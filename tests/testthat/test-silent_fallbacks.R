# A value fallback (`error = function(e) NULL`) keeps the result going but
# used to drop the cause. .wehoop_fallback() keeps the fallback value and
# .wehoop_report_fallbacks() reports every collected cause once, naming the
# function. Nothing here reaches the network.

collect_messages <- function(expr) {
  msgs <- character()
  value <- withCallingHandlers(expr, message = function(m) {
    msgs <<- c(msgs, conditionMessage(m))
    invokeRestart("muffleMessage")
  })
  list(value = value, msgs = trimws(msgs))
}

# Every request fails with a 503; the inner wrappers report it with
# .report_api_error() and return their empty result, as in production.
local_http_503 <- function(env = parent.frame()) {
  httr2::local_mocked_responses(function(req) {
    httr2::response(status_code = 503L, url = req$url,
                    headers = list(`Content-Type` = "text/html", `Retry-After` = "0"),
                    body = charToRaw("<html>busy</html>"))
  }, env = env)
}

test_that("a cause reported by .report_api_error() inside .wehoop_fallback() is collected, not printed", {
  inner <- function() {
    tryCatch(stop("inner outage"), error = function(e) .report_api_error(e, hint = "inner failed"))
    data.frame()
  }
  log <- new.env()
  got <- collect_messages(.wehoop_fallback(inner(), "inner()", log))
  expect_identical(got$value, data.frame())
  expect_length(got$msgs, 0L)
  expect_identical(log$causes, "inner(): inner outage")
  # outside a fallback it still prints
  expect_true(any(grepl("inner outage", collect_messages(inner())$msgs, fixed = TRUE)))
})

test_that(".wehoop_fallback() returns the fallback and .wehoop_report_fallbacks() reports once", {
  log <- new.env()
  expect_null(.wehoop_fallback(stop("boom 1"), "a()", log))
  expect_identical(.wehoop_fallback(stop("boom 2"), "b()", log, fallback = 0L), 0L)
  expect_identical(.wehoop_fallback(1L, "c()", log), 1L)
  expect_identical(log$causes, c("a(): boom 1", "b(): boom 2"))

  got <- collect_messages(.wehoop_report_fallbacks("some_fn", log))
  expect_length(got$msgs, 1L)
  expect_match(got$msgs, "some_fn(): 2 parts failed and were left out of the result: a(): boom 1; b(): boom 2",
               fixed = TRUE)
  expect_length(collect_messages(.wehoop_report_fallbacks("some_fn", new.env()))$msgs, 0L)
})

test_that("wnba_boxscoresummaryv3() reports a sub-frame that fails to build, once, and keeps the rest", {
  skip_on_cran()
  withr::local_options(lifecycle_verbosity = "quiet")
  body <- paste0(
    '{"boxScoreSummary": {"gameSummary": {"gameId": "1022200034"},',
    '"arenaInfo": {"arenaName": "Michelob ULTRA Arena"},',
    '"officials": {"a": [1, 2], "b": [1, 2, 3]},',
    '"lineScore": {"x": [1, 2], "y": [1, 2, 3, 4, 5]}}}'
  )
  httr2::local_mocked_responses(function(req) {
    httr2::response(status_code = 200L, url = req$url,
                    headers = list(`Content-Type` = "application/json"), body = charToRaw(body))
  })
  got <- collect_messages(wnba_boxscoresummaryv3(game_id = "1022200034"))
  out <- got$value
  expect_equal(nrow(out$arena_info), 1L)
  expect_equal(nrow(out$officials), 0L)
  expect_equal(nrow(out$line_score), 0L)
  hits <- grep("wnba_boxscoresummaryv3()", got$msgs, fixed = TRUE, value = TRUE)
  expect_length(hits, 1L)
  expect_match(hits, "2 parts failed", fixed = TRUE)
  expect_match(hits, "officials: arguments imply differing number of rows", fixed = TRUE)
  expect_match(hits, "lineScore: arguments imply differing number of rows", fixed = TRUE)
})

test_that("wnba_team_crosswalk() reports a failed Fox lookup and still builds the crosswalk", {
  skip_on_cran()
  espn <- data.frame(team_id = "5", abbreviation = "IND", display_name = "Indiana Fever",
                     short_name = "Fever", location = "Indiana", stringsAsFactors = FALSE)
  sched <- data.frame(home_team_id = 1611661325L, home_team_tricode = "IND",
                      home_team_name = "Fever", home_team_city = "Indiana", home_team_slug = "fever",
                      away_team_id = 1611661325L, away_team_tricode = "IND",
                      away_team_name = "Fever", away_team_city = "Indiana", away_team_slug = "fever")
  local_http_503()
  local_mocked_bindings(
    espn_wnba_teams = function(...) espn,
    .bb_assemble_team_crosswalk_wnba = function(espn, stats, fox, season) {
      expect_equal(NROW(fox), 0L)
      data.frame(espn_team_id = 5L)
    }
  )
  got <- collect_messages(wnba_team_crosswalk(season = 2024, .schedule = sched))
  expect_s3_class(got$value, "wehoop_data")
  # one line: the real fox_wnba_teams() failure, collected instead of printed
  expect_length(got$msgs, 1L)
  expect_match(got$msgs, "wnba_team_crosswalk(): 1 part failed and was left out of the result: fox_wnba_teams(): HTTP 503 Service Unavailable from https://api.foxsports.com/",
               fixed = TRUE)
})

test_that("wnba_schedule_crosswalk() reports failed per-date scoreboards once, not per date", {
  skip_on_cran()
  stats <- data.frame(
    game_id = c("1", "2", "3"), game_code = c("a", "b", "c"),
    game_date_time_utc = c("2024-06-01T23:00:00Z", "2024-06-02T23:00:00Z", "2024-06-03T23:00:00Z"),
    home_team_id = 1L, away_team_id = 2L, season_type_description = "Regular Season",
    stringsAsFactors = FALSE
  )
  local_http_503()
  local_mocked_bindings(
    wnba_schedule = function(...) stats,
    wnba_team_crosswalk = function(...) data.frame(espn_team_id = 5L, wnba_team_id = 1L),
    .bb_assemble_schedule_crosswalk_wnba = function(espn_games, ...) {
      expect_equal(nrow(espn_games), 0L)
      data.frame(wnba_game_id = character())
    }
  )
  got <- collect_messages(wnba_schedule_crosswalk(season = 2024))
  # the three real espn_wnba_scoreboard() failures make one line, not three reports
  expect_length(got$msgs, 1L)
  expect_match(got$msgs, "wnba_schedule_crosswalk(): 3 parts failed", fixed = TRUE)
  expect_match(got$msgs, "espn_wnba_scoreboard(20240601): HTTP 503 Service Unavailable from http://site.api.espn.com/",
               fixed = TRUE)
})

test_that("wbb_player_crosswalk() reports failed per-team roster lookups once", {
  skip_on_cran()
  local_mocked_bindings(
    wbb_team_crosswalk = function(...) data.frame(espn_team_id = c(1L, 2L), fox_team_id = NA_character_,
                                                 espn_abbreviation = c("A", "B")),
    espn_wbb_team_roster = function(team_id, ...) stop("roster ", team_id, " unavailable")
  )
  got <- collect_messages(wbb_player_crosswalk(season = 2025))
  hits <- grep("wbb_player_crosswalk()", got$msgs, fixed = TRUE, value = TRUE)
  expect_length(hits, 1L)
  expect_match(hits, "2 parts failed and were left out of the result: espn_wbb_team_roster(1): roster 1 unavailable",
               fixed = TRUE)
})

test_that("wnba_player_crosswalk() reports failed per-team WNBA Stats and Fox rosters once", {
  skip_on_cran()
  local_http_503()
  local_mocked_bindings(
    wnba_team_crosswalk = function(...) data.frame(
      espn_team_id = c(5L, 6L), wnba_team_id = c(1611661325L, 1611661319L),
      fox_team_id = c("10", "11"), espn_abbreviation = c("IND", "LV"), stringsAsFactors = FALSE),
    espn_wnba_team_roster = function(team_id, ...) data.frame(
      athlete_id = paste0(team_id, "1"), full_name = "A Player", jersey = "1",
      position_abbrev = "G", birth_date = "2000-01-01", stringsAsFactors = FALSE)
  )
  got <- collect_messages(wnba_player_crosswalk(season = 2024))
  expect_equal(nrow(got$value), 2L)
  expect_length(got$msgs, 1L)
  expect_match(got$msgs, "wnba_player_crosswalk(): 4 parts failed", fixed = TRUE)
  expect_match(got$msgs, "wnba_commonteamroster(1611661325): HTTP 503", fixed = TRUE)
  expect_match(got$msgs, "fox_wnba_team_roster(10): HTTP 503", fixed = TRUE)
})

test_that("wbb_schedule_crosswalk() reports failed per-date scoreboards once", {
  skip_on_cran()
  local_http_503()
  local_mocked_bindings(
    wbb_team_crosswalk = function(...) data.frame(espn_team_id = 1L, bart_team = "UConn"),
    bart_wbb_game_schedule = function(...) data.frame(
      muid = c("a", "b"), date = c("11/04/24", "11/05/24"), team1 = "UConn", team2 = "Villanova",
      winner = "UConn", stringsAsFactors = FALSE),
    .bb_assemble_schedule_crosswalk_wbb = function(espn_games, ...) {
      expect_equal(NROW(espn_games), 0L)
      data.frame(espn_game_id = character())
    }
  )
  got <- collect_messages(wbb_schedule_crosswalk(season = 2025))
  # espn_wbb_scoreboard() still prints its own one-line "no scoreboard data"
  # alert per date; the per-request error reports are collected
  expect_false(any(grepl("Error:", got$msgs, fixed = TRUE)))
  hits <- grep("wbb_schedule_crosswalk()", got$msgs, fixed = TRUE, value = TRUE)
  expect_length(hits, 1L)
  expect_match(hits, "parts failed and were left out of the result: espn_wbb_scoreboard(20241104): HTTP 503",
               fixed = TRUE)
})

test_that("ncaa_wbb_teams() leaves out failed conference pages and reports them once", {
  skip_on_cran()
  index <- paste0(
    "<html><body>", strrep("<div class='level2'><a href='#'>x</a></div>", 3),
    "<div class='level2'><a href='#'>All</a>",
    "<a href='javascript:changeConference(1)'>Big East</a>",
    "<a href='javascript:changeConference(2)'>Big Ten</a>",
    "<a href='javascript:changeConference(3)'>SEC</a></div>",
    "<table><a href='/teams/1'>UConn</a></table></body></html>"
  )
  conf1 <- "<html><body><table><a href='/teams/100'>UConn</a><a href='/teams/101'>Villanova</a></table></body></html>"
  httr2::local_mocked_responses(function(req) {
    conf <- regmatches(req$url, regexpr("(?<=conf_id=)-?[0-9]+", req$url, perl = TRUE))
    if (conf == "2") {
      return(httr2::response(status_code = 503L, url = req$url,
                             headers = list(`Content-Type` = "text/html", `Retry-After` = "0"),
                             body = charToRaw("<html>busy</html>")))
    }
    # conf 3: an HTTP 200 block page with no team table
    body <- switch(conf, "1" = conf1, "3" = "<html><body>Access Denied</body></html>", index)
    httr2::response(status_code = 200L, url = req$url, headers = list(`Content-Type` = "text/html"),
                    body = charToRaw(body))
  })
  got <- collect_messages(ncaa_wbb_teams(year = 2025))
  expect_equal(nrow(got$value), 2L)
  expect_identical(got$value$season_team_id, c("100", "101"))
  expect_length(got$msgs, 1L)
  expect_match(got$msgs, "ncaa_wbb_teams(): 2 parts failed and were left out of the result: conference 2: HTTP 503 Service Unavailable from http://stats.ncaa.org/team/inst_team_list",
               fixed = TRUE)
  expect_match(got$msgs, "conference 3: the page lists no teams (blocked or empty)", fixed = TRUE)
})

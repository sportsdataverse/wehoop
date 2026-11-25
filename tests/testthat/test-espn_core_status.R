# Request counts and non-2xx handling for ESPN wrappers that make one request
# per date, season type or page. Nothing here reaches the network.

collect_messages <- function(expr) {
  msgs <- character()
  value <- withCallingHandlers(expr, message = function(m) {
    msgs <<- c(msgs, conditionMessage(m))
    invokeRestart("muffleMessage")
  })
  list(value = value, msgs = trimws(msgs))
}

json_response <- function(req, status, body) {
  httr2::response(status_code = status, url = req$url,
                  headers = list(`Content-Type` = "application/json", `Retry-After` = "0"),
                  body = charToRaw(body))
}

test_that("espn_wbb_scoreboard() makes one request per date", {
  skip_on_cran()
  urls <- character()
  httr2::local_mocked_responses(function(req) {
    urls <<- c(urls, req$url)
    json_response(req, 200L, '{"events": []}')
  })
  got <- collect_messages(espn_wbb_scoreboard(season = "20250105"))
  expect_length(urls, 1L)
  expect_match(urls, "dates=20250105", fixed = TRUE)
  # a date with no games is not a failure
  expect_length(got$msgs, 0L)

  urls <- character()
  espn_wbb_scoreboard(season = c("20250105", "20250106"))
  expect_length(urls, 2L)
})

test_that("espn_wbb_scoreboard() keeps its class when the first date has no games", {
  skip_on_cran()
  # the 2025-04-06 scoreboard recorded for the offline replay tests
  skip_if_no_fixtures("http")
  path <- testthat::test_path("fixtures", "http", http_fixture_index()[[
    "http://site.api.espn.com/apis/site/v2/sports/basketball/womens-college-basketball/scoreboard?groups=50&limit=1000&dates=20250406"
  ]]$file)
  day <- rawToChar(memDecompress(readBin(path, "raw", file.size(path)), "gzip"))
  httr2::local_mocked_responses(function(req) {
    json_response(req, 200L, if (grepl("dates=20250406", req$url, fixed = TRUE)) day else '{"events": []}')
  })
  out <- espn_wbb_scoreboard(season = c("20250801", "20250406"))
  expect_s3_class(out, "wehoop_data")
  expect_gt(nrow(out), 0L)
})

test_that("espn_wbb_scoreboard() reports failed dates once for a multi-date call", {
  skip_on_cran()
  httr2::local_mocked_responses(function(req) json_response(req, 500L, '{"message": "down"}'))
  got <- collect_messages(espn_wbb_scoreboard(season = c("20250105", "20250106")))
  expect_equal(NROW(got$value), 0L)
  expect_length(got$msgs, 1L)
  expect_match(got$msgs, "espn_wbb_scoreboard(): 2 parts failed and were left out of the result: dates=20250105: HTTP 500",
               fixed = TRUE)
  expect_match(got$msgs, "dates=20250106: HTTP 500", fixed = TRUE)
})

# One body that every helper below can parse: career `splits`, leaders
# `categories`, and `items` for records, groups, weeks and prop bets.
core_body <- paste0(
  '{"pageCount": 2,',
  '"splits": {"id": "0", "name": "All Splits", "type": "total", "categories": [',
  '{"name": "scoring", "stats": [{"name": "points", "value": 10, "displayValue": "10"}]}]},',
  '"categories": [{"name": "points", "leaders": [{"displayValue": "20", "value": 20,',
  '"athlete": {"$ref": "http://x/athletes/9?lang=en"}, "team": {"$ref": "http://x/teams/3?lang=en"}}]}],',
  '"items": [{"$ref": "http://x/groups/5/weeks/1?lang=en", "id": "0", "name": "overall",',
  '"athlete": {"$ref": "http://x/athletes/9?lang=en"}}]}'
)

# Each call makes two requests; the second (postseason stat type, season
# type 3, prop-bet page 2) answers with `status`, the first with data.
core_calls <- list(
  career  = list(probe = TRUE,  fn = ".espn_basketball_athlete_career_stats",
                 call = quote(espn_wnba_player_career_stats(athlete_id = 1, stat_type = c(0L, 1L)))),
  leaders = list(probe = TRUE,  fn = ".espn_basketball_season_leaders",
                 call = quote(espn_wnba_season_leaders(season = 2025, season_type = c(2L, 3L)))),
  # page 2 after pageCount said 2: a 404 there is a failure (page 1 is below)
  propbets = list(probe = FALSE, fn = ".espn_basketball_event_propbets",
                  call = quote(espn_wnba_game_propbets(event_id = 1, provider_id = 58))),
  record  = list(probe = FALSE, fn = ".espn_basketball_team_record",
                 call = quote(espn_wnba_team_record(team_id = 3, season = 2025, season_type = c(2L, 3L)))),
  groups  = list(probe = FALSE, fn = ".espn_basketball_season_groups",
                 call = quote(espn_wnba_season_groups(season = 2025, season_type = c(2L, 3L)))),
  weeks   = list(probe = FALSE, fn = ".espn_basketball_season_weeks",
                 call = quote(espn_wnba_season_weeks(season = 2025, season_type = c(2L, 3L))))
)

run_core <- function(call, status) {
  httr2::local_mocked_responses(function(req) {
    second <- grepl("/statistics/1\\?|/types/3/|page=2&", req$url)
    if (second) json_response(req, status, '{"message": "nope"}') else json_response(req, 200L, core_body)
  })
  collect_messages(eval(call))
}

test_that("core-v2 helpers keep a 404 silent only where it is an expected probe", {
  skip_on_cran()
  for (nm in names(core_calls)) {
    cc <- core_calls[[nm]]
    got <- run_core(cc$call, 404L)
    # the first request's rows are kept either way
    expect(NROW(got$value) > 0L, paste(nm, "lost the rows of the request that succeeded"))
    if (cc$probe) {
      expect(length(got$msgs) == 0L, paste(nm, "reported an expected 404:", paste(got$msgs, collapse = " | ")))
    } else {
      expect(length(got$msgs) == 1L && grepl(paste0(cc$fn, "(): 1 part failed"), got$msgs, fixed = TRUE) &&
               grepl("HTTP 404", got$msgs, fixed = TRUE),
             paste(nm, "did not report its 404 once:", paste(got$msgs, collapse = " | ")))
    }
  }
})

test_that("core-v2 helpers report a 5xx, 401, 403 or 429 once and keep the rest", {
  skip_on_cran()
  for (nm in names(core_calls)) {
    for (status in c(500L, 401L, 403L, 429L)) {
      cc <- core_calls[[nm]]
      got <- run_core(cc$call, status)
      expect(NROW(got$value) > 0L, paste(nm, status, "lost the rows of the request that succeeded"))
      expect(length(got$msgs) == 1L && grepl(paste0(cc$fn, "(): 1 part failed"), got$msgs, fixed = TRUE) &&
               grepl(paste0("HTTP ", status), got$msgs, fixed = TRUE),
             paste(nm, status, "did not report once:", paste(got$msgs, collapse = " | ")))
    }
  }
})

test_that("a 404 on the first prop-bet page means no prop bets, quietly", {
  skip_on_cran()
  httr2::local_mocked_responses(function(req) json_response(req, 404L, '{"message": "not found"}'))
  got <- collect_messages(espn_wnba_game_propbets(event_id = 1, provider_id = 100))
  expect_equal(nrow(got$value), 0L)
  expect_length(got$msgs, 0L)
})

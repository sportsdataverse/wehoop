# The WNBA CDN wrappers: wnba_live_pbp(), wnba_live_boxscore(), wnba_schedule() and
# wnba_todays_scoreboard(), all on cdn.wnba.com. See .wnba_cdn_headers()
# for the 2026-09-29 probe: no browser headers got a 403 on both hosts, and the old
# five-header set got the JSON over HTTP/2 only.

cdn_fixture <- function(file) {
  con <- gzfile(test_path("fixtures", "wnba_live", file), "rb")
  on.exit(close(con))
  readBin(con, "raw", n = 1e7)
}

# Serve the captured payload named after the requested URL (see fixtures/wnba_live/README.md).
local_cdn_fixtures <- function(env = parent.frame()) {
  local_mocked_bindings(
    .retry_request = function(url, params = list(), headers = NULL, ...) {
      httr2::response(
        status_code = 200L,
        url = url,
        headers = list(`Content-Type` = "application/json"),
        body = cdn_fixture(paste0(sub(".json", "", basename(url), fixed = TRUE), ".json.gz"))
      )
    },
    .env = env
  )
}

test_that("every WNBA CDN wrapper sends the shared browser header set", {
  seen <- list()
  local_mocked_bindings(
    .retry_request = function(url, params = list(), headers = NULL, ...) {
      seen[[url]] <<- list(headers = headers)
      stop("offline")
    }
  )
  suppressMessages({
    wnba_live_pbp(game_id = "1022600097")
    wnba_live_boxscore(game_id = "1022600097")
    wnba_schedule()
    wnba_todays_scoreboard()
  })

  expect_length(seen, 4)
  # The scoreboard comes from the WNBA's own host: cdn.nba.com's copy is frozen at 2020.
  expect_in("https://cdn.wnba.com/static/json/liveData/scoreboard/todaysScoreboard_10.json", names(seen))
  for (url in names(seen)) {
    expect_identical(seen[[url]]$headers, .wnba_cdn_headers(), info = url)
  }
  expect_in(
    c("sec-ch-ua", "sec-ch-ua-mobile", "sec-ch-ua-platform",
      "Sec-Fetch-Site", "Sec-Fetch-Mode", "Sec-Fetch-Dest",
      "User-Agent", "Origin", "Referer"),
    names(.wnba_cdn_headers())
  )
})

test_that("the sec-ch-ua brands carry the User-Agent's Chrome major version", {
  h <- .wnba_cdn_headers()
  v <- sub(".*Chrome/(\\d+).*", "\\1", h[["User-Agent"]])
  expect_true(grepl(sprintf('"Chromium";v="%s"', v), h[["sec-ch-ua"]], fixed = TRUE))
  expect_true(grepl(sprintf('"Google Chrome";v="%s"', v), h[["sec-ch-ua"]], fixed = TRUE))
})

test_that("wnba_live_pbp() and wnba_live_boxscore() parse captured cdn.wnba.com payloads", {
  local_cdn_fixtures()

  pbp <- wnba_live_pbp(game_id = "1022600097")
  expect_equal(nrow(pbp), 465)

  box <- wnba_live_boxscore(game_id = "1022600097")
  expect_equal(box$game_details$home_team_tricode, "CON")
  expect_equal(nrow(box$home_team_player_boxscore), 14)
  expect_equal(nrow(box$away_team_player_boxscore), 14)
})

test_that("a warning while parsing no longer throws the result away", {
  # The wrappers' tryCatch() used to carry a `warning` handler, which abandons
  # the whole parse at the first warning and returns an empty result.
  local_cdn_fixtures()
  resp_text <- .resp_text
  local_mocked_bindings(.resp_text = function(resp) {
    warning("simulated parse warning")
    resp_text(resp)
  })
  expect_warning(pbp <- wnba_live_pbp(game_id = "1022600097"), "simulated")
  expect_equal(nrow(pbp), 465)
  expect_warning(box <- wnba_live_boxscore(game_id = "1022600097"), "simulated")
  expect_equal(nrow(box$home_team_player_boxscore), 14)
})

test_that("wnba_todays_scoreboard() on a day without games is empty, not an error", {
  local_mocked_bindings(
    .retry_request = function(url, params = list(), headers = NULL, ...) {
      httr2::response(
        200L,
        headers = list(`Content-Type` = "application/json"),
        body = charToRaw('{"scoreboard":{"gameDate":"2026-09-29","leagueId":"10","games":[]}}')
      )
    }
  )
  expect_silent(out <- wnba_todays_scoreboard())
  expect_equal(nrow(out), 0)
  expect_s3_class(out, "wehoop_data")
})

test_that("wnba_todays_scoreboard() reports a payload without a games list, not an empty day", {
  local_mocked_bindings(
    .retry_request = function(url, params = list(), headers = NULL, ...) {
      httr2::response(
        200L,
        headers = list(`Content-Type` = "application/json"),
        body = charToRaw('{"scoreboard":{"gameDate":"2026-09-29","leagueId":"10"}}')
      )
    }
  )
  expect_message(wnba_todays_scoreboard(), "no games list")
})

test_that("wnba_schedule() and wnba_todays_scoreboard() keep their result through a parse warning", {
  local_mocked_bindings(
    .retry_request = function(url, params = list(), headers = NULL, ...) {
      body <- if (grepl("schedule", url, fixed = TRUE)) {
        paste0(
          '{"leagueSchedule":{"seasonYear":"2026","leagueId":"10","gameDates":[{"gameDate":',
          '"05/16/2026 00:00:00","games":[{"gameId":"1022600001","homeTeam":{"teamId":1},"awayTeam":{"teamId":2}}]}]}}'
        )
      } else {
        '{"scoreboard":{"gameDate":"2026-09-29","leagueId":"10","games":[]}}'
      }
      httr2::response(200L, headers = list(`Content-Type` = "application/json"), body = charToRaw(body))
    }
  )
  resp_text <- .resp_text
  local_mocked_bindings(.resp_text = function(resp) {
    warning("simulated parse warning")
    resp_text(resp)
  })
  expect_warning(sched <- wnba_schedule(season = 2026), "simulated")
  expect_equal(nrow(sched), 1)
  expect_warning(wnba_todays_scoreboard(), "simulated")
})

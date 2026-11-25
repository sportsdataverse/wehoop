# .retry_request() turns off httr2's status errors, so the shared helpers check
# the status themselves (.wehoop_stop_for_http_status()): an error response must
# reach the wrapper's error handler as a reported cause, never be parsed as
# data. Every request here is answered by a mocked httr2 response.

local_status_response <- function(status, body, type = "application/json", env = parent.frame()) {
  httr2::local_mocked_responses(function(req) {
    httr2::response(
      status_code = status, url = req$url,
      # Retry-After: 0 keeps req_retry() from backing off on a 429 / 503
      headers = list(`Content-Type` = type, `Retry-After` = "0"),
      body = charToRaw(body)
    )
  }, env = env)
}

report_of <- function(expr) {
  msgs <- character()
  value <- withCallingHandlers(expr, message = function(m) {
    msgs <<- c(msgs, conditionMessage(m))
    invokeRestart("muffleMessage")
  })
  list(value = value, msgs = trimws(msgs))
}

test_that("a WNBA Stats error response is reported with its status, not parsed", {
  skip_on_cran()
  withr::local_options(lifecycle_verbosity = "quiet")
  cases <- list(
    list(status = 401L, type = "application/json", body = '{"message":"Access denied for this key"}',
         expect = "HTTP 401 Unauthorized from https://stats.wnba.com/stats/boxscoresummaryv3: Access denied for this key"),
    list(status = 500L, type = "text/html", body = "<html><body>Internal Server Error</body></html>",
         expect = "HTTP 500 Internal Server Error from https://stats.wnba.com/stats/boxscoresummaryv3$")
  )
  for (case in cases) {
    local({
      local_status_response(case$status, case$body, type = case$type)
      got <- report_of(wnba_boxscoresummaryv3(game_id = "1022200034"))
      expect_identical(got$value, list())
      expect_true(any(grepl(case$expect, sub("^Error: ", "", got$msgs))), info = paste(got$msgs, collapse = "\n"))
    })
  }
})

test_that("a WNBA Stats 200 response is parsed as before", {
  skip_on_cran()
  local_status_response(200L, '{"resultSets": []}')
  expect_identical(request_with_proxy("https://stats.wnba.com/stats/x", params = list()), list(resultSets = list()))
})

test_that("a CDN or direct-request error page is reported with its status", {
  skip_on_cran()
  local_status_response(403L, "<html>Access Denied</html>", type = "text/html")
  calls <- list(
    wnba_todays_scoreboard = function() wnba_todays_scoreboard(),
    wnba_schedule = function() wnba_schedule(season = 2025),
    wnba_live_pbp = function() wnba_live_pbp(game_id = "1022500001"),
    wnba_live_boxscore = function() wnba_live_boxscore(game_id = "1022500001"),
    wnba_draftboard = function() wnba_draftboard(season = 2025),
    wnba_homepagewidget = function() wnba_homepagewidget()
  )
  for (nm in names(calls)) {
    got <- report_of(calls[[nm]]())
    expect_true(any(grepl("HTTP 403 Forbidden from https://", got$msgs, fixed = TRUE)),
                info = paste(c(nm, got$msgs), collapse = "\n"))
  }
})

test_that(".wehoop_stop_for_http_status() raises a classed error carrying the status", {
  ok <- httr2::response(status_code = 204L, url = "https://example.com/x")
  expect_identical(.wehoop_stop_for_http_status(ok), ok)

  bad <- httr2::response(
    status_code = 403L, url = "https://example.com/x?season=2025",
    headers = list(`Content-Type` = "application/json"), body = charToRaw('{"error":"Forbidden here"}')
  )
  err <- expect_error(.wehoop_stop_for_http_status(bad), class = "wehoop_http_error")
  expect_s3_class(err, "wehoop_fetch_error")
  expect_s3_class(err, "wehoop_error")
  expect_identical(err$status, 403L)
  expect_identical(conditionMessage(err), "HTTP 403 Forbidden from https://example.com/x: Forbidden here")
})

test_that("the shared request helpers stop on an error status before parsing", {
  skip_on_cran()
  local_status_response(503L, "<html>busy</html>", type = "text/html")
  expect_error(request_with_proxy("https://stats.wnba.com/stats/x", params = list()),
               "HTTP 503", class = "wehoop_http_error")
  expect_error(.wnba_headers("https://stats.wnba.com/stats/x"), "HTTP 503", class = "wehoop_http_error")
  expect_error(.bart_wbb_text("/ncaaw/trank.php"), "HTTP 503", class = "wehoop_http_error")
  expect_error(.bref_wnba_text("/wnba/years/2024.html"), "HTTP 503", class = "wehoop_http_error")
  expect_error(check_status(httr2::response(status_code = 500L, url = "https://site.api.espn.com/x")),
               "HTTP 500 Internal Server Error from https://site.api.espn.com/x", class = "wehoop_http_error")
})

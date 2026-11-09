# Every recorded ESPN / Fox call, replayed against a failing and an empty upstream.
# The calls are read from the generated test-*_offline.R files, so this file needs
# no upkeep when calls are added. A wrapper must not raise on either: it reports
# the failure and returns its empty value.

recorded_calls <- function() {
  files <- testthat::test_path(c("test-espn_offline.R", "test-fox_offline.R"))
  lines <- unlist(lapply(files[file.exists(files)], readLines))
  m <- regmatches(lines, regexpr("(?<=x <- suppressMessages\\().*(?=\\)$)", lines, perl = TRUE))
  unique(m)
}

replay_with <- function(calls, status, body) {
  for (call in calls) {
    httr2::local_mocked_responses(function(req) {
      httr2::response(status_code = status, url = req$url,
                      headers = list(`Content-Type` = "application/json"),
                      body = charToRaw(body))
    })
    res <- tryCatch(suppressWarnings(suppressMessages(eval(str2lang(call)))),
                    error = function(e) e)
    expect(!inherits(res, "error"),
           paste0(call, " raised: ", if (inherits(res, "error")) conditionMessage(res)))
  }
}

test_that("wrappers report an HTTP 500 instead of raising", {
  skip_on_cran()
  skip_if_no_fixtures("http")
  calls <- recorded_calls()
  expect_gt(length(calls), 100)
  replay_with(calls, 500L, '{"error": {"code": 500}}')
})

test_that("wrappers return their empty value for an empty payload", {
  skip_on_cran()
  skip_if_no_fixtures("http")
  replay_with(recorded_calls(), 200L, "{}")
})

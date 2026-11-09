# Offline tests for the small internal helpers in R/utils.R.

test_that("message helpers emit each message type", {
  skip_on_cran()
  expect_message(message_completed("done"), "done")
  expect_message(message_completed("built", in_builder = TRUE), "built")
  for (type in c("done", "todo", "info", "oops")) {
    expect_message(user_message("hello", type), "hello")
  }
  expect_silent(user_message("hello", "unknown"))
  expect_match(my_time(), "^\\d{2}:\\d{2}:\\d{2}$")
})

test_that("custom_mode, %c% and year_to_season", {
  skip_on_cran()
  expect_equal(custom_mode(c(1, 2, 2, NA, NA, NA)), 2)
  expect_true(is.na(custom_mode(c(NA, NA, 1), na.rm = FALSE)))
  expect_equal(c(NA, 2) %c% c(1, 3), c(1, 2))
  expect_equal(year_to_season(2024), "2024-25")
  expect_equal(year_to_season(2008), "2008-09")
  expect_equal(year_to_season(1999), "1999-00")
})

test_that("check_status raises on a non-200 response", {
  skip_on_cran()
  expect_silent(check_status(httr2::response(status_code = 200L)))
  expect_error(check_status(httr2::response(status_code = 500L)), "API returned an error")
})

test_that(".retry_request applies params, headers and a proxy", {
  skip_on_cran()
  seen <- NULL
  httr2::local_mocked_responses(function(req) {
    seen <<- req
    httr2::response(status_code = 200L, body = charToRaw("ok"))
  })
  res <- .retry_request("https://example.com/x", params = list(a = 1),
                        headers = c(`X-Test` = "1"), proxy = "http://127.0.0.1:9")
  expect_equal(.resp_text(res), "ok")
  expect_match(seen$url, "a=1")
  expect_equal(seen$headers$`X-Test`, "1")
  .retry_request("https://example.com/y", proxy = list(url = "http://127.0.0.1", port = 9))
  expect_equal(seen$options$proxyport, 9)
  old <- options(wehoop.proxy = "http://127.0.0.1:9")
  on.exit(options(old), add = TRUE)
  .retry_request("https://example.com/z")
  expect_equal(seen$options$proxy, "http://127.0.0.1:9")
})

test_that(".capture_args and the api reporters", {
  skip_on_cran()
  f <- function(game_id, n = 2, ...) .capture_args()
  expect_equal(f(5), list(game_id = 5, n = 2))
  g <- function() .capture_args()
  expect_equal(g(), list())
  h <- function(...) .capture_args()
  expect_equal(h(1), list())

  game_id <- 7
  expect_equal(.interp_braces("game {game_id} {nope}"), "game 7 {nope}")
  expect_equal(.interp_braces(NA_character_), NA_character_)
  expect_equal(.interp_braces("plain"), "plain")

  e <- simpleError("boom")
  expect_message(.report_api_error(e), "Request failed")
  expect_message(.report_api_error(e, hint = "id {game_id}", args = list(game_id = 7, x = strrep("a", 80))), "boom")
  w <- simpleWarning("careful")
  expect_message(.report_api_warning(w), "Request emitted a warning")
  expect_message(.report_api_warning(w, hint = "id {game_id}", args = list(game_id = 7, x = strrep("a", 80))), "careful")
})

test_that(".echo_identity keeps the wehoop_data class and print shows the timestamp", {
  skip_on_cran()
  df <- make_wehoop_data(data.frame(a = 1:2), "test", Sys.time())
  out <- .echo_identity(df, season = 2025, a = 9, none = NULL)
  expect_s3_class(out, "wehoop_data")
  expect_equal(names(out)[1], "season")
  expect_equal(out$a, 1:2)
  expect_identical(.echo_identity(df), df)
  expect_identical(.echo_identity(df[0, ], season = 1), df[0, ])
  expect_output(suppressMessages(print(out)), "season")
  both <- rbindlist_with_attrs(list(df, df))
  expect_equal(attr(both, "wehoop_type"), "test")
})

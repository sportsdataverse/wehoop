# Offline tests for the pure helpers in R/utils_wnba_stats.R. Nothing here reaches
# stats.wnba.com: the one request is answered by a mocked httr2 response.

test_that("endpoint builders and header sets", {
  skip_on_cran()
  expect_equal(wnba_endpoint("leaguegamelog"), "https://stats.wnba.com/stats/leaguegamelog")
  expect_equal(wnba_live_endpoint("playbyplay/playbyplay_1.json"),
               "https://cdn.wnba.com/static/json/liveData/playbyplay/playbyplay_1.json")
  h <- wnba_headers_params(origin = "https://example.com")
  expect_equal(h[["Origin"]], "https://example.com")
  expect_equal(.wnba_cdn_headers()[["Origin"]], "https://www.wnba.com")
  expect_true("User-Agent" %in% names(.ncaa_headers("https://example.com")))
})

test_that("pad_id zero-pads to 10 digits", {
  skip_on_cran()
  expect_equal(pad_id(22200034), "0022200034")
  expect_equal(pad_id(1022200034), "1022200034")
})

test_that("wnba_stats_map_result_sets reads both resultSets and resultSet", {
  skip_on_cran()
  rs <- list(name = c("A", "B"),
             headers = list(c("x", "y"), "z"),
             rowSet = list(matrix(c("1", "2", "3", "4"), 2), matrix("5", 1)))
  out <- wnba_stats_map_result_sets(list(resultSets = rs))
  expect_named(out, c("A", "B"))
  expect_equal(colnames(out$A), c("x", "y"))
  expect_equal(nrow(out$A), 2)
  out2 <- wnba_stats_map_result_sets(list(resultSet = rs))
  expect_equal(out2$B$z, "5")
})

test_that("request_with_proxy and .wnba_headers send the stats headers and parse JSON", {
  skip_on_cran()
  seen <- NULL
  httr2::local_mocked_responses(function(req) {
    seen <<- req
    httr2::response(status_code = 200L, headers = list(`Content-Type` = "application/json"),
                    body = charToRaw('{"resultSets": []}'))
  })
  out <- request_with_proxy("https://stats.wnba.com/stats/x", params = list(a = 1))
  expect_true("resultSets" %in% names(out))
  expect_equal(seen$headers$`x-nba-stats-token`, "true")
  out <- .wnba_headers("https://stats.wnba.com/stats/y")
  expect_true("resultSets" %in% names(out))
})

test_that("wnba_data_pbp is defunct", {
  skip_on_cran()
  expect_error(wnba_data_pbp(), "wnba_pbp")
})

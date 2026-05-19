test_that("ESPN - WNBA Event Predictor", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_event_predictor(event_id = 401736171)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wnba_event_predictor at test time")
  }

  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})


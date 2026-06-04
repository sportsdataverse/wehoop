test_that("ESPN - WNBA Event Odds", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_game_odds(event_id = "401736171")

  if (is.null(x)) {
    skip("NULL returned from espn_wnba_game_odds at test time")
  }

  expect_s3_class(x, "data.frame")

  # Columns must be present even when zero rows are returned
  required_cols <- c(
    "event_id",
    "provider_id",
    "provider_name",
    "details",
    "over_under",
    "spread"
  )
  expect_in(sort(required_cols), sort(colnames(x)))

  Sys.sleep(1)
})

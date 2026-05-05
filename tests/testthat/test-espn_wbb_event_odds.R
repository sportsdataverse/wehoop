test_that("ESPN - WBB Event Odds", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  # WBB odds are typically empty because ESPN does not carry NCAA basketball
  # betting lines. Accept an empty tibble as a valid result.
  x <- espn_wbb_event_odds(event_id = "401736171")

  if (is.null(x)) {
    skip("NULL returned from espn_wbb_event_odds at test time")
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

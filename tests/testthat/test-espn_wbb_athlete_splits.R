test_that("ESPN - WBB Athlete Splits", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_athlete_splits(athlete_id = "4432755", season = 2025)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from endpoint at test time")
  }

  expect_s3_class(x, "data.frame")
  expect_gt(nrow(x), 0)

  Sys.sleep(1)
})

test_that("ESPN - WNBA Athlete Career Stats (Long Format)", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_athlete_career_stats(athlete_id = "3149391")

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wnba_athlete_career_stats at test time")
  }

  required_cols <- c(
    "league",
    "athlete_id",
    "stat_name",
    "value"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})


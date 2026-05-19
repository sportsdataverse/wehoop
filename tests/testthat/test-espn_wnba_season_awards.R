test_that("ESPN - WNBA Season Awards Index", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_season_awards(season = 2024)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wnba_season_awards at test time")
  }

  required_cols <- c(
    "award_id",
    "ref",
    "league"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})


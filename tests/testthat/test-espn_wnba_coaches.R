test_that("ESPN WNBA Coaches", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_coaches(season = 2024)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wnba_coaches at test time")
  }

  cols_x <- c(
    "coach_id", "first_name", "last_name", "full_name",
    "experience", "team_id"
  )

  expect_in(sort(cols_x), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})

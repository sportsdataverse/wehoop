
test_that("ESPN - WNBA Team Leaders", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_team_leaders(team_id = 17, season = 2025)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wnba_team_leaders at test time")
  }

  cols <- c(
    "team_id",
    "season",
    "category",
    "display_name",
    "athlete_id",
    "athlete_name",
    "value",
    "rank"
  )

  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")
  expect_true(nrow(x) > 0)

  Sys.sleep(1)
})

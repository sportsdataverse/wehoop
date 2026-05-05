test_that("ESPN WBB League Leaders", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_leaders(season = 2025, season_type = 2)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wbb_leaders at test time")
  }

  cols_x <- c(
    "season", "season_type", "category", "abbreviation",
    "athlete_id", "athlete_name", "team_id", "team_abbrev",
    "value", "rank", "display_value"
  )

  expect_in(sort(cols_x), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})

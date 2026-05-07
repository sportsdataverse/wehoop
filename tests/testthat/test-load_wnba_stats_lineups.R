test_that("load_wnba_stats_lineups returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  lineups <- load_wnba_stats_lineups(seasons = most_recent_wnba_stats_season())

  if (length(lineups) == 0 || nrow(lineups) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(lineups, "wehoop_data")
  expect_s3_class(lineups, "data.frame")

  core_cols <- c("season", "team_id")
  expect_in(sort(core_cols), sort(colnames(lineups)))
})

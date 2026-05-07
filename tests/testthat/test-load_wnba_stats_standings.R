test_that("load_wnba_stats_standings returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  standings <- load_wnba_stats_standings(seasons = most_recent_wnba_stats_season())

  if (length(standings) == 0 || nrow(standings) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(standings, "wehoop_data")
  expect_s3_class(standings, "data.frame")

  core_cols <- c("season", "team_id")
  expect_in(sort(core_cols), sort(colnames(standings)))
})

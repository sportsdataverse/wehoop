test_that("load_wnba_stats_team_stats returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  team_stats <- load_wnba_stats_team_stats(seasons = most_recent_wnba_stats_season())

  if (length(team_stats) == 0 || nrow(team_stats) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(team_stats, "wehoop_data")
  expect_s3_class(team_stats, "data.frame")

  core_cols <- c("season", "team_id")
  expect_in(sort(core_cols), sort(colnames(team_stats)))
})

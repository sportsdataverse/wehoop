test_that("load_wnba_stats_player_stats returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  player_stats <- load_wnba_stats_player_stats(seasons = most_recent_wnba_stats_season())

  if (length(player_stats) == 0 || nrow(player_stats) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(player_stats, "wehoop_data")
  expect_s3_class(player_stats, "data.frame")

  core_cols <- c("season", "team_id", "player_id")
  expect_in(sort(core_cols), sort(colnames(player_stats)))
})

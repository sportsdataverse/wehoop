test_that("load_wnba_stats_game_rosters returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  game_rosters <- load_wnba_stats_game_rosters(seasons = most_recent_wnba_stats_season())

  if (length(game_rosters) == 0 || nrow(game_rosters) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(game_rosters, "wehoop_data")
  expect_s3_class(game_rosters, "data.frame")

  core_cols <- c("game_id", "team_id", "player_id")
  expect_in(sort(core_cols), sort(colnames(game_rosters)))
})

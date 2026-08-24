test_that("load_wnba_stats_possessions returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_wnba_stats_possessions(seasons = most_recent_wnba_stats_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_s3_class(df, "data.frame")

  core_cols <- c("game_id", "season", "possession_number", "offense_team_id", "defense_team_id")
  expect_in(sort(core_cols), sort(colnames(df)))
})

test_that("load_wnba_stats_shots returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  shots <- load_wnba_stats_shots(seasons = most_recent_wnba_stats_season())

  if (length(shots) == 0 || nrow(shots) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(shots, "wehoop_data")
  expect_s3_class(shots, "data.frame")

  core_cols <- c("game_id", "season", "x_legacy", "y_legacy")
  expect_in(sort(core_cols), sort(colnames(shots)))
})

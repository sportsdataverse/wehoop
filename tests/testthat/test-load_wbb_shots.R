test_that("load_wbb_shots returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  shots <- load_wbb_shots(seasons = most_recent_wbb_season())

  if (length(shots) == 0 || nrow(shots) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(shots, "wehoop_data")
  expect_s3_class(shots, "data.frame")

  core_cols <- c("game_id", "season", "coordinate_x", "coordinate_y")
  expect_in(sort(core_cols), sort(colnames(shots)))
})

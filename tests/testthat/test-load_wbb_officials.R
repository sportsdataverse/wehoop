test_that("load_wbb_officials returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  officials <- load_wbb_officials(seasons = most_recent_wbb_season())

  if (length(officials) == 0 || nrow(officials) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(officials, "wehoop_data")
  expect_s3_class(officials, "data.frame")

  core_cols <- c("game_id", "display_name")
  expect_in(sort(core_cols), sort(colnames(officials)))
})

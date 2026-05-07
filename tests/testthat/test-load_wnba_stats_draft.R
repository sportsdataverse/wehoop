test_that("load_wnba_stats_draft returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  draft <- load_wnba_stats_draft(seasons = most_recent_wnba_stats_season())

  if (length(draft) == 0 || nrow(draft) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(draft, "wehoop_data")
  expect_s3_class(draft, "data.frame")

  core_cols <- c("season")
  expect_in(sort(core_cols), sort(colnames(draft)))
})

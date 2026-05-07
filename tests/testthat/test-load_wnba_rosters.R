test_that("load_wnba_rosters returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  rosters <- load_wnba_rosters(seasons = most_recent_wnba_season())

  if (length(rosters) == 0 || nrow(rosters) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(rosters, "wehoop_data")
  expect_s3_class(rosters, "data.frame")

  core_cols <- c("season", "team_id", "athlete_id")
  expect_in(sort(core_cols), sort(colnames(rosters)))
})

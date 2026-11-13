test_that("load_wbb_team_crosswalk() loads a cached snapshot", {
  skip_on_cran()
  skip_load_test()
  out <- load_wbb_team_crosswalk(seasons = most_recent_wbb_season())
  expect_s3_class(out, "wehoop_data")
  expect_true(all(c("season", "espn_team_id") %in% names(out)))
})

test_that("load_wbb_schedule_crosswalk() loads a cached snapshot", {
  skip_on_cran()
  skip_load_test()
  out <- load_wbb_schedule_crosswalk(seasons = most_recent_wbb_season())
  expect_s3_class(out, "wehoop_data")
  expect_true("season" %in% names(out))
})

test_that("load_wbb_player_crosswalk() loads a cached snapshot", {
  skip_on_cran()
  skip_load_test()
  out <- load_wbb_player_crosswalk(seasons = most_recent_wbb_season())
  expect_s3_class(out, "wehoop_data")
  expect_true("season" %in% names(out))
})

test_that("load_wnba_team_crosswalk() loads a cached snapshot", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()
  out <- load_wnba_team_crosswalk(seasons = most_recent_wnba_season())
  expect_s3_class(out, "wehoop_data")
  expect_true(all(c("season", "espn_team_id", "wnba_team_id") %in% names(out)))
})

test_that("load_wnba_schedule_crosswalk() loads a cached snapshot", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()
  out <- load_wnba_schedule_crosswalk(seasons = most_recent_wnba_season())
  expect_s3_class(out, "wehoop_data")
  expect_true("season" %in% names(out))
})

test_that("load_wnba_player_crosswalk() loads a cached snapshot", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()
  out <- load_wnba_player_crosswalk(seasons = most_recent_wnba_season())
  expect_s3_class(out, "wehoop_data")
  expect_true("season" %in% names(out))
})

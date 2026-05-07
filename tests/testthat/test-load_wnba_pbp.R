test_that("load_wnba_pbp returns expected schema for most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  pbp <- wehoop::load_wnba_pbp(seasons = wehoop::most_recent_wnba_season())

  expect_true(inherits(pbp, "wehoop_data"))
  expect_true(nrow(pbp) > 0)

  core_cols <- c(
    "game_id",
    "season",
    "period",
    "clock_display_value",
    "home_team_id",
    "away_team_id"
  )
  expect_in(sort(core_cols), sort(colnames(pbp)))
})

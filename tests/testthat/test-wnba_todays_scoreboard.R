test_that("WNBA Todays Scoreboard", {
  skip_on_cran()
  skip_on_ci()
  skip_wnba_stats_test()

  x <- wnba_todays_scoreboard()

  # Skip-if-empty guard: no games today (off-season / dark day) returns an
  # empty tibble with no columns.
  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No games returned from wnba_todays_scoreboard at test time")
  }

  cols_x1 <- c(
    "game_id",
    "game_status",
    "home_team_id",
    "away_team_id"
  )

  expect_in(sort(cols_x1), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(3)

})

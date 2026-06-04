test_that("ESPN - WBB Athlete Stats", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_player_stats_v3(athlete_id = "4433985", season = 2025)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No data returned from endpoint at test time")
  }

  # Wide, self-describing tibble: one row per athlete-season-team.
  cols <- c("athlete_id", "season", "team_id", "team_slug")
  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")
  # Category-prefixed stat columns are present.
  expect_true(any(grepl("^avg_", colnames(x))))

  Sys.sleep(1)
})

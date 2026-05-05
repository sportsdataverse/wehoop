
test_that("ESPN - WBB Team Schedule", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_team_schedule(team_id = 2509, season = 2025, season_type = 2)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wbb_team_schedule at test time")
  }

  cols <- c(
    "event_id",
    "season",
    "season_type",
    "date",
    "name",
    "short_name",
    "opponent_id",
    "home_away",
    "winner"
  )

  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")
  expect_true(nrow(x) > 0)

  Sys.sleep(1)
})

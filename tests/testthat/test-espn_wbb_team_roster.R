
test_that("ESPN - WBB Team Roster", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_team_roster(team_id = 2509, season = 2025)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wbb_team_roster at test time")
  }

  cols <- c(
    "athlete_id",
    "full_name",
    "jersey",
    "position_abbrev",
    "position_name",
    "team_id",
    "season"
  )

  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")
  expect_true(nrow(x) > 0)

  Sys.sleep(1)
})

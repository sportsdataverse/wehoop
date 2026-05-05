
test_that("ESPN - WNBA Team Injuries", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  # Las Vegas Aces (team_id = 17) as the example team.
  x <- espn_wnba_team_injuries(team_id = "17")

  # Skip-if-empty guard: injury data may be absent outside the WNBA season.
  expect_true(is.data.frame(x) || is.null(x))

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0L) {
    skip("No injury rows returned for WNBA team 17 at test time (may be off-season or no active injuries)")
  }

  cols <- c(
    "team_id",
    "athlete_id",
    "athlete_name",
    "position",
    "status"
  )

  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})


test_that("ESPN - WBB Team Injuries", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  # UConn (team_id = 2509) is a large program — most likely to have
  # populated injury data when any WBB data is available.
  x <- espn_wbb_team_injuries(team_id = "2509")

  # Skip-if-empty guard: WBB team injury data is typically sparse on ESPN.
  expect_true(is.data.frame(x) || is.null(x))

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0L) {
    skip("No injury rows returned for WBB team 2509 at test time (expected — WBB injuries are typically sparse on ESPN)")
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

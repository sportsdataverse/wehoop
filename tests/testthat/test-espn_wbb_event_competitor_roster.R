test_that("ESPN - WBB Event Competitor Roster", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wbb_event_competitor_roster(event_id = 401276115, team_id = 52)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wbb_event_competitor_roster at test time")
  }

  required_cols <- c(
    "league",
    "event_id",
    "team_id"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})


test_that("ESPN - WNBA Event Competitor Roster Entry", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_event_competitor_roster_entry(event_id = 401736171, team_id = 17, athlete_id = "3149391")

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wnba_event_competitor_roster_entry at test time")
  }

  required_cols <- c(
    "league",
    "event_id",
    "team_id",
    "athlete_id"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})


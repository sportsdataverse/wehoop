test_that("ESPN - WNBA Event Competitor Score", {
  skip_on_cran()
  skip_on_ci()
  skip_espn_test()

  x <- espn_wnba_game_team_score(event_id = 401736171, team_id = 17)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from espn_wnba_game_team_score at test time")
  }

  required_cols <- c(
    "league",
    "event_id",
    "team_id",
    "value"
  )
  expect_in(sort(required_cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")

  Sys.sleep(1)
})


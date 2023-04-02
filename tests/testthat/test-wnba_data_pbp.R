test_that("WNBA Data PBP", {
  skip_on_cran()
  skip_on_ci()
  x <- wnba_data_pbp(game_id = "1022200034")
  
  cols <- c(
    "game_id",
    "league",
    "period",
    "event_num",
    "clock",
    "description",
    "locX",
    "locY",
    "opt1",
    "opt2",
    "event_action_type",
    "event_type",
    "team_id",
    "offense_team_id",
    "player1_id",
    "player2_id",
    "player3_id",
    "home_score",
    "away_score",
    "order"
  )
  
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
 
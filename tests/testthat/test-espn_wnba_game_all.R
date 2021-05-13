
cols <- c("shooting_play", "sequence_number", "home_score", "scoring_play",
          "away_score", "id", "text", "score_value", "period_display_value", 
          "period_number", "coordinate_x", "coordinate_y", "clock_display_value", 
          "team_id", "type_id", "type_text", "play_id", 
          "athlete_id_1", "athlete_id_2", "athlete_id_3")

test_that("ESPN - WNBA Game all", {
  skip_on_cran()
  x <- espn_wnba_game_all(game_id = 401244185)
  expect_equal(colnames(x$Plays), cols)
  expect_s3_class(x$Plays, "data.frame")
})
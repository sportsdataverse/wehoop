test_that("WNBA Live Play-by-Play", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_live_pbp(game_id = "1022200034")
  
  cols_x1 <- c(
    "event_num",
    "clock",
    "time_actual",
    "period",
    "period_type",
    "action_type",
    "sub_type",
    "qualifiers",
    "player1_id",
    "x",
    "y",
    "offense_team_id",
    "home_score",
    "away_score",
    "edited",
    "order",
    "x_legacy",
    "y_legacy",
    "is_field_goal",
    "side",
    "description",
    "person_ids_filter",
    "team_id",
    "team_tricode",
    "descriptor",
    "jump_ball_recovered_name",
    "jump_ball_recoverd_person_id",
    "player_name",
    "player_name_i",
    "jump_ball_won_player_name",
    "jump_ball_won_person_id",
    "jump_ball_lost_player_name",
    "jump_ball_lost_person_id",
    "shot_distance",
    "shot_result",
    "shot_action_number",
    "rebound_total",
    "rebound_defensive_total",
    "rebound_offensive_total",
    "turnover_total",
    "steal_player_name",
    "steal_person_id",
    "points_total",
    "assist_player_name_initial",
    "assist_person_id",
    "assist_total",
    "official_id",
    "foul_personal_total",
    "foul_technical_total",
    "foul_drawn_player_name",
    "foul_drawn_person_id",
    "block_player_name",
    "block_person_id",
    "value",
    "player2_id",
    "player3_id"
  )
  
  
  expect_equal(sort(colnames(x)), sort(cols_x1))
  expect_s3_class(x, "data.frame")
  
  Sys.sleep(3)
  
})

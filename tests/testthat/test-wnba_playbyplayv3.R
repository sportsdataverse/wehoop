test_that("WNBA PlayByPlay V3", {
  skip_on_cran()
  skip_on_ci()

  x <- wnba_playbyplayv3(game_id = "1022200034")

  expect_true("PlayByPlay" %in% names(x))
  expect_true("AvailableVideo" %in% names(x))
  expect_s3_class(x$PlayByPlay, "data.frame")
  expect_true(nrow(x$PlayByPlay) > 0)

  core_cols <- c(
    "game_id",
    "action_number",
    "clock",
    "period",
    "action_type",
    "description"
  )
  expect_true(all(core_cols %in% colnames(x$PlayByPlay)))

  Sys.sleep(3)

})


test_that("WNBA PBP V3 via wnba_pbp()", {
  skip_on_cran()
  skip_on_ci()

  x <- wnba_pbp(game_id = "1022200034", version = "v3", on_court = FALSE)

  expect_s3_class(x, "data.frame")
  expect_true(nrow(x) > 0)

  core_v2_cols <- c(
    "game_id",
    "event_num",
    "event_type",
    "event_action_type",
    "period",
    "minute_game",
    "time_remaining",
    "time_quarter",
    "minute_remaining_quarter",
    "seconds_remaining_quarter",
    "home_description",
    "neutral_description",
    "visitor_description",
    "description",
    "score",
    "away_score",
    "home_score",
    "score_margin",
    "person1type",
    "player1_id",
    "player1_name",
    "player1_team_id",
    "player1_team_abbreviation",
    "player2_id",
    "player2_name",
    "player3_id",
    "player3_name",
    "team_leading"
  )
  expect_true(all(core_v2_cols %in% colnames(x)))

  # V3-only columns retained
  v3_cols <- c(
    "x_legacy",
    "y_legacy",
    "shot_distance",
    "shot_result",
    "is_field_goal",
    "points_total",
    "shot_value"
  )
  expect_true(all(v3_cols %in% colnames(x)))

  Sys.sleep(3)

})


test_that("WNBA PBP V3 with on-court players", {
  skip_on_cran()
  skip_on_ci()

  x <- wnba_pbp(game_id = "1022200034", version = "v3", on_court = TRUE)

  expect_s3_class(x, "data.frame")
  expect_true(nrow(x) > 0)

  oncourt_cols <- c(
    "away_player1", "away_player2", "away_player3", "away_player4", "away_player5",
    "home_player1", "home_player2", "home_player3", "home_player4", "home_player5"
  )
  expect_true(all(oncourt_cols %in% colnames(x)))

  Sys.sleep(3)

})

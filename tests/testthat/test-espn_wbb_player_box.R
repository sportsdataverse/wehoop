
test_that("ESPN - WBB Player Box", {
  skip_on_cran()
  x <- espn_wbb_player_box(game_id = 401276115)
  cols <- c(
    "game_id",
    "season",
    "season_type",
    "game_date",
    "athlete_id",
    "athlete_display_name",
    "team_id",
    "team_name",
    "team_short_display_name",
    "minutes",
    "field_goals_made",
    "field_goals_attempted",
    "three_point_field_goals_made",
    "three_point_field_goals_attempted",
    "free_throws_made",
    "free_throws_attempted",
    "offensive_rebounds",
    "defensive_rebounds",
    "rebounds",
    "assists",
    "steals",
    "blocks",
    "turnovers",
    "fouls",
    "points",
    "starter",
    "ejected",
    "did_not_play",
    "active",
    "athlete_jersey",
    "athlete_short_name",
    "athlete_headshot_href",
    "athlete_position_name",
    "athlete_position_abbreviation",
    "team_logo",
    "team_abbreviation",
    "team_color",
    "team_alternate_color"
  )
  
  expect_equal(sort(colnames(x)), sort(cols))
  expect_s3_class(x, "data.frame")
})

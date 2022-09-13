

test_that("ESPN - WNBA Player Box", {
  skip_on_cran()
  cols <- c(
    "athlete_display_name",
    "team_short_display_name",
    "min",
    "fg",
    "fg3",
    "ft",
    "oreb",
    "dreb",
    "reb",
    "ast",
    "stl",
    "blk",
    "to",
    "pf",
    "+/-",
    "pts",
    "starter",
    "ejected",
    "did_not_play",
    "active",
    "athlete_jersey",
    "athlete_id",
    "athlete_short_name",
    "athlete_headshot_href",
    "athlete_position_name",
    "athlete_position_abbreviation",
    "team_name",
    "team_logo",
    "team_id",
    "team_abbreviation",
    "team_color",
    "team_alternate_color"
  )
  x <- espn_wnba_player_box(game_id = 401244185)
  expect_equal(sort(colnames(x)), sort(cols))
  expect_s3_class(x, "data.frame")
})

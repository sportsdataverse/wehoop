
cols <- c("matchup", "matchup_short", "season", "type", "slug", "game_id", 
          "game_uid", "game_date", "attendance","neutral_site","conference_competition",
          "home_team_name", "home_team_logo", 
          "home_team_abbreviation", "home_team_id", "home_team_location", "home_team_full_name", 
          "home_team_color", "home_score", "home_win", "home_record", "away_team_name", 
          "away_team_logo", "away_team_abbreviation", "away_team_id", "away_team_location", 
          "away_team_full_name", "away_team_color", "away_score", "away_win", 
          "away_record", "notes", "status_name","broadcast_market","broadcast_name", "start_date")

test_that("ESPN - WBB Scoreboard", {
  skip_on_cran()
  x <- espn_wbb_scoreboard(season="20210215")
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})


x <- wbb_espn_player_box(game_id = 401276115)


cols <- c("athlete.displayName", "team.shortDisplayName", "MIN", "FG", 
          "3PT", "FT", "OREB", "DREB", "REB", "AST", "STL", "BLK", "TO", 
          "PF", "PTS", "starter", "ejected", "didNotPlay", "active", "athlete.jersey", 
          "athlete.id", "athlete.shortName", "athlete.headshot.href", "athlete.position.name", 
          "athlete.position.abbreviation", "team.name", "team.logo", "team.id", 
          "team.abbreviation", "team.color", "team.alternateColor")

test_that("WBB ESPN Player Box", {
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
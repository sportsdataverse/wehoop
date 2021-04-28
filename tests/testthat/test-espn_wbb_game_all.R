
cols <- c("shootingPlay", "sequenceNumber", "homeScore", "scoringPlay", 
          "awayScore", "id", "text", "scoreValue", "period.displayValue", 
          "period.number", "coordinate.x", "coordinate.y", "clock.displayValue", 
          "team.id", "type.id", "type.text", "play.id", "athlete.id.1", 
          "athlete.id.2")

test_that("ESPN - WBB Play-by-Play", {
  skip_on_cran()
  x <- espn_wbb_game_all(game_id = 401276115)
  expect_equal(colnames(x$Plays), cols)
  expect_s3_class(x$Plays, "data.frame")
})
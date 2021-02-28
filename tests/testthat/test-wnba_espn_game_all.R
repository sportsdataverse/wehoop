
x <- wnba_espn_game_all(game_id = 401244185)

cols <- c("shootingPlay", "sequenceNumber", "homeScore", "scoringPlay", 
          "awayScore", "id", "text", "scoreValue", "period.displayValue", 
          "period.number", "coordinate.x", "coordinate.y", "clock.displayValue", 
          "team.id", "type.id", "type.text", "play.id", "athlete.id.1", 
          "athlete.id.2", "athlete.id.3")

test_that("WNBA ESPN Game all", {
  expect_equal(colnames(x$Plays), cols)
  expect_s3_class(x$Plays, "data.frame")
})
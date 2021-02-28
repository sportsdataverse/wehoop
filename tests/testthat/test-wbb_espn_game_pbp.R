
x <- wbb_espn_pbp(game_id = 401276115)


cols <- c("shootingPlay", "sequenceNumber", "homeScore", "scoringPlay", 
          "awayScore", "id", "text", "scoreValue", "period.displayValue", 
          "period.number", "coordinate.x", "coordinate.y", "clock.displayValue", 
          "team.id", "type.id", "type.text", "play.id", "athlete.id.1", 
          "athlete.id.2")

test_that("WBB ESPN Play-by-Play", {
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
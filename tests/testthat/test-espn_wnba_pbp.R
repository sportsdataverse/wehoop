
cols <- c("shootingPlay", "sequenceNumber", "homeScore", "scoringPlay", 
          "awayScore", "id", "text", "scoreValue", "period.displayValue", 
          "period.number", "coordinate.x", "coordinate.y", "clock.displayValue", 
          "team.id", "type.id", "type.text", "play.id", "athlete.id.1", 
          "athlete.id.2", "athlete.id.3")

test_that("ESPN - WNBA Play-by-Play", {
  skip_on_cran()
  x <- espn_wnba_pbp(game_id = 401244185)
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
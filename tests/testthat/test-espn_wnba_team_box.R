
cols <- c("home", "label", "away")

test_that("ESPN - WNBA Team Box", {
  skip_on_cran()
  x <- espn_wnba_team_box(game_id = 401244185)  
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
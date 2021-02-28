
x <- wnba_espn_team_box(game_id = 401244185)


cols <- c("Home", "label", "Away")

test_that("WNBA ESPN Team Box", {
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
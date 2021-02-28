
x <- wbb_espn_team_box(game_id = 401276115)


cols <- c("Home","label","Away")

test_that("WBB ESPN Team Box", {
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
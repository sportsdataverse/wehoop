
cols <- c("Home","label","Away")

test_that("ESPN - WBB Team Box", {
  skip_on_cran()
  x <- espn_wbb_team_box(game_id = 401276115)
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
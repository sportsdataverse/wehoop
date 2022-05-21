
cols <- c("team_id", "team", "mascot", "nickname", "abbreviation", 
          "display_name", "short_name",
          "color", "alternate_color", "logo", "logo_dark")

test_that("ESPN - WBB Teams", {
  skip_on_cran()
  x <- espn_wbb_teams()
  
  expect_equal(sort(colnames(x)), sort(cols))
  expect_s3_class(x, "data.frame")
})

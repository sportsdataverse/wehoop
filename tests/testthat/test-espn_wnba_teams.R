
cols <- c("team_id", "team", "mascot", "display_name", "short_name", 
          "abbreviation", "color", "alternate_color", "logo", "logo_dark")

test_that("ESPN - WNBA Teams", {
  skip_on_cran()
  x <- espn_wnba_teams()
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})


cols <- c(
  "team_id",
  "team",
  "mascot",
  "display_name",
  "short_name",
  "abbreviation",
  "color",
  "alternate_color",
  "logo",
  "logo_dark"
)

test_that("ESPN - WNBA Teams", {
  skip_on_cran()
  skip_espn_test()
  x <- espn_wnba_teams()
  expect_in(cols, colnames(x))
  expect_s3_class(x, "data.frame")
})
 

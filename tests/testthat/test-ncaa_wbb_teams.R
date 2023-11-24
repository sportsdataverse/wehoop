test_that("NCAA - Get WBB Teams", {
  skip_on_cran()
  skip_on_ci()
  x <- ncaa_wbb_teams(year = most_recent_wbb_season(), division = 1)
  
  cols <- c(
    "team_id",
    "team_name",
    "team_url",
    "conference_id",
    "conference",
    "division",
    "year",
    "season_id"
  )
  expect_in(sort(colnames(x)), sort(cols))
  expect_s3_class(x, 'data.frame')
  
})

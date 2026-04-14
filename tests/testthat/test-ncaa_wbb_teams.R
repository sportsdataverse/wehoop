test_that("NCAA - Get WBB Teams", {
  skip_on_cran()
  skip_on_ci()
  skip("stats.ncaa.org is currently 403-blocked for automated scraping; re-enable when reachable")
  x <- ncaa_wbb_teams(year = most_recent_wbb_season(), division = 1)

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0) {
    skip("No rows returned from ncaa_wbb_teams() at test time")
  }

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
  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, 'data.frame')
  
})

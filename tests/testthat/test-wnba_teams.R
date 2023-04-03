test_that("WNBA Teams", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_teams()
  
  cols_x1 <- c(
    "league_id",
    "season_id",
    "team_id",
    "team_city",
    "team_name",
    "team_slug",
    "conference",
    "division",
    "team_abbreviation",
    "team_name_full",
    "season",
    "espn_team_id",
    "abbreviation",
    "display_name",
    "mascot",
    "team",
    "color",
    "alternate_color",
    "logo",
    "logo_dark",
    "wnba_logo_svg"
  )
  
  
  expect_equal(sort(colnames(x)), sort(cols_x1))
  expect_s3_class(x, "data.frame")
  
  Sys.sleep(3)
  
})

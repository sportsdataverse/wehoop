test_that("WNBA Teams", {
  skip_on_cran()
  skip_on_ci()
  skip_wnba_stats_test()
  
  x <- wnba_teams()

  if (is.null(x) || !is.data.frame(x) || nrow(x) == 0 ||
      !"team_abbreviation" %in% colnames(x)) {
    # Standings-only fallback (LeagueGameLog returned empty, so the
    # snake_case team_* columns are missing). Skip schema assertions but
    # still confirm the function returned a data frame instead of erroring.
    if (!is.null(x)) expect_s3_class(x, "data.frame")
    skip("wnba_teams() returned a partial response at test time")
  }

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
  
  
  expect_in(sort(cols_x1), sort(colnames(x)))
  expect_s3_class(x, "data.frame")
  
  Sys.sleep(3)
  
})

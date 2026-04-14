test_that("WNBA League Dash Bio Stats", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_leaguedashplayerbiostats(league_id = "10", season = most_recent_wnba_season() - 1)

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    skip("No rows returned from endpoint at test time")
  }
  
  cols_x1 <- c(
    "PLAYER_ID",
    "PLAYER_NAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "AGE",
    "PLAYER_HEIGHT",
    "PLAYER_HEIGHT_INCHES",
    "PLAYER_WEIGHT",
    "COLLEGE",
    "COUNTRY",
    "DRAFT_YEAR",
    "DRAFT_ROUND",
    "DRAFT_NUMBER",
    "GP",
    "PTS",
    "REB",
    "AST",
    "NET_RATING",
    "OREB_PCT",
    "DREB_PCT",
    "USG_PCT",
    "TS_PCT",
    "AST_PCT"
  )
  
  
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
  
})

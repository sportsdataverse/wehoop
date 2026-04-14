test_that("WNBA Fantasy Widget", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_fantasywidget(league_id = "10", season = most_recent_wnba_season() - 1)

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    skip("No rows returned from endpoint at test time")
  }
  
  cols_x1 <- c(
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_POSITION",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "GP",
    "MIN",
    "FAN_DUEL_PTS",
    "NBA_FANTASY_PTS",
    "PTS",
    "REB",
    "AST",
    "BLK",
    "STL",
    "TOV",
    "FG3M",
    "FGA",
    "FG_PCT",
    "FTA",
    "FT_PCT"
  )
  
  
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
  
})

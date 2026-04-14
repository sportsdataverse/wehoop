test_that("WNBA Boxscore Advanced V2", {
  skip_on_cran()
  skip_on_ci()
  x <- wnba_boxscoreadvancedv2(game_id = "1022200034")

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    skip("No rows returned from endpoint at test time")
  }
  
  cols_x1 <- c(
    "GAME_ID",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_CITY",
    "PLAYER_ID",
    "PLAYER_NAME",
    "NICKNAME",
    "START_POSITION",
    "COMMENT",
    "MIN",
    "E_OFF_RATING",
    "OFF_RATING",
    "E_DEF_RATING",
    "DEF_RATING",
    "E_NET_RATING",
    "NET_RATING",
    "AST_PCT",
    "AST_TOV",
    "AST_RATIO",
    "OREB_PCT",
    "DREB_PCT",
    "REB_PCT",
    "TM_TOV_PCT",
    "EFG_PCT",
    "TS_PCT",
    "USG_PCT",
    "E_USG_PCT",
    "E_PACE",
    "PACE",
    "PACE_PER40",
    "POSS",
    "PIE"
  )
  
  cols_x2 <- c(
    "GAME_ID",
    "TEAM_ID",
    "TEAM_NAME",
    "TEAM_ABBREVIATION",
    "TEAM_CITY",
    "MIN",
    "E_OFF_RATING",
    "OFF_RATING",
    "E_DEF_RATING",
    "DEF_RATING",
    "E_NET_RATING",
    "NET_RATING",
    "AST_PCT",
    "AST_TOV",
    "AST_RATIO",
    "OREB_PCT",
    "DREB_PCT",
    "REB_PCT",
    "E_TM_TOV_PCT",
    "TM_TOV_PCT",
    "EFG_PCT",
    "TS_PCT",
    "USG_PCT",
    "E_USG_PCT",
    "E_PACE",
    "PACE",
    "PACE_PER40",
    "POSS",
    "PIE"
  )
  
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")
  expect_in(sort(cols_x2), sort(colnames(x[[2]])))
  expect_s3_class(x[[2]], "data.frame")
  
  Sys.sleep(3)
})
 

test_that("WNBA FanDuel Player Infographic", {
  skip_on_cran()
  skip_on_ci()
  x <- wnba_infographicfanduelplayer(game_id = "1022200034")

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    skip("No rows returned from endpoint at test time")
  }
  
  cols_x1 <- c(
    "PLAYER_ID",
    "PLAYER_NAME",
    "TEAM_ID",
    "TEAM_NAME",
    "TEAM_ABBREVIATION",
    "JERSEY_NUM",
    "PLAYER_POSITION",
    "LOCATION",
    "FAN_DUEL_PTS",
    "NBA_FANTASY_PTS",
    "USG_PCT",
    "MIN",
    "FGM",
    "FGA",
    "FG_PCT",
    "FG3M",
    "FG3A",
    "FG3_PCT",
    "FTM",
    "FTA",
    "FT_PCT",
    "OREB",
    "DREB",
    "REB",
    "AST",
    "TOV",
    "STL",
    "BLK",
    "BLKA",
    "PF",
    "PFD",
    "PTS",
    "PLUS_MINUS"
  )
  
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
})
 

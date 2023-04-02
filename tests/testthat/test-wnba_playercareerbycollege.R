test_that("WNBA Player Career by College", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_playercareerbycollege(college = 'Florida State', 
                                  per_mode = 'PerGame',
                                  season = most_recent_wnba_season() - 1)
  
  cols_x1 <- c(
    "PLAYER_ID",
    "PLAYER_NAME",
    "COLLEGE",
    "GP",
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
    "PF",
    "PTS"
  )
  
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
  
})

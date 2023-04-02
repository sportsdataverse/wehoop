test_that("WNBA Player Compare", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_playercompare(player_id_list = '100720,202250,204319,1627668,1628931', 
                          vs_player_id_list = '202252,203399,1631022,1628878,204333')
  
  cols_x1 <- c(
    "GROUP_SET",
    "DESCRIPTION",
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
  
  cols_x2 <- c(
    "GROUP_SET",
    "DESCRIPTION",
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
  
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  expect_equal(sort(colnames(x[[2]])), sort(cols_x2))
  expect_s3_class(x[[2]], "data.frame")
  
  Sys.sleep(3)
  
})
test_that("WNBA Player Compare", {
  skip_on_cran()
  skip_on_ci()
  skip_wnba_stats_test()
  
  x <- wnba_playercompare(player_id_list = '204324,1627700,1628276,1628922,1642288', 
                          vs_player_id_list = '203014,203400,204365,1628931,1629496',
                          season = 2025)

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    fail("No rows returned from endpoint at test time")
    return(invisible(NULL))
  }
  
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
  
  
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")
  expect_in(sort(cols_x2), sort(colnames(x[[2]])))
  expect_s3_class(x[[2]], "data.frame")
  
  Sys.sleep(3)
  
})

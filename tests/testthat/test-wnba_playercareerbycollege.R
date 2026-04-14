test_that("WNBA Player Career by College", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_playercareerbycollege(college = 'Florida State', 
                                  per_mode = 'PerGame',
                                  season = most_recent_wnba_season() - 1)

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    skip("No rows returned from endpoint at test time")
  }
  
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
  
  
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
  
})

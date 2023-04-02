test_that("WNBA Player Estimated Metrics", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_playerestimatedmetrics(league_id = '10', season = most_recent_wnba_season() - 1)
  
  cols_x1 <- c(
    "PLAYER_ID",
    "PLAYER_NAME",
    "GP",
    "W",
    "L",
    "W_PCT",
    "MIN",
    "E_OFF_RATING",
    "E_DEF_RATING",
    "E_NET_RATING",
    "E_AST_RATIO",
    "E_OREB_PCT",
    "E_DREB_PCT",
    "E_REB_PCT",
    "E_TOV_PCT",
    "E_USG_PCT",
    "E_PACE",
    "GP_RANK",
    "W_RANK",
    "L_RANK",
    "W_PCT_RANK",
    "MIN_RANK",
    "E_OFF_RATING_RANK",
    "E_DEF_RATING_RANK",
    "E_NET_RATING_RANK",
    "E_AST_RATIO_RANK",
    "E_OREB_PCT_RANK",
    "E_DREB_PCT_RANK",
    "E_REB_PCT_RANK",
    "E_TOV_PCT_RANK",
    "E_USG_PCT_RANK",
    "E_PACE_RANK"
  )
  
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
  
})

test_that("WNBA Shotchart League-Wide", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_shotchartleaguewide(league_id = '10', season = most_recent_wnba_season() - 1)
  
  
  cols_x1 <- c(
    "GRID_TYPE",
    "SHOT_ZONE_BASIC",
    "SHOT_ZONE_AREA",
    "SHOT_ZONE_RANGE",
    "FGA",
    "FGM",
    "FG_PCT"
  )
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
  
})
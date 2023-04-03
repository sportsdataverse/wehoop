test_that("WNBA Team Game Streak Finder", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_teamgamestreakfinder(season = most_recent_wnba_season())
  
  
  cols_x1 <- c(
    "TEAM_NAME",
    "TEAM_ID",
    "GAMESTREAK",
    "STARTDATE",
    "ENDDATE",
    "ACTIVESTREAK",
    "NUMSEASONS",
    "LASTSEASON",
    "FIRSTSEASON",
    "ABBREVIATION"
  )
  
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
  
})

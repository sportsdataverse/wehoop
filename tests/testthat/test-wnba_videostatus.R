test_that("WNBA Video Status", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_videostatus(game_date = '2022-06-10', league_id = '10')
  
  cols_x1 <- c(
    "GAME_ID",
    "GAME_DATE",
    "VISITOR_TEAM_ID",
    "VISITOR_TEAM_CITY",
    "VISITOR_TEAM_NAME",
    "VISITOR_TEAM_ABBREVIATION",
    "HOME_TEAM_ID",
    "HOME_TEAM_CITY",
    "HOME_TEAM_NAME",
    "HOME_TEAM_ABBREVIATION",
    "GAME_STATUS",
    "GAME_STATUS_TEXT",
    "IS_AVAILABLE",
    "PT_XYZ_AVAILABLE"
  )
  
  
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
  
})

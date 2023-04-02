test_that("WNBA Common All Players", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_commonallplayers(league_id = "10", season = most_recent_wnba_season() - 1)
  
  cols_x1 <- c(
    "PERSON_ID",
    "DISPLAY_LAST_COMMA_FIRST",
    "DISPLAY_FIRST_LAST",
    "ROSTERSTATUS",
    "FROM_YEAR",
    "TO_YEAR",
    "PLAYERCODE",
    "PLAYER_SLUG",
    "TEAM_ID",
    "TEAM_CITY",
    "TEAM_NAME",
    "TEAM_ABBREVIATION",
    "TEAM_CODE",
    "TEAM_SLUG",
    "GAMES_PLAYED_FLAG",
    "NBA_ASSIGNED_TEAM_ID",
    "IS_NBA_ASSIGNED"
  )
  
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
  
})

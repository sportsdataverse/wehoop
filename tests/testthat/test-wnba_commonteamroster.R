test_that("WNBA Common Team Roster", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_commonteamroster(season = most_recent_wnba_season() - 1, team_id = '1611661317')

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    skip("No rows returned from endpoint at test time")
  }
  
  cols_x1 <- c(
    "TeamID",
    "SEASON",
    "LeagueID",
    "PLAYER",
    "NICKNAME",
    "PLAYER_SLUG",
    "NUM",
    "POSITION",
    "HEIGHT",
    "WEIGHT",
    "BIRTH_DATE",
    "AGE",
    "EXP",
    "SCHOOL",
    "PLAYER_ID",
    "HOW_ACQUIRED"
  )
  
  cols_x2 <- c(
  )
  
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")
  # expect_in(sort(cols_x2), sort(colnames(x[[2]])))
  expect_s3_class(x[[2]], "data.frame")
  
  Sys.sleep(3)
  
})

test_that("WNBA Cumulative Stats Team Games", {
  skip_on_cran()
  skip_on_ci()
  x <- wnba_cumestatsteamgames(team_id = 1611661317, season = "2021-22")
  
  cols_x1 <- c(
    "MATCHUP",
    "GAME_ID"
  )
  
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
})
 
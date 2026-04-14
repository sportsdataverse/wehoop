test_that("WNBA Cumulative Stats Player Games", {
  skip_on_cran()
  skip_on_ci()
  x <- wnba_cumestatsplayergames(player_id = "204319", season = "2021-22")

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    skip("No rows returned from endpoint at test time")
  }
  
  cols_x1 <- c(
    "MATCHUP",
    "GAME_ID"
  )
  
  
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
})
 

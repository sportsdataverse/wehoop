test_that("WNBA Assist Leaders", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_assistleaders(league_id = "10")
  
  cols_x1 <- c(
    "RANK",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "AST"
  )
  
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
  
})

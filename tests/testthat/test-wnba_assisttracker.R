test_that("WNBA Assist Tracker", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_assisttracker(league_id = "10")
  
  cols_x1 <- c(
    "ASSISTS"
  )
  
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  
  Sys.sleep(3)
  
})

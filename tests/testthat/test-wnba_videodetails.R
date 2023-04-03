test_that("WNBA Video Details", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_videodetails(player_id = '1627668', team_id = '1611661328')
  
  cols_x1 <- c(
    "uuid",
    "dur",
    "stt",
    "stp",
    "sth",
    "stw",
    "mtt",
    "mtp",
    "mth",
    "mtw",
    "ltt",
    "ltp",
    "lth",
    "ltw"
  )
  
  cols_x2 <- c(
    "gi",
    "ei",
    "y",
    "m",
    "d",
    "gc",
    "p",
    "dsc",
    "ha",
    "va",
    "hpb",
    "hpa",
    "vpb",
    "vpa",
    "pta"
  )
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  expect_equal(sort(colnames(x[[2]])), sort(cols_x2))
  expect_s3_class(x[[2]], "data.frame")
  
  Sys.sleep(3)
  
})

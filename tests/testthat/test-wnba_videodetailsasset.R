test_that("WNBA Video Details Asset", {
  skip()
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_videodetailsasset(player_id = '1627668', team_id = '1611661328')
  
  cols_x1 <- c(
    "uuid",
    "sdur",
    "surl",
    "sth",
    "mdur",
    "murl",
    "mth",
    "ldur",
    "lurl",
    "lth",
    "vtt",
    "scc",
    "srt"
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
    "hid",
    "va",
    "vid",
    "hpb",
    "hpa",
    "vpb",
    "vpa",
    "pta"
  )
  
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")
  expect_in(sort(cols_x2), sort(colnames(x[[2]])))
  expect_s3_class(x[[2]], "data.frame")
  
  Sys.sleep(3)
  
})

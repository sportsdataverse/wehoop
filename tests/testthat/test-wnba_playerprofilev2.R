test_that("WNBA Player Profile V2", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_playerprofilev2(player_id = "1628932")
  
  cols_x1 <- c(
  )
  
  cols_x2 <- c(
  )
  
  cols_x3 <- c(
  )
  
  cols_x4 <- c(
  )
  
  cols_x5 <- c(
  )
  
  cols_x6 <- c(
  )
  
  cols_x7 <- c(
  )
  
  cols_x8 <- c(
  )
  
  cols_x9 <- c(
  )
  
  cols_x10 <- c(
  )
  
  cols_x11 <- c(
  )
  
  cols_x12 <- c(
  )
  
  cols_x13 <- c(
    "PLAYER_ID",
    "GAME_DATE",
    "VS_TEAM_ID",
    "VS_TEAM_CITY",
    "VS_TEAM_NAME",
    "VS_TEAM_ABBREVIATION",
    "STAT",
    "STATS_VALUE",
    "STAT_ORDER",
    "DATE_EST"
  )
  
  cols_x14 <- c(
    "PLAYER_ID",
    "GAME_DATE",
    "VS_TEAM_ID",
    "VS_TEAM_CITY",
    "VS_TEAM_NAME",
    "VS_TEAM_ABBREVIATION",
    "STAT",
    "STATS_VALUE",
    "STAT_ORDER",
    "DATE_EST"
  )
  
  cols_x15 <- c(
    "GAME_ID",
    "GAME_DATE",
    "GAME_TIME",
    "PLAYER_TEAM_ID",
    "PLAYER_TEAM_CITY",
    "PLAYER_TEAM_NICKNAME",
    "PLAYER_TEAM_ABBREVIATION",
    "VS_TEAM_ID",
    "VS_TEAM_CITY",
    "VS_TEAM_NICKNAME",
    "VS_TEAM_ABBREVIATION"
  )
  
  # expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  # expect_equal(sort(colnames(x[[2]])), sort(cols_x2))
  expect_s3_class(x[[2]], "data.frame")
  # expect_equal(sort(colnames(x[[3]])), sort(cols_x3))
  expect_s3_class(x[[3]], "data.frame")
  # expect_equal(sort(colnames(x[[4]])), sort(cols_x4))
  expect_s3_class(x[[4]], "data.frame")
  # expect_equal(sort(colnames(x[[5]])), sort(cols_x5))
  expect_s3_class(x[[5]], "data.frame")
  # expect_equal(sort(colnames(x[[6]])), sort(cols_x6))
  expect_s3_class(x[[6]], "data.frame")
  # expect_equal(sort(colnames(x[[7]])), sort(cols_x7))
  expect_s3_class(x[[7]], "data.frame")
  # expect_equal(sort(colnames(x[[8]])), sort(cols_x8))
  expect_s3_class(x[[8]], "data.frame")
  # expect_equal(sort(colnames(x[[9]])), sort(cols_x9))
  expect_s3_class(x[[9]], "data.frame")
  # expect_equal(sort(colnames(x[[10]])), sort(cols_x10))
  expect_s3_class(x[[10]], "data.frame")
  # expect_equal(sort(colnames(x[[11]])), sort(cols_x11))
  expect_s3_class(x[[11]], "data.frame")
  # expect_equal(sort(colnames(x[[12]])), sort(cols_x12))
  expect_s3_class(x[[12]], "data.frame")
  expect_equal(sort(colnames(x[[13]])), sort(cols_x13))
  expect_s3_class(x[[13]], "data.frame")
  expect_equal(sort(colnames(x[[14]])), sort(cols_x14))
  expect_s3_class(x[[14]], "data.frame")
  expect_equal(sort(colnames(x[[15]])), sort(cols_x15))
  expect_s3_class(x[[15]], "data.frame")
  
  Sys.sleep(3)
  
})

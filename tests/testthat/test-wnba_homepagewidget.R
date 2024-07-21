test_that("WNBA Home Page Widget", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_homepagewidget(player_or_team = "Player")
  
  cols_x1 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "season",
    "seasontype",
    "permode",
    "RANK",
    "PLAYER_ID",
    "PLAYER_NAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "PTS",
    "FIRST_NAME",
    "NICKNAME",
    "LAST_NAME",
    "JERSEY_NUM",
    "POSITION"
  )
  
  cols_x2 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "season",
    "seasontype",
    "permode",
    "RANK",
    "PLAYER_ID",
    "PLAYER_NAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "REB",
    "FIRST_NAME",
    "NICKNAME",
    "LAST_NAME",
    "JERSEY_NUM",
    "POSITION"
  )
  
  cols_x3 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "season",
    "seasontype",
    "permode",
    "RANK",
    "PLAYER_ID",
    "PLAYER_NAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "AST",
    "FIRST_NAME",
    "NICKNAME",
    "LAST_NAME",
    "JERSEY_NUM",
    "POSITION"
  )
  
  cols_x4 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "season",
    "seasontype",
    "permode",
    "RANK",
    "PLAYER_ID",
    "PLAYER_NAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "BLK",
    "FIRST_NAME",
    "NICKNAME",
    "LAST_NAME",
    "JERSEY_NUM",
    "POSITION"
  )
  
  cols_x5 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "season",
    "seasontype",
    "permode",
    "RANK",
    "PLAYER_ID",
    "PLAYER_NAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "STL",
    "FIRST_NAME",
    "NICKNAME",
    "LAST_NAME",
    "JERSEY_NUM",
    "POSITION"
  )
  
  cols_x6 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "season",
    "seasontype",
    "permode",
    "RANK",
    "PLAYER_ID",
    "PLAYER_NAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "FG_PCT",
    "FIRST_NAME",
    "NICKNAME",
    "LAST_NAME",
    "JERSEY_NUM",
    "POSITION"
  )
  
  cols_x7 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "season",
    "seasontype",
    "permode",
    "RANK",
    "PLAYER_ID",
    "PLAYER_NAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "FG3M",
    "FIRST_NAME",
    "NICKNAME",
    "LAST_NAME",
    "JERSEY_NUM",
    "POSITION"
  )
  
  cols_x8 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "season",
    "seasontype",
    "permode",
    "RANK",
    "PLAYER_ID",
    "PLAYER_NAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "FG3_PCT",
    "FIRST_NAME",
    "NICKNAME",
    "LAST_NAME",
    "JERSEY_NUM",
    "POSITION"
  )
  
  cols_x9 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "season",
    "seasontype",
    "permode",
    "PLAYER_ID",
    "PLAYER_NAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "FANTASY_POINTS",
    "FIRST_NAME",
    "NICKNAME",
    "LAST_NAME",
    "JERSEY_NUM",
    "POSITION"
  )
  
  cols_x10 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "NICKNAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "PTS"
  )
  
  cols_x11 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "NICKNAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "REB"
  )
  
  cols_x12 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "NICKNAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "AST"
  )
  
  cols_x13 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "TD3"
  )
  
  cols_x14 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "TEAM_ABBREVIATION",
    "SEASON_YEAR",
    "TD3"
  )
  
  cols_x15 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "NICKNAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "FG3M",
    "GAME_ID"
  )
  
  cols_x16 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "NICKNAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "PTS",
    "GAME_ID"
  )
  
  cols_x17 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "NICKNAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "AST",
    "GAME_ID"
  )
  
  cols_x18 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "NICKNAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "STL",
    "GAME_ID"
  )
  
  cols_x19 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "NICKNAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "BLK",
    "GAME_ID"
  )
  
  cols_x20 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "NICKNAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "PCT_PTS_3PT"
  )
  
  cols_x21 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "NICKNAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "PCT_PTS_2PT"
  )
  
  cols_x22 <- c(
    "title",
    "deep_link",
    "name",
    "timestamp",
    "permode",
    "season",
    "seasontype",
    "PLAYER_ID",
    "PLAYER_NAME",
    "PLAYER_NAME_LAST_FIRST",
    "NICKNAME",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "PCT_PTS_2PT_MR"
  )
  
  expect_equal(sort(colnames(x[[1]])), sort(cols_x1))
  expect_s3_class(x[[1]], "data.frame")
  expect_equal(sort(colnames(x[[2]])), sort(cols_x2))
  expect_s3_class(x[[2]], "data.frame")
  expect_equal(sort(colnames(x[[3]])), sort(cols_x3))
  expect_s3_class(x[[3]], "data.frame")
  expect_equal(sort(colnames(x[[4]])), sort(cols_x4))
  expect_s3_class(x[[4]], "data.frame")
  expect_equal(sort(colnames(x[[5]])), sort(cols_x5))
  expect_s3_class(x[[5]], "data.frame")
  expect_equal(sort(colnames(x[[6]])), sort(cols_x6))
  expect_s3_class(x[[6]], "data.frame")
  expect_equal(sort(colnames(x[[7]])), sort(cols_x7))
  expect_s3_class(x[[7]], "data.frame")
  expect_equal(sort(colnames(x[[8]])), sort(cols_x8))
  expect_s3_class(x[[8]], "data.frame")
  expect_equal(sort(colnames(x[[9]])), sort(cols_x9))
  expect_s3_class(x[[9]], "data.frame")
  expect_equal(sort(colnames(x[[10]])), sort(cols_x10))
  expect_s3_class(x[[10]], "data.frame")
  expect_equal(sort(colnames(x[[11]])), sort(cols_x11))
  expect_s3_class(x[[11]], "data.frame")
  expect_equal(sort(colnames(x[[12]])), sort(cols_x12))
  expect_s3_class(x[[12]], "data.frame")
  expect_equal(sort(colnames(x[[13]])), sort(cols_x13))
  expect_s3_class(x[[13]], "data.frame")
  expect_equal(sort(colnames(x[[14]])), sort(cols_x14))
  expect_s3_class(x[[14]], "data.frame")
  expect_equal(sort(colnames(x[[15]])), sort(cols_x15))
  expect_s3_class(x[[15]], "data.frame")
  expect_equal(sort(colnames(x[[16]])), sort(cols_x16))
  expect_s3_class(x[[16]], "data.frame")
  expect_equal(sort(colnames(x[[17]])), sort(cols_x17))
  expect_s3_class(x[[17]], "data.frame")
  expect_equal(sort(colnames(x[[18]])), sort(cols_x18))
  expect_s3_class(x[[18]], "data.frame")
  expect_equal(sort(colnames(x[[19]])), sort(cols_x19))
  expect_s3_class(x[[19]], "data.frame")
  expect_equal(sort(colnames(x[[20]])), sort(cols_x20))
  expect_s3_class(x[[20]], "data.frame")
  expect_equal(sort(colnames(x[[21]])), sort(cols_x21))
  expect_s3_class(x[[21]], "data.frame")
  expect_equal(sort(colnames(x[[22]])), sort(cols_x22))
  expect_s3_class(x[[22]], "data.frame")
  
  Sys.sleep(3)
  
})

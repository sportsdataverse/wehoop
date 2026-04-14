test_that("WNBA Home Page Widget", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_homepagewidget(player_or_team = "Player")

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    skip("No rows returned from endpoint at test time")
  }
  
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
  
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")
  expect_in(sort(cols_x2), sort(colnames(x[[2]])))
  expect_s3_class(x[[2]], "data.frame")
  expect_in(sort(cols_x3), sort(colnames(x[[3]])))
  expect_s3_class(x[[3]], "data.frame")
  expect_in(sort(cols_x4), sort(colnames(x[[4]])))
  expect_s3_class(x[[4]], "data.frame")
  expect_in(sort(cols_x5), sort(colnames(x[[5]])))
  expect_s3_class(x[[5]], "data.frame")
  expect_in(sort(cols_x6), sort(colnames(x[[6]])))
  expect_s3_class(x[[6]], "data.frame")
  expect_in(sort(cols_x7), sort(colnames(x[[7]])))
  expect_s3_class(x[[7]], "data.frame")
  expect_in(sort(cols_x8), sort(colnames(x[[8]])))
  expect_s3_class(x[[8]], "data.frame")
  expect_in(sort(cols_x9), sort(colnames(x[[9]])))
  expect_s3_class(x[[9]], "data.frame")
  expect_in(sort(cols_x10), sort(colnames(x[[10]])))
  expect_s3_class(x[[10]], "data.frame")
  expect_in(sort(cols_x11), sort(colnames(x[[11]])))
  expect_s3_class(x[[11]], "data.frame")
  expect_in(sort(cols_x12), sort(colnames(x[[12]])))
  expect_s3_class(x[[12]], "data.frame")
  expect_in(sort(cols_x13), sort(colnames(x[[13]])))
  expect_s3_class(x[[13]], "data.frame")
  expect_in(sort(cols_x14), sort(colnames(x[[14]])))
  expect_s3_class(x[[14]], "data.frame")
  expect_in(sort(cols_x15), sort(colnames(x[[15]])))
  expect_s3_class(x[[15]], "data.frame")
  expect_in(sort(cols_x16), sort(colnames(x[[16]])))
  expect_s3_class(x[[16]], "data.frame")
  expect_in(sort(cols_x17), sort(colnames(x[[17]])))
  expect_s3_class(x[[17]], "data.frame")
  expect_in(sort(cols_x18), sort(colnames(x[[18]])))
  expect_s3_class(x[[18]], "data.frame")
  expect_in(sort(cols_x19), sort(colnames(x[[19]])))
  expect_s3_class(x[[19]], "data.frame")
  expect_in(sort(cols_x20), sort(colnames(x[[20]])))
  expect_s3_class(x[[20]], "data.frame")
  expect_in(sort(cols_x21), sort(colnames(x[[21]])))
  expect_s3_class(x[[21]], "data.frame")
  expect_in(sort(cols_x22), sort(colnames(x[[22]])))
  expect_s3_class(x[[22]], "data.frame")
  
  Sys.sleep(3)
  
})

test_that("WNBA Team vs Player", {
  skip_on_cran()
  skip_on_ci()
  
  x <- wnba_teamvsplayer(team_id = '1611661328', vs_player_id = '1628932')

  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) || nrow(x[[1]]) == 0) {
    skip("No rows returned from endpoint at test time")
  }
  
  
  cols_x1 <- c(
    "GROUP_SET",
    "GROUP_VALUE",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "GP",
    "W",
    "L",
    "W_PCT",
    "MIN",
    "FGM",
    "FGA",
    "FG_PCT",
    "FG3M",
    "FG3A",
    "FG3_PCT",
    "FTM",
    "FTA",
    "FT_PCT",
    "OREB",
    "DREB",
    "REB",
    "AST",
    "TOV",
    "STL",
    "BLK",
    "BLKA",
    "PF",
    "PFD",
    "PTS",
    "PLUS_MINUS",
    "GP_RANK",
    "W_RANK",
    "L_RANK",
    "W_PCT_RANK",
    "MIN_RANK",
    "FGM_RANK",
    "FGA_RANK",
    "FG_PCT_RANK",
    "FG3M_RANK",
    "FG3A_RANK",
    "FG3_PCT_RANK",
    "FTM_RANK",
    "FTA_RANK",
    "FT_PCT_RANK",
    "OREB_RANK",
    "DREB_RANK",
    "REB_RANK",
    "AST_RANK",
    "TOV_RANK",
    "STL_RANK",
    "BLK_RANK",
    "BLKA_RANK",
    "PF_RANK",
    "PFD_RANK",
    "PTS_RANK",
    "PLUS_MINUS_RANK"
  )
  
  cols_x2 <- c(
    "GROUP_SET",
    "GROUP_VALUE",
    "PLAYER_ID",
    "GP",
    "W",
    "L",
    "W_PCT",
    "MIN",
    "FGM",
    "FGA",
    "FG_PCT",
    "FG3M",
    "FG3A",
    "FG3_PCT",
    "FTM",
    "FTA",
    "FT_PCT",
    "OREB",
    "DREB",
    "REB",
    "AST",
    "TOV",
    "STL",
    "BLK",
    "BLKA",
    "PF",
    "PFD",
    "PTS",
    "PLUS_MINUS",
    "NBA_FANTASY_PTS",
    "DD2",
    "TD3",
    "WNBA_FANTASY_PTS",
    "GP_RANK",
    "W_RANK",
    "L_RANK",
    "W_PCT_RANK",
    "MIN_RANK",
    "FGM_RANK",
    "FGA_RANK",
    "FG_PCT_RANK",
    "FG3M_RANK",
    "FG3A_RANK",
    "FG3_PCT_RANK",
    "FTM_RANK",
    "FTA_RANK",
    "FT_PCT_RANK",
    "OREB_RANK",
    "DREB_RANK",
    "REB_RANK",
    "AST_RANK",
    "TOV_RANK",
    "STL_RANK",
    "BLK_RANK",
    "BLKA_RANK",
    "PF_RANK",
    "PFD_RANK",
    "PTS_RANK",
    "PLUS_MINUS_RANK",
    "NBA_FANTASY_PTS_RANK",
    "DD2_RANK",
    "TD3_RANK",
    "WNBA_FANTASY_PTS_RANK"
  )
  
  cols_x3 <- c(
    "GROUP_SET",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "VS_PLAYER_ID",
    "VS_PLAYER_NAME",
    "COURT_STATUS",
    "GP",
    "W",
    "L",
    "W_PCT",
    "MIN",
    "FGM",
    "FGA",
    "FG_PCT",
    "FG3M",
    "FG3A",
    "FG3_PCT",
    "FTM",
    "FTA",
    "FT_PCT",
    "OREB",
    "DREB",
    "REB",
    "AST",
    "TOV",
    "STL",
    "BLK",
    "BLKA",
    "PF",
    "PFD",
    "PTS",
    "PLUS_MINUS",
    "GP_RANK",
    "W_RANK",
    "L_RANK",
    "W_PCT_RANK",
    "MIN_RANK",
    "FGM_RANK",
    "FGA_RANK",
    "FG_PCT_RANK",
    "FG3M_RANK",
    "FG3A_RANK",
    "FG3_PCT_RANK",
    "FTM_RANK",
    "FTA_RANK",
    "FT_PCT_RANK",
    "OREB_RANK",
    "DREB_RANK",
    "REB_RANK",
    "AST_RANK",
    "TOV_RANK",
    "STL_RANK",
    "BLK_RANK",
    "BLKA_RANK",
    "PF_RANK",
    "PFD_RANK",
    "PTS_RANK",
    "PLUS_MINUS_RANK"
  )
  
  cols_x4 <- c(
    "GROUP_SET",
    "GROUP_VALUE",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "FGM",
    "FGA",
    "FG_PCT"
  )
  
  cols_x5 <- c(
    "GROUP_SET",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "VS_PLAYER_ID",
    "VS_PLAYER_NAME",
    "COURT_STATUS",
    "GROUP_VALUE",
    "FGM",
    "FGA",
    "FG_PCT"
  )
  
  cols_x6 <- c(
    "GROUP_SET",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "VS_PLAYER_ID",
    "VS_PLAYER_NAME",
    "COURT_STATUS",
    "GROUP_VALUE",
    "FGM",
    "FGA",
    "FG_PCT"
  )
  
  cols_x7 <- c(
    "GROUP_SET",
    "GROUP_VALUE",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "FGM",
    "FGA",
    "FG_PCT"
  )
  
  cols_x8 <- c(
    "GROUP_SET",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "VS_PLAYER_ID",
    "VS_PLAYER_NAME",
    "COURT_STATUS",
    "GROUP_VALUE",
    "FGM",
    "FGA",
    "FG_PCT"
  )
  
  cols_x9 <- c(
    "GROUP_SET",
    "TEAM_ID",
    "TEAM_ABBREVIATION",
    "TEAM_NAME",
    "VS_PLAYER_ID",
    "VS_PLAYER_NAME",
    "COURT_STATUS",
    "GROUP_VALUE",
    "FGM",
    "FGA",
    "FG_PCT"
  )
  
  check_cols <- function(i, cols) {
    if (length(x) < i || is.null(x[[i]]) || !is.data.frame(x[[i]]) ||
        ncol(x[[i]]) == 0) return(invisible(NULL))
    expect_in(sort(cols), sort(colnames(x[[i]])))
    expect_s3_class(x[[i]], "data.frame")
  }
  check_cols(1, cols_x1)
  check_cols(2, cols_x2)
  check_cols(3, cols_x3)
  check_cols(4, cols_x4)
  check_cols(5, cols_x5)
  check_cols(6, cols_x6)
  check_cols(7, cols_x7)
  check_cols(8, cols_x8)
  check_cols(9, cols_x9)
  
  Sys.sleep(3)
  
})

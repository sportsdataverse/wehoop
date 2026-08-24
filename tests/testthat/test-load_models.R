test_that("load_wnba_player_impact returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_wnba_player_impact(seasons = most_recent_wnba_stats_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("player_id", "player_name", "season", "rapm", "bpm", "war")), sort(colnames(df)))
})

test_that("load_wbb_player_value returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_wbb_player_value(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("player_id", "player", "season", "team_id", "box_bpm")), sort(colnames(df)))
})

test_that("load_wbb_ratings returns a wehoop_data tibble for the most recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_wbb_ratings(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("team_id", "season", "adj_o", "adj_d", "adj_em", "rank")), sort(colnames(df)))
})

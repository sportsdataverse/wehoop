test_that("load_ncaa_wbb_pbp returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_pbp(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_s3_class(df, "data.frame")
  expect_in(sort(c("contest_id", "season", "event_type", "poss_num")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_shots returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_shots(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("contest_id", "season", "shot_x", "shot_y", "made")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_lineups returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_lineups(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("lineup_key", "season", "team", "poss", "plus_minus")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_matchup_stints returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_matchup_stints(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("contest_id", "season", "matchup_key", "game_stint_num")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_possessions returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_possessions(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("contest_id", "season", "poss_num", "poss_team")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_rapm_within_team returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_rapm_within_team(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("team_id", "player_id", "season", "rapm_net")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_player_box returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_player_box(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("contest_id", "season", "player_id", "pts")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_team_box returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_team_box(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("contest_id", "season", "team_ncaa_team_id", "ortg", "drtg")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_rosters returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_rosters(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("season", "team", "player", "games")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_team_rosters returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_team_rosters(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("season", "team_id", "player_id", "position", "height")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_schedule returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_schedule(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("contest_id", "season", "home", "away", "home_score", "away_score")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_team_ids returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_team_ids(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("team", "conference", "id", "season")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_team_ids accepts a multi-season vector", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  season <- most_recent_wbb_season()
  df <- load_ncaa_wbb_team_ids(seasons = c(season - 1, season))

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_gte(length(unique(df$season)), 2)
})

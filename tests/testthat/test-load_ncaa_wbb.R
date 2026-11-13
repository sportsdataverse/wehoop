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

test_that("load_ncaa_wbb_rapm returns a wehoop_data tibble for a recent season", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  df <- load_ncaa_wbb_rapm(seasons = most_recent_wbb_season())

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_in(sort(c("player_id", "person_id", "season", "rapm_net")), sort(colnames(df)))
})

test_that("load_ncaa_wbb_rapm accepts a multi-season vector", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  season <- most_recent_wbb_season()
  df <- load_ncaa_wbb_rapm(seasons = c(season - 1, season))

  if (length(df) == 0 || nrow(df) == 0) {
    skip("No rows returned at test time -- release may not exist yet")
  }

  expect_s3_class(df, "wehoop_data")
  expect_gte(length(unique(df$season)), 2)
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

test_that("load_ncaa_wbb_* cast the numeric join ids and leave name columns alone (offline)", {
  local_mocked_bindings(
    rds_from_url = function(url) data.table::data.table(
      contest_id = "5722020", home_espn_team_id = "59", away_ncaa_team_id = NA_character_,
      home_1_player_id = "8724103", espn_game_id = "401711537",
      team_id = "Georgia Tech", shooter_id = "ToMorgan", id = "591979"
    ),
    .release_asset_exists = function(url) TRUE
  )
  shots <- load_ncaa_wbb_shots(seasons = 2025)
  expect_identical(shots$contest_id, 5722020L)
  expect_identical(shots$home_espn_team_id, 59L)
  expect_identical(shots$away_ncaa_team_id, NA_integer_)
  expect_identical(shots$home_1_player_id, 8724103L)
  expect_identical(shots$espn_game_id, 401711537L)
  expect_identical(shots$team_id, "Georgia Tech")
  expect_identical(shots$shooter_id, "ToMorgan")
  expect_identical(shots$id, "591979")
  expect_identical(load_ncaa_wbb_team_ids(seasons = 2025)$id, 591979L)
})

test_that("load_ncaa_wbb_* return integer join ids from the release", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()
  tb <- load_ncaa_wbb_team_box(seasons = 2025)
  for (k in c("contest_id", "team_ncaa_team_id", "team_espn_team_id", "espn_game_id")) {
    expect_type(tb[[k]], "integer")
  }
  tr <- load_ncaa_wbb_team_rosters(seasons = 2025)
  expect_type(tr$team_id, "integer")
  expect_type(tr$player_id, "integer")
})

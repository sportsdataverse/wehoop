base <- "https://github.com/sportsdataverse/sportsdataverse-data/releases/download/"

test_that("the new WNBA Stats loaders read their release assets (offline)", {
  urls <- character()
  local_mocked_bindings(
    rds_from_url = function(url) {
      urls <<- c(urls, url)
      data.table::data.table(season = 2026L)
    },
    .release_asset_exists = function(url) TRUE
  )
  for (f in list(load_wnba_stats_game_lineups, load_wnba_stats_metric_curves,
                 load_wnba_stats_rolling_windows, load_wnba_stats_player_boxscores,
                 load_wnba_stats_team_boxscores)) {
    expect_s3_class(f(seasons = 2026), "wehoop_data")
  }
  expect_equal(urls, paste0(base, c(
    "wnba_stats_game_lineups/wnba_lineups_2026.rds",
    "wnba_stats_metric_curves/metric_curves_2026.rds",
    "wnba_stats_rolling_windows/rolling_windows_2026.rds",
    "wnba_stats_player_boxscores/player_boxscores_2026.rds",
    "wnba_stats_team_boxscores/team_boxscores_2026.rds"
  )))
})

test_that("the box score loaders refuse seasons before their 2026 floor (offline)", {
  local_mocked_bindings(
    rds_from_url = function(url) stop("no download expected"),
    .release_asset_exists = function(url) TRUE
  )
  expect_error(load_wnba_stats_player_boxscores(seasons = 2025), "Published seasons: 2026")
  expect_error(load_wnba_stats_team_boxscores(seasons = 2025), "Published seasons: 2026")
  expect_error(load_wnba_stats_game_lineups(seasons = 1996), "Published seasons: 1997")
})

test_that("load_wnba_stats_coaches skips the unpublished 2019 season (offline)", {
  urls <- character()
  local_mocked_bindings(rds_from_url = function(url) {
    urls <<- c(urls, url)
    data.table::data.table(season = 2018L)
  })
  expect_warning(out <- load_wnba_stats_coaches(seasons = 2018:2020), "2019")
  expect_s3_class(out, "wehoop_data")
  expect_false(any(grepl("coaches_2019", urls)))
  expect_length(urls, 2)

  urls <- character()
  expect_no_warning(load_wnba_stats_coaches(seasons = TRUE))
  expect_false(any(grepl("coaches_2019", urls)))

  expect_warning(out <- load_wnba_stats_coaches(seasons = 2019), "2019")
  expect_equal(nrow(out), 0)
})

test_that("the new WNBA Stats loaders return the published tables", {
  skip_on_cran()
  skip_on_ci()
  skip_load_test()

  checks <- list(
    list(f = load_wnba_stats_game_lineups, cols = c("game_id", "action_number", "home_player_1", "away_player_5")),
    list(f = load_wnba_stats_metric_curves, cols = c("entity_type", "metric", "x_lo", "x_hi", "rate")),
    list(f = load_wnba_stats_rolling_windows, cols = c("entity_id", "metric", "window_n", "cur", "delta_prev")),
    list(f = load_wnba_stats_player_boxscores, cols = c("game_id", "team_id", "person_id", "points")),
    list(f = load_wnba_stats_team_boxscores, cols = c("game_id", "team_id", "points"))
  )
  for (ck in checks) {
    df <- ck$f(seasons = 2026)
    expect_s3_class(df, "wehoop_data")
    expect_gt(nrow(df), 0)
    expect_in(ck$cols, colnames(df))
  }
})

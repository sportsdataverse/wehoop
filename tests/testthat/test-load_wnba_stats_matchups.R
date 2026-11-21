# Offline: the release readers are mocked; `urls` records what was requested.
local_fake_matchups <- function(unpublished = "playoffs_totals_2026", env = parent.frame()) {
  urls <- character()
  local_mocked_bindings(
    .release_asset_exists = function(url) TRUE,
    rds_from_url = function(url) {
      urls <<- c(urls, url)
      if (grepl(unpublished, url, fixed = TRUE)) {
        cli::cli_warn("Failed to read {.url {url}}.", class = "wehoop_read_failed",
                      reason = "cannot open URL: HTTP status was '404 Not Found'")
        return(data.table::data.table())
      }
      data.table::data.table(off_player_id = 1L, def_player_id = 2L)
    },
    .env = env
  )
  function() urls
}

test_that("load_wnba_stats_matchups rejects unknown season types, per modes and seasons", {
  local_fake_matchups()
  expect_error(load_wnba_stats_matchups(2025, season_type = "preseason"), "Unknown")
  expect_error(load_wnba_stats_matchups(2025, per_mode = "per36"), "Unknown")
  expect_error(load_wnba_stats_matchups(2022), "must be seasons published")
})

test_that("load_wnba_stats_matchups reads one asset per season type and per mode", {
  urls <- local_fake_matchups()
  out <- load_wnba_stats_matchups(2024:2025, per_mode = "totals")
  expect_s3_class(out, "wehoop_data")
  expect_equal(nrow(out), 4L)
  expect_setequal(basename(urls()), c(
    "leagueseasonmatchups_regular-season_totals_2024.rds",
    "leagueseasonmatchups_playoffs_totals_2024.rds",
    "leagueseasonmatchups_regular-season_totals_2025.rds",
    "leagueseasonmatchups_playoffs_totals_2025.rds"
  ))
})

test_that("load_wnba_stats_matchups skips an unpublished playoffs file quietly", {
  local_fake_matchups()
  expect_no_warning(out <- load_wnba_stats_matchups(2026, per_mode = "totals"))
  expect_equal(nrow(out), 1L)
  # a season with nothing at all still warns
  expect_warning(out <- load_wnba_stats_matchups(2026, season_type = "playoffs",
                                                 per_mode = "totals"),
                 "no .*playoffs.* matchups for season 2026")
  expect_equal(nrow(out), 0L)
})

test_that("load_wnba_stats_matchups returns derived playoffs from the release", {
  skip_load_test()

  out <- load_wnba_stats_matchups(seasons = 2025, season_type = "playoffs",
                                  per_mode = "totals")
  expect_gt(nrow(out), 0)
  expect_in(c("off_player_id", "def_player_id", "matchup_min", "partial_poss",
              "season", "season_type", "per_mode"), colnames(out))
  expect_true(all(out$season_type == "playoffs"))
  expect_type(out$off_player_id, "integer")
  expect_match(out$matchup_min, "^[0-9]+:[0-9]{2}$")
})

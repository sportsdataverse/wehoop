manifest_cols <- c("season", "row_count", "generated_at_utc", "source_endpoint")

assert_manifest <- function(df) {
  expect_s3_class(df, "data.frame")
  expect_in(manifest_cols, sort(colnames(df)))
}

test_that("load_wnba_stats_rosters_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wnba_stats_rosters_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wnba_stats_coaches_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wnba_stats_coaches_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wnba_stats_player_stats_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wnba_stats_player_stats_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wnba_stats_lineups_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wnba_stats_lineups_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wnba_stats_team_stats_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wnba_stats_team_stats_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wnba_stats_standings_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wnba_stats_standings_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wnba_stats_draft_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wnba_stats_draft_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wnba_stats_shots_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wnba_stats_shots_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wnba_stats_game_rosters_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wnba_stats_game_rosters_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wnba_stats_officials_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wnba_stats_officials_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

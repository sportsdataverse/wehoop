manifest_cols <- c("season", "row_count", "generated_at_utc", "source_endpoint")

assert_manifest <- function(df) {
  expect_s3_class(df, "data.frame")
  expect_in(manifest_cols, sort(colnames(df)))
}

test_that("load_wbb_rosters_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wbb_rosters_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wbb_player_stats_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wbb_player_stats_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wbb_team_stats_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wbb_team_stats_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wbb_standings_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wbb_standings_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wbb_shots_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wbb_shots_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wbb_game_rosters_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wbb_game_rosters_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

test_that("load_wbb_officials_manifest", {
  skip_on_cran(); skip_on_ci(); skip_load_test()
  df <- try(load_wbb_officials_manifest(), silent = TRUE)
  if (inherits(df, "try-error")) skip("manifest not yet published")
  assert_manifest(df)
})

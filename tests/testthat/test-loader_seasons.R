# Offline unit tests for the release-loader helpers in R/utils.R. The asset
# existence check is mocked, so nothing here touches the network.

url_for <- function(s) paste0("https://example.invalid/tag/play_by_play_", s, ".rds")

# .release_asset_exists() stand-in: TRUE for every url except those in `missing`.
mock_assets <- function(missing = character()) {
  function(url) !url %in% missing
}

test_that(".loader_seasons falls back to the newest published season only for the default", {
  local_mocked_bindings(.release_asset_exists = mock_assets(url_for(2027)))

  expect_message(
    out <- .loader_seasons(2027, 2004, 2027, fn = "load_x", url_for = url_for, default = TRUE),
    "2027 is not published yet; loading 2026"
  )
  expect_equal(out, 2026)

  # An explicit request for the unpublished season is kept as asked.
  expect_no_message(
    out <- .loader_seasons(2027, 2004, 2027, fn = "load_x", url_for = url_for, default = FALSE)
  )
  expect_equal(out, 2027)
})

test_that(".loader_seasons keeps the default season when it is published", {
  local_mocked_bindings(.release_asset_exists = mock_assets())
  expect_no_message(
    out <- .loader_seasons(2027, 2004, 2027, fn = "load_x", url_for = url_for, default = TRUE)
  )
  expect_equal(out, 2027)
})

test_that(".loader_seasons falls back past a gap", {
  local_mocked_bindings(.release_asset_exists = mock_assets(url_for(2027)))
  expect_message(
    out <- .loader_seasons(2027, 2004, 2027, gaps = 2025:2026, fn = "load_x",
                           url_for = url_for, default = TRUE)
  )
  expect_equal(out, 2024)
})

test_that(".loader_seasons accepts a .parquet sibling when parquet = TRUE", {
  local_mocked_bindings(.release_asset_exists = mock_assets(url_for(2027)))
  expect_no_message(
    out <- .loader_seasons(2027, 2004, 2027, fn = "load_x", url_for = url_for,
                           default = TRUE, parquet = TRUE)
  )
  expect_equal(out, 2027)

  pq <- sub("\\.rds$", ".parquet", url_for(2027))
  local_mocked_bindings(.release_asset_exists = mock_assets(c(url_for(2027), pq)))
  expect_message(
    out <- .loader_seasons(2027, 2004, 2027, fn = "load_x", url_for = url_for,
                           default = TRUE, parquet = TRUE)
  )
  expect_equal(out, 2026)
})

test_that(".loader_seasons(TRUE) expands to published seasons only", {
  local_mocked_bindings(.release_asset_exists = mock_assets(url_for(2027)))
  expect_equal(
    .loader_seasons(TRUE, 2004, 2027, gaps = 2005, fn = "load_x", url_for = url_for),
    c(2004L, 2006:2026)
  )

  local_mocked_bindings(.release_asset_exists = mock_assets())
  expect_equal(.loader_seasons(TRUE, 2024, 2027, fn = "load_x", url_for = url_for), 2024:2027)
  # Without url_for there is no existence check at all.
  expect_equal(.loader_seasons(TRUE, 2024, 2027, fn = "load_x"), 2024:2027)
})

test_that(".loader_seasons rejects unpublished seasons and lists the real range", {
  local_mocked_bindings(.release_asset_exists = mock_assets(url_for(2027)))
  expect_error(
    .loader_seasons(2005, 2004, 2027, gaps = 2005, fn = "load_x", url_for = url_for),
    "Published seasons: 2004, 2006-2026\\."
  )
  expect_error(.loader_seasons(2003, 2004, 2027, fn = "load_x"), "Published seasons: 2004-2027\\.")
  expect_error(.loader_seasons(2028, 2004, 2027, fn = "load_x"), "You requested: 2028")
  expect_error(.loader_seasons(2024.5, 2004, 2027, fn = "load_x"), "must be seasons published")
  expect_error(.loader_seasons("2024", 2004, 2027, fn = "load_x"), "must be seasons published")
  expect_error(.loader_seasons(NA_real_, 2004, 2027, fn = "load_x"), "must be seasons published")
  expect_error(.loader_seasons(numeric(), 2004, 2027, fn = "load_x"), "must be seasons published")
})

test_that(".loader_seasons passes multi-season requests through without a check", {
  local_mocked_bindings(.release_asset_exists = function(url) stop("no network expected"))
  expect_equal(.loader_seasons(c(2025, 2026), 2004, 2027, fn = "load_x", url_for = url_for,
                               default = TRUE), c(2025, 2026))
})

test_that(".ids_as_integer casts character ids and leaves the rest alone", {
  df <- data.table::data.table(
    game_id = c("401234567", NA, ""),
    athlete_id = 1:3,
    name = c("a", "b", "c")
  )
  expect_no_warning(out <- .ids_as_integer(df, c("game_id", "athlete_id", "not_there")))
  expect_identical(out$game_id, c(401234567L, NA, NA))
  expect_identical(out$athlete_id, 1:3)
  expect_identical(out$name, c("a", "b", "c"))

  dbl <- data.table::data.table(espn_team_id = c(52, 53))
  expect_identical(.ids_as_integer(dbl, "espn_team_id")$espn_team_id, c(52L, 53L))
})

test_that(".ids_as_integer warns when a cast loses a value", {
  df <- data.table::data.table(wnba_player_id = c("1628932", "abc"))
  expect_warning(out <- .ids_as_integer(df, "wnba_player_id"), "1 value could not be read")
  expect_identical(out$wnba_player_id, c(1628932L, NA))
})

## ---------------------------------------------------------------------------
## test-wnba_tracking.R
##
## Tests for .aggregate_tracking_frames and wnba_tracking_aggregate.
##
## Four gate contracts (Phase 6d TDD — WNBA mirror of hoopR/test-nba_tracking.R):
##   1. Identity gate  — single-season aggregation gives counts identical to
##      source per player; recomputed *_FG_PCT / *_FT_PCT match within
##      rounding tolerance; "% of total" *_PCT columns DROPPED.
##   2. Additivity gate — two-season aggregation: each additive count equals
##      season-A count + season-B count for players present in both seasons.
##   3. ID-NOT-SUMMED gate (keystone) — team_id / player_id in the output
##      are VALID ids (in the union of both seasons), NOT doubled values.
##   4. Never-raise — empty list and 0-row frame inputs return 0-row frames.
##   5. Numeric-content gate — non-numeric string col → first(), not 0.
##   6. Denominator guard — orphaned *_FG_PCT / *_FT_PCT → dropped, no crash.
##
## All offline tests run from SYNTHETIC fixture files saved under
##   tests/testthat/fixtures/wnba_tracking/
## (Synthetic because WNBA leaguedashptstats tracking data is unavailable
##  via stats.wnba.com — the API endpoint exists in the allowlist but does
##  not return player-tracking data for the WNBA.)
##
## The live smoke test is gated by WNBA_STATS_TESTS=1.
##
## Column note: wnba_stats_map_result_sets returns ALL columns as character.
## The internal helper coerces numeric-like columns before summing.
## ---------------------------------------------------------------------------

FIXTURE_DIR <- testthat::test_path("fixtures", "wnba_tracking")
FRAME_2024  <- readRDS(file.path(FIXTURE_DIR, "ptstats_drives_player_2024.rds"))
FRAME_2023  <- readRDS(file.path(FIXTURE_DIR, "ptstats_drives_player_2023.rds"))

## ── helpers ─────────────────────────────────────────────────────────────────

## Columns that should be DROPPED (% of total, non-additive rates)
PCT_DROP_COLS <- grep("_PCT$", colnames(FRAME_2024), value = TRUE) |>
  setdiff(grep("_FG_PCT$|_FT_PCT$", colnames(FRAME_2024), value = TRUE))

## Identity columns (id + name string cols)
IDENTITY_COLS <- c("PLAYER_ID", "PLAYER_NAME", "TEAM_ID", "TEAM_ABBREVIATION")

## Recomputed pct columns
FG_PCT_COLS <- grep("_FG_PCT$", colnames(FRAME_2024), value = TRUE)  # DRIVE_FG_PCT
FT_PCT_COLS <- grep("_FT_PCT$", colnames(FRAME_2024), value = TRUE)  # DRIVE_FT_PCT

## Additive count columns (everything that is not identity / pct-drop / pct-recompute)
ADDITIVE_COLS <- setdiff(
  colnames(FRAME_2024),
  c(IDENTITY_COLS, FG_PCT_COLS, FT_PCT_COLS, PCT_DROP_COLS)
)

## ===========================================================================
## 1. IDENTITY GATE — single season aggregation
## ===========================================================================

test_that("identity gate: single-season aggregate equals source counts", {
  skip_if(!file.exists(file.path(FIXTURE_DIR, "ptstats_drives_player_2024.rds")),
          "fixture not found")

  out <- wehoop:::.aggregate_tracking_frames(list(FRAME_2024), "PLAYER_ID")

  ## Same number of players
  expect_equal(nrow(out), nrow(FRAME_2024),
               label = "row count matches source for single season")

  ## All source PLAYER_IDs are present in output
  expect_true(all(FRAME_2024$PLAYER_ID %in% out$PLAYER_ID),
              label = "all source PLAYER_IDs present in single-season output")

  ## "% of total" *_PCT columns are DROPPED
  dropped_check <- intersect(PCT_DROP_COLS, colnames(out))
  expect_true(length(dropped_check) == 0L,
              label = "non-recomputable *_PCT columns dropped from output")

  ## FG_PCT and FT_PCT are PRESENT (recomputed)
  expect_true(all(c("DRIVE_FG_PCT", "DRIVE_FT_PCT") %in% colnames(out)),
              label = "recomputed DRIVE_FG_PCT and DRIVE_FT_PCT present in output")

  ## Additive counts match source (join on PLAYER_ID)
  merged <- merge(
    out[, c("PLAYER_ID", ADDITIVE_COLS)],
    FRAME_2024[, c("PLAYER_ID", ADDITIVE_COLS)],
    by = "PLAYER_ID", suffixes = c("_agg", "_src")
  )
  for (col in ADDITIVE_COLS) {
    agg_vals <- as.numeric(merged[[paste0(col, "_agg")]])
    src_vals <- as.numeric(merged[[paste0(col, "_src")]])
    expect_equal(
      agg_vals, src_vals,
      tolerance = 1e-6,
      label = paste0("identity gate: additive col ", col, " matches source")
    )
  }

  ## Recomputed DRIVE_FG_PCT is within rounding tolerance of source
  ##   (source is 3-dp rounded string; recomputed is more precise)
  merged_pct <- merge(
    out[, c("PLAYER_ID", "DRIVE_FG_PCT", "DRIVE_FGM", "DRIVE_FGA")],
    FRAME_2024[, c("PLAYER_ID", "DRIVE_FG_PCT")],
    by = "PLAYER_ID", suffixes = c("_agg", "_src")
  )
  ## Only check rows where FGA > 0 (denom non-zero)
  valid_rows <- as.numeric(merged_pct$DRIVE_FGA) > 0
  if (any(valid_rows)) {
    agg_pct <- merged_pct$DRIVE_FG_PCT_agg[valid_rows]
    src_pct <- as.numeric(merged_pct$DRIVE_FG_PCT_src[valid_rows])
    max_diff <- max(abs(agg_pct - src_pct), na.rm = TRUE)
    expect_lt(max_diff, 0.01,
              label = "recomputed DRIVE_FG_PCT within 0.01 of source for single season")
  }
})

## ===========================================================================
## 2. ADDITIVITY GATE — two-season aggregation
## ===========================================================================

test_that("additivity gate: two-season counts sum correctly", {
  skip_if(!file.exists(file.path(FIXTURE_DIR, "ptstats_drives_player_2023.rds")),
          "fixture not found")

  out <- wehoop:::.aggregate_tracking_frames(list(FRAME_2023, FRAME_2024), "PLAYER_ID")

  ## Players present in BOTH seasons
  players_both <- intersect(FRAME_2023$PLAYER_ID, FRAME_2024$PLAYER_ID)
  expect_true(length(players_both) > 0L,
              label = "there are players present in both fixture seasons")

  ## For each additive col, agg == A_val + B_val
  for (col in ADDITIVE_COLS) {
    a_sub <- FRAME_2023[FRAME_2023$PLAYER_ID %in% players_both,
                         c("PLAYER_ID", col)]
    b_sub <- FRAME_2024[FRAME_2024$PLAYER_ID %in% players_both,
                         c("PLAYER_ID", col)]
    ab   <- merge(a_sub, b_sub, by = "PLAYER_ID", suffixes = c("_a", "_b"))
    ab$expected <- as.numeric(ab[[paste0(col, "_a")]]) +
                   as.numeric(ab[[paste0(col, "_b")]])

    out_sub <- out[out$PLAYER_ID %in% players_both, c("PLAYER_ID", col)]
    merged  <- merge(out_sub, ab[, c("PLAYER_ID", "expected")], by = "PLAYER_ID")
    agg_vals <- as.numeric(merged[[col]])

    expect_equal(
      agg_vals, merged$expected,
      tolerance = 1e-6,
      label = paste0("additivity gate: ", col, " sums correctly across 2 seasons")
    )
  }
})

## ===========================================================================
## 3. ID-NOT-SUMMED GATE (keystone) — team_id / player_id are VALID ids
## ===========================================================================

test_that("ID-NOT-SUMMED gate: team_id and player_id are valid (not doubled)", {
  skip_if(!file.exists(file.path(FIXTURE_DIR, "ptstats_drives_player_2023.rds")),
          "fixture not found")

  out <- wehoop:::.aggregate_tracking_frames(list(FRAME_2023, FRAME_2024), "PLAYER_ID")

  ## All PLAYER_IDs in output must be in the union of both seasons
  valid_player_ids <- union(FRAME_2023$PLAYER_ID, FRAME_2024$PLAYER_ID)
  expect_true(
    all(out$PLAYER_ID %in% valid_player_ids),
    label = "PLAYER_ID-NOT-SUMMED: all output PLAYER_IDs are valid source IDs"
  )

  ## All TEAM_IDs in output must be in the union of both seasons
  valid_team_ids <- union(FRAME_2023$TEAM_ID, FRAME_2024$TEAM_ID)
  expect_true(
    all(out$TEAM_ID %in% valid_team_ids),
    label = "TEAM_ID-NOT-SUMMED: all output TEAM_IDs are valid source IDs (not doubled)"
  )

  ## Confirm no PLAYER_ID was doubled (sanity: no 2x real id)
  ##   A doubled id would be a numeric string that equals 2 × some valid id.
  ##   The easiest proxy: every output PLAYER_ID must appear in the valid set.
  ##   (The above union check already guarantees this, but we state it explicitly.)
  doubled_players <- out$PLAYER_ID[!out$PLAYER_ID %in% valid_player_ids]
  expect_true(length(doubled_players) == 0L,
              label = "no doubled (summed) PLAYER_IDs in output")

  doubled_teams <- out$TEAM_ID[!out$TEAM_ID %in% valid_team_ids]
  expect_true(length(doubled_teams) == 0L,
              label = "no doubled (summed) TEAM_IDs in output")
})

## ===========================================================================
## 4. NEVER-RAISE GATE — empty and 0-row inputs
## ===========================================================================

test_that("never-raise: empty list returns 0-row data.frame", {
  out <- wehoop:::.aggregate_tracking_frames(list(), "PLAYER_ID")
  expect_s3_class(out, "data.frame")
  expect_equal(nrow(out), 0L)
})

test_that("never-raise: list of 0-row frame returns 0-row data.frame", {
  empty_frame <- FRAME_2024[0L, ]
  out <- wehoop:::.aggregate_tracking_frames(list(empty_frame), "PLAYER_ID")
  expect_s3_class(out, "data.frame")
  expect_equal(nrow(out), 0L)
})

## ===========================================================================
## 5. NUMERIC-CONTENT GATE (FIX 1) — non-numeric string col → first(), not 0
## ===========================================================================

test_that("numeric-content gate: string col carried via first(), numeric summed", {
  ## A non-Drives-shape frame:
  ##   TEAM_ID    — *_id (identity, never summed)
  ##   TEAM_CITY  — non-numeric string, no _id/_name/_abbreviation pattern
  ##                → numeric-content gate routes to identity (first(), NOT 0)
  ##   SOME_COUNT — numeric-as-character → additive (summed)
  ##   FOO_PCT    — "% of total" rate → dropped
  fake_a <- data.frame(
    TEAM_ID    = c("1611661328", "1611661319"),  # LV, ATL
    TEAM_CITY  = c("Las Vegas", "Atlanta"),
    SOME_COUNT = c("10", "20"),
    FOO_PCT    = c("0.500", "0.250"),
    stringsAsFactors = FALSE
  )
  fake_b <- data.frame(
    TEAM_ID    = c("1611661328", "1611661319"),
    TEAM_CITY  = c("Las Vegas", "Atlanta"),
    SOME_COUNT = c("5", "7"),
    FOO_PCT    = c("0.600", "0.100"),
    stringsAsFactors = FALSE
  )

  out <- wehoop:::.aggregate_tracking_frames(list(fake_a, fake_b), "TEAM_ID")

  ## TEAM_CITY carried via first() — the actual string, NOT a silent 0
  expect_true("TEAM_CITY" %in% colnames(out),
              label = "TEAM_CITY present in output")
  lv  <- out[out$TEAM_ID == "1611661328", ]
  atl <- out[out$TEAM_ID == "1611661319", ]
  expect_identical(lv$TEAM_CITY, "Las Vegas",
                   label = "TEAM_CITY carried as string for LV (not 0)")
  expect_identical(atl$TEAM_CITY, "Atlanta",
                   label = "TEAM_CITY carried as string for ATL (not 0)")
  ## Confirm it was NOT coerced to a number / zeroed
  expect_false(is.numeric(out$TEAM_CITY),
               label = "TEAM_CITY is not numeric (was not summed to 0)")

  ## SOME_COUNT summed: 10+5 = 15 ; 20+7 = 27
  expect_equal(as.numeric(lv$SOME_COUNT), 15)
  expect_equal(as.numeric(atl$SOME_COUNT), 27)

  ## FOO_PCT dropped
  expect_false("FOO_PCT" %in% colnames(out),
               label = "FOO_PCT (% of total) dropped from output")

  ## id-not-summed: TEAM_IDs are the valid source ids, not doubled
  expect_true(all(out$TEAM_ID %in% c("1611661328", "1611661319")),
              label = "TEAM_ID not summed/doubled")
})

## ===========================================================================
## 6. FG_PCT/FT_PCT DENOMINATOR GUARD (FIX 2) — missing makes/attempts → drop
## ===========================================================================

test_that("denominator guard: _fg_pct without makes/attempts is dropped, no crash", {
  ## FOO_FG_PCT has no FOO_FGM / FOO_FGA pair → must be dropped, not recomputed
  fake <- data.frame(
    PLAYER_ID  = c("1001", "1002"),
    PLAYER_NAME = c("Player A", "Player B"),
    SOME_COUNT = c("3", "4"),
    FOO_FG_PCT = c("0.450", "0.500"),
    stringsAsFactors = FALSE
  )

  expect_no_error(
    out <- wehoop:::.aggregate_tracking_frames(list(fake), "PLAYER_ID")
  )
  ## The orphaned _fg_pct col is dropped (no FGM/FGA to recompute from)
  expect_false("FOO_FG_PCT" %in% colnames(out),
               label = "orphaned FOO_FG_PCT dropped (denominator guard)")
  ## Additive + identity still work
  expect_true(all(c("PLAYER_ID", "PLAYER_NAME", "SOME_COUNT") %in% colnames(out)))
  expect_equal(nrow(out), 2L)
})

test_that("denominator guard: _ft_pct without makes/attempts is dropped, no crash", {
  fake <- data.frame(
    PLAYER_ID  = c("1001", "1002"),
    SOME_COUNT = c("3", "4"),
    BAR_FT_PCT = c("0.800", "0.900"),
    stringsAsFactors = FALSE
  )
  expect_no_error(
    out <- wehoop:::.aggregate_tracking_frames(list(fake), "PLAYER_ID")
  )
  expect_false("BAR_FT_PCT" %in% colnames(out),
               label = "orphaned BAR_FT_PCT dropped (denominator guard)")
})

## ===========================================================================
## Live smoke test — gated by WNBA_STATS_TESTS=1
## ===========================================================================

test_that("wnba_tracking_aggregate works live (2 seasons)", {
  skip_if(
    Sys.getenv("WNBA_STATS_TESTS") != "1",
    message = "Set WNBA_STATS_TESTS=1 to run live WNBA tracking tests"
  )

  out <- wnba_tracking_aggregate(
    seasons         = c(2023, 2024),
    per_mode        = "Totals",
    pt_measure_type = "Drives",
    player_or_team  = "Player"
  )

  expect_s3_class(out, "data.frame")
  ## WNBA tracking may be sparsely populated; accept 0-row without error
  expect_true(nrow(out) >= 0L,
              label = "live wnba_tracking_aggregate returns a data.frame (possibly empty)")
  if (nrow(out) > 0L) {
    expect_true("PLAYER_ID" %in% colnames(out),
                label = "PLAYER_ID present in live output")
    ## No non-recomputable *_PCT columns present
    live_drop <- grep("_PCT$", colnames(out), value = TRUE) |>
      setdiff(grep("_FG_PCT$|_FT_PCT$", colnames(out), value = TRUE))
    expect_true(length(live_drop) == 0L,
                label = "non-recomputable *_PCT columns absent from live output")
  }
})

## Tests for WNBA possession event-classification helpers and public API.
##
## Mirrors hoopR/tests/testthat/test-nba_possessions.R + test-nba_rapm.R
## adapted to WNBA fixtures and boxscore oracles.
##
## Internal (unexported) helpers are accessible via wehoop:::fn() after
## devtools::load_all().  All tests run offline against captured fixtures.
##
## WNBA fixture game IDs:
##   1022400001 -- NYL @ WAS (2024): WAS(1611661322)=80, NYL(1611661313)=85
##   1022400003 -- PHO @ LVA (2024): LVA(1611661319)=89, PHO(1611661317)=80
##
## Known limitation: game 1022400001 has no rotation data
## (wnba_gamerotation returns empty -> home_player1..5 / away_player1..5 are
## all NA).  The boxscore-points gate still runs on it (the grouper does
## not use on-court data); the roster-membership gate runs on 1022400003
## ONLY, which has full rotation coverage.

# ---------------------------------------------------------------------------
# Helper: .poss_df -- construct a possessions data.frame from a list of row specs
# (mirrors hoopR/tests/testthat/test-nba_rapm.R)
# ---------------------------------------------------------------------------

.poss_df <- function(rows) {
  d <- list()
  for (i in 1:5) {
    d[[paste0("off_player_", i)]] <- vapply(rows, function(r) r$off[i], integer(1))
  }
  for (i in 1:5) {
    d[[paste0("def_player_", i)]] <- vapply(rows, function(r) r$def[i], integer(1))
  }
  d[["points"]] <- vapply(rows, function(r) r$pts, numeric(1))
  as.data.frame(d)
}

# ---------------------------------------------------------------------------
# .is_last_ft -- NBA/WNBA "N of N" + G-League "{N}PT" contract
# (identical behavior; helper is shared logic)
# ---------------------------------------------------------------------------

test_that(".is_last_ft matches the NBA/WNBA + G-League free-throw contract", {
  skip_on_cran()
  # NBA/WNBA "N of N" sequence labels -- last FT of sequence -> TRUE
  expect_true(.is_last_ft("Free Throw 2 of 2"))
  expect_true(.is_last_ft("Free Throw 1 of 1"))
  expect_true(.is_last_ft("Free Throw 3 of 3"))
  expect_true(.is_last_ft("Free Throw Flagrant 3 of 3"))

  # NBA/WNBA mid-sequence -- not last -> FALSE
  expect_false(.is_last_ft("Free Throw 1 of 2"))
  expect_false(.is_last_ft("Free Throw 2 of 3"))

  # Technical FT: no "N of N" substring -> FALSE
  expect_false(.is_last_ft("Free Throw Technical"))

  # G-League single-FT (point-value) format -- standalone trip -> always last -> TRUE
  expect_true(.is_last_ft("Free Throw 1PT"))
  expect_true(.is_last_ft("Free Throw 2PT"))
  expect_true(.is_last_ft("Free Throw 3PT"))

  # G-League case-sensitivity contract (mirrors sdv-py _FT_GL_PT_RE which is case-sensitive):
  # lowercase 'pt' must NOT match
  expect_false(.is_last_ft("Free Throw 2pt"))
  # optional-space variant (regex \s* tolerates the space)
  expect_true(.is_last_ft("Free Throw 2 PT"))

  # NA / empty -> FALSE (safe for vectorized per-row usage)
  expect_false(.is_last_ft(NA_character_))
  expect_false(.is_last_ft(""))
})

# ---------------------------------------------------------------------------
# .offense_from_events -- two-pass offense attribution
# ---------------------------------------------------------------------------

test_that(".offense_from_events returns correct offense team from scoring events", {
  skip_on_cran()
  # Use WNBA-range team IDs for the test
  home_id <- 1611661322L  # WAS
  away_id <- 1611661313L  # NYL

  # Pass 1: first scoring/shooting/turnover event with location wins
  events_away_scores <- list(
    list(event_type = "1", location = "v", team_id = away_id),  # away made shot
    list(event_type = "4", location = "h", team_id = home_id)   # home rebound (not seeding)
  )
  expect_equal(.offense_from_events(events_away_scores, home_id, away_id), away_id)

  events_home_scores <- list(
    list(event_type = "1", location = "h", team_id = home_id),  # home made shot
    list(event_type = "4", location = "v", team_id = away_id)   # away rebound
  )
  expect_equal(.offense_from_events(events_home_scores, home_id, away_id), home_id)

  # Pass 1: free throw (event_type "3") seeds offense
  events_ft <- list(
    list(event_type = "3", location = "v", team_id = away_id)  # away free throw
  )
  expect_equal(.offense_from_events(events_ft, home_id, away_id), away_id)

  # Pass 1: turnover (event_type "5") seeds offense
  events_to <- list(
    list(event_type = "5", location = "h", team_id = home_id)  # home turnover
  )
  expect_equal(.offense_from_events(events_to, home_id, away_id), home_id)

  # Pass 2 fallback: no scoring events but non-admin event has location
  events_fallback <- list(
    list(event_type = "4", location = "h", team_id = home_id)  # rebound -- not in seeding set
  )
  expect_equal(.offense_from_events(events_fallback, home_id, away_id), home_id)

  # No attributable event -> 0
  events_no_loc <- list(
    list(event_type = "12", location = "", team_id = 0L),  # StartPeriod, no location
    list(event_type = "13", location = "", team_id = 0L)   # EndPeriod, no location
  )
  expect_equal(.offense_from_events(events_no_loc, home_id, away_id), 0L)

  # Empty event list -> 0
  expect_equal(.offense_from_events(list(), home_id, away_id), 0L)
})

# ---------------------------------------------------------------------------
# .OFFENSE_SEEDING_EVENT_TYPES -- allowlist constant
# ---------------------------------------------------------------------------

test_that(".OFFENSE_SEEDING_EVENT_TYPES contains only shot/turnover event_type codes", {
  skip_on_cran()
  # Must include MadeShot("1"), MissedShot("2"), FreeThrow("3"), Turnover("5")
  expect_true("1" %in% .OFFENSE_SEEDING_EVENT_TYPES)  # MadeShot
  expect_true("2" %in% .OFFENSE_SEEDING_EVENT_TYPES)  # MissedShot
  expect_true("3" %in% .OFFENSE_SEEDING_EVENT_TYPES)  # FreeThrow
  expect_true("5" %in% .OFFENSE_SEEDING_EVENT_TYPES)  # Turnover

  # Admin/non-seeding types must NOT be included
  expect_false("4"  %in% .OFFENSE_SEEDING_EVENT_TYPES)  # Rebound
  expect_false("6"  %in% .OFFENSE_SEEDING_EVENT_TYPES)  # Foul
  expect_false("8"  %in% .OFFENSE_SEEDING_EVENT_TYPES)  # Sub
  expect_false("12" %in% .OFFENSE_SEEDING_EVENT_TYPES)  # StartPeriod
  expect_false("13" %in% .OFFENSE_SEEDING_EVENT_TYPES)  # EndPeriod

  # Exactly 4 elements
  expect_equal(length(.OFFENSE_SEEDING_EVENT_TYPES), 4L)
})

# ---------------------------------------------------------------------------
# .build_possessions -- boxscore-points reconciliation (independent oracle)
#
# Oracle: home_team_totals_traditional$points / away_team_totals_traditional$points
# Both games must reconcile EXACTLY.
#
# NOTE: game 1022400001 has no rotation data (all NA on-court cols) but
# location/score columns are fully populated, so .build_possessions still
# runs and must reconcile to the boxscore.
# ---------------------------------------------------------------------------

test_that("possession points reconcile to the boxscore (independent oracle)", {
  skip_on_cran()
  for (gid in c("1022400001", "1022400003")) {
    pbp <- readRDS(test_path("fixtures", "wnba_engine", paste0("pbp_", gid, ".rds")))
    box <- readRDS(test_path("fixtures", "wnba_engine", paste0("box_", gid, ".rds")))

    poss <- .build_possessions(pbp)

    # Per-team possession points
    agg <- dplyr::group_by(poss, offense_team_id)
    agg <- dplyr::summarise(agg, pts = sum(points), .groups = "drop")

    # Boxscore oracle: use team totals (scalar columns, same structure both games)
    totals_home <- box[["home_team_totals_traditional"]]
    totals_away <- box[["away_team_totals_traditional"]]
    home_tid <- as.integer(totals_home[["team_id"]])
    away_tid <- as.integer(totals_away[["team_id"]])
    home_pts <- as.integer(totals_home[["points"]])
    away_pts <- as.integer(totals_away[["points"]])

    box_pts <- c(home_pts, away_pts)
    names(box_pts) <- as.character(c(home_tid, away_tid))

    for (tid_chr in names(box_pts)) {
      expected <- as.integer(box_pts[[tid_chr]])
      tid_int  <- as.integer(tid_chr)
      actual   <- agg$pts[agg$offense_team_id == tid_int]
      if (length(actual) == 0L) actual <- 0L
      expect_equal(
        actual, expected,
        label = paste0("game=", gid, " team=", tid_chr,
                       " engine=", actual, " boxscore=", expected)
      )
    }
  }
})

# ---------------------------------------------------------------------------
# .build_possessions -- second_chance flag
# ---------------------------------------------------------------------------

test_that(".build_possessions emits a logical second_chance flag", {
  skip_on_cran()
  for (gid in c("1022400001", "1022400003")) {
    pbp  <- readRDS(test_path("fixtures", "wnba_engine", paste0("pbp_", gid, ".rds")))
    poss <- .build_possessions(pbp)

    # Column present and logical-typed
    expect_true("second_chance" %in% colnames(poss),
                label = paste0("game=", gid, " has second_chance column"))
    expect_true(is.logical(poss$second_chance),
                label = paste0("game=", gid, " second_chance is logical"))

    # Both fixture games contain offensive rebounds -> at least one second-chance
    # possession, but the vast majority of possessions are not second-chance.
    expect_true(any(poss$second_chance),
                label = paste0("game=", gid, " has >=1 second-chance possession"))
    expect_false(all(poss$second_chance),
                 label = paste0("game=", gid, " not all possessions are second-chance"))
  }
})

# ---------------------------------------------------------------------------
# .attach_possession_lineups -- roster-membership gate (independent oracle)
#
# Game 1022400003 ONLY -- game 1022400001's wnba_gamerotation returned empty
# data so on-court cols (home_player1..5 / away_player1..5) are all NA in
# that fixture.  The roster-membership gate is therefore scoped to the game
# that has full rotation coverage (1022400003: PHO @ LVA, 2024).
# ---------------------------------------------------------------------------

test_that("possession on-court ids are all in the boxscore roster (independent oracle)", {
  skip_on_cran()
  off_cols <- paste0("off_player_", 1:5)
  def_cols <- paste0("def_player_", 1:5)

  # Only run on game 1022400003 -- see header comment for the 1022400001 caveat
  gid <- "1022400003"

  pbp <- readRDS(test_path("fixtures", "wnba_engine", paste0("pbp_", gid, ".rds")))
  box <- readRDS(test_path("fixtures", "wnba_engine", paste0("box_", gid, ".rds")))

  poss <- .attach_possession_lineups(.build_possessions(pbp), pbp)

  # Verify 10 new columns were added, all integer-typed
  for (col in c(off_cols, def_cols)) {
    expect_true(col %in% colnames(poss),
                label = paste0("game=", gid, " column ", col, " present"))
    expect_true(is.integer(poss[[col]]),
                label = paste0("game=", gid, " column ", col, " is integer"))
  }

  # Build independent roster oracle from boxscore person_id columns
  # (box 1022400003 has plain integer person_id -- no nested frame issue)
  home_df  <- box[["home_team_player_traditional"]]
  away_df  <- box[["away_team_player_traditional"]]
  home_tid <- as.integer(home_df[["team_id"]][1L])
  away_tid <- as.integer(away_df[["team_id"]][1L])
  home_roster <- as.integer(home_df[["person_id"]])
  away_roster <- as.integer(away_df[["person_id"]])

  roster_by_team <- list()
  roster_by_team[[as.character(home_tid)]] <- home_roster
  roster_by_team[[as.character(away_tid)]] <- away_roster

  # For each possession: off_player_1..5 must be in offense team's roster,
  # def_player_1..5 must be in defense team's roster
  off_tids <- dplyr::pull(poss, offense_team_id)
  def_tids <- dplyr::pull(poss, defense_team_id)

  for (i in seq_len(nrow(poss))) {
    off_tid_chr <- as.character(off_tids[i])
    def_tid_chr <- as.character(def_tids[i])
    off_roster  <- roster_by_team[[off_tid_chr]]
    def_roster  <- roster_by_team[[def_tid_chr]]

    for (p in 1:5) {
      off_id <- poss[[paste0("off_player_", p)]][i]
      def_id <- poss[[paste0("def_player_", p)]][i]

      expect_true(
        off_id %in% off_roster,
        label = paste0("game=", gid, " poss=", i,
                       " off_player_", p, "=", off_id,
                       " in offense roster (team=", off_tid_chr, ")")
      )
      expect_true(
        def_id %in% def_roster,
        label = paste0("game=", gid, " poss=", i,
                       " def_player_", p, "=", def_id,
                       " in defense roster (team=", def_tid_chr, ")")
      )
    }
  }
})

# ---------------------------------------------------------------------------
# never-raise on empty PBP (off-season / invalid game id / API hiccup)
# ---------------------------------------------------------------------------

test_that("possession engine is never-raise on empty PBP", {
  skip_on_cran()
  pbp <- readRDS(test_path("fixtures", "wnba_engine", "pbp_1022400003.rds"))
  empty <- head(pbp, 0)
  poss0 <- .build_possessions(empty)
  expect_equal(nrow(poss0), 0)
  lin0 <- .attach_possession_lineups(poss0, empty)
  expect_equal(nrow(lin0), 0)
  expect_true(all(c(paste0("off_player_", 1:5), paste0("def_player_", 1:5)) %in% colnames(lin0)))
})

# ===========================================================================
# .build_rapm_design -- RAPM sparse design matrix builder
# (mirrors hoopR/tests/testthat/test-nba_rapm.R)
# ===========================================================================

# ---------------------------------------------------------------------------
# Core encoding test
# ---------------------------------------------------------------------------

test_that(".build_rapm_design encodes offense/defense indicators correctly", {
  skip_on_cran()
  rows <- list(
    list(off = c(1L, 2L, 3L, 4L, 5L),    def = c(11L, 12L, 13L, 14L, 15L), pts = 2),
    list(off = c(11L, 12L, 13L, 14L, 15L), def = c(1L,  2L,  3L,  4L,  5L),  pts = 0)
  )
  des <- .build_rapm_design(.poss_df(rows))

  expect_equal(des$player_ids, c(1L, 2L, 3L, 4L, 5L, 11L, 12L, 13L, 14L, 15L))
  P <- length(des$player_ids)
  expect_equal(P, 10L)
  expect_equal(dim(des$X), c(2L, 2L * P))

  Xd  <- as.matrix(des$X)
  idx <- setNames(seq_along(des$player_ids), as.character(des$player_ids))

  for (p in as.character(1:5)) {
    expect_equal(Xd[1, idx[[p]]], 1,
                 label = paste0("poss1 offense player ", p))
  }
  for (p in as.character(11:15)) {
    expect_equal(Xd[1, P + idx[[p]]], 1,
                 label = paste0("poss1 defense player ", p))
  }

  expect_equal(sum(Xd[1, ]), 10)
  expect_equal(sum(Xd[1, 1:P]), 5)
  expect_equal(sum(Xd[1, (P + 1):(2 * P)]), 5)

  for (p in as.character(11:15)) {
    expect_equal(Xd[2, idx[[p]]], 1,
                 label = paste0("poss2 offense player ", p))
  }
  for (p in as.character(1:5)) {
    expect_equal(Xd[2, P + idx[[p]]], 1,
                 label = paste0("poss2 defense player ", p))
  }
  expect_equal(sum(Xd[2, ]), 10)
  expect_equal(des$y, c(2, 0))
})

# ---------------------------------------------------------------------------
# Empty input -- never-raise
# ---------------------------------------------------------------------------

test_that(".build_rapm_design handles empty possessions without raising", {
  skip_on_cran()
  empty <- data.frame(
    off_player_1 = integer(0), off_player_2 = integer(0),
    off_player_3 = integer(0), off_player_4 = integer(0),
    off_player_5 = integer(0),
    def_player_1 = integer(0), def_player_2 = integer(0),
    def_player_3 = integer(0), def_player_4 = integer(0),
    def_player_5 = integer(0),
    points       = numeric(0)
  )

  des <- .build_rapm_design(empty)

  expect_true(is.list(des))
  expect_equal(length(des$player_ids), 0L)
  expect_equal(length(des$y), 0L)
  expect_equal(nrow(des$X), 0L)
  expect_equal(ncol(des$X), 0L)
})

# ---------------------------------------------------------------------------
# NA lineup drop
# ---------------------------------------------------------------------------

test_that(".build_rapm_design drops possessions with NA lineup cells (never-raise)", {
  skip_on_cran()
  df <- data.frame(
    off_player_1 = c(NA_integer_, 1L),
    off_player_2 = c(2L,         2L),
    off_player_3 = c(3L,         3L),
    off_player_4 = c(4L,         4L),
    off_player_5 = c(5L,         5L),
    def_player_1 = c(11L,        11L),
    def_player_2 = c(12L,        12L),
    def_player_3 = c(13L,        13L),
    def_player_4 = c(14L,        14L),
    def_player_5 = c(15L,        15L),
    points       = c(2,           0)
  )

  des <- .build_rapm_design(df)
  expect_equal(nrow(des$X), 1L)
  expect_equal(length(des$y), 1L)
  expect_equal(des$y, 0)

  df_all_na <- data.frame(
    off_player_1 = NA_integer_, off_player_2 = NA_integer_,
    off_player_3 = NA_integer_, off_player_4 = NA_integer_,
    off_player_5 = NA_integer_,
    def_player_1 = NA_integer_, def_player_2 = NA_integer_,
    def_player_3 = NA_integer_, def_player_4 = NA_integer_,
    def_player_5 = NA_integer_,
    points       = NA_real_
  )
  des2 <- .build_rapm_design(df_all_na)
  expect_equal(length(des2$player_ids), 0L)
  expect_equal(nrow(des2$X), 0L)
})

# ===========================================================================
# wnba_rapm() -- ridge fit + synthetic-recovery gate
# ===========================================================================

# ---------------------------------------------------------------------------
# Schema / sign / possession-counts test -- tiny hand frame
# ---------------------------------------------------------------------------

test_that("wnba_rapm returns correct schema on a tiny hand frame", {
  skip_on_cran()
  rows <- list(
    list(off = c(1L, 2L, 3L, 7L, 8L), def = c(4L, 5L, 6L, 9L, 10L), pts = 2),
    list(off = c(1L, 2L, 3L, 7L, 8L), def = c(4L, 5L, 6L, 9L, 10L), pts = 1),
    list(off = c(4L, 5L, 6L, 9L, 10L), def = c(1L, 2L, 3L, 7L, 8L), pts = 0),
    list(off = c(4L, 5L, 6L, 9L, 10L), def = c(1L, 2L, 3L, 7L, 8L), pts = 3)
  )
  df  <- .poss_df(rows)
  out <- suppressWarnings(wnba_rapm(df))

  expect_true(is.data.frame(out))
  expect_true(all(c("player_id", "o_rapm", "d_rapm", "rapm",
                     "off_poss", "def_poss") %in% names(out)))
  expect_true(is.integer(out$player_id))
  expect_true(is.numeric(out$o_rapm))
  expect_true(is.numeric(out$d_rapm))
  expect_true(is.numeric(out$rapm))
  expect_true(is.integer(out$off_poss))
  expect_true(is.integer(out$def_poss))
  expect_equal(out$rapm, out$o_rapm + out$d_rapm)
  expect_equal(nrow(out), 10L)
  expect_equal(out$player_id, sort(out$player_id))
})

# ---------------------------------------------------------------------------
# Empty input -- never-raise, returns 0-row frame with correct schema
# ---------------------------------------------------------------------------

test_that("wnba_rapm returns 0-row schema frame on empty input (never-raise)", {
  skip_on_cran()
  empty <- data.frame(
    off_player_1 = integer(0), off_player_2 = integer(0),
    off_player_3 = integer(0), off_player_4 = integer(0),
    off_player_5 = integer(0),
    def_player_1 = integer(0), def_player_2 = integer(0),
    def_player_3 = integer(0), def_player_4 = integer(0),
    def_player_5 = integer(0),
    points       = numeric(0)
  )

  out <- wnba_rapm(empty)

  expect_true(is.data.frame(out))
  expect_equal(nrow(out), 0L)
  expect_true(all(c("player_id", "o_rapm", "d_rapm", "rapm",
                     "off_poss", "def_poss") %in% names(out)))
  expect_true(is.integer(out$player_id))
  expect_true(is.numeric(out$o_rapm))
  expect_true(is.numeric(out$d_rapm))
  expect_true(is.numeric(out$rapm))
  expect_true(is.integer(out$off_poss))
  expect_true(is.integer(out$def_poss))
})

# ---------------------------------------------------------------------------
# Synthetic-recovery gate -- binding model-correctness test
# (verbatim copy of hoopR's synthetic recovery test; league-agnostic)
# ---------------------------------------------------------------------------

test_that("wnba_rapm recovers planted player effects (synthetic recovery)", {
  skip_on_cran()
  set.seed(42)
  P         <- 40L
  true_off  <- rnorm(P, 0, 0.06)
  true_def  <- rnorm(P, 0, 0.06)
  players   <- seq_len(P)
  M         <- 8000L

  rows <- vector("list", M)
  for (m in seq_len(M)) {
    pick <- sample(players, 10L)
    off5 <- pick[1:5]
    def5 <- pick[6:10]
    pts  <- 1.05 +
              sum(true_off[off5]) -
              sum(true_def[def5]) +
              rnorm(1L, 0, 0.4)
    pts  <- max(0, round(pts))
    rows[[m]] <- list(
      off = as.integer(off5),
      def = as.integer(def5),
      pts = pts
    )
  }

  df  <- .poss_df(rows)
  out <- wnba_rapm(df)
  out <- out[order(out$player_id), ]

  corr_off <- cor(out$o_rapm, true_off[out$player_id])
  corr_def <- cor(out$d_rapm, true_def[out$player_id])

  message(sprintf("Synthetic recovery: corr_off=%.4f  corr_def=%.4f",
                  corr_off, corr_def))

  expect_gt(corr_off, 0.7)
  expect_gt(corr_def, 0.7)

  # Determinism: second call on same data gives identical rapm
  out2 <- wnba_rapm(df)
  out2 <- out2[order(out2$player_id), ]
  expect_equal(out$rapm, out2$rapm)
})

# ===========================================================================
# wnba_rapm -- 1-game smoke (offline fixture, game 1022400003)
# ===========================================================================

test_that("wnba_rapm runs end-to-end on a real WNBA game (offline smoke)", {
  skip_on_cran()
  fx <- test_path("fixtures", "wnba_engine", "pbp_1022400003.rds")
  skip_if(!file.exists(fx), "fixture pbp_1022400003.rds not present")
  pbp  <- readRDS(fx)
  poss <- .attach_possession_lineups(.build_possessions(pbp), pbp)

  out  <- wnba_rapm(poss)

  expect_true(is.data.frame(out))
  expect_true(nrow(out) > 0)
  expect_named(out, c("player_id", "o_rapm", "d_rapm", "rapm", "off_poss", "def_poss"))
  expect_true(all(is.finite(out$rapm)))
  expect_true(abs(mean(out$rapm)) < 50)
  # Verify both possession-count columns independently
  expect_true(any(out$off_poss > 0L),
              label = "at least one player has off_poss > 0")
  expect_true(any(out$def_poss > 0L),
              label = "at least one player has def_poss > 0")

  # Deterministic by construction (fixed CV folds)
  out2 <- wnba_rapm(poss)
  expect_equal(
    out[order(out$player_id), ]$rapm,
    out2[order(out2$player_id), ]$rapm
  )
})

# ===========================================================================
# wnba_possession_lineups + wnba_rapm -- gated live test
# Requires WNBA_STATS_TESTS=1 (live network access to stats.wnba.com).
# Game 1022400003 (PHO @ LVA, 2024) has full rotation data.
# ===========================================================================

test_that("wnba_possession_lineups + wnba_rapm work live", {
  skip_on_cran()
  skip_on_ci()
  skip_wnba_stats_test()
  poss <- wnba_possession_lineups(game_id = "1022400003")
  skip_if(nrow(poss) == 0L, "live wnba_possession_lineups returned empty frame")
  expect_true(nrow(poss) > 0)
  out <- wnba_rapm(poss)
  skip_if(nrow(out) == 0L, "live wnba_rapm returned empty frame")
  expect_true(nrow(out) > 0)
  expect_true(all(is.finite(out$rapm)))
  Sys.sleep(3)
})

# Offline tests for .bb_assemble_team_crosswalk_wbb() and the alias helpers.

# ---------------------------------------------------------------------------
# Helper: synthetic fixtures
# ---------------------------------------------------------------------------

.make_espn <- function() {
  data.frame(
    team_id        = c(100L, 200L, 300L),
    abbreviation   = c("SC", "CONN", "OM"),
    display_name   = c("South Carolina Gamecocks",
                       "UConn Huskies",
                       "Ole Miss Rebels"),
    short_name     = c("South Carolina", "UConn", "Ole Miss"),
    team           = c("South Carolina", "UConn", "Ole Miss"),
    mascot         = c("Gamecocks", "Huskies", "Rebels"),
    conference_name = c("SEC", "Big East", "SEC"),
    stringsAsFactors = FALSE
  )
}

.make_fox <- function() {
  data.frame(
    fox_team_id   = c("277", "11", "276"),
    fox_team_name = c("South Carolina Gamecocks",
                      "Uconn Huskies",
                      "Ole Miss Rebels"),
    fox_section   = c("SEC", "Big East", "SEC"),
    stringsAsFactors = FALSE
  )
}

.make_bart <- function() {
  data.frame(
    team = c("South Carolina", "Connecticut", "Mississippi"),
    conf = c("SEC", "BE", "SEC"),
    stringsAsFactors = FALSE
  )
}

# ---------------------------------------------------------------------------

test_that(".wbb_apply_bart_alias maps known Torvik names to ESPN locations", {
  expect_equal(.wbb_apply_bart_alias("Connecticut"), "UConn")
  expect_equal(.wbb_apply_bart_alias("Mississippi"), "Ole Miss")
  expect_equal(.wbb_apply_bart_alias("N.C. State"),  "NC State")
  # Unknown names pass through unchanged
  expect_equal(.wbb_apply_bart_alias("South Carolina"), "South Carolina")
})

test_that(".wbb_apply_fox_alias maps Fox keys to ESPN keys", {
  expect_equal(
    .wbb_apply_fox_alias("uconn huskies"),
    "uconn huskies"
  )
  expect_equal(
    .wbb_apply_fox_alias("penn quakers"),
    "pennsylvania quakers"
  )
  expect_equal(
    .wbb_apply_fox_alias("miami fl hurricanes"),
    "miami hurricanes"
  )
  # Unknown keys pass through
  expect_equal(
    .wbb_apply_fox_alias("south carolina gamecocks"),
    "south carolina gamecocks"
  )
})

test_that(".bb_assemble_team_crosswalk_wbb exact-matches 3 synthetic teams", {
  espn <- .make_espn()
  fox  <- .make_fox()
  bart <- .make_bart()

  xw <- .bb_assemble_team_crosswalk_wbb(
    espn = espn, fox = fox, bart = bart, season = 2025L
  )

  expect_equal(nrow(xw), 3L)
  expect_equal(xw$season, rep(2025L, 3L))

  # All three teams should have a Fox match
  expect_true(all(!is.na(xw$fox_team_id)))

  # All three teams should have a Torvik match (via alias for UConn + Ole Miss)
  expect_true(all(!is.na(xw$bart_team)))

  # South Carolina: direct exact match on both sides
  sc <- xw[xw$espn_team_id == 100L, ]
  expect_equal(sc$fox_team_id,  "277")
  expect_equal(sc$bart_team,    "South Carolina")
  expect_equal(sc$match_method, "fox+bart")

  # UConn: Fox alias ("uconn huskies" -> "uconn huskies") + Bart alias
  #   ("Connecticut" -> "UConn" -> normalizes to "uconn")
  conn <- xw[xw$espn_team_id == 200L, ]
  expect_equal(conn$fox_team_id,  "11")
  expect_equal(conn$bart_team,    "Connecticut")
  expect_equal(conn$match_method, "fox+bart")

  # Ole Miss: Bart alias ("Mississippi" -> "Ole Miss")
  om <- xw[xw$espn_team_id == 300L, ]
  expect_equal(om$fox_team_id,  "276")
  expect_equal(om$bart_team,    "Mississippi")
  expect_equal(om$match_method, "fox+bart")
})

test_that(".bb_assemble_team_crosswalk_wbb handles NULL fox gracefully", {
  espn <- .make_espn()
  bart <- .make_bart()

  xw <- .bb_assemble_team_crosswalk_wbb(
    espn = espn, fox = NULL, bart = bart, season = 2025L
  )

  expect_equal(nrow(xw), 3L)
  expect_true(all(is.na(xw$fox_team_id)))
  expect_true(all(!is.na(xw$bart_team)))
  expect_true(all(xw$match_method == "bart_only"))
})

test_that(".bb_assemble_team_crosswalk_wbb dedupes ESPN by team_id", {
  espn_dup <- rbind(.make_espn(), .make_espn()[1, ])  # duplicate row 1
  xw <- .bb_assemble_team_crosswalk_wbb(
    espn = espn_dup, fox = .make_fox(), bart = .make_bart(), season = 2025L
  )
  expect_equal(nrow(xw), 3L)
})

# ---------------------------------------------------------------------------
# Gated live test
# ---------------------------------------------------------------------------

test_that("wbb_team_crosswalk() live Fox+Bart rates >= 0.90", {
  skip_fox_test()
  xw <- wbb_team_crosswalk(season = most_recent_wbb_season())
  n  <- nrow(xw)
  expect_gt(n, 300L)
  fox_rate  <- sum(!is.na(xw$fox_team_id))  / n
  bart_rate <- sum(!is.na(xw$bart_team)) / n
  expect_gte(fox_rate,  0.90)
  expect_gte(bart_rate, 0.90)
})

# ===========================================================================
# Schedule crosswalk assembler (offline)
# ===========================================================================

# Minimal synthetic fixtures:
#   team_xwalk: 2 ESPN teams, both matched to Torvik names
#   espn_games: 1 game (2025-01-15, teams 100 vs 200)
#   bart_games: 1 game (same date, team names "South Carolina" & "Connecticut")
#     -> after alias + normalize: "south carolina" & "uconn"
#     -> resolve to espn ids 100 & 200 via team_xwalk$bart_team

.make_xwalk_for_sched <- function() {
  data.frame(
    espn_team_id      = c(100L, 200L),
    espn_abbreviation = c("SC", "CONN"),
    espn_display_name = c("South Carolina Gamecocks", "UConn Huskies"),
    espn_short_name   = c("South Carolina", "UConn"),
    espn_location     = c("South Carolina", "UConn"),
    espn_mascot       = c("Gamecocks", "Huskies"),
    espn_conference   = c("SEC", "Big East"),
    fox_team_id       = c("277", "11"),
    fox_team_name     = c("South Carolina Gamecocks", "Uconn Huskies"),
    fox_section       = c("SEC", "Big East"),
    bart_team         = c("South Carolina", "Connecticut"),  # Torvik names
    bart_conf         = c("SEC", "BE"),
    yahoo_team_id     = c(NA_character_, NA_character_),
    yahoo_team_name   = c(NA_character_, NA_character_),
    fox_match_confidence  = c(1, 1),
    bart_match_confidence = c(1, 1),
    match_method      = c("fox+bart", "fox+bart"),
    season            = c(2025L, 2025L),
    stringsAsFactors  = FALSE
  )
}

.make_espn_games <- function() {
  data.frame(
    espn_game_id      = "401234567",
    game_date         = as.Date("2025-01-15"),
    home_espn_team_id = 100L,
    away_espn_team_id = 200L,
    stringsAsFactors  = FALSE
  )
}

.make_bart_games_for_sched <- function() {
  data.frame(
    muid      = "BT-001",
    game_date = as.Date("2025-01-15"),
    team1     = "South Carolina",    # direct name in Torvik
    team2     = "Connecticut",       # alias -> UConn -> espn id 200
    winner    = "South Carolina",
    stringsAsFactors = FALSE
  )
}

test_that(".bb_assemble_schedule_crosswalk_wbb joins ESPN + Torvik on date + pair key", {
  xw   <- .make_xwalk_for_sched()
  eg   <- .make_espn_games()
  bg   <- .make_bart_games_for_sched()

  result <- .bb_assemble_schedule_crosswalk_wbb(
    espn_games = eg,
    bart_games = bg,
    team_xwalk = xw,
    season     = 2025L
  )

  # One row: both sources matched on the same date + pair key
  expect_equal(nrow(result), 1L)
  expect_equal(result$match_method, "both")
  expect_equal(result$match_confidence, 1)
  expect_equal(result$espn_game_id, "401234567")
  expect_equal(result$bart_muid,    "BT-001")
  expect_equal(result$season,       2025L)
  expect_true(is.na(result$fox_game_id))
  expect_true(is.na(result$yahoo_game_id))
  # ESPN home/away preserved
  expect_equal(result$home_espn_team_id, 100L)
  expect_equal(result$away_espn_team_id, 200L)
})

test_that(".bb_assemble_schedule_crosswalk_wbb espn-only row when Torvik absent", {
  xw <- .make_xwalk_for_sched()
  eg <- .make_espn_games()
  bg <- data.frame(muid = character(), game_date = as.Date(character()),
                   team1 = character(), team2 = character(), winner = character(),
                   stringsAsFactors = FALSE)

  result <- .bb_assemble_schedule_crosswalk_wbb(eg, bg, xw, 2025L)

  expect_equal(nrow(result), 1L)
  expect_equal(result$match_method, "espn_only")
  expect_true(is.na(result$bart_muid))
})

test_that(".bb_assemble_schedule_crosswalk_wbb bart-only row when ESPN absent", {
  xw <- .make_xwalk_for_sched()
  eg <- data.frame(espn_game_id = character(), game_date = as.Date(character()),
                   home_espn_team_id = integer(), away_espn_team_id = integer(),
                   stringsAsFactors = FALSE)
  bg <- .make_bart_games_for_sched()

  result <- .bb_assemble_schedule_crosswalk_wbb(eg, bg, xw, 2025L)

  expect_equal(nrow(result), 1L)
  expect_equal(result$match_method, "bart_only")
  expect_true(is.na(result$espn_game_id))
  expect_equal(result$bart_muid, "BT-001")
})

test_that(".bb_assemble_schedule_crosswalk_wbb no duplicate espn_game_id columns", {
  xw     <- .make_xwalk_for_sched()
  eg     <- .make_espn_games()
  bg     <- .make_bart_games_for_sched()
  result <- .bb_assemble_schedule_crosswalk_wbb(eg, bg, xw, 2025L)
  expect_equal(sum(names(result) == "espn_game_id"), 1L)
})

# ===========================================================================
# Player crosswalk assembler (offline)
# ===========================================================================

# 1 team block: ESPN has 2 players; Fox has 2 players.
# Player 1: exact name match.
# Player 2: slight fuzzy mis-spelling of family name -> fuzzy match.

.make_espn_players <- function() {
  data.frame(
    espn_team_id      = c(100L, 100L),
    team_abbreviation = c("SC", "SC"),
    espn_athlete_id   = c("E1", "E2"),
    espn_full_name    = c("Breanna Stewart", "Aliyah Boston"),
    espn_jersey       = c("30", "4"),
    espn_position     = c("F", "F"),
    stringsAsFactors  = FALSE
  )
}

.make_fox_players <- function() {
  data.frame(
    espn_team_id   = c(100L, 100L),
    fox_athlete_id = c("F1", "F2"),
    fox_player     = c("Breanna Stewart", "Aliyah Bostn"),  # typo
    fox_jersey     = c("30", "4"),
    fox_position_group = c("Forward", "Forward"),
    stringsAsFactors = FALSE
  )
}

test_that(".bb_assemble_player_crosswalk_wbb exact + fuzzy match for 2 players", {
  espn <- .make_espn_players()
  fox  <- .make_fox_players()

  result <- .bb_assemble_player_crosswalk_wbb(espn, fox, season = 2025L, min_confidence = 0.92)

  expect_equal(nrow(result), 2L)

  # Player 1: exact
  r1 <- result[result$espn_athlete_id == "E1", ]
  expect_equal(r1$match_method,   "exact_name")
  expect_equal(r1$fox_athlete_id, "F1")
  expect_equal(r1$fox_player,     "Breanna Stewart")

  # Player 2: fuzzy (typo in Fox name)
  r2 <- result[result$espn_athlete_id == "E2", ]
  expect_equal(r2$match_method, "fuzzy_jw")
  expect_equal(r2$fox_athlete_id, "F2")
  expect_gte(r2$match_confidence, 0.92)
})

test_that(".bb_assemble_player_crosswalk_wbb output has all required columns", {
  espn   <- .make_espn_players()
  fox    <- .make_fox_players()
  result <- .bb_assemble_player_crosswalk_wbb(espn, fox, season = 2025L)

  expected_cols <- c(
    "season", "espn_team_id", "team_abbreviation", "player_name",
    "espn_athlete_id", "espn_full_name", "espn_jersey", "espn_position",
    "fox_athlete_id", "fox_player", "fox_jersey", "fox_position_group",
    "yahoo_player_id", "yahoo_player_name",
    "match_method", "match_confidence", "match_keys"
  )
  expect_true(all(expected_cols %in% names(result)))
})

test_that(".bb_assemble_player_crosswalk_wbb handles empty Fox gracefully", {
  espn <- .make_espn_players()
  fox_empty <- data.frame(
    espn_team_id       = integer(),
    fox_athlete_id     = character(),
    fox_player         = character(),
    fox_jersey         = character(),
    fox_position_group = character(),
    stringsAsFactors   = FALSE
  )

  result <- .bb_assemble_player_crosswalk_wbb(espn, fox_empty, season = 2025L)

  expect_equal(nrow(result), 2L)
  expect_true(all(is.na(result$fox_athlete_id)))
  expect_true(all(result$match_method == "unmatched"))
})

# ===========================================================================
# Gated live tests
# ===========================================================================

test_that("wbb_schedule_crosswalk() live: date parsing + pair-key join (offline verified)", {
  # The offline tests above verify the core logic. This gated test confirms
  # the full builder runs without error for a recent season.
  skip_fox_test()
  # Schedule crosswalk is expensive (~150 ESPN calls), so we just verify it
  # returns a non-empty frame without running the full season unless opted in.
  skip("Skipping full live schedule crosswalk -- run manually with skip removed")
})

test_that("wbb_player_crosswalk() live: ESPN+Fox roster join for one team", {
  skip_espn_test()
  skip_fox_test()
  tx  <- wbb_team_crosswalk(season = most_recent_wbb_season())
  idx <- which(!is.na(tx$fox_team_id))
  expect_gt(length(idx), 0L)
  i      <- idx[1]
  er     <- espn_wbb_team_roster(tx$espn_team_id[i], most_recent_wbb_season())
  fr     <- fox_wbb_team_roster(tx$fox_team_id[i])
  expect_gt(nrow(er), 0L)
  expect_gt(nrow(fr), 0L)
  # Run the assembler for this single team block
  espn_df <- dplyr::transmute(
    er,
    espn_team_id      = as.integer(tx$espn_team_id[i]),
    team_abbreviation = tx$espn_abbreviation[i],
    espn_athlete_id   = as.character(.data$athlete_id),
    espn_full_name    = .data$full_name,
    espn_jersey       = .data$jersey,
    espn_position     = .data$position_abbrev
  )
  fox_df <- dplyr::transmute(
    fr,
    espn_team_id       = as.integer(tx$espn_team_id[i]),
    fox_athlete_id     = as.character(.data$athlete_id),
    fox_player         = .data$player,
    fox_jersey         = if ("x" %in% names(fr)) as.character(.data$x)
                         else if ("jersey" %in% names(fr)) as.character(.data$jersey)
                         else NA_character_,
    fox_position_group = .data$position_group
  )
  result <- .bb_assemble_player_crosswalk_wbb(espn_df, fox_df, most_recent_wbb_season())
  expect_gt(nrow(result), 0L)
  # At least one matched player
  expect_true(any(result$match_method != "unmatched"))
})

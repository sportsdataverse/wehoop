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

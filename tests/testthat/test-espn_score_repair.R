skip_on_cran()

# Running-score rebuild in helper_espn_wnba_pbp() / helper_espn_wbb_pbp(), the R
# mirror of sportsdataverse-py's _repair_running_score. Every payload is a real
# ESPN summary (provenance: fixtures/score_repair/README.md), and
# expected/<name>.csv is sportsdataverse-py's output on the same bytes. One test
# mutates a real payload in-test (a dropped header score) to reach a branch no
# committed game exercises; it says so where it does it.

fx <- testthat::test_path("fixtures", "score_repair")
.fixture <- function(name) file.path(fx, paste0(name, ".json.gz"))

# ESPN's own per-play scores, in the payload's array order.
.espn_scores <- function(path) {
  plays <- jsonlite::fromJSON(path, simplifyVector = FALSE)[["plays"]]
  pick <- function(key) {
    vapply(plays, function(p) if (is.null(p[[key]])) NA_integer_ else as.integer(p[[key]]), integer(1))
  }
  list(home = pick("homeScore"), away = pick("awayScore"))
}
.at <- function(got, seq) {
  i <- which(got$sequence_number == as.character(seq))
  c(got$home_score[[i]], got$away_score[[i]])
}
.last <- function(got) c(got$home_score[[nrow(got)]], got$away_score[[nrow(got)]])
.changed <- function(got, espn) sum(got$home_score != espn$home | got$away_score != espn$away, na.rm = TRUE)
.never_falls <- function(got) all(diff(got$home_score) >= 0) && all(diff(got$away_score) >= 0)
.mutated <- function(name, edit) {
  tf <- tempfile(fileext = ".json")
  payload <- edit(jsonlite::fromJSON(.fixture(name), simplifyVector = FALSE))
  jsonlite::write_json(payload, tf, auto_unbox = TRUE, null = "null", digits = NA)
  tf
}

test_that("home_score / away_score / score_source equal sportsdataverse-py row for row", {
  cases <- list(
    list(helper_espn_wnba_pbp, c("wnba_240618004", "summary_wnba")),
    list(helper_espn_wbb_pbp, c("wbb_400550784", "summary_wbb"))
  )
  for (case in cases) {
    for (name in case[[2]]) {
      got <- case[[1]](.fixture(name))
      want <- utils::read.csv(file.path(fx, "expected", paste0(name, ".csv")), stringsAsFactors = FALSE)
      expect_identical(names(got)[[ncol(got)]], "score_source", info = name)
      expect_identical(nrow(got), nrow(want), info = name)
      expect_identical(as.integer(got$sequence_number), want$sequence_number, info = name)
      expect_identical(got$home_score, want$home_score, info = name)
      expect_identical(got$away_score, want$away_score, info = name)
      expect_identical(got$score_source, want$score_source, info = name)
    }
  }
})

test_that("WNBA halves era: a stale base is re-based (240618004, 2004-06-18)", {
  got <- helper_espn_wnba_pbp(.fixture("wnba_240618004"))
  espn <- .espn_scores(.fixture("wnba_240618004"))
  expect_identical(max(got$period_number), 2L)
  expect_identical(unique(got$score_source), "rebuilt")
  expect_identical(c(espn$home[[length(espn$home)]], espn$away[[length(espn$away)]]), c(61L, 69L))
  expect_identical(.last(got), c(63L, 69L)) # official 63-69
  expect_identical(c(espn$home[[117]], espn$away[[117]]), c(12L, 22L))
  expect_identical(.at(got, 119), c(14L, 22L))
  expect_identical(.changed(got, espn), 245L)
  expect_true(.never_falls(got))
})

test_that("WBB halves era: the last two rows are re-based (400550784, 2013-14)", {
  got <- helper_espn_wbb_pbp(.fixture("wbb_400550784"))
  espn <- .espn_scores(.fixture("wbb_400550784"))
  expect_identical(max(got$period_number), 2L)
  expect_identical(unique(got$score_source), "rebuilt")
  expect_identical(c(espn$home[[length(espn$home)]], espn$away[[length(espn$away)]]), c(52L, 54L))
  expect_identical(.last(got), c(54L, 56L)) # official 54-56
  expect_identical(.changed(got, espn), 2L)
  expect_true(.never_falls(got))
})

test_that("clean feeds rebuild to ESPN's values exactly (WNBA quarters + OT, WBB quarters)", {
  cases <- list(
    list(helper_espn_wnba_pbp, "summary_wnba", 418L, 5L, c(67L, 62L)),
    list(helper_espn_wbb_pbp, "summary_wbb", 360L, 4L, c(87L, 75L))
  )
  for (case in cases) {
    got <- case[[1]](.fixture(case[[2]]))
    expect_identical(nrow(got), case[[3]], info = case[[2]])
    expect_identical(max(got$period_number), case[[4]], info = case[[2]])
    expect_identical(unique(got$score_source), "rebuilt", info = case[[2]])
    expect_identical(.changed(got, .espn_scores(.fixture(case[[2]]))), 0L, info = case[[2]])
    expect_identical(.last(got), case[[5]], info = case[[2]])
  }
})

test_that("no official final keeps ESPN's scores", {
  # In-test mutation of the real payload: a pre-tip live header carries no score.
  tf <- .mutated("wnba_240618004", function(j) {
    j$header$competitions[[1]]$competitors[[1]]$score <- NULL
    j
  })
  got <- helper_espn_wnba_pbp(tf)
  espn <- .espn_scores(tf)
  unlink(tf)
  expect_identical(unique(got$score_source), "espn")
  expect_identical(.changed(got, espn), 0L)
  expect_identical(.last(got), c(61L, 69L))
})

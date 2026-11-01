# Live-network tests run only when their toggle is "1", and never on CRAN or CI.
# The CI rule lives here, not in each test file: 33 files once lacked their own
# skip_on_ci() and hit live ESPN whenever the CI toggle was set, which turned the
# macOS push job red. The workflow env toggles therefore do not make CI run live
# tests; set them locally.
skip_live_test <- function(var, what) {
  testthat::skip_on_cran()
  testthat::skip_on_ci()
  if (Sys.getenv(var) != "1") {
    testthat::skip(paste0("User can't run ", what, " tests (set ", var, "=1)"))
  }
  invisible()
}

skip_wnba_stats_test <- function() skip_live_test("WNBA_STATS_TESTS", "WNBA Stats")

skip_espn_test <- function() skip_live_test("ESPN_TESTS", "ESPN")

skip_ncaa_wbb_test <- function() skip_live_test("NCAA_WBB_TESTS", "NCAA WBB")

skip_fox_test <- function() skip_live_test("FOX_TESTS", "Fox Sports")

# Gates live tests against official.nba.com (referee assignments). Kept
# separate from `WNBA_STATS_TESTS` even though both are browser-UA-required
# NBA-family JSON APIs: official.nba.com is a distinct host with its own
# Akamai/S3 fronting and rate-limit behavior.
skip_official_nba_test <- function() skip_live_test("OFFICIAL_NBA_TESTS", "official.nba.com")

# Gates tests for `load_*()` functions that download release-asset .rds/.parquet
# files from `github.com/sportsdataverse/sportsdataverse-data/releases/...`.
# Triggered by `WEHOOP_LOAD_TESTS=1`.
#
# Kept separate from `WNBA_STATS_TESTS` and `ESPN_TESTS` because the cost
# profile is different: the API tests issue small JSON requests, whereas the
# load tests pull multi-megabyte release assets per season. Bundling them under
# the same env var would force every contributor running API tests to also
# download the full data repo, which is undesirable for routine local checks.
skip_load_test <- function() skip_live_test("WEHOOP_LOAD_TESTS", "wehoop load_*")

# Basketball-Reference (sports-reference.com) rate-limits hard and bans IPs.
skip_bref_test <- function() skip_live_test("BREF_TESTS", "Basketball-Reference")

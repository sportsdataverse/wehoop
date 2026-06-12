skip_wnba_stats_test <- function(){
  if(Sys.getenv("WNBA_STATS_TESTS") != "1"){
    skip("User can't run WNBA Stats tests")
  } else {
    invisible()
  }
}

skip_espn_test <- function(){
  if(Sys.getenv("ESPN_TESTS") != "1"){
    skip("User can't run ESPN tests")
  } else {
    invisible()
  }
}

skip_ncaa_wbb_test <- function(){
  if(Sys.getenv("NCAA_WBB_TESTS") != "1"){
    skip("User can't run NCAA WBB tests")
  } else {
    invisible()
  }
}

skip_fox_test <- function(){
  if(Sys.getenv("FOX_TESTS") != "1"){
    skip("User can't run Fox Sports tests")
  } else {
    invisible()
  }
}

# Gates tests for `load_*()` functions that download release-asset .rds/.parquet
# files from `github.com/sportsdataverse/sportsdataverse-data/releases/...`.
# Triggered by `WEHOOP_LOAD_TESTS=1`.
#
# Kept separate from `WNBA_STATS_TESTS` and `ESPN_TESTS` because the cost
# profile is different: the API tests issue small JSON requests, whereas the
# load tests pull multi-megabyte release assets per season. Bundling them under
# the same env var would force every contributor running API tests to also
# download the full data repo, which is undesirable for routine local checks.
skip_load_test <- function(){
  if(Sys.getenv("WEHOOP_LOAD_TESTS") != "1"){
    skip("User can't run wehoop load_* tests")
  } else {
    invisible()
  }
}

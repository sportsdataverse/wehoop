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

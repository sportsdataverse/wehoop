## probe_param_order_sensitivity.R
## --------------------------------
## Diagnose query-string parameter-order sensitivity. As of 2026, the WNBA
## (and NBA) Stats API at `stats.wnba.com/stats/leaguegamelog` returns a
## Cloudflare HTML error page when params are sent in alphabetical order
## (`Counter, DateFrom, DateTo, Direction, LeagueID, ...`) but a populated
## `LeagueGameLog` resultSet for the `LeagueID`-first ordering that the
## nba.com client uses. Same param *values* in both cases — only the
## key order differs.
##
## This probe sends the same params twice — once in each order — so you
## can confirm/disprove the sensitivity for any endpoint where the wrapper
## starts returning HTML but the URL looks right.
##
## Originally written for `wnba_leaguegamelog()`. Repurpose by swapping
## the `url` and `params` lists below.
##
## Run from package root:
##   Rscript tools/probes/probe_param_order_sensitivity.R
options(warn=1)
suppressPackageStartupMessages(devtools::load_all(quiet=TRUE))
url <- "https://stats.wnba.com/stats/leaguegamelog"

# Wrapper-order params
wrapper_params <- list(
  Counter      = 0,
  DateFrom     = "",
  DateTo       = "",
  Direction    = "ASC",
  LeagueID     = "10",
  PlayerOrTeam = "T",
  Season       = 2025,
  SeasonType   = "Regular Season",
  Sorter       = "DATE"
)

# My-probe-order params
probe_params <- list(
  LeagueID     = "10",
  Season       = 2025,
  SeasonType   = "Regular Season",
  PlayerOrTeam = "T",
  Counter      = 0,
  Direction    = "ASC",
  Sorter       = "DATE",
  DateFrom     = "",
  DateTo       = ""
)

tries <- list(
  list(label = "wrapper order", params = wrapper_params),
  list(label = "probe order",   params = probe_params)
)

for (t in tries) {
  Sys.sleep(4)
  cat("\n=== ", t$label, " ===\n", sep = "")
  out <- tryCatch(
    wehoop:::request_with_proxy(url = url, params = t$params),
    error = function(e) conditionMessage(e)
  )
  if (is.character(out)) cat("  ERR:", substr(out, 1, 80), "\n")
  else if (!is.null(out$resultSets) && is.data.frame(out$resultSets))
    cat("  rows=", length(out$resultSets$rowSet[[1]]), "\n", sep = "")
  else cat("  no resultSets\n")
}

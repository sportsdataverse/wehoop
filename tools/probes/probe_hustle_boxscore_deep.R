## probe_hustle_boxscore_deep.R
## ----------------------------
## Hits the `hustlestatsboxscore` endpoint via `request_with_proxy` +
## `wnba_stats_map_result_sets` for a handful of recent + historical WNBA
## game_ids and reports the per-resultSet row counts. Used to answer the
## question "does the upstream API publish populated PlayerStats / TeamStats
## tables for WNBA games, or just the `HustleStatsAvailable` flag?".
##
## When the deprecation case for `wnba_hustlestatsboxscore()` was first
## written, all three resultSets came back empty. This probe is the
## periodic re-check.
##
## Run from package root:
##   Rscript tools/probes/probe_hustle_boxscore_deep.R
options(warn = 1)
suppressPackageStartupMessages(devtools::load_all(quiet = TRUE))

url <- "https://stats.wnba.com/stats/hustlestatsboxscore"

dump <- function(game_id) {
  cat("\n=== game_id =", game_id, "===\n")
  resp <- tryCatch(
    wehoop:::request_with_proxy(url = url, params = list(GameID = wehoop:::pad_id(game_id))),
    error = function(e) { cat("  HTTP ERROR:", conditionMessage(e), "\n"); NULL }
  )
  if (is.null(resp)) return(invisible(NULL))
  sets <- tryCatch(
    wehoop:::wnba_stats_map_result_sets(resp),
    error = function(e) { cat("  MAP ERROR:", conditionMessage(e), "\n"); NULL }
  )
  if (is.null(sets)) return(invisible(NULL))
  cat("  result-set names: ", paste(names(sets), collapse=" | "), "\n", sep="")
  for (nm in names(sets)) {
    d <- sets[[nm]]
    cat(sprintf("  [%s]  nrow=%d  ncol=%d\n", nm, nrow(d), ncol(d)))
    cat("    cols: ", paste(colnames(d), collapse=", "), "\n", sep="")
    if (nrow(d) > 0) {
      cat("    head:\n")
      print(utils::head(d, 4))
    }
  }
  Sys.sleep(5)
}

for (gid in c("1022600021", "1022600024", "1022600022")) dump(gid)

## Historical check
cat("\n--- historical check (2024 season end) ---\n")
sb <- tryCatch(wnba_scoreboardv3(game_date = "2024-09-25", league_id = "10"),
               error = function(e) NULL)
if (!is.null(sb) && nrow(sb) > 0) {
  dump(sb$game_id[1])
}

cat("\nDone.\n")

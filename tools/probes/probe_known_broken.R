## probe_known_broken.R
## --------------------
## Sanity-check the endpoints that users have reported as "broken" in the
## issue tracker (e.g. wehoop #48 wnba_leaguegamelog, hoopR #183
## commonallplayers, hoopR #185 leaguedashplayerbiostats). Most of these
## reports turn out to be client-fingerprinting / IP-reputation issues at
## stats.wnba.com / stats.nba.com that affect macOS users but work fine
## from Windows — not actual endpoint migrations.
##
## Run this probe from the reporter's environment if possible. If it
## returns data, the endpoint is healthy and the report is a client-side
## problem; if it returns HTML / empty, the endpoint is genuinely broken.
##
## Run from package root:
##   Rscript tools/probes/probe_known_broken.R
options(warn = 1)
suppressPackageStartupMessages(devtools::load_all(quiet = TRUE))

go <- function(label, fn, ...) {
  cat("\n=== ", label, " ===\n", sep = "")
  out <- tryCatch(fn(...),
                  error = function(e) { cat("ERROR:", conditionMessage(e), "\n"); NULL })
  if (is.null(out)) return(invisible(NULL))
  if (is.list(out) && !is.data.frame(out)) {
    cat("returned list, components:\n")
    for (nm in names(out)) {
      d <- out[[nm]]
      if (is.data.frame(d)) {
        cat("  $", nm, ": ", nrow(d), " rows x ", ncol(d), " cols\n", sep="")
      } else {
        cat("  $", nm, ": ", class(d)[1], " len=", length(d), "\n", sep="")
      }
    }
  } else if (is.data.frame(out)) {
    cat("returned data.frame: ", nrow(out), " rows x ", ncol(out), " cols\n", sep="")
    print(head(colnames(out), 12))
  } else {
    cat("returned ", class(out)[1], "\n", sep="")
  }
  invisible(out)
}

## #48 wnba_leaguegamelog default
go("wnba_leaguegamelog() default", wnba_leaguegamelog)
Sys.sleep(3)
go("wnba_leaguegamelog(league_id='10', season='2025')",
   wnba_leaguegamelog, league_id = "10", season = "2025")
Sys.sleep(3)
go("wnba_leaguegamelog(league_id='10', season='2025-26')",
   wnba_leaguegamelog, league_id = "10", season = "2025-26")
Sys.sleep(3)

## commonplayers (WNBA equivalent of NBA commonallplayers)
go("wnba_commonallplayers(season='2025-26')",
   wnba_commonallplayers, season = "2025-26")
Sys.sleep(3)

## sanity: scoreboardv3 worked earlier
go("wnba_scoreboardv3(today)",
   wnba_scoreboardv3, game_date = format(Sys.Date()-1, "%Y-%m-%d"), league_id = "10")

cat("\nDone.\n")

## verify_wrapper_changes.R
## ------------------------
## End-to-end smoke test for the wrappers touched in any given PR. Calls
## each one against the live WNBA Stats API / CDN and prints a one-line
## class + shape summary so you can eyeball that the wrapper returns the
## right kind of object (list of data.frames vs single data.frame) with
## non-zero rows.
##
## Update the `verdict()` block list to match whatever wrappers your PR
## touches. Lighter-weight than the testthat suite; use this for the
## "did I break anything obvious" check before running `devtools::test()`.
##
## Run from package root:
##   Rscript tools/probes/verify_wrapper_changes.R
options(warn = 1)
suppressPackageStartupMessages(devtools::load_all(quiet = TRUE))

verdict <- function(label, expr) {
  cat("\n--- ", label, " ---\n", sep = "")
  out <- tryCatch(expr, error = function(e) { cat("  ERROR: ", conditionMessage(e), "\n"); structure(NULL, error = TRUE) })
  if (!is.null(attr(out, "error"))) return(invisible(NULL))
  if (is.list(out) && !is.data.frame(out)) {
    cat("  list with", length(out), "components:\n")
    for (nm in names(out)) {
      d <- out[[nm]]
      if (is.data.frame(d)) cat("    ", nm, ": ", nrow(d), "x", ncol(d), "\n")
      else cat("    ", nm, ": ", class(d)[1], " len=", length(d), "\n")
    }
  } else if (is.data.frame(out)) {
    cat("  data.frame: ", nrow(out), "x", ncol(out), "\n", sep = "")
    cat("  first 5 cols: ", paste(head(colnames(out), 5), collapse=", "), "\n", sep="")
  } else {
    cat("  ", class(out)[1], " len=", length(out), "\n", sep="")
  }
  invisible(out)
}

verdict("wnba_schedule()  (CDN migration)", wnba_schedule())
Sys.sleep(3)

verdict("wnba_schedule(season=2024)  (historical season warning)",
        wnba_schedule(season = 2024))
Sys.sleep(3)

verdict("wnba_leaguegamelog()  (default now '10')", wnba_leaguegamelog())
Sys.sleep(3)

verdict("wnba_playerprofilev2(player_id='1628932')  (un-deprecated)",
        wnba_playerprofilev2(player_id = '1628932'))
Sys.sleep(3)

verdict("wnba_teaminfocommon(team_id='1611661319')  (un-deprecated)",
        wnba_teaminfocommon(team_id = '1611661319'))
Sys.sleep(3)

verdict("wnba_teamyearbyyearstats(team_id='1611661319')  (un-deprecated)",
        wnba_teamyearbyyearstats(team_id = '1611661319'))
Sys.sleep(3)

verdict("wnba_leaguelineupviz()  (un-deprecated)",
        wnba_leaguelineupviz(season = "2025-26"))
Sys.sleep(3)

cat("\nDone.\n")

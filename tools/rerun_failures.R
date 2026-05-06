#!/usr/bin/env Rscript
# Re-run only the previously-failing examples and report status.
fails <- c(
  "espn_wbb_athlete_info", "espn_wnba_athlete_info",
  "espn_wbb_athlete_overview", "espn_wbb_athlete_stats",
  "espn_wbb_athlete_eventlog", "espn_wbb_athlete_gamelog",
  "espn_wbb_athlete_splits", "espn_wbb_athlete_statisticslog",
  "espn_wnba_athlete_splits", "espn_wnba_athlete_statisticslog",
  "espn_wbb_team_news", "espn_wnba_team_news",
  "espn_wnba_draft",
  "espn_wbb_team_injuries", "espn_wnba_team_injuries",
  "espn_wbb_team_leaders", "espn_wnba_team_leaders",
  "espn_wbb_injuries",
  "espn_wnba_freeagents"
)

cat(sprintf("%-42s | %s\n", "name", "result"))
cat(strrep("-", 95), "\n", sep = "")
for (nm in fails) {
  scr <- file.path("tools/example_runs", paste0(nm, ".R"))
  if (!file.exists(scr)) { cat(sprintf("%-42s | (no script)\n", nm)); next }
  out <- tryCatch(
    system2("Rscript", c("--no-save", scr),
            stdout = TRUE, stderr = TRUE, timeout = 60),
    error = function(e) paste("RUNNER-ERROR:", conditionMessage(e))
  )
  res_idx <- grep("^---RESULT---", out)
  summary <- if (length(res_idx))
              paste(out[(res_idx[1] + 1):length(out)], collapse = " | ")
              else paste("ERR:", paste(tail(out, 2), collapse = " "))
  cat(sprintf("%-42s | %s\n", nm, substr(summary, 1, 200)))
}

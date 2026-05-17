## mine_api_descriptions.R
## ------------------------
## Driver that calls `mine_espn_api_descriptions()` (defined in
## tools/docs/markdown_man_table_helper.R) against several ESPN
## endpoints that self-document their columns, and writes the
## aggregate result to `tools/docs/column_descriptions_api.csv`.
##
## The mined entries become the second-highest-precedence source in
## the dictionary build (after the hand-curated CSV) — see
## tools/docs/build_column_descriptions.R. ESPN-authored descriptions
## are domain-rich and authoritative, so they outrank both mined
## describe-blocks and heuristic fallbacks.
##
## Endpoints probed:
##   1. core-v2 player statistics (WNBA + WBB)
##      Source for the `general_*`, `offensive_*`, `defensive_*`,
##      `rebounding_*`, `shooting_*`, `misc_*` stat-section column
##      families exposed by `espn_wnba_player_stats()` and
##      `espn_wbb_player_stats()`.
##   2. core-v2 team statistics (WNBA + WBB)
##      Same shape; covers the team-equivalent dashboard sections.
##   3. web-common-v3 athlete stats (WNBA + WBB)
##      Different shape (parallel arrays); covers `averages_*` /
##      `totals_*` style columns.
##
## Run from package root:
##   Rscript tools/docs/mine_api_descriptions.R

options(warn = 1)
suppressPackageStartupMessages({
  library(dplyr); library(tibble); library(readr)
})

source("tools/docs/markdown_man_table_helper.R")

## Known-good IDs for probing (do not depend on a live game schedule).
## Pick athletes/teams with long, current careers so the API returns
## populated category structures.
endpoints <- c(
  ## core-v2 athlete statistics (general/offensive/defensive/etc.)
  "https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/2025/types/2/athletes/3149391/statistics",
  "https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/2025/types/3/athletes/3149391/statistics",
  "https://sports.core.api.espn.com/v2/sports/basketball/leagues/womens-college-basketball/seasons/2024/types/2/athletes/4433402/statistics",

  ## core-v2 team statistics
  "https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/2025/types/2/teams/20/statistics",
  "https://sports.core.api.espn.com/v2/sports/basketball/leagues/womens-college-basketball/seasons/2025/types/2/teams/41/statistics",

  ## web-common-v3 athlete stats (parallel-array averages/totals)
  "https://site.web.api.espn.com/apis/common/v3/sports/basketball/wnba/athletes/3149391/stats?season=2025",
  "https://site.web.api.espn.com/apis/common/v3/sports/basketball/womens-college-basketball/athletes/4433402/stats?season=2024"
)

all_rows <- list()
for (url in endpoints) {
  short <- sub("^https://[^/]+", "", url)
  cat("probing", short, "...\n")
  rows <- mine_espn_api_descriptions(url)
  cat("  mined", nrow(rows), "rows\n")
  if (nrow(rows) > 0) all_rows[[length(all_rows) + 1]] <- rows
  Sys.sleep(1)
}

dict <- bind_rows(all_rows) |>
  distinct(col_name, .keep_all = TRUE) |>
  arrange(col_name)

cat("\n=== Total unique API-mined col_names:", nrow(dict), "===\n")
write_csv(dict, "tools/docs/column_descriptions_api.csv")
cat("Wrote tools/docs/column_descriptions_api.csv\n\n")

cat("Sample (first 20):\n")
print(head(dict, 20), n = 20)

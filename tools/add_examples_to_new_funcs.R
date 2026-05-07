#!/usr/bin/env Rscript
# Inject @examples \donttest{...} blocks into each of the 58 ESPN basketball
# wrappers added in wehoop 3.0.0. All wrappers hit live ESPN endpoints, so
# examples are wrapped in \donttest{} -- they DO work when network is
# available but are skipped during routine R CMD check.
#
# Strategy: for each (file, function_name, example_call) tuple, find the
# roxygen block that immediately precedes `funcname <- function(...)` and
# insert an @examples block before the @export tag (or after @details if
# @export is in a different block).
#
# Idempotent: skips functions that already have @examples.

# nolint start: line_length_linter

specs <- list(
  # News
  list("R/espn_wbb_news.R",            "espn_wbb_news",            "espn_wbb_news(limit = 5)"),
  list("R/espn_wbb_news.R",            "espn_wbb_team_news",       'espn_wbb_team_news(team_id = "2509", limit = 5)'),
  list("R/espn_wnba_news.R",           "espn_wnba_news",           "espn_wnba_news(limit = 5)"),
  list("R/espn_wnba_news.R",           "espn_wnba_team_news",      'espn_wnba_team_news(team_id = "17", limit = 5)'),
  # Calendar
  list("R/espn_wbb_calendar.R",        "espn_wbb_calendar",        "espn_wbb_calendar(season = 2025)"),
  list("R/espn_wnba_calendar.R",       "espn_wnba_calendar",       "espn_wnba_calendar(season = 2025)"),
  # Team detail
  list("R/espn_wbb_team_detail.R",     "espn_wbb_team",            'espn_wbb_team(team_id = "2509", season = 2025)'),
  list("R/espn_wbb_team_detail.R",     "espn_wbb_team_roster",     'espn_wbb_team_roster(team_id = "2509", season = 2025)'),
  list("R/espn_wbb_team_detail.R",     "espn_wbb_team_schedule",   'espn_wbb_team_schedule(team_id = "2509", season = 2025)'),
  list("R/espn_wbb_team_detail.R",     "espn_wbb_team_leaders",    'espn_wbb_team_leaders(team_id = "2509", season = 2025)'),
  list("R/espn_wnba_team_detail.R",    "espn_wnba_team",           'espn_wnba_team(team_id = "17", season = 2025)'),
  list("R/espn_wnba_team_detail.R",    "espn_wnba_team_roster",    'espn_wnba_team_roster(team_id = "17", season = 2025)'),
  list("R/espn_wnba_team_detail.R",    "espn_wnba_team_schedule",  'espn_wnba_team_schedule(team_id = "17", season = 2025)'),
  list("R/espn_wnba_team_detail.R",    "espn_wnba_team_leaders",   'espn_wnba_team_leaders(team_id = "17", season = 2025)'),
  # Injuries
  list("R/espn_wbb_injuries.R",        "espn_wbb_injuries",        "espn_wbb_injuries()"),
  list("R/espn_wbb_injuries.R",        "espn_wbb_team_injuries",   'espn_wbb_team_injuries(team_id = "2509")'),
  list("R/espn_wnba_injuries.R",       "espn_wnba_injuries",       "espn_wnba_injuries()"),
  list("R/espn_wnba_injuries.R",       "espn_wnba_team_injuries",  'espn_wnba_team_injuries(team_id = "17")'),
  # Athletes
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_info",          'espn_wbb_athlete_info(athlete_id = "4432755")'),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_overview",      'espn_wbb_athlete_overview(athlete_id = "4432755", season = 2025)'),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_stats",         'espn_wbb_athlete_stats(athlete_id = "4432755", season = 2025)'),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_gamelog",       'espn_wbb_athlete_gamelog(athlete_id = "4432755", season = 2025)'),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_splits",        'espn_wbb_athlete_splits(athlete_id = "4432755", season = 2025)'),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_eventlog",      'espn_wbb_athlete_eventlog(athlete_id = "4432755", season = 2025)'),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_awards",        'espn_wbb_athlete_awards(athlete_id = "4432755")'),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_statisticslog", 'espn_wbb_athlete_statisticslog(athlete_id = "4432755", season = 2025)'),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_info",          'espn_wnba_athlete_info(athlete_id = "3149391")'),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_overview",      'espn_wnba_athlete_overview(athlete_id = "3149391", season = 2024)'),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_stats",         'espn_wnba_athlete_stats(athlete_id = "3149391", season = 2024)'),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_gamelog",       'espn_wnba_athlete_gamelog(athlete_id = "3149391", season = 2024)'),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_splits",        'espn_wnba_athlete_splits(athlete_id = "3149391", season = 2024)'),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_eventlog",      'espn_wnba_athlete_eventlog(athlete_id = "3149391", season = 2024)'),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_awards",        'espn_wnba_athlete_awards(athlete_id = "3149391")'),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_statisticslog", 'espn_wnba_athlete_statisticslog(athlete_id = "3149391", season = 2024)'),
  # Event detail
  list("R/espn_wbb_event_detail.R",    "espn_wbb_event_odds",          'espn_wbb_event_odds(event_id = "401735229")'),
  list("R/espn_wbb_event_detail.R",    "espn_wbb_event_probabilities", 'espn_wbb_event_probabilities(event_id = "401735229", limit = 50)'),
  list("R/espn_wbb_event_detail.R",    "espn_wbb_event_officials",     'espn_wbb_event_officials(event_id = "401735229")'),
  list("R/espn_wbb_event_detail.R",    "espn_wbb_event_broadcasts",    'espn_wbb_event_broadcasts(event_id = "401735229")'),
  list("R/espn_wnba_event_detail.R",   "espn_wnba_event_odds",          'espn_wnba_event_odds(event_id = "401736171")'),
  list("R/espn_wnba_event_detail.R",   "espn_wnba_event_probabilities", 'espn_wnba_event_probabilities(event_id = "401736171", limit = 50)'),
  list("R/espn_wnba_event_detail.R",   "espn_wnba_event_officials",     'espn_wnba_event_officials(event_id = "401736171")'),
  list("R/espn_wnba_event_detail.R",   "espn_wnba_event_broadcasts",    'espn_wnba_event_broadcasts(event_id = "401736171")'),
  # WNBA-only
  list("R/espn_wnba_transactions.R",   "espn_wnba_draft",          "espn_wnba_draft(season = 2024)"),
  list("R/espn_wnba_transactions.R",   "espn_wnba_freeagents",     "espn_wnba_freeagents(season = 2025)"),
  list("R/espn_wnba_transactions.R",   "espn_wnba_transactions",   "espn_wnba_transactions(season = 2025, limit = 10)"),
  # League catalogs
  list("R/espn_wbb_league.R",          "espn_wbb_leaders",          "espn_wbb_leaders(season = 2025, season_type = 2)"),
  list("R/espn_wbb_league.R",          "espn_wbb_venues",           "espn_wbb_venues()"),
  list("R/espn_wbb_league.R",          "espn_wbb_coaches",          "espn_wbb_coaches(season = 2025)"),
  list("R/espn_wbb_league.R",          "espn_wbb_athletes_index",   "espn_wbb_athletes_index(season = 2025, limit = 50)"),
  list("R/espn_wbb_league.R",          "espn_wbb_seasons",          "espn_wbb_seasons()"),
  list("R/espn_wbb_league.R",          "espn_wbb_season_info",      "espn_wbb_season_info(season = 2025)"),
  list("R/espn_wnba_league.R",         "espn_wnba_leaders",         "espn_wnba_leaders(season = 2024, season_type = 2)"),
  list("R/espn_wnba_league.R",         "espn_wnba_venues",          "espn_wnba_venues()"),
  list("R/espn_wnba_league.R",         "espn_wnba_coaches",         "espn_wnba_coaches(season = 2025)"),
  list("R/espn_wnba_league.R",         "espn_wnba_athletes_index",  "espn_wnba_athletes_index(season = 2025, limit = 50)"),
  list("R/espn_wnba_league.R",         "espn_wnba_seasons",         "espn_wnba_seasons()"),
  list("R/espn_wnba_league.R",         "espn_wnba_season_info",     "espn_wnba_season_info(season = 2025)"),
  # Symmetric
  list("R/espn_wnba_groups.R",         "espn_wnba_conferences",     "espn_wnba_conferences()")
)

stopifnot(length(specs) == 58L)

# nolint end

inject_examples <- function(file, fn_name, call_text) {
  if (!file.exists(file)) {
    message("SKIP (file missing): ", file, " :: ", fn_name)
    return(invisible(FALSE))
  }
  lines <- readLines(file, warn = FALSE)

  # Find the line that defines `fn_name <- function(`
  fn_pattern <- paste0("^", gsub("\\.", "\\\\.", fn_name), "\\s*<-\\s*function\\s*\\(")
  fn_line <- grep(fn_pattern, lines)
  if (length(fn_line) == 0L) {
    message("SKIP (fn not found): ", file, " :: ", fn_name)
    return(invisible(FALSE))
  }
  fn_line <- fn_line[1L]

  # Walk backwards to find the start of the immediately-preceding roxygen block
  i <- fn_line - 1L
  while (i >= 1L && grepl("^#'", lines[i])) {
    i <- i - 1L
  }
  block_start <- i + 1L
  block_end   <- fn_line - 1L
  if (block_end < block_start) {
    message("SKIP (no roxygen block): ", file, " :: ", fn_name)
    return(invisible(FALSE))
  }
  block <- lines[block_start:block_end]

  # Idempotency: skip if @examples already present
  if (any(grepl("@examples", block))) {
    return(invisible(FALSE))
  }

  examples_lines <- c(
    "#' @examples",
    "#' \\donttest{",
    paste0("#'   ", call_text),
    "#' }"
  )

  # Insert just before the function definition line (after the roxygen block)
  new_lines <- c(
    lines[seq_len(block_end)],
    examples_lines,
    lines[(block_end + 1L):length(lines)]
  )

  writeLines(new_lines, file, useBytes = TRUE)
  message("OK: ", file, " :: ", fn_name)
  invisible(TRUE)
}

results <- vapply(specs, function(s) {
  inject_examples(s[[1]], s[[2]], s[[3]])
}, logical(1L))

cat("\n==================================\n")
cat(sprintf("Injected examples into %d/%d functions.\n", sum(results), length(results)))
cat("==================================\n")

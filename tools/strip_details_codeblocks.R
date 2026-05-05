#!/usr/bin/env Rscript
# For each of the 58 net-new ESPN expansion wrappers (which now carry
# proper `@examples \donttest{...}` blocks), strip the redundant code-only
# part out of any `@details` section.
#
# Rules:
#   - If @details contains prose AND a fenced ```r ... ``` code block,
#     remove just the code block (keep the prose).
#   - If @details contains ONLY a fenced code block (no prose), remove the
#     entire @details tag.
#   - Leave the rest of the roxygen block untouched.
#
# Operates on the same 58 (file, function) pairs as add_examples_to_new_funcs.R.

specs <- list(
  list("R/espn_wbb_news.R",            "espn_wbb_news"),
  list("R/espn_wbb_news.R",            "espn_wbb_team_news"),
  list("R/espn_wnba_news.R",           "espn_wnba_news"),
  list("R/espn_wnba_news.R",           "espn_wnba_team_news"),
  list("R/espn_wbb_calendar.R",        "espn_wbb_calendar"),
  list("R/espn_wnba_calendar.R",       "espn_wnba_calendar"),
  list("R/espn_wbb_team_detail.R",     "espn_wbb_team"),
  list("R/espn_wbb_team_detail.R",     "espn_wbb_team_roster"),
  list("R/espn_wbb_team_detail.R",     "espn_wbb_team_schedule"),
  list("R/espn_wbb_team_detail.R",     "espn_wbb_team_leaders"),
  list("R/espn_wnba_team_detail.R",    "espn_wnba_team"),
  list("R/espn_wnba_team_detail.R",    "espn_wnba_team_roster"),
  list("R/espn_wnba_team_detail.R",    "espn_wnba_team_schedule"),
  list("R/espn_wnba_team_detail.R",    "espn_wnba_team_leaders"),
  list("R/espn_wbb_injuries.R",        "espn_wbb_injuries"),
  list("R/espn_wbb_injuries.R",        "espn_wbb_team_injuries"),
  list("R/espn_wnba_injuries.R",       "espn_wnba_injuries"),
  list("R/espn_wnba_injuries.R",       "espn_wnba_team_injuries"),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_info"),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_overview"),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_stats"),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_gamelog"),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_splits"),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_eventlog"),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_awards"),
  list("R/espn_wbb_athletes.R",        "espn_wbb_athlete_statisticslog"),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_info"),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_overview"),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_stats"),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_gamelog"),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_splits"),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_eventlog"),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_awards"),
  list("R/espn_wnba_athletes.R",       "espn_wnba_athlete_statisticslog"),
  list("R/espn_wbb_event_detail.R",    "espn_wbb_event_odds"),
  list("R/espn_wbb_event_detail.R",    "espn_wbb_event_probabilities"),
  list("R/espn_wbb_event_detail.R",    "espn_wbb_event_officials"),
  list("R/espn_wbb_event_detail.R",    "espn_wbb_event_broadcasts"),
  list("R/espn_wnba_event_detail.R",   "espn_wnba_event_odds"),
  list("R/espn_wnba_event_detail.R",   "espn_wnba_event_probabilities"),
  list("R/espn_wnba_event_detail.R",   "espn_wnba_event_officials"),
  list("R/espn_wnba_event_detail.R",   "espn_wnba_event_broadcasts"),
  list("R/espn_wnba_transactions.R",   "espn_wnba_draft"),
  list("R/espn_wnba_transactions.R",   "espn_wnba_freeagents"),
  list("R/espn_wnba_transactions.R",   "espn_wnba_transactions"),
  list("R/espn_wbb_league.R",          "espn_wbb_leaders"),
  list("R/espn_wbb_league.R",          "espn_wbb_venues"),
  list("R/espn_wbb_league.R",          "espn_wbb_coaches"),
  list("R/espn_wbb_league.R",          "espn_wbb_athletes_index"),
  list("R/espn_wbb_league.R",          "espn_wbb_seasons"),
  list("R/espn_wbb_league.R",          "espn_wbb_season_info"),
  list("R/espn_wnba_league.R",         "espn_wnba_leaders"),
  list("R/espn_wnba_league.R",         "espn_wnba_venues"),
  list("R/espn_wnba_league.R",         "espn_wnba_coaches"),
  list("R/espn_wnba_league.R",         "espn_wnba_athletes_index"),
  list("R/espn_wnba_league.R",         "espn_wnba_seasons"),
  list("R/espn_wnba_league.R",         "espn_wnba_season_info"),
  list("R/espn_wnba_groups.R",         "espn_wnba_conferences")
)

stopifnot(length(specs) == 58L)

strip_block <- function(file, fn_name) {
  if (!file.exists(file)) {
    message("SKIP (file missing): ", file, " :: ", fn_name)
    return(invisible(FALSE))
  }
  lines <- readLines(file, warn = FALSE)

  # Find the line `fn_name <- function(`
  fn_pat <- paste0("^", gsub("\\.", "\\\\.", fn_name), "\\s*<-\\s*function\\s*\\(")
  fn_line <- grep(fn_pat, lines)
  if (length(fn_line) == 0L) {
    message("SKIP (fn not found): ", file, " :: ", fn_name)
    return(invisible(FALSE))
  }
  fn_line <- fn_line[1L]

  # Walk back to the start of the immediately-preceding roxygen block
  i <- fn_line - 1L
  while (i >= 1L && grepl("^#'", lines[i])) i <- i - 1L
  block_start <- i + 1L
  block_end   <- fn_line - 1L
  if (block_end < block_start) return(invisible(FALSE))

  block <- lines[block_start:block_end]

  # Locate @details
  details_idx <- grep("^#'\\s*@details", block)
  if (length(details_idx) == 0L) return(invisible(FALSE))
  details_start <- details_idx[1L]

  # Find end of @details section: next @tag (or end of block)
  next_tag <- grep("^#'\\s*@", block)
  next_tag <- next_tag[next_tag > details_start]
  details_end <- if (length(next_tag) == 0L) length(block) else (next_tag[1L] - 1L)

  details_lines <- block[details_start:details_end]

  # Find ```r ... ``` fences inside details
  fence_open  <- grep("^#'\\s*```r\\s*$", details_lines)
  fence_close <- grep("^#'\\s*```\\s*$",  details_lines)
  fence_close <- fence_close[fence_close > fence_open[1]]
  if (length(fence_open) == 0L || length(fence_close) == 0L) {
    return(invisible(FALSE))   # nothing to strip
  }
  fence_open  <- fence_open[1L]
  fence_close <- fence_close[1L]

  # Lines to drop within details_lines (relative to details_lines): the fences
  # plus their content
  drop_local <- seq(fence_open, fence_close)

  # Determine if details_lines (excluding the @details header itself) has
  # any non-fence-block prose left. Prose = #' lines that are not the header,
  # not blank `#'` separators, and not in the code-fence range.
  header_local <- 1L
  remaining <- setdiff(seq_along(details_lines), c(header_local, drop_local))
  remaining_lines <- details_lines[remaining]
  has_prose <- any(grepl("^#'\\s+\\S+", remaining_lines))

  if (!has_prose) {
    # Drop the whole @details section
    new_details <- character(0)
  } else {
    # Drop just the fence range
    new_details <- details_lines[-drop_local]
    # Remove any trailing blank `#'` left dangling at end of details section
    while (length(new_details) > 0 &&
           grepl("^#'\\s*$", new_details[length(new_details)])) {
      new_details <- new_details[-length(new_details)]
    }
  }

  new_block <- c(
    block[seq_len(details_start - 1L)],
    new_details,
    if (details_end < length(block)) block[(details_end + 1L):length(block)] else character()
  )

  new_lines <- c(
    lines[seq_len(block_start - 1L)],
    new_block,
    lines[(block_end + 1L):length(lines)]
  )

  writeLines(new_lines, file, useBytes = TRUE)
  message("OK: ", file, " :: ", fn_name)
  invisible(TRUE)
}

results <- vapply(specs, function(s) strip_block(s[[1]], s[[2]]), logical(1L))

cat("\n=========================================\n")
cat(sprintf("Stripped @details code blocks in %d/%d functions.\n",
            sum(results), length(results)))
cat("=========================================\n")

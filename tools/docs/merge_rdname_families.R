## merge_rdname_families.R
## ------------------------
## Lever 2 of the win-builder manual-build time reduction: cut man/ PAGE
## COUNT by merging sibling function families onto one shared Rd topic
## via @rdname (roxygen2's standard multi-object-one-topic mechanism --
## see e.g. base::mean/mean.Date). Every function keeps its own \alias,
## \usage, and @return content; ?fn still resolves for every member.
##
## Common source shape for a family member (verified against the repo's
## generated wnba_stats_*.R / espn_*.R modules):
##
##   #' **Title**
##   #' @name <member>
##   NULL
##   #' @title
##   #' **Title**
##   #' @rdname <member>
##   #' @author ...
##   #' @param ...
##   #' @return ...
##   <member> <- function(...) { ... }
##
## For the chosen PRIMARY member of a family, nothing changes. For every
## OTHER member: the tiny `#' @name <member>` / NULL stub block is
## deleted (it exists only to seed the object's own topic, which the
## family now shares with the primary), and the main block's
## `@rdname <member>` becomes `@rdname <primary>`. Title/description/
## param/return content in the main block is left untouched --
## roxygen2 concatenates it into the shared topic (verified in a pilot:
## tools::checkRd stays clean, \alias/\usage/\value all show every
## member).
##
## Usage:
##   Rscript tools/docs/merge_rdname_families.R            # apply
##   Rscript tools/docs/merge_rdname_families.R --dry-run   # report only

source("tools/docs/gate_tables_pdf.R")  ## for doc_blocks(), block_rdname(), is_roxy()

args <- commandArgs(trailingOnly = TRUE)
dry_run <- "--dry-run" %in% args

## ---- family definitions: file(s) -> list of c(primary, other1, other2, ...) ----
## One file's functions merge onto the FIRST family member's topic name.
families <- list(
  wnba_stats_player_dash.R = list(
    c("wnba_playerdashboardbyclutch", "wnba_playerdashboardbygamesplits",
      "wnba_playerdashboardbygeneralsplits", "wnba_playerdashboardbylastngames",
      "wnba_playerdashboardbyopponent", "wnba_playerdashboardbyshootingsplits",
      "wnba_playerdashboardbyteamperformance", "wnba_playerdashboardbyyearoveryear")
  ),
  wnba_stats_team_dash.R = list(
    c("wnba_teamdashboardbyclutch", "wnba_teamdashboardbygamesplits",
      "wnba_teamdashboardbygeneralsplits", "wnba_teamdashboardbylastngames",
      "wnba_teamdashboardbyopponent", "wnba_teamdashboardbyshootingsplits",
      "wnba_teamdashboardbyteamperformance", "wnba_teamdashboardbyyearoveryear")
  ),
  wnba_stats_boxscore_v3.R = list(
    c("wnba_boxscoretraditionalv3", "wnba_boxscoreadvancedv3", "wnba_boxscoremiscv3",
      "wnba_boxscorescoringv3", "wnba_boxscorefourfactorsv3", "wnba_boxscoreplayertrackv3",
      "wnba_boxscoreusagev3")
  ),
  wnba_stats_boxscore.R = list(
    c("wnba_boxscoretraditionalv2", "wnba_boxscoreadvancedv2", "wnba_boxscoremiscv2",
      "wnba_boxscorescoringv2", "wnba_boxscoreusagev2", "wnba_boxscorefourfactorsv2"),
    c("wnba_boxscoreplayertrackv2", "wnba_boxscoresummaryv2", "wnba_hustlestatsboxscore")
  ),
  wnba_stats_draft.R = list(
    c("wnba_draftcombinestats", "wnba_draftcombinedrillresults",
      "wnba_draftcombinenonstationaryshooting", "wnba_draftcombineplayeranthro",
      "wnba_draftcombinespotshooting")
  ),
  wnba_stats_video.R = list(
    c("wnba_videodetailsasset", "wnba_videodetails")
  ),
  wnba_stats_hustle.R = list(
    c("wnba_leaguehustlestatsplayer", "wnba_leaguehustlestatsplayerleaders",
      "wnba_leaguehustlestatsteam", "wnba_leaguehustlestatsteamleaders")
  ),
  wnba_stats_team.R = list(
    c("wnba_teamplayerdashboard", "wnba_teamplayeronoffdetails", "wnba_teamplayeronoffsummary")
  ),
  espn_wbb_event_detail.R = list(
    c("espn_wbb_game_broadcasts", "espn_wbb_game_odds", "espn_wbb_game_officials",
      "espn_wbb_game_powerindex", "espn_wbb_game_predictor", "espn_wbb_game_situation"),
    c("espn_wbb_game_team_leaders", "espn_wbb_game_team_linescores", "espn_wbb_game_team_records",
      "espn_wbb_game_team_roster", "espn_wbb_game_team_score", "espn_wbb_game_team_statistics")
  ),
  espn_wnba_event_detail.R = list(
    c("espn_wnba_game_broadcasts", "espn_wnba_game_odds", "espn_wnba_game_officials",
      "espn_wnba_game_powerindex", "espn_wnba_game_predictor", "espn_wnba_game_situation"),
    c("espn_wnba_game_team_leaders", "espn_wnba_game_team_linescores", "espn_wnba_game_team_records",
      "espn_wnba_game_team_roster", "espn_wnba_game_team_score", "espn_wnba_game_team_statistics")
  ),
  espn_wbb_athletes.R = list(
    c("espn_wbb_player_eventlog", "espn_wbb_player_gamelog", "espn_wbb_player_overview",
      "espn_wbb_player_splits", "espn_wbb_player_statisticslog", "espn_wbb_player_stats_v3")
  ),
  espn_wnba_athletes.R = list(
    c("espn_wnba_player_eventlog", "espn_wnba_player_gamelog", "espn_wnba_player_overview",
      "espn_wnba_player_splits", "espn_wnba_player_statisticslog", "espn_wnba_player_stats_v3")
  ),
  espn_wbb_data.R = list(
    c("espn_wbb_game_all", "espn_wbb_game_rosters", "espn_wbb_pbp",
      "espn_wbb_player_box", "espn_wbb_team_box"),
    c("helper_espn_wbb_pbp", "helper_espn_wbb_player_box", "helper_espn_wbb_team_box")
  ),
  espn_wnba_data.R = list(
    c("espn_wnba_game_all", "espn_wnba_game_rosters", "espn_wnba_pbp",
      "espn_wnba_player_box", "espn_wnba_team_box"),
    c("helper_espn_wnba_pbp", "helper_espn_wnba_player_box", "helper_espn_wnba_team_box")
  ),
  espn_wbb_team_detail.R = list(
    c("espn_wbb_team", "espn_wbb_team_leaders", "espn_wbb_team_roster",
      "espn_wbb_team_season_profile")
  ),
  espn_wnba_team_detail.R = list(
    c("espn_wnba_team", "espn_wnba_team_leaders", "espn_wnba_team_roster",
      "espn_wnba_team_season_profile")
  ),
  espn_wnba_athlete_career.R = list(
    c("espn_wnba_draft_athletes", "espn_wnba_draft_rounds", "espn_wnba_draft_status",
      "espn_wnba_season_draft")
  ),
  espn_wbb_groups_v2.R = list(
    c("espn_wbb_season_group", "espn_wbb_season_group_children", "espn_wbb_season_group_teams")
  ),
  espn_wnba_groups_v2.R = list(
    c("espn_wnba_season_group", "espn_wnba_season_group_children", "espn_wnba_season_group_teams")
  ),
  fox_basketball.R = list(
    c("fox_basketball_standings", "fox_basketball_team_gamelog", "fox_basketball_team_roster",
      "fox_basketball_team_stats", "fox_basketball_teams"),
    c("fox_basketball_boxscore", "fox_basketball_odds", "fox_basketball_pbp")
  ),
  load_crosswalk.R = list(
    c("load_wbb_player_crosswalk", "load_wbb_schedule_crosswalk", "load_wbb_team_crosswalk",
      "load_wnba_player_crosswalk", "load_wnba_schedule_crosswalk", "load_wnba_team_crosswalk")
  ),
  load_models.R = list(
    c("load_wbb_player_value", "load_wbb_ratings", "load_wnba_player_impact")
  ),
  load_wbb.R = list(
    c("load_wbb_game_rosters", "load_wbb_officials", "load_wbb_pbp", "load_wbb_player_box",
      "load_wbb_player_core", "load_wbb_player_stats", "load_wbb_rosters", "load_wbb_schedule",
      "load_wbb_shots", "load_wbb_standings", "load_wbb_team_box", "load_wbb_team_stats")
  ),
  load_wnba.R = list(
    c("load_wnba_draft", "load_wnba_game_rosters", "load_wnba_officials", "load_wnba_pbp",
      "load_wnba_player_box", "load_wnba_player_core", "load_wnba_player_stats",
      "load_wnba_rosters", "load_wnba_schedule", "load_wnba_shots", "load_wnba_standings",
      "load_wnba_team_box", "load_wnba_team_stats")
  ),
  load_wnba_stats.R = list(
    c("load_wnba_stats_coaches", "load_wnba_stats_draft", "load_wnba_stats_game_rosters",
      "load_wnba_stats_lineups", "load_wnba_stats_officials", "load_wnba_stats_pbp",
      "load_wnba_stats_player_game_logs", "load_wnba_stats_player_stats",
      "load_wnba_stats_possessions", "load_wnba_stats_rosters", "load_wnba_stats_schedule",
      "load_wnba_stats_shots", "load_wnba_stats_standings", "load_wnba_stats_team_stats")
  ),
  load_ncaa_wbb.R = list(
    c("load_ncaa_wbb_lineups", "load_ncaa_wbb_matchup_stints", "load_ncaa_wbb_pbp",
      "load_ncaa_wbb_player_box", "load_ncaa_wbb_possessions", "load_ncaa_wbb_rapm",
      "load_ncaa_wbb_rapm_within_team", "load_ncaa_wbb_rosters", "load_ncaa_wbb_schedule",
      "load_ncaa_wbb_shots", "load_ncaa_wbb_team_box", "load_ncaa_wbb_team_ids",
      "load_ncaa_wbb_team_rosters")
  )
)

## ---- transform one file for its family list ----
process_family_file <- function(fname, fam_list, dry_run = FALSE) {
  r_path <- file.path("R", fname)
  if (!file.exists(r_path)) {
    cat(sprintf("SKIP %s: file not found\n", fname)); return(invisible(NULL))
  }
  lines <- readLines(r_path, warn = FALSE)
  n_saved <- 0L

  for (fam in fam_list) {
    primary <- fam[1]
    others  <- fam[-1]

    for (member in others) {
      blocks <- doc_blocks(lines)
      matched <- FALSE
      for (b in blocks) {
        bstart <- b[1]; bend <- b[2]
        bl <- lines[bstart:bend]
        rn <- block_rdname(bl, lines, bend)
        if (is.na(rn) || rn != member) next

        ## classify: tiny stub block (followed by NULL) vs main block
        nxt <- bend + 1L
        while (nxt <= length(lines) && !nzchar(trimws(lines[nxt]))) nxt <- nxt + 1L
        is_stub <- nxt <= length(lines) && trimws(lines[nxt]) == "NULL"

        if (is_stub) {
          ## delete the stub block AND the following NULL line (+ any
          ## blank lines strictly between them, which is none in this
          ## repo's pattern, plus trailing blank lines already left as-is)
          del_end <- nxt
          lines[bstart:del_end] <- NA_character_
          matched <- TRUE
        } else {
          rdname_ln <- grep(paste0("^#'\\s*@rdname\\s+", member, "\\s*$"), bl, perl = TRUE)
          name_ln   <- grep(paste0("^#'\\s*@name\\s+", member, "\\s*$"), bl, perl = TRUE)
          if (length(rdname_ln) == 1L) {
            abs_ln <- bstart + rdname_ln[1] - 1L
            lines[abs_ln] <- sub(paste0("@rdname\\s+", member, "\\s*$"),
                                  paste0("@rdname ", primary), lines[abs_ln], perl = TRUE)
          } else if (length(name_ln) == 1L) {
            abs_ln <- bstart + name_ln[1] - 1L
            lines[abs_ln] <- sub(paste0("@name\\s+", member, "\\s*$"),
                                  paste0("@rdname ", primary), lines[abs_ln], perl = TRUE)
          } else if (length(rdname_ln) == 0L && length(name_ln) == 0L) {
            ## no explicit @rdname/@name tag at all (roxygen2's own
            ## function-name fallback was in play). Insert one right before
            ## the block's FIRST real @tag line -- NOT at the block's
            ## absolute start, which would swallow any leading title-prose
            ## line into the new tag and silently drop the @export/@title
            ## parse (verified: doing this wrong produced "Undocumented
            ## code objects" in R CMD check).
            first_tag <- grep("^#'\\s*@\\S", bl, perl = TRUE)
            insert_at <- if (length(first_tag) > 0) bstart + first_tag[1] - 1L else bend + 1L
            lines <- append(lines, paste0("#' @rdname ", primary), after = insert_at - 1L)
          } else {
            stop(sprintf("%s: ambiguous @rdname/@name match for member '%s'", fname, member))
          }
          matched <- TRUE
        }
      }
      if (!matched) {
        stop(sprintf("%s: member '%s' -- no matching doc block found (0 of 2 expected hits)", fname, member))
      }
      ## re-derive line indices since we may have blanked lines (NA marks deletion,
      ## applied at the end) -- doc_blocks() on the NA-containing vector below would
      ## break, so purge NAs after each member's full pass, not mid-loop.
      keep <- !is.na(lines)
      lines <- lines[keep]
    }
    n_saved <- n_saved + length(others)
  }

  cat(sprintf("%s%s: %d topic(s) merged away (%d page(s) saved)\n",
              if (dry_run) "[dry-run] " else "", fname, n_saved, n_saved))
  if (!dry_run) writeLines(lines, r_path)
  n_saved
}

main <- function() {
  total <- 0L
  for (fname in names(families)) {
    total <- total + process_family_file(fname, families[[fname]], dry_run = dry_run)
  }
  cat(sprintf("\n%sTotal pages saved: %d\n", if (dry_run) "[dry-run] " else "", total))
}

if (sys.nframe() == 0) main()

## probe_hustle_deprecated.R
## --------------------------
## Probe whether the 6 hustle-family endpoints that are currently deprecated
## via `lifecycle::deprecate_stop()` in wehoop have started returning data
## again. Bypasses each wrapper's deprecation shim by calling
## `request_with_proxy()` directly with WNBA `LeagueID = "10"` and a current
## game_id. Reports per-endpoint result-set names + row/col counts.
##
## Covers: leaguehustlestatsplayer, leaguehustlestatsteam,
## leaguehustlestatsplayerleaders, leaguehustlestatsteamleaders,
## hustlestatsboxscore, boxscorehustlev2.
##
## Update `game_id` and `season` constants for the current season before
## running.
##
## Run from package root:
##   Rscript tools/probes/probe_hustle_deprecated.R
options(warn = 1)
suppressPackageStartupMessages(devtools::load_all(quiet = TRUE))

# 2026 WNBA finals from 2026-05-15
game_id <- "1022600021"  # CON vs LVA
season  <- "2025-26"     # WNBA seasons render as "YYYY-YY"

# Helper: hit an endpoint via the package's request_with_proxy and report shape
probe <- function(label, endpoint, params, peek_cols = TRUE) {
  cat("\n=== ", label, " (", endpoint, ") ===\n", sep = "")
  cat("Params: ", paste(names(params), unlist(params), sep="=", collapse="; "), "\n", sep="")
  url <- paste0("https://stats.wnba.com/stats/", endpoint)
  out <- tryCatch(
    {
      resp <- wehoop:::request_with_proxy(url = url, params = params)
      sets <- resp$resultSets
      if (is.null(sets) || length(sets) == 0) {
        cat("  -> NO resultSets in response\n")
        return(invisible(NULL))
      }
      for (i in seq_along(sets)) {
        nm <- sets[[i]]$name %||% paste0("set_", i)
        rs <- sets[[i]]$rowSet
        nrows <- if (is.null(rs)) 0 else nrow(rs) %||% length(rs)
        hdrs <- sets[[i]]$headers %||% character(0)
        cat(sprintf("  resultSet[%d] '%s': %d rows, %d cols\n",
                    i, nm, nrows, length(hdrs)))
        if (peek_cols && length(hdrs)) {
          cat("    headers: ", paste(head(hdrs, 12), collapse=", "),
              if (length(hdrs) > 12) ", ..." else "", "\n", sep = "")
        }
      }
      sets
    },
    error = function(e) {
      cat("  -> ERROR: ", conditionMessage(e), "\n", sep = "")
      NULL
    }
  )
  invisible(out)
}

`%||%` <- function(a, b) if (is.null(a)) b else a

cat("Probing 6 deprecated wehoop hustle endpoints with game_id=", game_id,
    " season=", season, "\n", sep="")

## --- 4 league-wide hustle endpoints -------------------------------------
common_params <- list(
  College = "", Conference = "", Country = "",
  DateFrom = "", DateTo = "", Division = "",
  DraftPick = "", DraftYear = "",
  Height = "", LastNGames = 0, LeagueID = "10",
  Location = "", Month = 0, OpponentTeamID = 0,
  Outcome = "", PORound = "", PerMode = "Totals",
  PlayerExperience = "", PlayerPosition = "",
  Season = season, SeasonSegment = "", SeasonType = "Regular Season",
  TeamID = "", VsConference = "", VsDivision = "", Weight = ""
)

probe("leaguehustlestatsplayer", "leaguehustlestatsplayer", common_params)

probe("leaguehustlestatsteam",   "leaguehustlestatsteam",   common_params)

leader_params <- modifyList(common_params, list(
  PlayerOrTeam   = "Player",
  PlayerScope    = "All Players",
  GameScope      = "Season",
  StatCategory   = "Deflections"
))
probe("leaguehustlestatsplayerleaders",
      "leaguehustlestatsplayerleaders", leader_params)

team_leader_params <- modifyList(common_params, list(
  PlayerOrTeam   = "Team",
  GameScope      = "Season",
  StatCategory   = "Deflections"
))
probe("leaguehustlestatsteamleaders",
      "leaguehustlestatsteamleaders", team_leader_params)

## --- 2 boxscore-style hustle endpoints (game-keyed; no LeagueID) ---------
probe("hustlestatsboxscore", "hustlestatsboxscore",
      list(GameID = wehoop:::pad_id(game_id)))

probe("boxscorehustlev2", "boxscorehustlev2",
      list(
        GameID        = wehoop:::pad_id(game_id),
        StartPeriod   = 1, EndPeriod = 10,
        StartRange    = 0, EndRange  = 28800,
        RangeType     = 0
      ))

cat("\nDone.\n")

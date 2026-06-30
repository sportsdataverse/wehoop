## ---------------------------------------------------------------------------
## wnba_tracking.R — multi-season tracking aggregation
##
## Mirror of hoopR/R/nba_tracking.R (Phase 6d) for the WNBA.
## Engine helpers (.aggregate_tracking_frames, .is_numeric_content,
## TRACKING_ENTITY_KEYS, column classifiers) are byte-identical to hoopR
## @55247fd3 — the aggregation logic is league-agnostic.
## Only the public function name and the fetch path differ:
##   - nba_tracking_aggregate  → wnba_tracking_aggregate
##   - nba_leaguedashptstats   → .wnba_fetch_ptstats (inline, uses
##                               wnba_endpoint() + request_with_proxy() +
##                               wnba_stats_map_result_sets(), LeagueID="10")
##
## All columns returned by leaguedashptstats / wnba_stats_map_result_sets
## are character strings. Column classification is therefore name-pattern
## driven, NOT R-type driven.
## ---------------------------------------------------------------------------

#' @keywords internal
#' Entity-key lookup: player_or_team string → column name
TRACKING_ENTITY_KEYS <- c(Player = "PLAYER_ID", Team = "TEAM_ID")

## ---------------------------------------------------------------------------
##  Column classifiers (name-pattern helpers)
## ---------------------------------------------------------------------------

.is_id_col <- function(col) {
  grepl("_ID$", col, ignore.case = FALSE) || col %in% unname(TRACKING_ENTITY_KEYS)
}

.is_name_col <- function(col) {
  grepl("_NAME$|_ABBREVIATION$", col, ignore.case = FALSE)
}

.is_fg_pct_col <- function(col) {
  grepl("_FG_PCT$", col, ignore.case = FALSE)
}

.is_ft_pct_col <- function(col) {
  grepl("_FT_PCT$", col, ignore.case = FALSE)
}

.is_other_pct_col <- function(col) {
  grepl("_PCT$", col, ignore.case = FALSE) &&
    !.is_fg_pct_col(col) &&
    !.is_ft_pct_col(col)
}

.is_identity_col <- function(col) {
  .is_id_col(col) || .is_name_col(col)
}

## Numeric-content gate: mirror Python's `dtype.is_numeric()` rule, adapted to
## R's all-character frames. A residual column (one that did NOT match the
## id / name / *_pct patterns) is ADDITIVE only when its non-empty values all
## parse as numeric; otherwise it is a non-numeric string column (e.g.
## `TEAM_CITY = "Las Vegas"`) and must be carried via first() — NOT summed
## into a silent 0. An all-empty column is treated as identity (safe default).
.is_numeric_content <- function(vals) {
  v <- vals[!is.na(vals) & vals != ""]
  if (length(v) == 0L) return(FALSE)
  suppressWarnings(all(!is.na(as.numeric(v))))
}

## ---------------------------------------------------------------------------
##  .aggregate_tracking_frames — internal workhorse
## ---------------------------------------------------------------------------

#' @noRd
.aggregate_tracking_frames <- function(frames, entity_key) {
  ## Never-raise: empty list or list of 0-row frames → 0-row frame
  if (length(frames) == 0L) {
    return(data.frame())
  }

  ## Drop NULL / 0-row frames, but keep going if some are non-empty
  frames <- Filter(function(f) !is.null(f) && nrow(f) > 0L, frames)
  if (length(frames) == 0L) {
    return(data.frame())
  }

  ## Stack all frames
  combined <- dplyr::bind_rows(frames)

  if (nrow(combined) == 0L) {
    return(combined)
  }

  all_cols <- colnames(combined)

  ## Classify every column.  Pattern guards run FIRST (id / name / fg_pct /
  ## ft_pct / other-pct), so a numeric-looking id (PLAYER_ID = "1001") is
  ## routed to identity and is never summed (the id-not-summed keystone).
  pattern_identity <- all_cols[vapply(all_cols, .is_identity_col,  logical(1L))]
  fg_pct_cols      <- all_cols[vapply(all_cols, .is_fg_pct_col,    logical(1L))]
  ft_pct_cols      <- all_cols[vapply(all_cols, .is_ft_pct_col,    logical(1L))]
  drop_pct_cols    <- all_cols[vapply(all_cols, .is_other_pct_col, logical(1L))]

  ## Residual columns (matched none of the above patterns) are split by the
  ## NUMERIC-CONTENT gate, mirroring Python's `dtype.is_numeric()` rule:
  ## numeric content -> additive; non-numeric string content (e.g. TEAM_CITY)
  ## -> identity, carried via first() and never silently summed to 0.
  residual_cols <- setdiff(
    all_cols,
    c(pattern_identity, fg_pct_cols, ft_pct_cols, drop_pct_cols)
  )
  residual_numeric <- vapply(
    residual_cols,
    function(col) .is_numeric_content(combined[[col]]),
    logical(1L)
  )
  additive_cols <- residual_cols[residual_numeric]
  identity_cols <- c(pattern_identity, residual_cols[!residual_numeric])

  ## Coerce additive columns to numeric (they come as character from the API)
  for (col in additive_cols) {
    combined[[col]] <- suppressWarnings(as.numeric(combined[[col]]))
  }
  ## Also coerce FGM/FGA, FTM/FTA numerics for pct recomputation
  ## (needed even though they are in identity_cols for prefix matching below)

  ## ── Build summarise expressions ──────────────────────────────────────────

  ## 1. Additive: sum per entity (NA as 0 for counting columns)
  sum_exprs <- lapply(setNames(additive_cols, additive_cols), function(col) {
    rlang::expr(sum(as.numeric(.data[[!!col]]), na.rm = TRUE))
  })

  ## 2. Identity: first per entity
  identity_exprs <- lapply(setNames(identity_cols, identity_cols), function(col) {
    rlang::expr(dplyr::first(.data[[!!col]]))
  })

  ## 3. FG_PCT recompute: derive prefix → look up FGM/FGA among additive cols
  ##    DRIVE_FG_PCT ← DRIVE_FGM / DRIVE_FGA, etc.
  ##    Guard (never-raise): only recompute when BOTH the makes and attempts
  ##    columns exist; otherwise DROP the _fg_pct col (a measure whose pct
  ##    lacks a makes/attempts pair would crash summarise with Column not found).
  fg_pct_recompute <- fg_pct_cols[vapply(fg_pct_cols, function(pct_col) {
    prefix <- sub("_FG_PCT$", "", pct_col)
    all(c(paste0(prefix, "_FGM"), paste0(prefix, "_FGA")) %in% all_cols)
  }, logical(1L))]
  fg_pct_exprs <- lapply(setNames(fg_pct_recompute, fg_pct_recompute), function(pct_col) {
    prefix <- sub("_FG_PCT$", "", pct_col)          # e.g. "DRIVE"
    fgm    <- paste0(prefix, "_FGM")
    fga    <- paste0(prefix, "_FGA")
    rlang::expr(
      dplyr::if_else(
        sum(as.numeric(.data[[!!fga]]), na.rm = TRUE) == 0,
        NA_real_,
        sum(as.numeric(.data[[!!fgm]]), na.rm = TRUE) /
          sum(as.numeric(.data[[!!fga]]), na.rm = TRUE)
      )
    )
  })

  ## 4. FT_PCT recompute (same never-raise guard as FG_PCT above)
  ft_pct_recompute <- ft_pct_cols[vapply(ft_pct_cols, function(pct_col) {
    prefix <- sub("_FT_PCT$", "", pct_col)
    all(c(paste0(prefix, "_FTM"), paste0(prefix, "_FTA")) %in% all_cols)
  }, logical(1L))]
  ft_pct_exprs <- lapply(setNames(ft_pct_recompute, ft_pct_recompute), function(pct_col) {
    prefix <- sub("_FT_PCT$", "", pct_col)
    ftm    <- paste0(prefix, "_FTM")
    fta    <- paste0(prefix, "_FTA")
    rlang::expr(
      dplyr::if_else(
        sum(as.numeric(.data[[!!fta]]), na.rm = TRUE) == 0,
        NA_real_,
        sum(as.numeric(.data[[!!ftm]]), na.rm = TRUE) /
          sum(as.numeric(.data[[!!fta]]), na.rm = TRUE)
      )
    )
  })

  ## 5. drop_pct_cols — omitted from output (not included in any expr list)

  ## ── Combine all expressions and summarise ────────────────────────────────
  all_exprs <- c(identity_exprs, sum_exprs, fg_pct_exprs, ft_pct_exprs)

  out <- combined |>
    dplyr::group_by(.data[[entity_key]]) |>
    dplyr::summarise(!!!all_exprs, .groups = "drop")

  out
}

## ---------------------------------------------------------------------------
##  .wnba_fetch_ptstats — internal fetch helper (WNBA-specific)
##
##  Fetches one leaguedashptstats frame from stats.wnba.com using the
##  standard wehoop pattern:
##    wnba_endpoint("leaguedashptstats")
##    → request_with_proxy(url, params)
##    → wnba_stats_map_result_sets(resp)[[1L]]
##
##  LeagueID is always "10" (WNBA).  Standard empty-string filter params
##  mirror the convention used by all wehoop leaguedash* wrappers.
## ---------------------------------------------------------------------------

#' @noRd
.wnba_fetch_ptstats <- function(season,
                                season_type     = "Regular Season",
                                per_mode        = "Totals",
                                pt_measure_type = "Drives",
                                player_or_team  = "Player",
                                ...) {
  version  <- "leaguedashptstats"
  full_url <- wnba_endpoint(version)

  params <- list(
    College         = "",
    Conference      = "",
    Country         = "",
    DateFrom        = "",
    DateTo          = "",
    Division        = "",
    GameScope       = "",
    GameSegment     = "",
    Height          = "",
    LastNGames      = 0,
    LeagueID        = "10",
    Location        = "",
    Month           = 0,
    OpponentTeamID  = 0,
    Outcome         = "",
    PORound         = "",
    PaceAdjust      = "N",
    PerMode         = per_mode,
    Period          = 0,
    PlayerExperience = "",
    PlayerOrTeam    = player_or_team,
    PlayerPosition  = "",
    PlusMinus       = "N",
    PtMeasureType   = pt_measure_type,
    Rank            = "N",
    Season          = season,
    SeasonSegment   = "",
    SeasonType      = season_type,
    StarterBench    = "",
    TeamID          = "",
    VsConference    = "",
    VsDivision      = "",
    Weight          = ""
  )

  df_list <- list()
  tryCatch(
    expr = {
      resp    <- request_with_proxy(url = full_url, params = params, ...)
      df_list <- wnba_stats_map_result_sets(resp)
    },
    error   = function(e) {
      message(sprintf(
        "[wnba_tracking_aggregate] fetch error season=%s type=%s: %s",
        season, season_type, conditionMessage(e)
      ))
    },
    warning = function(w) {
      message(sprintf(
        "[wnba_tracking_aggregate] fetch warning season=%s type=%s: %s",
        season, season_type, conditionMessage(w)
      ))
    }
  )
  df_list
}

## ---------------------------------------------------------------------------
##  wnba_tracking_aggregate — public API
## ---------------------------------------------------------------------------

#' @name wnba_tracking_aggregate
NULL

#' **Aggregate WNBA Player-Tracking Stats Across Multiple Seasons**
#' @rdname wnba_tracking_aggregate
#' @title **Aggregate WNBA Player-Tracking Stats Across Multiple Seasons**
#' @author Saiem Gilani
#'
#' @description
#' Fetches `leaguedashptstats` dashboards for each combination of `seasons`
#' and `season_types`, then aggregates the results by entity
#' (`PLAYER_ID` for Player, `TEAM_ID` for Team) following the contract
#' ported from `sportsdataverse-py`'s `aggregate_tracking_frames`:
#'
#' - **Identity columns** (`*_ID`, `*_NAME`, `*_ABBREVIATION`, and any other
#'   non-numeric string column such as `TEAM_CITY`) are carried via `first()`
#'   — never summed.
#' - **`*_FG_PCT` / `*_FT_PCT`** are recomputed from the summed FGM/FGA and
#'   FTM/FTA denominators (denom 0 → `NA`); a `*_FG_PCT` / `*_FT_PCT` column
#'   whose makes/attempts pair is absent is dropped rather than recomputed.
#' - **Other `*_PCT` columns** (e.g., `DRIVE_PTS_PCT` — "% of total" rates)
#'   are **dropped** from the output because they are not additive.
#' - **All remaining numeric columns** are summed (numeric-content gate,
#'   mirroring the `sportsdataverse-py` `dtype.is_numeric()` rule).
#'
#' @param seasons Numeric or character vector of WNBA season years, e.g.
#'   `c(2023, 2024)`.
#' @param season_types Character vector of season type(s), e.g.
#'   `"Regular Season"` or `c("Regular Season", "Playoffs")`.
#'   Defaults to `"Regular Season"`.
#' @param per_mode Per-mode string passed to `leaguedashptstats`
#'   (default `"Totals"`). Use `"Totals"` for aggregation; per-game
#'   averages are not meaningfully additive.
#' @param pt_measure_type Tracking measure type string, e.g. `"Drives"`,
#'   `"SpeedDistance"`, `"Passing"`. Passed directly to the endpoint.
#'   Default `"Drives"`.
#' @param player_or_team `"Player"` (default) or `"Team"`. Determines the
#'   entity key used to group aggregation (`PLAYER_ID` or `TEAM_ID`).
#' @param ... Additional arguments forwarded to the fetch helper
#'   (e.g., `proxy`).
#'
#' @return A `data.frame` (tibble-compatible) with one row per entity
#'   (`PLAYER_ID` or `TEAM_ID`).  Count columns are summed across all
#'   requested seasons/season types; `*_FG_PCT` and `*_FT_PCT` are
#'   recomputed from summed numerators/denominators; `*_PCT` "% of total"
#'   columns are dropped; identity string columns are carried from the
#'   first season.  Returns a 0-row frame when no data are available.
#'
#' @note Designed and validated for COUNT-based tracking measures (e.g.
#'   `"Drives"`). Rate-only columns without a `_pct` suffix in some
#'   `pt_measure_type` values are summed across seasons (a known limitation
#'   shared with the `sportsdataverse` reference engine); verify aggregation
#'   semantics before using rate-heavy measures.
#'
#' @importFrom dplyr bind_rows group_by summarise first if_else
#' @importFrom rlang .data expr
#' @export
#' @family WNBA Player Tracking Functions
#' @details
#' ```r
#'  wnba_tracking_aggregate(seasons = c(2023, 2024),
#'                          pt_measure_type = "Drives",
#'                          player_or_team  = "Player")
#' ```
#' @examples
#' \donttest{
#'   try({
#'     df <- wnba_tracking_aggregate(
#'       seasons = c(2023, 2024),
#'       pt_measure_type = "Drives",
#'       player_or_team  = "Player"
#'     )
#'     print(df[1:5, c("PLAYER_ID", "PLAYER_NAME", "DRIVES", "DRIVE_FG_PCT")])
#'   })
#' }
wnba_tracking_aggregate <- function(
    seasons,
    season_types    = "Regular Season",
    per_mode        = "Totals",
    pt_measure_type = "Drives",
    player_or_team  = "Player",
    ...) {

  entity_key <- TRACKING_ENTITY_KEYS[[player_or_team]]
  if (is.null(entity_key)) {
    stop("`player_or_team` must be \"Player\" or \"Team\"")
  }

  ## Fetch one frame per (season × season_type)
  frames <- list()
  for (season in seasons) {
    for (season_type in season_types) {
      raw <- tryCatch(
        .wnba_fetch_ptstats(
          season          = season,
          season_type     = season_type,
          per_mode        = per_mode,
          pt_measure_type = pt_measure_type,
          player_or_team  = player_or_team,
          ...
        ),
        error = function(e) {
          message(sprintf("[wnba_tracking_aggregate] Skipping %s / %s: %s",
                          season, season_type, conditionMessage(e)))
          NULL
        }
      )
      if (!is.null(raw) && length(raw) > 0L) {
        frames <- c(frames, list(raw[[1L]]))
      }
    }
  }

  .aggregate_tracking_frames(frames, entity_key)
}

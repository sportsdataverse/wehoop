# espn_basketball_athlete_helpers.R
# Internal helpers shared by WBB and WNBA athlete endpoint wrappers.
# Each helper accepts league = "wnba" or league = "womens-college-basketball".
# None of these functions are exported.

# ---------------------------------------------------------------------------
# .espn_basketball_athlete_info  (2.1)
# site-v2 /athletes/{athlete_id}
# Returns named list: Bio, Team, Position, Status, College, Draft
# ---------------------------------------------------------------------------

#' Internal: ESPN basketball athlete info
#'
#' Fetches
#' `site.api.espn.com/apis/site/v2/sports/basketball/{league}/athletes/{athlete_id}`
#' and returns a named list of tibbles: `Bio`, `Team`, `Position`, `Status`,
#' `College`, `Draft`.
#'
#' @param league character. `"wnba"` or `"womens-college-basketball"`.
#' @param athlete_id character or numeric. ESPN athlete identifier.
#' @param ... Unused; absorbed for forward compatibility.
#' @return Named list of data frames.
#' @keywords internal
.espn_basketball_athlete_info <- function(league, athlete_id, ...) {
  .espn_bball_validate_league(league)
  .args <- list(league = league, athlete_id = athlete_id)

  result <- list()

  url <- paste0(
    "https://site.api.espn.com/apis/site/v2/sports/basketball/",
    league,
    "/athletes/",
    athlete_id
  )

  tryCatch(
    expr = {
      res <- .retry_request(url)
      check_status(res)
      raw <- res %>% .resp_text() %>% jsonlite::fromJSON(simplifyDataFrame = TRUE)

      ath <- raw[["athlete"]] %||% raw

      # ---------- Bio ----------
      bio_keep <- c(
        "id", "uid", "guid", "firstName", "lastName", "fullName",
        "displayName", "shortName", "weight", "displayWeight",
        "height", "displayHeight", "age", "dateOfBirth",
        "debutYear", "jersey", "active"
      )
      bio_data <- ath[intersect(bio_keep, names(ath))]
      if (!is.null(ath[["headshot"]]) && is.data.frame(ath[["headshot"]])) {
        bio_data[["headshot_href"]] <- ath[["headshot"]][["href"]][[1]] %||% NA_character_
      }
      if (!is.null(ath[["birthPlace"]]) && is.data.frame(ath[["birthPlace"]])) {
        bp <- ath[["birthPlace"]]
        bio_data[["birth_city"]]    <- bp[["city"]][[1]] %||% NA_character_
        bio_data[["birth_state"]]   <- bp[["state"]][[1]] %||% NA_character_
        bio_data[["birth_country"]] <- bp[["country"]][[1]] %||% NA_character_
      }
      result[["Bio"]] <- data.frame(bio_data, stringsAsFactors = FALSE) %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete Bio from ESPN.com"),
          Sys.time()
        )

      # ---------- Team ----------
      team_df <- data.frame(stringsAsFactors = FALSE)
      if (!is.null(ath[["team"]]) && is.data.frame(ath[["team"]])) {
        t_obj <- ath[["team"]]
        team_keep <- c("id", "uid", "slug", "abbreviation", "displayName",
                       "shortDisplayName", "name", "location", "color")
        team_data <- t_obj[intersect(team_keep, colnames(t_obj))]
        team_df <- data.frame(team_data, stringsAsFactors = FALSE)
      }
      result[["Team"]] <- team_df %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete Team from ESPN.com"),
          Sys.time()
        )

      # ---------- Position ----------
      pos_df <- data.frame(stringsAsFactors = FALSE)
      if (!is.null(ath[["position"]]) && is.data.frame(ath[["position"]])) {
        p_obj <- ath[["position"]]
        pos_keep <- c("id", "name", "displayName", "abbreviation", "leaf")
        pos_data <- p_obj[intersect(pos_keep, colnames(p_obj))]
        pos_df <- data.frame(pos_data, stringsAsFactors = FALSE)
      }
      result[["Position"]] <- pos_df %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete Position from ESPN.com"),
          Sys.time()
        )

      # ---------- Status ----------
      status_df <- data.frame(stringsAsFactors = FALSE)
      if (!is.null(ath[["status"]]) && is.data.frame(ath[["status"]])) {
        s_obj <- ath[["status"]]
        stat_keep <- c("id", "name", "type", "abbreviation")
        stat_data <- s_obj[intersect(stat_keep, colnames(s_obj))]
        status_df <- data.frame(stat_data, stringsAsFactors = FALSE)
      }
      result[["Status"]] <- status_df %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete Status from ESPN.com"),
          Sys.time()
        )

      # ---------- College ----------
      college_df <- data.frame(stringsAsFactors = FALSE)
      if (!is.null(ath[["college"]]) && is.data.frame(ath[["college"]])) {
        c_obj <- ath[["college"]]
        coll_keep <- c("id", "mascot", "name", "shortName", "abbrev")
        coll_data <- c_obj[intersect(coll_keep, colnames(c_obj))]
        college_df <- data.frame(coll_data, stringsAsFactors = FALSE)
      }
      result[["College"]] <- college_df %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete College from ESPN.com"),
          Sys.time()
        )

      # ---------- Draft ----------
      draft_df <- data.frame(stringsAsFactors = FALSE)
      if (!is.null(ath[["draft"]]) && is.list(ath[["draft"]])) {
        d_obj <- ath[["draft"]]
        draft_df <- data.frame(
          year          = as.character(d_obj[["year"]] %||% NA_character_),
          round         = as.character(d_obj[["round"]] %||% NA_character_),
          selection     = as.character(d_obj[["selection"]] %||% NA_character_),
          stringsAsFactors = FALSE
        )
      }
      result[["Draft"]] <- draft_df %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete Draft from ESPN.com"),
          Sys.time()
        )
    },
    error = function(e) .report_api_error(
      e,
      hint = paste0("Failed to retrieve ESPN ", league,
                    " athlete info for athlete_id=", athlete_id),
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = paste0("Warning retrieving ESPN ", league,
                    " athlete info for athlete_id=", athlete_id),
      args = .args
    ),
    finally = {}
  )
  return(result)
}

# ---------------------------------------------------------------------------
# .espn_basketball_athlete_overview  (2.2)
# web-common-v3 /athletes/{athlete_id}/overview?season={year}
# Returns named list: Statistics, NextGame, Last5Games, Headlines, FantasyOutlook
# ---------------------------------------------------------------------------

#' Internal: ESPN basketball athlete overview
#'
#' Fetches
#' `site.web.api.espn.com/apis/common/v3/sports/basketball/{league}/athletes/{athlete_id}/overview`
#' and returns a named list of tibbles.
#'
#' @param league character.
#' @param athlete_id character or numeric.
#' @param season numeric. Season year.
#' @param ... Unused.
#' @return Named list of data frames.
#' @keywords internal
.espn_basketball_athlete_overview <- function(league, athlete_id, season, ...) {
  .espn_bball_validate_league(league)
  .args <- list(league = league, athlete_id = athlete_id, season = season)

  result <- list()

  url <- paste0(
    "https://site.web.api.espn.com/apis/common/v3/sports/basketball/",
    league,
    "/athletes/",
    athlete_id,
    "/overview?season=",
    season
  )

  tryCatch(
    expr = {
      res <- .retry_request(url)
      check_status(res)
      raw <- res %>% .resp_text() %>% jsonlite::fromJSON(simplifyDataFrame = TRUE)

      # ---------- Statistics ----------
      stats_df <- data.frame(stringsAsFactors = FALSE)
      stat_raw <- raw[["statistics"]] %||% raw[["stats"]]
      if (!is.null(stat_raw) && is.data.frame(stat_raw) && nrow(stat_raw) > 0) {
        stats_df <- stat_raw %>%
          data.frame(stringsAsFactors = FALSE)
      }
      result[["Statistics"]] <- stats_df %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete Overview Statistics from ESPN.com"),
          Sys.time()
        )

      # ---------- NextGame ----------
      next_df <- data.frame(stringsAsFactors = FALSE)
      ng_raw <- raw[["nextOpponent"]] %||% raw[["nextGame"]] %||% raw[["nextEvent"]]
      if (!is.null(ng_raw) && is.data.frame(ng_raw) && nrow(ng_raw) > 0) {
        ng_keep <- c("id", "date", "name", "shortName")
        ng_data <- ng_raw[intersect(ng_keep, colnames(ng_raw))]
        next_df <- data.frame(ng_data, stringsAsFactors = FALSE)
      } else if (!is.null(ng_raw) && is.list(ng_raw)) {
        next_df <- data.frame(
          id         = as.character(ng_raw[["id"]] %||% NA_character_),
          date       = as.character(ng_raw[["date"]] %||% NA_character_),
          name       = as.character(ng_raw[["name"]] %||% NA_character_),
          short_name = as.character(ng_raw[["shortName"]] %||% NA_character_),
          stringsAsFactors = FALSE
        )
      }
      result[["NextGame"]] <- next_df %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete Overview NextGame from ESPN.com"),
          Sys.time()
        )

      # ---------- Last5Games ----------
      last5_df <- data.frame(stringsAsFactors = FALSE)
      l5_raw <- raw[["last5Games"]] %||% raw[["recentGames"]] %||% raw[["gameLog"]]
      if (!is.null(l5_raw) && is.data.frame(l5_raw) && nrow(l5_raw) > 0) {
        last5_df <- l5_raw %>% data.frame(stringsAsFactors = FALSE)
      }
      result[["Last5Games"]] <- last5_df %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete Overview Last5Games from ESPN.com"),
          Sys.time()
        )

      # ---------- Headlines ----------
      hdl_df <- data.frame(stringsAsFactors = FALSE)
      hdl_raw <- raw[["news"]] %||% raw[["headlines"]] %||% raw[["articles"]]
      if (!is.null(hdl_raw) && is.data.frame(hdl_raw) && nrow(hdl_raw) > 0) {
        hdl_keep <- c("headline", "description", "published", "byline", "type")
        hdl_df <- hdl_raw %>%
          dplyr::select(dplyr::any_of(hdl_keep)) %>%
          data.frame(stringsAsFactors = FALSE)
      }
      result[["Headlines"]] <- hdl_df %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete Overview Headlines from ESPN.com"),
          Sys.time()
        )

      # ---------- FantasyOutlook ----------
      fant_df <- data.frame(stringsAsFactors = FALSE)
      fo_raw <- raw[["fantasyOutlook"]] %||% raw[["fantasy"]]
      if (!is.null(fo_raw) && is.data.frame(fo_raw) && nrow(fo_raw) > 0) {
        fant_df <- fo_raw %>% data.frame(stringsAsFactors = FALSE)
      } else if (!is.null(fo_raw) && is.list(fo_raw)) {
        fant_df <- data.frame(
          outlook = as.character(fo_raw[["outlook"]] %||% NA_character_),
          stringsAsFactors = FALSE
        )
      }
      result[["FantasyOutlook"]] <- fant_df %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete Overview FantasyOutlook from ESPN.com"),
          Sys.time()
        )
    },
    error = function(e) .report_api_error(
      e,
      hint = paste0("Failed to retrieve ESPN ", league,
                    " athlete overview for athlete_id=", athlete_id,
                    ", season=", season),
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = paste0("Warning retrieving ESPN ", league,
                    " athlete overview for athlete_id=", athlete_id),
      args = .args
    ),
    finally = {}
  )
  return(result)
}

# ---------------------------------------------------------------------------
# .espn_basketball_athlete_stats  (2.3)
# web-common-v3 /athletes/{athlete_id}/stats?season={year}
# Returns named list per category: General, Offensive, Defensive, Rebounding,
#   Shooting, Misc
# ---------------------------------------------------------------------------

#' Internal: ESPN basketball athlete stats
#'
#' Fetches
#' `site.web.api.espn.com/apis/common/v3/sports/basketball/{league}/athletes/{athlete_id}/stats`
#' and returns a named list of per-category tibbles.
#'
#' @param league character.
#' @param athlete_id character or numeric.
#' @param season numeric.
#' @param ... Unused.
#' @return Named list of data frames, one per stats category.
#' @keywords internal
.espn_basketball_athlete_stats <- function(league, athlete_id, season, ...) {
  .espn_bball_validate_league(league)
  .args <- list(league = league, athlete_id = athlete_id, season = season)

  result <- list()

  url <- paste0(
    "https://site.web.api.espn.com/apis/common/v3/sports/basketball/",
    league,
    "/athletes/",
    athlete_id,
    "/stats?season=",
    season
  )

  tryCatch(
    expr = {
      res <- .retry_request(url)
      check_status(res)
      raw <- res %>% .resp_text() %>% jsonlite::fromJSON(simplifyDataFrame = TRUE)

      categories_raw <- raw[["categories"]] %||% raw[["statCategories"]]

      # Category name mapping: we expect up to 6 categories from the API.
      # If categories is absent or empty, return list with 6 empty tibbles.
      default_cats <- c("General", "Offensive", "Defensive",
                        "Rebounding", "Shooting", "Misc")

      empty_tbl <- data.frame(stringsAsFactors = FALSE) %>%
        dplyr::as_tibble() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Athlete Stats from ESPN.com"),
          Sys.time()
        )

      if (is.null(categories_raw) ||
          (!is.data.frame(categories_raw) && !is.list(categories_raw))) {
        for (cat_name in default_cats) result[[cat_name]] <- empty_tbl
        return(result)
      }

      # categories_raw may be a data frame (one row per category) or a list
      n_cats <- if (is.data.frame(categories_raw)) nrow(categories_raw)
                else length(categories_raw)

      for (i in seq_len(n_cats)) {
        cat_row <- if (is.data.frame(categories_raw)) {
          categories_raw[i, , drop = FALSE]
        } else {
          categories_raw[[i]]
        }

        # Derive a clean category name
        cat_name_raw <- if (is.data.frame(cat_row)) {
          cat_row[["displayName"]][[1]] %||%
            cat_row[["name"]][[1]] %||%
            paste0("Category", i)
        } else {
          cat_row[["displayName"]] %||% cat_row[["name"]] %||% paste0("Category", i)
        }
        # Normalize to title-case ASCII name matching expected defaults
        cat_name <- as.character(cat_name_raw)

        # stats may be a data frame or a list element named "stats"
        stats_raw <- if (is.data.frame(cat_row)) {
          cat_row[["stats"]][[1]] %||% cat_row[["statistics"]][[1]]
        } else {
          cat_row[["stats"]] %||% cat_row[["statistics"]]
        }

        if (is.null(stats_raw) || length(stats_raw) == 0) {
          result[[cat_name]] <- empty_tbl
          next
        }

        # stats_raw can be a data frame with name/value columns,
        # or a named numeric vector
        cat_df <- tryCatch({
          if (is.data.frame(stats_raw)) {
            stats_raw %>%
              data.frame(stringsAsFactors = FALSE) %>%
              dplyr::as_tibble() %>%
              janitor::clean_names() %>%
              make_wehoop_data(
                paste0("ESPN ", toupper(league), " Athlete Stats from ESPN.com"),
                Sys.time()
              )
          } else if (is.numeric(stats_raw) || is.character(stats_raw)) {
            # Flatten named vector into two columns
            nm <- names(stats_raw)
            if (is.null(nm)) nm <- paste0("stat_", seq_along(stats_raw))
            data.frame(
              stat_name  = nm,
              stat_value = as.character(stats_raw),
              stringsAsFactors = FALSE
            ) %>%
              dplyr::as_tibble() %>%
              make_wehoop_data(
                paste0("ESPN ", toupper(league), " Athlete Stats from ESPN.com"),
                Sys.time()
              )
          } else {
            empty_tbl
          }
        }, error = function(.e) empty_tbl)

        result[[cat_name]] <- cat_df
      }

      # Ensure canonical default slots are always present
      for (cat_name in default_cats) {
        if (is.null(result[[cat_name]])) result[[cat_name]] <- empty_tbl
      }
    },
    error = function(e) .report_api_error(
      e,
      hint = paste0("Failed to retrieve ESPN ", league,
                    " athlete stats for athlete_id=", athlete_id,
                    ", season=", season),
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = paste0("Warning retrieving ESPN ", league,
                    " athlete stats for athlete_id=", athlete_id),
      args = .args
    ),
    finally = {}
  )
  return(result)
}

# ---------------------------------------------------------------------------
# .espn_basketball_athlete_gamelog  (2.4)
# web-common-v3 /athletes/{athlete_id}/gamelog?season={year}
# Returns single tibble (one row per game)
# ---------------------------------------------------------------------------

#' Internal: ESPN basketball athlete gamelog
#'
#' Fetches
#' `site.web.api.espn.com/apis/common/v3/sports/basketball/{league}/athletes/{athlete_id}/gamelog`
#' and returns a single tidy tibble (one row per game).
#'
#' @param league character.
#' @param athlete_id character or numeric.
#' @param season numeric.
#' @param ... Unused.
#' @return A tibble.
#' @keywords internal
.espn_basketball_athlete_gamelog <- function(league, athlete_id, season, ...) {
  .espn_bball_validate_league(league)
  .args <- list(league = league, athlete_id = athlete_id, season = season)

  result <- NULL

  url <- paste0(
    "https://site.web.api.espn.com/apis/common/v3/sports/basketball/",
    league,
    "/athletes/",
    athlete_id,
    "/gamelog?season=",
    season
  )

  tryCatch(
    expr = {
      res <- .retry_request(url)
      check_status(res)
      raw <- res %>% .resp_text() %>% jsonlite::fromJSON(simplifyDataFrame = TRUE)

      # The gamelog payload nests stats under events/categories.
      # Attempt to parse the flat events table first; fall back to
      # stats[[]] if the response shape differs.
      events_raw <- raw[["events"]] %||% raw[["games"]] %||% raw[["gameLog"]]
      labels_raw <- raw[["labels"]] %||% raw[["statNames"]] %||% raw[["names"]]

      if (is.null(events_raw) ||
          (!is.data.frame(events_raw) && !is.list(events_raw))) {
        result <- data.frame(stringsAsFactors = FALSE) %>% dplyr::as_tibble()
      } else {
        if (is.data.frame(events_raw) && nrow(events_raw) > 0) {
          result <- events_raw %>%
            data.frame(stringsAsFactors = FALSE) %>%
            dplyr::as_tibble() %>%
            janitor::clean_names() %>%
            make_wehoop_data(
              paste0("ESPN ", toupper(league), " Athlete Gamelog from ESPN.com"),
              Sys.time()
            )
        } else if (is.list(events_raw) && length(events_raw) > 0) {
          # Each element may be a named list with eventId + stats vector
          rows <- lapply(events_raw, function(ev) {
            event_id <- as.character(ev[["eventId"]] %||% ev[["id"]] %||% NA_character_)
            stats_v  <- ev[["stats"]] %||% ev[["values"]]
            if (!is.null(stats_v) && !is.null(labels_raw) &&
                length(labels_raw) == length(stats_v)) {
              row_vals <- as.list(as.character(stats_v))
              names(row_vals) <- as.character(labels_raw)
              row_vals[["event_id"]] <- event_id
              data.frame(row_vals, stringsAsFactors = FALSE)
            } else {
              data.frame(event_id = event_id, stringsAsFactors = FALSE)
            }
          })
          rows <- Filter(Negate(is.null), rows)
          if (length(rows) > 0) {
            result <- dplyr::bind_rows(rows) %>%
              dplyr::as_tibble() %>%
              janitor::clean_names() %>%
              make_wehoop_data(
                paste0("ESPN ", toupper(league), " Athlete Gamelog from ESPN.com"),
                Sys.time()
              )
          } else {
            result <- data.frame(stringsAsFactors = FALSE) %>% dplyr::as_tibble()
          }
        } else {
          result <- data.frame(stringsAsFactors = FALSE) %>% dplyr::as_tibble()
        }
      }
    },
    error = function(e) .report_api_error(
      e,
      hint = paste0("Failed to retrieve ESPN ", league,
                    " athlete gamelog for athlete_id=", athlete_id,
                    ", season=", season),
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = paste0("Warning retrieving ESPN ", league,
                    " athlete gamelog for athlete_id=", athlete_id),
      args = .args
    ),
    finally = {}
  )
  return(result)
}

# ---------------------------------------------------------------------------
# .espn_basketball_athlete_splits  (2.5)
# web-common-v3 /athletes/{athlete_id}/splits?season={year}
# Returns single tibble (long-format splits)
# ---------------------------------------------------------------------------

#' Internal: ESPN basketball athlete splits
#'
#' Fetches
#' `site.web.api.espn.com/apis/common/v3/sports/basketball/{league}/athletes/{athlete_id}/splits`
#' and returns a single long-format tibble.
#'
#' @param league character.
#' @param athlete_id character or numeric.
#' @param season numeric.
#' @param ... Unused.
#' @return A tibble.
#' @keywords internal
.espn_basketball_athlete_splits <- function(league, athlete_id, season, ...) {
  .espn_bball_validate_league(league)
  .args <- list(league = league, athlete_id = athlete_id, season = season)

  result <- NULL

  url <- paste0(
    "https://site.web.api.espn.com/apis/common/v3/sports/basketball/",
    league,
    "/athletes/",
    athlete_id,
    "/splits?season=",
    season
  )

  tryCatch(
    expr = {
      res <- .retry_request(url)
      check_status(res)
      raw <- res %>% .resp_text() %>% jsonlite::fromJSON(simplifyDataFrame = TRUE)

      splits_raw <- raw[["splits"]] %||% raw[["categories"]] %||% raw[["data"]]
      labels_raw <- raw[["labels"]] %||% raw[["names"]] %||% raw[["statNames"]]

      if (is.null(splits_raw)) {
        result <- data.frame(stringsAsFactors = FALSE) %>% dplyr::as_tibble()
      } else if (is.data.frame(splits_raw) && nrow(splits_raw) > 0) {
        result <- splits_raw %>%
          data.frame(stringsAsFactors = FALSE) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data(
            paste0("ESPN ", toupper(league), " Athlete Splits from ESPN.com"),
            Sys.time()
          )
      } else if (is.list(splits_raw) && length(splits_raw) > 0) {
        # Flatten each split category into long rows
        rows <- lapply(splits_raw, function(cat_item) {
          cat_name   <- as.character(cat_item[["displayName"]] %||%
                                      cat_item[["name"]] %||% NA_character_)
          splits_lst <- cat_item[["splits"]] %||% cat_item[["rows"]]

          if (is.null(splits_lst) || length(splits_lst) == 0) {
            return(data.frame(category = cat_name, stringsAsFactors = FALSE))
          }

          if (is.data.frame(splits_lst)) {
            cbind(
              data.frame(category = rep(cat_name, nrow(splits_lst)),
                         stringsAsFactors = FALSE),
              splits_lst
            )
          } else if (is.list(splits_lst)) {
            inner_rows <- lapply(splits_lst, function(sp) {
              split_name <- as.character(sp[["displayName"]] %||%
                                          sp[["name"]] %||% NA_character_)
              stats_v    <- sp[["stats"]] %||% sp[["values"]]
              if (!is.null(stats_v) && !is.null(labels_raw) &&
                  length(labels_raw) == length(stats_v)) {
                row_vals <- as.list(as.character(stats_v))
                names(row_vals) <- as.character(labels_raw)
                row_vals[["category"]]   <- cat_name
                row_vals[["split_name"]] <- split_name
                data.frame(row_vals, stringsAsFactors = FALSE)
              } else {
                data.frame(category   = cat_name,
                           split_name = split_name,
                           stringsAsFactors = FALSE)
              }
            })
            dplyr::bind_rows(inner_rows)
          } else {
            data.frame(category = cat_name, stringsAsFactors = FALSE)
          }
        })
        rows <- Filter(Negate(is.null), rows)
        if (length(rows) > 0) {
          result <- dplyr::bind_rows(rows) %>%
            dplyr::as_tibble() %>%
            janitor::clean_names() %>%
            make_wehoop_data(
              paste0("ESPN ", toupper(league), " Athlete Splits from ESPN.com"),
              Sys.time()
            )
        } else {
          result <- data.frame(stringsAsFactors = FALSE) %>% dplyr::as_tibble()
        }
      } else {
        result <- data.frame(stringsAsFactors = FALSE) %>% dplyr::as_tibble()
      }
    },
    error = function(e) .report_api_error(
      e,
      hint = paste0("Failed to retrieve ESPN ", league,
                    " athlete splits for athlete_id=", athlete_id,
                    ", season=", season),
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = paste0("Warning retrieving ESPN ", league,
                    " athlete splits for athlete_id=", athlete_id),
      args = .args
    ),
    finally = {}
  )
  return(result)
}

# ---------------------------------------------------------------------------
# .espn_basketball_athlete_eventlog  (2.6)
# core-v2 /athletes/{athlete_id}/eventlog?season={year}
# Returns single tibble; $ref URLs returned as character columns, not resolved
# ---------------------------------------------------------------------------

#' Internal: ESPN basketball athlete eventlog
#'
#' Fetches
#' `sports.core.api.espn.com/v2/sports/basketball/leagues/{league}/athletes/{athlete_id}/eventlog`
#' and returns a single tidy tibble. Per-event `statistics.$ref` URLs are
#' returned as a character column `statistics_ref` -- they are NOT resolved.
#'
#' @param league character.
#' @param athlete_id character or numeric.
#' @param season numeric.
#' @param ... Unused.
#' @return A tibble.
#' @keywords internal
.espn_basketball_athlete_eventlog <- function(league, athlete_id, season, ...) {
  .espn_bball_validate_league(league)
  .args <- list(league = league, athlete_id = athlete_id, season = season)

  result <- NULL

  url <- paste0(
    "https://sports.core.api.espn.com/v2/sports/basketball/leagues/",
    league,
    "/athletes/",
    athlete_id,
    "/eventlog?season=",
    season
  )

  tryCatch(
    expr = {
      res <- .retry_request(url)
      check_status(res)
      raw <- res %>% .resp_text() %>% jsonlite::fromJSON(simplifyDataFrame = TRUE)

      # core-v2 eventlog returns events[].{event.$ref, competition.$ref,
      #   team.$ref, statistics.$ref, playByPlay.$ref}
      events_raw <- raw[["events"]] %||% raw[["items"]]

      if (is.null(events_raw) ||
          (!is.data.frame(events_raw) && !is.list(events_raw)) ||
          length(events_raw) == 0) {
        result <- data.frame(stringsAsFactors = FALSE) %>% dplyr::as_tibble()
      } else {
        if (is.data.frame(events_raw) && nrow(events_raw) > 0) {
          # Flatten $ref columns from nested data frames
          ev <- events_raw

          extract_ref <- function(col_name) {
            x <- ev[[col_name]]
            if (is.null(x)) return(rep(NA_character_, nrow(ev)))
            if (is.data.frame(x) && "$ref" %in% colnames(x)) {
              return(as.character(x[["$ref"]]))
            }
            if (is.list(x)) {
              return(vapply(x, function(item) {
                if (is.list(item) && !is.null(item[["$ref"]])) {
                  as.character(item[["$ref"]])
                } else {
                  NA_character_
                }
              }, character(1)))
            }
            rep(NA_character_, nrow(ev))
          }

          flat_df <- data.frame(
            event_ref       = extract_ref("event"),
            competition_ref = extract_ref("competition"),
            team_ref        = extract_ref("team"),
            statistics_ref  = extract_ref("statistics"),
            stringsAsFactors = FALSE
          )

          # Append any plain scalar columns not already in flat_df
          scalar_cols <- setdiff(
            names(ev)[vapply(ev, function(x) {
              !is.data.frame(x) && !is.list(x)
            }, logical(1))],
            names(flat_df)
          )
          if (length(scalar_cols) > 0) {
            flat_df <- cbind(
              flat_df,
              ev[scalar_cols],
              stringsAsFactors = FALSE
            )
          }

          result <- flat_df %>%
            dplyr::as_tibble() %>%
            janitor::clean_names() %>%
            make_wehoop_data(
              paste0("ESPN ", toupper(league), " Athlete Eventlog from ESPN.com"),
              Sys.time()
            )
        } else {
          # list form
          rows <- lapply(events_raw, function(ev_item) {
            ev_ref   <- ev_item[["event"]][["$ref"]] %||%
                        ev_item[["event"]]           %||% NA_character_
            comp_ref <- ev_item[["competition"]][["$ref"]] %||%
                        ev_item[["competition"]]      %||% NA_character_
            team_ref <- ev_item[["team"]][["$ref"]] %||%
                        ev_item[["team"]]            %||% NA_character_
            stats_ref <- ev_item[["statistics"]][["$ref"]] %||%
                         ev_item[["statistics"]]      %||% NA_character_
            data.frame(
              event_ref       = as.character(ev_ref),
              competition_ref = as.character(comp_ref),
              team_ref        = as.character(team_ref),
              statistics_ref  = as.character(stats_ref),
              stringsAsFactors = FALSE
            )
          })
          result <- dplyr::bind_rows(rows) %>%
            dplyr::as_tibble() %>%
            janitor::clean_names() %>%
            make_wehoop_data(
              paste0("ESPN ", toupper(league), " Athlete Eventlog from ESPN.com"),
              Sys.time()
            )
        }
      }
    },
    error = function(e) .report_api_error(
      e,
      hint = paste0("Failed to retrieve ESPN ", league,
                    " athlete eventlog for athlete_id=", athlete_id,
                    ", season=", season),
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = paste0("Warning retrieving ESPN ", league,
                    " athlete eventlog for athlete_id=", athlete_id),
      args = .args
    ),
    finally = {}
  )
  return(result)
}

# ---------------------------------------------------------------------------
# .espn_basketball_athlete_awards  (2.7)
# core-v2 /athletes/{athlete_id}/awards
# Returns single tibble; often empty
# ---------------------------------------------------------------------------

#' Internal: ESPN basketball athlete awards
#'
#' Fetches
#' `sports.core.api.espn.com/v2/sports/basketball/leagues/{league}/athletes/{athlete_id}/awards`
#' and returns a single tidy tibble. This endpoint is sparse; many athletes
#' return no data, in which case an empty tibble with canonical columns is
#' returned.
#'
#' @param league character.
#' @param athlete_id character or numeric.
#' @param ... Unused.
#' @return A tibble with columns `season`, `award_id`, `name`, `description`,
#'   `date`, `type`.
#' @keywords internal
.espn_basketball_athlete_awards <- function(league, athlete_id, ...) {
  .espn_bball_validate_league(league)
  .args <- list(league = league, athlete_id = athlete_id)

  empty_awards <- data.frame(
    season      = character(0),
    award_id    = character(0),
    name        = character(0),
    description = character(0),
    date        = character(0),
    type        = character(0),
    stringsAsFactors = FALSE
  ) %>%
    dplyr::as_tibble() %>%
    make_wehoop_data(
      paste0("ESPN ", toupper(league), " Athlete Awards from ESPN.com"),
      Sys.time()
    )

  result <- empty_awards

  url <- paste0(
    "https://sports.core.api.espn.com/v2/sports/basketball/leagues/",
    league,
    "/athletes/",
    athlete_id,
    "/awards"
  )

  tryCatch(
    expr = {
      res <- .retry_request(url)
      check_status(res)
      raw <- res %>% .resp_text() %>% jsonlite::fromJSON(simplifyDataFrame = TRUE)

      items_raw <- raw[["items"]] %||% raw[["awards"]]

      if (is.null(items_raw) ||
          (!is.data.frame(items_raw) && !is.list(items_raw)) ||
          length(items_raw) == 0) {
        return(result)  # empty tibble
      }

      if (is.data.frame(items_raw) && nrow(items_raw) > 0) {
        keep_cols <- c("season", "award_id", "id", "name", "displayName",
                       "description", "date", "type")
        avail <- intersect(keep_cols, colnames(items_raw))
        award_df <- items_raw[avail] %>%
          data.frame(stringsAsFactors = FALSE)

        # Normalize to canonical column names
        if ("id" %in% colnames(award_df) && !"award_id" %in% colnames(award_df)) {
          award_df[["award_id"]] <- award_df[["id"]]
        }
        if ("displayName" %in% colnames(award_df) && !"name" %in% colnames(award_df)) {
          award_df[["name"]] <- award_df[["displayName"]]
        }

        result <- award_df %>%
          dplyr::select(dplyr::any_of(c("season", "award_id", "name",
                                        "description", "date", "type"))) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data(
            paste0("ESPN ", toupper(league), " Athlete Awards from ESPN.com"),
            Sys.time()
          )
      }
    },
    error = function(e) .report_api_error(
      e,
      hint = paste0("Failed to retrieve ESPN ", league,
                    " athlete awards for athlete_id=", athlete_id),
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = paste0("Warning retrieving ESPN ", league,
                    " athlete awards for athlete_id=", athlete_id),
      args = .args
    ),
    finally = {}
  )
  return(result)
}

# ---------------------------------------------------------------------------
# .espn_basketball_athlete_statisticslog  (2.8)
# core-v2 /athletes/{athlete_id}/statisticslog?season={year}
# Returns single tibble
# ---------------------------------------------------------------------------

#' Internal: ESPN basketball athlete statisticslog
#'
#' Fetches
#' `sports.core.api.espn.com/v2/sports/basketball/leagues/{league}/athletes/{athlete_id}/statisticslog`
#' and returns a single tidy tibble.
#'
#' @param league character.
#' @param athlete_id character or numeric.
#' @param season numeric.
#' @param ... Unused.
#' @return A tibble.
#' @keywords internal
.espn_basketball_athlete_statisticslog <- function(league, athlete_id, season, ...) {
  .espn_bball_validate_league(league)
  .args <- list(league = league, athlete_id = athlete_id, season = season)

  result <- NULL

  url <- paste0(
    "https://sports.core.api.espn.com/v2/sports/basketball/leagues/",
    league,
    "/athletes/",
    athlete_id,
    "/statisticslog?season=",
    season
  )

  tryCatch(
    expr = {
      res <- .retry_request(url)
      check_status(res)
      raw <- res %>% .resp_text() %>% jsonlite::fromJSON(simplifyDataFrame = TRUE)

      entries_raw <- raw[["entries"]] %||% raw[["items"]] %||% raw[["statistics"]]

      if (is.null(entries_raw) ||
          (!is.data.frame(entries_raw) && !is.list(entries_raw)) ||
          length(entries_raw) == 0) {
        result <- data.frame(stringsAsFactors = FALSE) %>% dplyr::as_tibble()
      } else if (is.data.frame(entries_raw) && nrow(entries_raw) > 0) {
        result <- entries_raw %>%
          data.frame(stringsAsFactors = FALSE) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data(
            paste0("ESPN ", toupper(league), " Athlete Statisticslog from ESPN.com"),
            Sys.time()
          )
      } else if (is.list(entries_raw) && length(entries_raw) > 0) {
        rows <- lapply(entries_raw, function(entry) {
          event_ref <- NA_character_
          stats_ref <- NA_character_

          if (!is.null(entry[["event"]]) && is.list(entry[["event"]])) {
            event_ref <- as.character(entry[["event"]][["$ref"]] %||% NA_character_)
          }
          if (!is.null(entry[["statistics"]]) && is.list(entry[["statistics"]])) {
            stats_ref <- as.character(entry[["statistics"]][["$ref"]] %||% NA_character_)
          }

          # Collect scalar fields
          scalars <- Filter(function(x) !is.list(x) && !is.data.frame(x), entry)
          row_df <- data.frame(
            event_ref      = event_ref,
            statistics_ref = stats_ref,
            stringsAsFactors = FALSE
          )
          if (length(scalars) > 0) {
            sc_df <- data.frame(
              lapply(scalars, function(v) as.character(v[[1]] %||% NA_character_)),
              stringsAsFactors = FALSE
            )
            names(sc_df) <- names(scalars)
            row_df <- cbind(row_df, sc_df)
          }
          row_df
        })
        result <- dplyr::bind_rows(rows) %>%
          dplyr::as_tibble() %>%
          janitor::clean_names() %>%
          make_wehoop_data(
            paste0("ESPN ", toupper(league), " Athlete Statisticslog from ESPN.com"),
            Sys.time()
          )
      } else {
        result <- data.frame(stringsAsFactors = FALSE) %>% dplyr::as_tibble()
      }
    },
    error = function(e) .report_api_error(
      e,
      hint = paste0("Failed to retrieve ESPN ", league,
                    " athlete statisticslog for athlete_id=", athlete_id,
                    ", season=", season),
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = paste0("Warning retrieving ESPN ", league,
                    " athlete statisticslog for athlete_id=", athlete_id),
      args = .args
    ),
    finally = {}
  )
  return(result)
}

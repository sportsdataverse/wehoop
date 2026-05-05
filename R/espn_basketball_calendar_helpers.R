#' Internal helper -- ESPN basketball calendar
#'
#' Fetches the schedule calendar for an ESPN basketball league and returns a
#' tidy tibble of calendar entries. This is the single implementation shared by
#' `espn_wbb_calendar()` (league = "womens-college-basketball") and
#' `espn_wnba_calendar()` (league = "wnba"). The scoreboard endpoint carries a
#' `leagues[[1]]$calendar` block that describes the season types and their
#' date-range entries (weeks / round labels).
#'
#' @param league character. One of `"wnba"` or `"womens-college-basketball"`.
#' @param season integer or character. Four-digit season year (e.g. `2025`).
#' @param ... Currently unused; reserved for future pass-through arguments.
#' @return A `wehoop_data` tibble of calendar entries, or `NULL` on error.
#' @keywords internal
.espn_basketball_calendar <- function(league, season, ...) {
  if (!league %in% c("wnba", "womens-college-basketball")) {
    stop(
      paste0(
        "league must be one of 'wnba' or 'womens-college-basketball', got: ",
        league
      ),
      call. = FALSE
    )
  }

  .args <- mget(setdiff(names(formals()), "..."))

  url <- paste0(
    "https://site.api.espn.com/apis/site/v2/sports/basketball/",
    league,
    "/scoreboard?dates=",
    as.integer(season)
  )

  calendar <- NULL

  tryCatch(
    expr = {
      res <- .retry_request(url)
      check_status(res)

      resp <- res %>%
        .resp_text()

      raw <- jsonlite::fromJSON(resp, flatten = FALSE)

      # Navigate to the leagues[[1]]$calendar block
      leagues_block <- raw[["leagues"]]
      if (is.null(leagues_block) || length(leagues_block) == 0) {
        calendar <- data.frame(stringsAsFactors = FALSE) %>%
          dplyr::as_tibble() %>%
          make_wehoop_data(
            paste0("ESPN ", toupper(league), " Calendar from ESPN.com"),
            Sys.time()
          )
        return(calendar)
      }

      first_league <- leagues_block[[1]]
      cal_block <- first_league[["calendar"]]

      if (is.null(cal_block) || length(cal_block) == 0) {
        calendar <- data.frame(stringsAsFactors = FALSE) %>%
          dplyr::as_tibble() %>%
          make_wehoop_data(
            paste0("ESPN ", toupper(league), " Calendar from ESPN.com"),
            Sys.time()
          )
        return(calendar)
      }

      # cal_block is a list of season-type objects, each with $entries[]
      rows <- lapply(seq_along(cal_block), function(i) {
        st <- cal_block[[i]]

        season_type_label <- st[["label"]] %||% NA_character_
        season_type_value <- st[["value"]] %||% NA_character_
        season_type_startDate <- st[["startDate"]] %||% NA_character_
        season_type_endDate   <- st[["endDate"]]   %||% NA_character_

        entries <- st[["entries"]]
        if (is.null(entries) || length(entries) == 0) {
          return(data.frame(
            season            = as.character(season),
            season_type       = season_type_value,
            season_type_label = season_type_label,
            season_start_date = season_type_startDate,
            season_end_date   = season_type_endDate,
            label             = NA_character_,
            alternate_label   = NA_character_,
            detail            = NA_character_,
            value             = NA_character_,
            start_date        = NA_character_,
            end_date          = NA_character_,
            stringsAsFactors  = FALSE
          ))
        }

        if (is.data.frame(entries)) {
          n <- nrow(entries)
          data.frame(
            season            = rep(as.character(season), n),
            season_type       = rep(season_type_value, n),
            season_type_label = rep(season_type_label, n),
            season_start_date = rep(season_type_startDate, n),
            season_end_date   = rep(season_type_endDate, n),
            label             = as.character(entries[["label"]] %||% rep(NA_character_, n)),
            alternate_label   = as.character(entries[["alternateLabel"]] %||% rep(NA_character_, n)),
            detail            = as.character(entries[["detail"]] %||% rep(NA_character_, n)),
            value             = as.character(entries[["value"]] %||% rep(NA_character_, n)),
            start_date        = as.character(entries[["startDate"]] %||% rep(NA_character_, n)),
            end_date          = as.character(entries[["endDate"]] %||% rep(NA_character_, n)),
            stringsAsFactors  = FALSE
          )
        } else {
          # entries is a list of individual entry objects
          entry_rows <- lapply(entries, function(e) {
            data.frame(
              season            = as.character(season),
              season_type       = season_type_value,
              season_type_label = season_type_label,
              season_start_date = season_type_startDate,
              season_end_date   = season_type_endDate,
              label             = e[["label"]]           %||% NA_character_,
              alternate_label   = e[["alternateLabel"]]  %||% NA_character_,
              detail            = e[["detail"]]          %||% NA_character_,
              value             = e[["value"]]           %||% NA_character_,
              start_date        = e[["startDate"]]       %||% NA_character_,
              end_date          = e[["endDate"]]         %||% NA_character_,
              stringsAsFactors  = FALSE
            )
          })
          do.call(rbind, entry_rows)
        }
      })

      combined <- do.call(rbind, rows)

      calendar <- combined %>%
        data.frame(stringsAsFactors = FALSE) %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        make_wehoop_data(
          paste0("ESPN ", toupper(league), " Calendar from ESPN.com"),
          Sys.time()
        )
    },
    error = function(e) .report_api_error(
      e,
      hint = paste0(
        "Failed to retrieve ESPN ", league, " calendar for season=", season
      ),
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = paste0(
        "Warning retrieving ESPN ", league, " calendar for season=", season
      ),
      args = .args
    ),
    finally = {}
  )
  return(calendar)
}

# espn_wnba_transactions.R
# WNBA-only Phase 4 ESPN endpoint wrappers:
#   espn_wnba_draft(), espn_wnba_freeagents(), espn_wnba_transactions()
# These endpoints have no WBB equivalent, so they are implemented directly
# without shared helpers.

# ---------------------------------------------------------------------------
# espn_wnba_draft
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Draft Picks**
#' @name espn_wnba_draft
NULL
#' @title
#' **Get ESPN WNBA Draft Picks**
#' @rdname espn_wnba_draft
#' @author Saiem Gilani
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WNBA season.
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)`.
#' @return A `wehoop_data` tibble with one row per draft pick:
#'
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |season        |integer   |
#'    |round         |integer   |
#'    |pick          |integer   |
#'    |overall       |integer   |
#'    |team_id       |character |
#'    |athlete_id    |character |
#'    |athlete_name  |character |
#'    |position      |character |
#'    |college       |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble mutate
#' @importFrom rlang %||%
#' @import rvest
#' @export
#' @family ESPN WNBA Functions
#' @details
#' Calls the ESPN core-v2 endpoint
#' `https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/{year}/draft`.
#' Paginates over all pages (capped at 20 pages) and returns a single flat
#' tibble. Outside the draft window, or for historical seasons with no ESPN
#' draft data, the function returns an empty tibble rather than erroring.
#' @examples
#' \donttest{
#'   espn_wnba_draft(season = 2024)
#' }
espn_wnba_draft <- function(season = most_recent_wnba_season(), ...) {
  .args <- mget(setdiff(names(formals()), "..."))

  picks_df <- data.frame(stringsAsFactors = FALSE)

  tryCatch(
    expr = {
      base_url <- paste0(
        "https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba",
        "/seasons/", as.integer(season), "/draft"
      )

      all_rows <- list()
      page_index <- 1L
      page_count <- 1L
      page_cap   <- 20L

      repeat {
        url <- if (page_index == 1L) {
          base_url
        } else {
          paste0(base_url, "?pageIndex=", page_index)
        }

        res <- .retry_request(url)
        check_status(res)

        raw <- res %>%
          .resp_text() %>%
          jsonlite::fromJSON(simplifyDataFrame = TRUE)

        # Update pagination info on first page
        if (page_index == 1L) {
          page_count <- as.integer(raw[["pageCount"]] %||% 1L)
          if (is.na(page_count) || page_count < 1L) page_count <- 1L
        }

        items <- raw[["items"]]

        if (!is.null(items) && is.data.frame(items) && nrow(items) > 0) {
          all_rows[[page_index]] <- items
        }

        if (page_index >= page_count || page_index >= page_cap) break
        page_index <- page_index + 1L
      }

      if (length(all_rows) == 0) {
        picks_df <- data.frame(stringsAsFactors = FALSE) %>%
          dplyr::as_tibble() %>%
          make_wehoop_data("ESPN WNBA Draft Picks from ESPN.com", Sys.time())
        return(picks_df)
      }

      combined <- do.call(rbind, lapply(all_rows, function(df) {
        # Normalise column names before bind to absorb schema drift
        as.data.frame(df, stringsAsFactors = FALSE)
      }))

      # Extract nested fields defensively
      extract_col <- function(df, col, default = NA_character_) {
        if (col %in% colnames(df)) df[[col]] else rep(default, nrow(df))
      }

      # athlete ref -> id
      athlete_id <- NA_character_
      athlete_name <- NA_character_
      if ("athlete" %in% colnames(combined)) {
        ath <- combined[["athlete"]]
        if (is.data.frame(ath)) {
          athlete_id   <- as.character(ath[["id"]] %||% NA_character_)
          athlete_name <- as.character(ath[["displayName"]] %||% NA_character_)
        } else if (is.list(ath)) {
          athlete_id <- vapply(ath, function(a) {
            as.character(if (is.list(a) || is.data.frame(a)) a[["id"]] %||% NA_character_ else NA_character_)
          }, character(1))
          athlete_name <- vapply(ath, function(a) {
            as.character(if (is.list(a) || is.data.frame(a)) a[["displayName"]] %||% NA_character_ else NA_character_)
          }, character(1))
        }
      }

      team_id <- NA_character_
      if ("team" %in% colnames(combined)) {
        tm <- combined[["team"]]
        if (is.data.frame(tm)) {
          team_id <- as.character(tm[["id"]] %||% NA_character_)
        } else if (is.list(tm)) {
          team_id <- vapply(tm, function(t) {
            as.character(if (is.list(t) || is.data.frame(t)) t[["id"]] %||% NA_character_ else NA_character_)
          }, character(1))
        }
      }

      position_val <- NA_character_
      if ("position" %in% colnames(combined)) {
        pos <- combined[["position"]]
        if (is.data.frame(pos)) {
          position_val <- as.character(pos[["abbreviation"]] %||% NA_character_)
        } else if (is.list(pos)) {
          position_val <- vapply(pos, function(p) {
            as.character(if (is.list(p) || is.data.frame(p)) p[["abbreviation"]] %||% NA_character_ else NA_character_)
          }, character(1))
        } else {
          position_val <- as.character(pos)
        }
      }

      college_val <- NA_character_
      if ("college" %in% colnames(combined)) {
        col_raw <- combined[["college"]]
        if (is.data.frame(col_raw)) {
          college_val <- as.character(col_raw[["name"]] %||% NA_character_)
        } else if (is.list(col_raw)) {
          college_val <- vapply(col_raw, function(c) {
            as.character(if (is.list(c) || is.data.frame(c)) c[["name"]] %||% NA_character_ else NA_character_)
          }, character(1))
        } else {
          college_val <- as.character(col_raw)
        }
      }

      picks_df <- data.frame(
        season       = as.integer(season),
        round        = as.integer(extract_col(combined, "round",   NA_integer_)),
        pick         = as.integer(extract_col(combined, "pick",    NA_integer_)),
        overall      = as.integer(extract_col(combined, "overall", NA_integer_)),
        team_id      = team_id,
        athlete_id   = athlete_id,
        athlete_name = athlete_name,
        position     = position_val,
        college      = college_val,
        stringsAsFactors = FALSE
      ) %>%
        dplyr::as_tibble() %>%
        make_wehoop_data("ESPN WNBA Draft Picks from ESPN.com", Sys.time())
    },
    error = function(e) .report_api_error(
      e,
      hint = "Failed to retrieve ESPN WNBA draft data for season {season}",
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = "Warning retrieving ESPN WNBA draft data for season {season}",
      args = .args
    ),
    finally = {}
  )
  return(picks_df)
}


# ---------------------------------------------------------------------------
# espn_wnba_freeagents
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Free Agents**
#' @name espn_wnba_freeagents
NULL
#' @title
#' **Get ESPN WNBA Free Agents**
#' @rdname espn_wnba_freeagents
#' @author Saiem Gilani
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WNBA season.
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)`.
#' @return A `wehoop_data` tibble with one row per free agent:
#'
#'    |col_name           |types     |
#'    |:------------------|:---------|
#'    |season             |integer   |
#'    |athlete_id         |character |
#'    |athlete_name       |character |
#'    |position           |character |
#'    |prior_team_id      |character |
#'    |status             |character |
#'    |signed_team_id     |character |
#'    |signed_date        |character |
#'    |contract_value     |character |
#'    |contract_term_years|character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble
#' @importFrom rlang %||%
#' @import rvest
#' @export
#' @family ESPN WNBA Functions
#' @details
#' Calls the ESPN core-v2 endpoint
#' `https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/{year}/freeagents`.
#' Outside the free-agent window the endpoint typically returns an empty list;
#' the function returns an empty tibble rather than erroring in that case.
#' @examples
#' \donttest{
#'   espn_wnba_freeagents(season = 2025)
#' }
espn_wnba_freeagents <- function(season = most_recent_wnba_season(), ...) {
  .args <- mget(setdiff(names(formals()), "..."))

  fa_df <- data.frame(stringsAsFactors = FALSE)

  tryCatch(
    expr = {
      url <- paste0(
        "https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba",
        "/seasons/", as.integer(season), "/freeagents"
      )

      res <- .retry_request(url)
      check_status(res)

      raw <- res %>%
        .resp_text() %>%
        jsonlite::fromJSON(simplifyDataFrame = TRUE)

      items <- raw[["items"]]

      if (is.null(items) || (is.data.frame(items) && nrow(items) == 0) ||
          (is.list(items) && length(items) == 0)) {
        fa_df <- data.frame(stringsAsFactors = FALSE) %>%
          dplyr::as_tibble() %>%
          make_wehoop_data("ESPN WNBA Free Agents from ESPN.com", Sys.time())
        return(fa_df)
      }

      if (!is.data.frame(items)) {
        items <- as.data.frame(items, stringsAsFactors = FALSE)
      }

      # Extract nested athlete fields
      athlete_id   <- NA_character_
      athlete_name <- NA_character_
      if ("athlete" %in% colnames(items)) {
        ath <- items[["athlete"]]
        if (is.data.frame(ath)) {
          athlete_id   <- as.character(ath[["id"]] %||% NA_character_)
          athlete_name <- as.character(ath[["displayName"]] %||% NA_character_)
        } else if (is.list(ath)) {
          athlete_id <- vapply(ath, function(a) {
            as.character(if (is.list(a) || is.data.frame(a)) a[["id"]] %||% NA_character_ else NA_character_)
          }, character(1))
          athlete_name <- vapply(ath, function(a) {
            as.character(if (is.list(a) || is.data.frame(a)) a[["displayName"]] %||% NA_character_ else NA_character_)
          }, character(1))
        }
      }

      position_val <- NA_character_
      if ("position" %in% colnames(items)) {
        pos <- items[["position"]]
        if (is.data.frame(pos)) {
          position_val <- as.character(pos[["abbreviation"]] %||% NA_character_)
        } else if (is.list(pos)) {
          position_val <- vapply(pos, function(p) {
            as.character(if (is.list(p) || is.data.frame(p)) p[["abbreviation"]] %||% NA_character_ else NA_character_)
          }, character(1))
        } else {
          position_val <- as.character(pos)
        }
      }

      prior_team_id <- NA_character_
      if ("team" %in% colnames(items)) {
        tm <- items[["team"]]
        if (is.data.frame(tm)) {
          prior_team_id <- as.character(tm[["id"]] %||% NA_character_)
        } else if (is.list(tm)) {
          prior_team_id <- vapply(tm, function(t) {
            as.character(if (is.list(t) || is.data.frame(t)) t[["id"]] %||% NA_character_ else NA_character_)
          }, character(1))
        }
      }

      signed_team_id <- NA_character_
      if ("signedTeam" %in% colnames(items)) {
        stm <- items[["signedTeam"]]
        if (is.data.frame(stm)) {
          signed_team_id <- as.character(stm[["id"]] %||% NA_character_)
        } else if (is.list(stm)) {
          signed_team_id <- vapply(stm, function(t) {
            as.character(if (is.list(t) || is.data.frame(t)) t[["id"]] %||% NA_character_ else NA_character_)
          }, character(1))
        }
      }

      get_scalar_col <- function(df, col) {
        if (col %in% colnames(df)) as.character(df[[col]]) else rep(NA_character_, nrow(df))
      }

      fa_df <- data.frame(
        season              = as.integer(season),
        athlete_id          = athlete_id,
        athlete_name        = athlete_name,
        position            = position_val,
        prior_team_id       = prior_team_id,
        status              = get_scalar_col(items, "status"),
        signed_team_id      = signed_team_id,
        signed_date         = get_scalar_col(items, "signedDate"),
        contract_value      = get_scalar_col(items, "contractValue"),
        contract_term_years = get_scalar_col(items, "contractTermYears"),
        stringsAsFactors = FALSE
      ) %>%
        dplyr::as_tibble() %>%
        make_wehoop_data("ESPN WNBA Free Agents from ESPN.com", Sys.time())
    },
    error = function(e) .report_api_error(
      e,
      hint = "Failed to retrieve ESPN WNBA free agents for season {season}",
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = "Warning retrieving ESPN WNBA free agents for season {season}",
      args = .args
    ),
    finally = {}
  )
  return(fa_df)
}


# ---------------------------------------------------------------------------
# espn_wnba_transactions
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Transactions**
#' @name espn_wnba_transactions
NULL
#' @title
#' **Get ESPN WNBA Transactions**
#' @rdname espn_wnba_transactions
#' @author Saiem Gilani
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WNBA season.
#' @param limit Maximum number of transactions to return (integer). Default
#'   `100`.
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)`.
#' @return A `wehoop_data` tibble with one row per transaction:
#'
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |transaction_id |character |
#'    |date           |character |
#'    |type           |character |
#'    |description    |character |
#'    |team_id        |character |
#'    |athlete_id     |character |
#'    |athlete_name   |character |
#'    |from_team_id   |character |
#'    |to_team_id     |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble
#' @importFrom rlang %||%
#' @import rvest
#' @export
#' @family ESPN WNBA Functions
#' @details
#' Calls the ESPN site-v2 endpoint
#' `https://site.api.espn.com/apis/site/v2/sports/basketball/wnba/transactions?season={year}&limit={limit}`.
#' Releases have a `NULL` `to_team_id`; those are stored as `NA`. Returns an
#' empty tibble rather than erroring when no transactions are available.
#' @examples
#' \donttest{
#'   espn_wnba_transactions(season = 2025, limit = 10)
#' }
espn_wnba_transactions <- function(
    season = most_recent_wnba_season(),
    limit  = 100,
    ...) {
  .args <- mget(setdiff(names(formals()), "..."))

  tx_df <- data.frame(stringsAsFactors = FALSE)

  tryCatch(
    expr = {
      url <- paste0(
        "https://site.api.espn.com/apis/site/v2/sports/basketball/wnba",
        "/transactions?season=", as.integer(season),
        "&limit=", as.integer(limit)
      )

      res <- .retry_request(url)
      check_status(res)

      raw <- res %>%
        .resp_text() %>%
        jsonlite::fromJSON(simplifyDataFrame = TRUE)

      items <- raw[["transactions"]]
      if (is.null(items)) items <- raw[["items"]]

      if (is.null(items) || (is.data.frame(items) && nrow(items) == 0) ||
          (is.list(items) && length(items) == 0)) {
        tx_df <- data.frame(stringsAsFactors = FALSE) %>%
          dplyr::as_tibble() %>%
          make_wehoop_data("ESPN WNBA Transactions from ESPN.com", Sys.time())
        return(tx_df)
      }

      if (!is.data.frame(items)) {
        items <- as.data.frame(items, stringsAsFactors = FALSE)
      }

      # Nested field extractors
      athlete_id   <- NA_character_
      athlete_name <- NA_character_
      if ("athlete" %in% colnames(items)) {
        ath <- items[["athlete"]]
        if (is.data.frame(ath)) {
          athlete_id   <- as.character(ath[["id"]] %||% NA_character_)
          athlete_name <- as.character(ath[["displayName"]] %||% NA_character_)
        } else if (is.list(ath)) {
          athlete_id <- vapply(ath, function(a) {
            as.character(if (is.list(a) || is.data.frame(a)) a[["id"]] %||% NA_character_ else NA_character_)
          }, character(1))
          athlete_name <- vapply(ath, function(a) {
            as.character(if (is.list(a) || is.data.frame(a)) a[["displayName"]] %||% NA_character_ else NA_character_)
          }, character(1))
        }
      }

      team_id <- NA_character_
      if ("team" %in% colnames(items)) {
        tm <- items[["team"]]
        if (is.data.frame(tm)) {
          team_id <- as.character(tm[["id"]] %||% NA_character_)
        } else if (is.list(tm)) {
          team_id <- vapply(tm, function(t) {
            as.character(if (is.list(t) || is.data.frame(t)) t[["id"]] %||% NA_character_ else NA_character_)
          }, character(1))
        }
      }

      from_team_id <- NA_character_
      if ("fromTeam" %in% colnames(items)) {
        ftm <- items[["fromTeam"]]
        if (is.data.frame(ftm)) {
          from_team_id <- as.character(ftm[["id"]] %||% NA_character_)
        } else if (is.list(ftm)) {
          from_team_id <- vapply(ftm, function(t) {
            as.character(if (is.list(t) || is.data.frame(t)) t[["id"]] %||% NA_character_ else NA_character_)
          }, character(1))
        }
      }

      to_team_id <- NA_character_
      if ("toTeam" %in% colnames(items)) {
        ttm <- items[["toTeam"]]
        if (is.data.frame(ttm)) {
          to_team_id <- as.character(ttm[["id"]] %||% NA_character_)
        } else if (is.list(ttm)) {
          to_team_id <- vapply(ttm, function(t) {
            as.character(if (is.list(t) || is.data.frame(t)) t[["id"]] %||% NA_character_ else NA_character_)
          }, character(1))
        }
      }

      get_col <- function(df, col) {
        if (col %in% colnames(df)) as.character(df[[col]]) else rep(NA_character_, nrow(df))
      }

      tx_df <- data.frame(
        transaction_id = get_col(items, "id"),
        date           = get_col(items, "date"),
        type           = get_col(items, "type"),
        description    = get_col(items, "description"),
        team_id        = team_id,
        athlete_id     = athlete_id,
        athlete_name   = athlete_name,
        from_team_id   = from_team_id,
        to_team_id     = to_team_id,
        stringsAsFactors = FALSE
      ) %>%
        dplyr::as_tibble() %>%
        make_wehoop_data("ESPN WNBA Transactions from ESPN.com", Sys.time())
    },
    error = function(e) .report_api_error(
      e,
      hint = "Failed to retrieve ESPN WNBA transactions for season {season}",
      args = .args
    ),
    warning = function(w) .report_api_warning(
      w,
      hint = "Warning retrieving ESPN WNBA transactions for season {season}",
      args = .args
    ),
    finally = {}
  )
  return(tx_df)
}

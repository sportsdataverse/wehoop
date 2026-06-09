# Internal: parse every HTML table on a Her Hoop Stats page into cleaned tibbles.
.hhs_tables <- function(doc, min_rows = 1) {
  tbs <- rvest::html_elements(doc, "table")
  out <- lapply(tbs, function(t) {
    tryCatch(janitor::clean_names(rvest::html_table(t)), error = function(e) NULL)
  })
  out <- out[!vapply(out, is.null, logical(1))]
  Filter(function(t) nrow(t) >= min_rows, out)
}

#' @title
#' **Her Hoop Stats NCAA Team Single-Season Index**
#' @description
#' **Get the NCAA women's team single-season summary table from
#' [Her Hoop Stats](https://herhoopstats.com).**
#'
#' Her Hoop Stats is a *subscription* service; this logs in with your own
#' credentials (read from the `email`/`password` arguments, the
#' `wehoop.herhoopstats_email`/`..._password` options, or the
#' `HERHOOPSTATS_EMAIL`/`HERHOOPSTATS_PW` environment variables) and returns one
#' row per team-season, with a `team_link` column for [hhs_team_stats()] /
#' [hhs_team_roster()].
#' @param min_season,max_season Season range (4-digit ending year; `2024` =
#'   2023-24). Default both to `most_recent_wbb_season()`.
#' @param division NCAA division: `1` (default), `2` or `3`.
#' @param email,password Optional explicit subscription credentials.
#' @return A `wehoop_data` tibble, one row per team-season (record, scoring and
#'   per-100-possession columns), plus a `team_link` column and the requested
#'   `min_season` / `max_season` / `division`.
#' @note Requires a Her Hoop Stats subscription. The member-table layout may
#'   change over time; selectors here are a starting point.
#' @importFrom rvest read_html html_element html_elements html_table html_attr
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble
#' @export
#' @family Her Hoop Stats Functions
#' @examples
#' \dontrun{
#'   # requires HERHOOPSTATS_EMAIL / HERHOOPSTATS_PW
#'   hhs_teams(min_season = 2024, max_season = 2024, division = 1)
#' }
hhs_teams <- function(min_season = most_recent_wbb_season(),
                      max_season = most_recent_wbb_season(),
                      division = 1, email = NULL, password = NULL) {
  .args <- .capture_args()

  df <- data.frame()

  tryCatch(
    expr = {
      jar <- .hhs_login(email, password)
      path <- sprintf(
        "/stats/ncaa/research/team_single_seasons/?min_season=%s&max_season=%s&division=%s&games=all&stats_to_show=summary&submit=true",
        min_season, max_season, division)
      doc <- .hhs_doc(path, jar)
      tnode <- rvest::html_element(doc, "table")
      if (inherits(tnode, "xml_missing")) stop("No Her Hoop Stats team table found", call. = FALSE)
      d <- janitor::clean_names(rvest::html_table(tnode))
      # attach the per-row team link
      links <- rvest::html_attr(rvest::html_elements(tnode, "tbody tr a"), "href")
      links <- links[grepl("/team/|/stats/", links)]
      if (length(links) == nrow(d)) d[["team_link"]] <- links
      d[["min_season"]] <- as.integer(min_season)
      d[["max_season"]] <- as.integer(max_season)
      d[["division"]] <- as.integer(division)
      df <- make_wehoop_data(dplyr::as_tibble(d), "NCAA women's team seasons from herhoopstats.com", Sys.time())
    },
    error = function(e) {
      .report_api_error(e, hint = "No Her Hoop Stats team data available!", args = .args)
    },
    warning = function(w) {
      .report_api_warning(w, hint = "Warning fetching Her Hoop Stats teams", args = .args)
    },
    finally = {
    }
  )
  return(df)
}

#' @title
#' **Her Hoop Stats Team Statistics**
#' @description
#' **Get a team's statistics page from [Her Hoop Stats](https://herhoopstats.com).**
#'
#' Requires a Her Hoop Stats subscription (see [hhs_teams()]).
#' @param team_link A team page path or URL, e.g. the `team_link` column returned
#'   by [hhs_teams()].
#' @param email,password Optional explicit subscription credentials.
#' @return A `wehoop_data` tibble of the team's primary statistics table.
#' @note Requires a Her Hoop Stats subscription. Member-table layout may change.
#' @importFrom rvest read_html html_elements html_table
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble
#' @export
#' @family Her Hoop Stats Functions
#' @examples
#' \dontrun{
#'   teams <- hhs_teams(2024, 2024, 1)
#'   hhs_team_stats(team_link = teams$team_link[1])
#' }
hhs_team_stats <- function(team_link, email = NULL, password = NULL) {
  .args <- .capture_args()

  df <- data.frame()

  tryCatch(
    expr = {
      jar <- .hhs_login(email, password)
      doc <- .hhs_doc(team_link, jar)
      tables <- .hhs_tables(doc, min_rows = 1)
      if (!length(tables)) stop("No Her Hoop Stats team tables found", call. = FALSE)
      d <- tables[[which.max(vapply(tables, nrow, integer(1)))]]
      df <- make_wehoop_data(dplyr::as_tibble(d), "Team statistics from herhoopstats.com", Sys.time())
    },
    error = function(e) {
      .report_api_error(e, hint = "No Her Hoop Stats team statistics available!", args = .args)
    },
    warning = function(w) {
      .report_api_warning(w, hint = "Warning fetching Her Hoop Stats team statistics", args = .args)
    },
    finally = {
    }
  )
  return(df)
}

#' @title
#' **Her Hoop Stats Team Roster**
#' @description
#' **Get a team's player roster + stats from
#' [Her Hoop Stats](https://herhoopstats.com).**
#'
#' Requires a Her Hoop Stats subscription (see [hhs_teams()]).
#' @param team_link A team page path or URL (the `team_link` column from
#'   [hhs_teams()]).
#' @param email,password Optional explicit subscription credentials.
#' @return A `wehoop_data` tibble, one row per player.
#' @note Requires a Her Hoop Stats subscription. Member-table layout may change.
#' @importFrom rvest read_html html_elements html_table
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble
#' @export
#' @family Her Hoop Stats Functions
#' @examples
#' \dontrun{
#'   teams <- hhs_teams(2024, 2024, 1)
#'   hhs_team_roster(team_link = teams$team_link[1])
#' }
hhs_team_roster <- function(team_link, email = NULL, password = NULL) {
  .args <- .capture_args()

  df <- data.frame()

  tryCatch(
    expr = {
      jar <- .hhs_login(email, password)
      doc <- .hhs_doc(team_link, jar)
      tables <- .hhs_tables(doc, min_rows = 2)
      # the roster is the table carrying a player/name column
      is_roster <- vapply(tables, function(t) any(grepl("player|name", colnames(t))), logical(1))
      d <- if (any(is_roster)) tables[[which(is_roster)[1]]] else
        tables[[which.max(vapply(tables, nrow, integer(1)))]]
      if (is.null(d) || nrow(d) == 0) stop("No Her Hoop Stats roster table found", call. = FALSE)
      df <- make_wehoop_data(dplyr::as_tibble(d), "Team roster from herhoopstats.com", Sys.time())
    },
    error = function(e) {
      .report_api_error(e, hint = "No Her Hoop Stats roster available!", args = .args)
    },
    warning = function(w) {
      .report_api_warning(w, hint = "Warning fetching Her Hoop Stats roster", args = .args)
    },
    finally = {
    }
  )
  return(df)
}

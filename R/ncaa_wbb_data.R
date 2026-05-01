
#' Get Women's college basketball NET rankings for the current date from the NCAA website
#'
#' @author Saiem Gilani
#' @return Returns a tibble
#' 
#'    |col_name   |types     |
#'    |:----------|:---------|
#'    |rank       |integer   |
#'    |previous   |integer   |
#'    |school     |character |
#'    |conference |character |
#'    |record     |character |
#'    |road       |character |
#'    |neutral    |character |
#'    |home       |character |
#'    |non_div_i  |character |
#' 
#' @importFrom dplyr %>% as_tibble
#' @import rvest
#' @export
#' @keywords NCAA WBB NET Rankings
#' @family NCAA WBB Functions
#' @examples
#' # Get current NCAA NET rankings
#' \donttest{
#'   try(ncaa_wbb_NET_rankings())
#' }

ncaa_wbb_NET_rankings <- function(){
  .args <- .capture_args()

  x <- NULL

  NET_url <- "https://www.ncaa.com/rankings/basketball-women/d1/ncaa-womens-basketball-net-rankings"
  tryCatch(
    expr = {
      x <- (NET_url %>%
              xml2::read_html() %>%
              rvest::html_nodes("table"))[[1]] %>%
        rvest::html_table(fill = TRUE) %>%
        dplyr::as_tibble() %>%
        janitor::clean_names() %>%
        dplyr::rename(dplyr::any_of(c(
          "conference" = "conf",
          "previous" = "prev"
        ))) %>%
        make_wehoop_data("NCAA WBB NET Rankings Information from NCAA.com", Sys.time())
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or no NET rankings available!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {
    }
  )
  return(x)
}


#' @title **Scrape NCAA Women's Basketball Teams (Division I, II, and III)**
#' @description Returns the list of NCAA member institutions in a given
#' division. Sourced from the NCAA member directory API at
#' `web3.ncaa.org/directory/api/directory/memberList`.
#'
#' Note: as of v3.0.0 the legacy `stats.ncaa.org/team/inst_team_list`
#' endpoint is blocked behind Akamai (HTTP 403 to all automated requests).
#' This function now returns institutional membership for the current
#' academic year regardless of the `year` argument; the argument is kept
#' for backward compatibility and emitted as the `year` column. The old
#' stats.ncaa.org per-season `season_id` is no longer available, so that
#' column is `NA_character_`.
#'
#' @param year The season for which data should be returned, in the form
#'   of "YYYY". The directory API only exposes the current academic year,
#'   so this argument is recorded in the `year` column but does not
#'   affect the rows returned.
#' @param division Division - 1, 2, or 3.
#' @param ... Additional arguments (unused; retained for backward
#'   compatibility).
#' @return A data frame with the following variables
#'
#'    |col_name      |types     |
#'    |:-------------|:---------|
#'    |team_id       |character |
#'    |team_name     |character |
#'    |team_url      |character |
#'    |conference_id |character |
#'    |conference    |character |
#'    |division      |numeric   |
#'    |year          |numeric   |
#'    |season_id     |character |
#'
#' @import dplyr
#' @importFrom jsonlite fromJSON
#' @export
#' @details
#' ```r
#'   ncaa_wbb_teams(year = 2025, division = 1)
#' ```
ncaa_wbb_teams <- function(year = most_recent_wbb_season(), division = 1, ...) {
  .args <- .capture_args()

  if (is.null(year)) {
    cli::cli_abort("Enter valid year as a number (YYYY)")
  }
  if (is.null(division)) {
    cli::cli_abort("Enter valid division as a number: 1, 2, 3")
  }
  if (year < 2002) {
    stop("you must provide a year that is equal to or greater than 2002")
  }
  div_roman <- switch(
    as.character(division),
    `1` = "I", `2` = "II", `3` = "III",
    cli::cli_abort("`division` must be 1, 2, or 3")
  )

  df <- data.frame()

  url <- paste0(
    "https://web3.ncaa.org/directory/api/directory/memberList?type=12&division=",
    div_roman
  )

  tryCatch(
    expr = {
      resp <- .retry_request(url, headers = .ncaa_headers(), timeout = 30)
      raw <- jsonlite::fromJSON(.resp_text(resp), flatten = TRUE)

      if (!is.data.frame(raw) || nrow(raw) == 0) {
        return(df)
      }

      df <- raw %>%
        dplyr::filter(.data$deactive == "N",
                      .data$division == as.integer(division)) %>%
        dplyr::transmute(
          team_id = as.character(.data$orgId),
          team_name = as.character(.data$nameOfficial),
          team_url = as.character(.data$athleticWebUrl),
          conference_id = as.character(.data$conferenceId),
          conference = as.character(.data$conferenceName),
          division = as.integer(.data$division),
          year = as.integer(year),
          season_id = NA_character_
        ) %>%
        dplyr::arrange(.data$conference, .data$team_name) %>%
        dplyr::as_tibble() %>%
        make_wehoop_data(
          "NCAA WBB Teams data from web3.ncaa.org/directory",
          Sys.time()
        )
    },
    error = function(e) .report_api_error(
      e,
      hint = "Could not fetch NCAA member directory for division {division}!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {}
  )
  return(df)
}

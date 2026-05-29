
#' Get Women's college basketball NET rankings for the current date from the NCAA website
#'
#' @author Saiem Gilani
#' @return Returns a tibble
#' 
#'    |col_name   |types     |description                                                 |
#'    |:----------|:---------|:-----------------------------------------------------------|
#'    |rank       |integer   |Whether to include statistical ranks in the returned table. |
#'    |previous   |integer   |Previous.                                                   |
#'    |school     |character |Player's school / college (when distinct from 'college').   |
#'    |conference |character |Filter players or teams by conference.                      |
#'    |record     |character |Record string (e.g. '12-4').                                |
#'    |road       |character |Road.                                                       |
#'    |neutral    |character |Neutral.                                                    |
#'    |home       |character |Home.                                                       |
#'    |non_div_i  |character |Non div i.                                                  |
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
#' @description Scrapes the NCAA Stats per-season team list at
#' `http://stats.ncaa.org/team/inst_team_list?academic_year=YYYY&conf_id=-1&division=N&sport_code=WBB`.
#' Returns one row per team for the requested season-year and division,
#' with the per-season `season_id` and `team_id` parsed out of the
#' `stats.ncaa.org` team URL.
#'
#' **Network access:** as of v3.0.0 `stats.ncaa.org` is fronted by Akamai
#' and returns HTTP 403 (`Reference #18.<...>`) to many residential and
#' cloud IP ranges regardless of headers. If you hit that block, supply a
#' proxy that egresses from a non-blocked address — pass `proxy =`
#' directly via `...` (forwarded to `.retry_request()`), or set it once
#' with `options(wehoop.proxy = list(url=, port=, username=, password=))`.
#' See the wehoop CLAUDE.md / pkgdown docs for the full proxy resolution
#' order.
#'
#' @param year The season for which data should be returned, in the form
#'   of "YYYY". Years currently available: 2002 onward.
#' @param division Division - 1, 2, or 3.
#' @param ... Forwarded to the internal `.retry_request()` HTTP helper.
#'   The most useful pass-through is `proxy =` (string `"http://host:port"`
#'   or named list `list(url=, port=, username=, password=, auth=)`); see
#'   `?.retry_request` for the full set of recognized arguments.
#' @return A data frame with the following variables
#'
#'    |col_name       |types     |description                                     |
#'    |:--------------|:---------|:-----------------------------------------------|
#'    |team_id        |character |Franchise team id (legacy `/team/{id}/...` urls).|
#'    |team_name      |character |Full team display name (e.g. 'Las Vegas Aces').  |
#'    |team_url       |character |URL for team.                                    |
#'    |conference_id  |character |Conference identifier.                           |
#'    |conference     |character |Filter players or teams by conference.           |
#'    |division       |numeric   |Team division.                                   |
#'    |year           |numeric   |4-digit year.                                    |
#'    |season_id      |character |Season id (legacy urls).                         |
#'    |season_team_id |character |Season-team id (modern `/teams/{id}` urls).      |
#'
#' @import dplyr
#' @import rvest
#' @importFrom stringr str_split
#' @export
#' @details
#' ```r
#'   ncaa_wbb_teams(year = 2025, division = 1)
#'
#'   # Behind a proxy (per-call):
#'   ncaa_wbb_teams(
#'     year = 2025, division = 1,
#'     proxy = list(url = "http://my-proxy", port = 8080,
#'                  username = "user", password = "pass")
#'   )
#'
#'   # Or session-wide:
#'   options(wehoop.proxy = list(url = "http://my-proxy", port = 8080,
#'                               username = "user", password = "pass"))
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

  # Pull `proxy` (and any other recognized args) out of `...` so we can
  # thread them into every `.retry_request()` call below. R's named-arg
  # matching does the rest — anything not consumed is silently dropped.
  .dots  <- list(...)
  .proxy <- .dots$proxy

  df <- data.frame()
  headers <- .ncaa_headers()

  tryCatch(
    expr = {
      url <- paste0(
        "http://stats.ncaa.org/team/inst_team_list?academic_year=",
        year,
        "&conf_id=-1",
        "&division=", division,
        "&sport_code=WBB"
      )

      resp <- .retry_request(url, headers = headers, timeout = 15,
                             proxy = .proxy)
      status <- httr2::resp_status(resp)
      body <- .resp_text(resp)

      # Bail early on Akamai's "Access Denied" page so callers see the
      # actual cause instead of a downstream `subscript out of bounds`
      # when the parser tries to index `.level2[[4]]` of an empty list.
      if (status >= 400L || grepl("Access Denied|Reference #18",
                                  body, ignore.case = TRUE)) {
        ref <- regmatches(
          body,
          regexpr("Reference&#32;&#35;18\\S+|Reference #18\\S+", body)
        )
        cli::cli_abort(c(
          "stats.ncaa.org returned HTTP {status} (Akamai WAF block).",
          "i" = if (length(ref) > 0) {
                  sprintf("WAF reference: %s", paste(ref, collapse = ", "))
                } else "Body did not contain the standard Akamai reference token.",
          "i" = "Provide an unblocked proxy via `proxy =` or `options(wehoop.proxy = ...)`."
        ))
      }

      data_read <- xml2::read_html(body)

      .level2 <- rvest::html_elements(data_read, ".level2")
      if (length(.level2) < 4L) {
        cli::cli_abort(c(
          "Expected at least 4 `.level2` blocks on the team list page; got {length(.level2)}.",
          "i" = "stats.ncaa.org may have changed its HTML; the conference parser needs an update.",
          "i" = "If you're seeing this from a working IP, dump the HTML and inspect the structure."
        ))
      }

      team_urls <- data_read %>%
        rvest::html_elements("table") %>%
        rvest::html_elements("a") %>%
        rvest::html_attr("href")

      team_names <- data_read %>%
        rvest::html_elements("table") %>%
        rvest::html_elements("a") %>%
        rvest::html_text()

      conference_names <- (.level2[[4]] %>%
        rvest::html_elements("a") %>%
        rvest::html_text())[-1]

      conference_ids <- .level2[[4]] %>%
        rvest::html_elements("a") %>%
        rvest::html_attr("href") %>%
        stringr::str_extract("javascript:changeConference\\(\\d+\\)") %>%
        stringr::str_subset("javascript:changeConference\\(\\d+\\)") %>%
        stringr::str_extract("\\d+")

      conference_df <- data.frame(
        conference = conference_names,
        conference_id = conference_ids
      )

      conferences_team_df <- lapply(conference_df$conference_id, function(x) {
        conf_team_url <- paste0(
          "http://stats.ncaa.org/team/inst_team_list?academic_year=",
          year,
          "&conf_id=", x,
          "&division=", division,
          "&sport_code=WBB"
        )

        resp <- .retry_request(conf_team_url, headers = headers, timeout = 15,
                               proxy = .proxy)

        page <- resp %>%
          .resp_text() %>%
          xml2::read_html()

        urls  <- page %>%
          rvest::html_elements("table") %>%
          rvest::html_elements("a") %>%
          rvest::html_attr("href")
        names <- page %>%
          rvest::html_elements("table") %>%
          rvest::html_elements("a") %>%
          rvest::html_text()

        out <- data.frame(
          team_url = urls,
          team_name = names,
          division = division,
          year = year,
          conference_id = x,
          stringsAsFactors = FALSE
        ) %>%
          dplyr::left_join(conference_df, by = c("conference_id"))
        Sys.sleep(5)
        return(out)
      })

      conferences_team_df <- rbindlist_with_attrs(conferences_team_df)

      # stats.ncaa.org serves two team-url shapes; extract ids from whichever
      # is present so the columns never come back all-NA when the site flips:
      #   legacy:  /team/{team_id}/{season_id}   (franchise id + season id)
      #   modern:  /teams/{season_team_id}       (single season-team id)
      # The patterns are distinguishable ("team/" vs "teams/"), so legacy rows
      # populate team_id/season_id and modern rows populate season_team_id.
      team_url <- conferences_team_df$team_url
      conferences_team_df$team_id <-
        stringr::str_extract(team_url, "team/(\\d+)/(\\d+)", group = 1)
      conferences_team_df$season_id <-
        stringr::str_extract(team_url, "team/(\\d+)/(\\d+)", group = 2)
      conferences_team_df$season_team_id <-
        stringr::str_extract(team_url, "teams/(\\d+)", group = 1)

      df <- as.data.frame(conferences_team_df) %>%
        dplyr::select(dplyr::any_of(c(
          "team_id",
          "team_name",
          "team_url",
          "conference_id",
          "conference",
          "division",
          "year",
          "season_id",
          "season_team_id"
        ))) %>%
        make_wehoop_data("NCAA WBB Teams data from stats.ncaa.org", Sys.time())
    },
    error = function(e) .report_api_error(
      e,
      hint = "Invalid arguments or stats.ncaa.org unreachable (try `proxy =`)!",
      args = .args
    ),
    warning = function(w) .report_api_warning(w, args = .args),
    finally = {}
  )
  return(df)
}

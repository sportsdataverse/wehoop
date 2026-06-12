# bart_wbb.R -- women's Bart Torvik (barttorvik.com/ncaaw) scrapers.
# Mirrors hoopR's men's torvik_* functions against the /ncaaw/ raw data files,
# using wehoop's shared HTTP + data-class helpers. No API key required.

.bart_wbb_base_url <- "https://barttorvik.com/ncaaw"
.bart_wbb_user_agent <- "Mozilla/5.0 (wehoop; +https://wehoop.sportsdataverse.org)"

#' Internal: GET a barttorvik.com/ncaaw resource and return the response text
#' @keywords internal
.bart_wbb_text <- function(path) {
  resp <- .retry_request(
    paste0(.bart_wbb_base_url, path),
    headers = c("User-Agent" = .bart_wbb_user_agent)
  )
  .resp_text(resp)
}

#' @title
#' **Bart Torvik Women's T-Rank Ratings**
#' @description
#' **Get women's college basketball T-Rank team ratings and adjusted
#' efficiencies from [barttorvik.com](https://barttorvik.com/ncaaw).** Pulls the
#' `/ncaaw/{year}_team_results.csv` file (one row per team). No API key required.
#' @param year Season, 4-digit ending-year format (e.g. `2024`). Defaults to
#'   `most_recent_wbb_season()`.
#' @return A `wehoop_data` tibble, one row per team: `rank`, `team`, `conf`,
#'   `record`, `adjoe`, `adjde`, `barthag`, plus projection / SOS / quality
#'   columns, and `year`.
#' @author Saiem Gilani
#' @importFrom data.table fread
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble
#' @export
#' @family Bart Torvik Functions
#' @examples
#' \donttest{
#'   try(bart_wbb_ratings(year = 2024))
#' }
bart_wbb_ratings <- function(year = most_recent_wbb_season()) {
  .args <- .capture_args()
  df <- data.frame()
  tryCatch(
    expr = {
      txt <- .bart_wbb_text(paste0("/", year, "_team_results.csv"))
      df <- data.table::fread(text = txt, showProgress = FALSE)
      df <- dplyr::as_tibble(janitor::clean_names(as.data.frame(df)))
      df[["year"]] <- as.integer(year)
      df <- make_wehoop_data(df, "Bart Torvik women's T-Rank ratings from barttorvik.com", Sys.time())
    },
    error = function(e) .report_api_error(e, hint = "No women's T-Rank ratings available for {year}!", args = .args),
    warning = function(w) .report_api_warning(w, hint = "Warning fetching women's T-Rank ratings for {year}", args = .args),
    finally = {}
  )
  df
}

#' @title
#' **Bart Torvik Women's Season Schedule & Results**
#' @description
#' **Get the full women's game-by-game schedule and results for a season from
#' [barttorvik.com](https://barttorvik.com/ncaaw).** Pulls the
#' `/ncaaw/{year}_super_sked.json` file (one row per game). No API key required.
#' @param year Season, 4-digit ending-year format (e.g. `2024`). Defaults to
#'   `most_recent_wbb_season()`.
#' @return A `wehoop_data` tibble, one row per game: `muid`, `date`, `team1`,
#'   `team2`, `t1pts`, `t2pts`, `winner`, `loser`, plus efficiency / quality
#'   columns, and `year`.
#' @author Saiem Gilani
#' @importFrom jsonlite fromJSON
#' @importFrom janitor clean_names
#' @importFrom dplyr as_tibble
#' @export
#' @family Bart Torvik Functions
#' @examples
#' \donttest{
#'   try(bart_wbb_game_schedule(year = 2024))
#' }
bart_wbb_game_schedule <- function(year = most_recent_wbb_season()) {
  .args <- .capture_args()
  field_names <- c(
    "muid", "date", "conmatch", "matchup", "prediction", "ttq", "conf", "venue",
    "team1", "t1oe", "t1de", "t1py", "t1wp", "t1propt",
    "team2", "t2oe", "t2de", "t2py", "t2wp", "t2propt",
    "tpro", "t1qual", "t2qual", "gp", "result", "tempo", "possessions", "t1pts",
    "t2pts", "winner", "loser", "t1adjt", "t2adjt", "t1adjo", "t1adjd", "t2adjo",
    "t2adjd", "gamevalue", "mismatch", "blowout", "t1elite", "t2elite", "ord_date",
    "t1ppp", "t2ppp", "gameppp", "t1rk", "t2rk", "t1gs", "t2gs", "gamestats",
    "overtimes", "t1fun", "t2fun", "results"
  )
  df <- data.frame()
  tryCatch(
    expr = {
      txt <- .bart_wbb_text(paste0("/", year, "_super_sked.json"))
      raw <- jsonlite::fromJSON(txt, simplifyVector = FALSE)
      mat <- do.call(rbind, lapply(raw, function(g) {
        vapply(g, function(x) {
          if (is.null(x) || length(x) == 0) NA_character_ else paste(unlist(x), collapse = ";")
        }, character(1))
      }))
      df <- as.data.frame(mat, stringsAsFactors = FALSE)
      if (ncol(df) == length(field_names)) colnames(df) <- field_names
      df <- utils::type.convert(df, as.is = TRUE)
      df <- janitor::clean_names(dplyr::as_tibble(df))
      df[["year"]] <- as.integer(year)
      df <- make_wehoop_data(df, "Bart Torvik women's season schedule from barttorvik.com", Sys.time())
    },
    error = function(e) .report_api_error(e, hint = "No women's schedule available for {year}!", args = .args),
    warning = function(w) .report_api_warning(w, hint = "Warning fetching women's Torvik schedule for {year}", args = .args),
    finally = {}
  )
  df
}

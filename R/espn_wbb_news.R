#' **Get ESPN WBB News**
#' @name espn_wbb_news
NULL
#' @title
#' **Get ESPN Women's College Basketball News**
#' @rdname espn_wbb_news
#' @author Saiem Gilani
#' @param limit integer. Maximum number of articles to return. Default `50`.
#' @return Returns a tibble of news articles.
#'
#'    |col_name    |types     |
#'    |:-----------|:---------|
#'    |id          |character |
#'    |type        |character |
#'    |headline    |character |
#'    |description |character |
#'    |published   |character |
#'    |premium     |logical   |
#'    |byline      |character |
#'    |link_web    |character |
#'    |league_id   |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr select as_tibble
#' @importFrom janitor clean_names
#' @import rvest
#' @export
#' @family ESPN WBB Functions
#' @details
#' Retrieve ESPN women's college basketball news. Uses
#' `getOption("wehoop.proxy")` or `http_proxy`/`https_proxy` environment
#' variables for proxy configuration (per-call proxy override is not
#' supported for ESPN wrappers).
#' ```r
#'  espn_wbb_news(limit = 10)
#' ```
espn_wbb_news <- function(limit = 50) {
  .args <- mget(setdiff(names(formals()), "..."))
  .espn_basketball_news(league = "womens-college-basketball", limit = limit)
}


#' **Get ESPN WBB Team News**
#' @name espn_wbb_team_news
NULL
#' @title
#' **Get ESPN Women's College Basketball Team News**
#' @rdname espn_wbb_team_news
#' @author Saiem Gilani
#' @param team_id character or integer. ESPN team ID (e.g. `2509` for UConn).
#' @param limit integer. Maximum number of articles to return. Default `25`.
#' @return Returns a tibble of team news articles.
#'
#'    |col_name    |types     |
#'    |:-----------|:---------|
#'    |id          |character |
#'    |type        |character |
#'    |headline    |character |
#'    |description |character |
#'    |published   |character |
#'    |premium     |logical   |
#'    |byline      |character |
#'    |link_web    |character |
#'    |league_id   |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr select as_tibble
#' @importFrom janitor clean_names
#' @import rvest
#' @export
#' @family ESPN WBB Functions
#' @details
#' Retrieve ESPN women's college basketball news for a specific team. Uses
#' `getOption("wehoop.proxy")` or `http_proxy`/`https_proxy` environment
#' variables for proxy configuration (per-call proxy override is not
#' supported for ESPN wrappers).
#' ```r
#'  espn_wbb_team_news(team_id = 2509, limit = 10)
#' ```
espn_wbb_team_news <- function(team_id, limit = 25) {
  .args <- mget(setdiff(names(formals()), "..."))
  .espn_basketball_team_news(
    league  = "womens-college-basketball",
    team_id = team_id,
    limit   = limit
  )
}

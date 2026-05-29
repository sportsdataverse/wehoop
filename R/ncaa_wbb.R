#' @name ncaa_wbb
#' @aliases ncaa_wbb ncaa_womens ncaa
#' @title **NCAA Women's Basketball Endpoint Overview**
#' @description
#' Wrappers around NCAA-side women's college basketball endpoints
#' beyond what ESPN exposes (rankings, teams reference, etc.). All
#' requests use the same `.retry_request()` HTTP layer as the rest of
#' the package.
#'
#' @details
#'
#' ## **NCAA endpoints**
#'
#' | Function | Purpose |
#' |---|---|
#' | [ncaa_wbb_teams()]          | NCAA WBB team reference |
#' | [ncaa_wbb_NET_rankings()]   | NCAA NET rankings |
#'
#' ## **Resilience pattern**
#'
#' NCAA endpoints occasionally drop columns. The wrappers use
#' `dplyr::any_of()` / `dplyr::rename(any_of(c(new = "old")))` so
#' schema drift doesn't crash the parser — see
#' `ncaa_wbb_NET_rankings()` for the reference implementation.
#'
#' @keywords NCAA WBB
#' @family NCAA WBB
NULL

#' @name wehoop_loaders
#' @aliases wehoop_loaders load_wnba load_wbb
#' @title **wehoop Data Loaders Overview**
#' @description
#' Loaders for full seasons of pre-scraped data from the
#' `sportsdataverse/wehoop-{wnba,wbb}-data` releases on
#' `sportsdataverse-data`. Each helper validates the requested
#' seasons, builds the per-asset URLs, downloads in parallel (with
#' optional [progressr] progress + optional `DBI` insertion), and
#' tags the result with the `wehoop_data` S3 class.
#'
#' @details
#'
#' ## **WNBA loaders**
#'
#' | Function | Asset family |
#' |---|---|
#' | [load_wnba_pbp()]            | WNBA play-by-play |
#' | [load_wnba_player_box()]     | WNBA player boxscores |
#' | [load_wnba_team_box()]       | WNBA team boxscores |
#' | [load_wnba_schedule()]       | WNBA schedule |
#' | [update_wnba_db()]           | Delta loader -> DB |
#'
#' ## **WBB loaders**
#'
#' | Function | Asset family |
#' |---|---|
#' | [load_wbb_pbp()]             | Women's college basketball PBP |
#' | [load_wbb_player_box()]      | WBB player boxscores |
#' | [load_wbb_team_box()]        | WBB team boxscores |
#' | [load_wbb_schedule()]        | WBB schedule |
#' | [update_wbb_db()]            | Delta loader -> DB |
#'
#' @keywords Loaders
#' @family wehoop Loaders
NULL

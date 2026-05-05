# espn_wbb_event_detail.R
# Public WBB shims for ESPN event-detail endpoints.
# These are thin wrappers over the internal helpers in
# espn_basketball_event_helpers.R.

# ---------------------------------------------------------------------------
# espn_wbb_event_odds
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Event Odds**
#' @name espn_wbb_event_odds
NULL
#' @title
#' **Get ESPN Women's College Basketball Event Odds**
#' @rdname espn_wbb_event_odds
#' @author Saiem Gilani
#' @param event_id ESPN event/game identifier (character or numeric).
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A tibble with one row per odds provider (typically empty for WBB
#'   because ESPN does not carry NCAA basketball betting lines).
#'
#'    |col_name             |types     |
#'    |:--------------------|:---------|
#'    |event_id             |character |
#'    |provider_id          |character |
#'    |provider_name        |character |
#'    |details              |character |
#'    |over_under           |numeric   |
#'    |spread               |numeric   |
#'    |home_money_line      |integer   |
#'    |away_money_line      |integer   |
#'    |home_team_odds_open  |numeric   |
#'    |home_team_odds_close |numeric   |
#'    |away_team_odds_open  |numeric   |
#'    |away_team_odds_close |numeric   |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @details
#' ```r
#'  espn_wbb_event_odds(event_id = "401736171")
#' ```
espn_wbb_event_odds <- function(event_id, ...) {
  .espn_basketball_event_odds(
    league   = "womens-college-basketball",
    event_id = event_id,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_event_probabilities
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Event Win Probabilities**
#' @name espn_wbb_event_probabilities
NULL
#' @title
#' **Get ESPN Women's College Basketball Event Win Probabilities**
#' @rdname espn_wbb_event_probabilities
#' @author Saiem Gilani
#' @param event_id ESPN event/game identifier (character or numeric).
#' @param limit integer. Maximum number of probability rows to return.
#'   Defaults to `200`. Pagination is handled internally.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per play-level win-probability entry.
#'
#'    |col_name                  |types     |
#'    |:-------------------------|:---------|
#'    |event_id                  |character |
#'    |sequence_number           |character |
#'    |play_id                   |character |
#'    |period                    |integer   |
#'    |clock                     |character |
#'    |home_win_percentage       |numeric   |
#'    |away_win_percentage       |numeric   |
#'    |tie_percentage            |numeric   |
#'    |secs_to_end_of_period     |numeric   |
#'    |secs_to_end_of_game       |numeric   |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @details
#' ```r
#'  espn_wbb_event_probabilities(event_id = "401736171", limit = 200)
#' ```
espn_wbb_event_probabilities <- function(event_id, limit = 200, ...) {
  .espn_basketball_event_probabilities(
    league   = "womens-college-basketball",
    event_id = event_id,
    limit    = limit,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_event_officials
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Event Officials**
#' @name espn_wbb_event_officials
NULL
#' @title
#' **Get ESPN Women's College Basketball Event Officials**
#' @rdname espn_wbb_event_officials
#' @author Saiem Gilani
#' @param event_id ESPN event/game identifier (character or numeric).
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per official assigned to the game.
#'
#'    |col_name       |types     |
#'    |:--------------|:---------|
#'    |event_id       |character |
#'    |official_id    |character |
#'    |full_name      |character |
#'    |display_name   |character |
#'    |position_id    |character |
#'    |position_name  |character |
#'    |position_type  |character |
#'    |order          |integer   |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @details
#' ```r
#'  espn_wbb_event_officials(event_id = "401736171")
#' ```
espn_wbb_event_officials <- function(event_id, ...) {
  .espn_basketball_event_officials(
    league   = "womens-college-basketball",
    event_id = event_id,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_event_broadcasts
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Event Broadcasts**
#' @name espn_wbb_event_broadcasts
NULL
#' @title
#' **Get ESPN Women's College Basketball Event Broadcasts**
#' @rdname espn_wbb_event_broadcasts
#' @author Saiem Gilani
#' @param event_id ESPN event/game identifier (character or numeric).
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per broadcast outlet for the game.
#'
#'    |col_name         |types     |
#'    |:----------------|:---------|
#'    |event_id         |character |
#'    |broadcast_id     |character |
#'    |type_id          |character |
#'    |type_short_name  |character |
#'    |type_long_name   |character |
#'    |market_id        |character |
#'    |market_type      |character |
#'    |names            |character |
#'    |lang             |character |
#'    |region           |character |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @details
#' ```r
#'  espn_wbb_event_broadcasts(event_id = "401736171")
#' ```
espn_wbb_event_broadcasts <- function(event_id, ...) {
  .espn_basketball_event_broadcasts(
    league   = "womens-college-basketball",
    event_id = event_id,
    ...
  )
}

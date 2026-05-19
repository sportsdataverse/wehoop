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
#'    |col_name             |types     |description                            |
#'    |:--------------------|:---------|:--------------------------------------|
#'    |event_id             |character |Unique event / game identifier (ESPN). |
#'    |provider_id          |character |Unique identifier for provider.        |
#'    |provider_name        |character |Provider name.                         |
#'    |details              |character |Details.                               |
#'    |over_under           |numeric   |Over under.                            |
#'    |spread               |numeric   |Spread.                                |
#'    |home_money_line      |integer   |Home team's money line.                |
#'    |away_money_line      |integer   |Away team's money line.                |
#'    |home_team_odds_open  |numeric   |Home team's team odds open.            |
#'    |home_team_odds_close |numeric   |Home team's team odds close.           |
#'    |away_team_odds_open  |numeric   |Away team's team odds open.            |
#'    |away_team_odds_close |numeric   |Away team's team odds close.           |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_event_odds(event_id = "401735229")
#' }
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
#'    |col_name              |types     |description                                              |
#'    |:---------------------|:---------|:--------------------------------------------------------|
#'    |event_id              |character |Unique event / game identifier (ESPN).                   |
#'    |sequence_number       |character |Sequence number representing a shot-possession (V3 PBP). |
#'    |play_id               |character |Unique play identifier within a game.                    |
#'    |period                |integer   |Period of the game (1-4 quarters; 5+ for OT).            |
#'    |clock                 |character |Game clock value.                                        |
#'    |home_win_percentage   |numeric   |Home win percentage (0-1 decimal).                       |
#'    |away_win_percentage   |numeric   |Away win percentage (0-1 decimal).                       |
#'    |tie_percentage        |numeric   |Tie percentage (0-1 decimal).                            |
#'    |secs_to_end_of_period |numeric   |Secs to end of period.                                   |
#'    |secs_to_end_of_game   |numeric   |Secs to end of game.                                     |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_event_probabilities(event_id = "401735229", limit = 50)
#' }
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
#'    |col_name      |types     |description                                            |
#'    |:-------------|:---------|:------------------------------------------------------|
#'    |event_id      |character |Unique event / game identifier (ESPN).                 |
#'    |official_id   |character |Unique official / referee identifier.                  |
#'    |full_name     |character |Player's full name.                                    |
#'    |display_name  |character |Display name.                                          |
#'    |position_id   |character |Unique position identifier.                            |
#'    |position_name |character |Listed roster position ('Guard', 'Forward', 'Center'). |
#'    |position_type |character |Position type.                                         |
#'    |order         |integer   |Display order within the result set.                   |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_event_officials(event_id = "401735229")
#' }
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
#'    |col_name        |types     |description                            |
#'    |:---------------|:---------|:--------------------------------------|
#'    |event_id        |character |Unique event / game identifier (ESPN). |
#'    |broadcast_id    |character |Unique identifier for broadcast.       |
#'    |type_id         |character |Type identifier (numeric).             |
#'    |type_short_name |character |Type short name.                       |
#'    |type_long_name  |character |Type long name.                        |
#'    |market_id       |character |Unique identifier for market.          |
#'    |market_type     |character |Market type.                           |
#'    |names           |character |Names.                                 |
#'    |lang            |character |Lang.                                  |
#'    |region          |character |Region label.                          |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble any_of bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_event_broadcasts(event_id = "401735229")
#' }
espn_wbb_event_broadcasts <- function(event_id, ...) {
  .espn_basketball_event_broadcasts(
    league   = "womens-college-basketball",
    event_id = event_id,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_event_situation
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Event Situation (Live)**
#' @name espn_wbb_event_situation
NULL
#' @title
#' **Get ESPN WBB Event Situation (Live)**
#' @rdname espn_wbb_event_situation
#' @author Saiem Gilani
#' @description
#' Returns the live game situation for one WBB event: timeouts remaining,
#' team fouls, fouls to give, bonus state, and a `$ref` to the last play.
#' During a live game this reflects current state; after the game ends
#' the values are frozen.
#'
#' @param event_id ESPN event identifier.
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble with timeouts + fouls for both teams.
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_event_situation(event_id = 401812680)
#' }
espn_wbb_event_situation <- function(event_id, ...) {
  .espn_basketball_event_situation(league = "womens-college-basketball", event_id = event_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_event_predictor
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Event Predictor (Pre-game)**
#' @name espn_wbb_event_predictor
#' @title
#' **Get ESPN WBB Event Predictor (Pre-game)**
#' @rdname espn_wbb_event_predictor
#' @author Saiem Gilani
#' @description
#' Returns pre-game predictor statistics for one WBB event in long
#' format: one row per (team × statistic). Typical stats include
#' matchup quality, predicted score, win probability, and team
#' strength metrics. Returns empty for events without predictor data
#' (often the case for already-played games).
#'
#' @param event_id ESPN event identifier.
#' @param ... Additional arguments; currently unused.
#' @return A long tibble with rows for both home and away teams.
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_event_predictor(event_id = 401812680)
#' }
espn_wbb_event_predictor <- function(event_id, ...) {
  .espn_basketball_event_predictor(league = "womens-college-basketball", event_id = event_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_event_powerindex
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Event Power Index Index**
#' @name espn_wbb_event_powerindex
#' @title
#' **Get ESPN WBB Event Power Index Index**
#' @rdname espn_wbb_event_powerindex
#' @author Saiem Gilani
#' @description
#' Returns the per-team power-index `$ref` URLs for one WBB event.
#' Coverage is sparse — many events return zero items.
#'
#' @param event_id ESPN event identifier.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per team-game power-index entry.
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_event_powerindex(event_id = 401812680)
#' }
espn_wbb_event_powerindex <- function(event_id, ...) {
  .espn_basketball_event_powerindex(league = "womens-college-basketball", event_id = event_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wbb_event_propbets
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Event Prop Bets (Long Format)**
#' @name espn_wbb_event_propbets
#' @title
#' **Get ESPN WBB Event Prop Bets (Long Format)**
#' @rdname espn_wbb_event_propbets
#' @author Saiem Gilani
#' @description
#' Returns prop-bet markets for one WBB event + provider in long format:
#' one row per (athlete × prop type). Each row has american / decimal /
#' fraction odds plus the current target (e.g. over/under line). Hits the
#' core-v2 `competitions/{id}/odds/{provider_id}/propBets` endpoint and
#' auto-paginates.
#'
#' @param event_id ESPN event identifier.
#' @param provider_id Sportsbook provider id (e.g. 58 = ESPN BET,
#'   100 = Caesars). Look up via [espn_wbb_event_odds()].
#' @param ... Additional arguments; currently unused.
#' @return A long tibble with one row per (athlete × prop type).
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_event_propbets(event_id = 401812680, provider_id = 58)
#' }
espn_wbb_event_propbets <- function(event_id, provider_id, ...) {
  .espn_basketball_event_propbets(league = "womens-college-basketball", event_id = event_id,
                                    provider_id = provider_id, ...)
}

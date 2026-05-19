# espn_wnba_event_detail.R
# Public WNBA shims for ESPN event-detail endpoints.
# These are thin wrappers over the internal helpers in
# espn_basketball_event_helpers.R.

# ---------------------------------------------------------------------------
# espn_wnba_event_odds
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Odds**
#' @name espn_wnba_event_odds
NULL
#' @title
#' **Get ESPN WNBA Event Odds**
#' @rdname espn_wnba_event_odds
#' @author Saiem Gilani
#' @param event_id ESPN event/game identifier (character or numeric).
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A tibble with one row per odds provider.
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
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_odds(event_id = "401736171")
#' }
espn_wnba_event_odds <- function(event_id, ...) {
  .espn_basketball_event_odds(
    league   = "wnba",
    event_id = event_id,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_event_probabilities
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Win Probabilities**
#' @name espn_wnba_event_probabilities
NULL
#' @title
#' **Get ESPN WNBA Event Win Probabilities**
#' @rdname espn_wnba_event_probabilities
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
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_probabilities(event_id = "401736171", limit = 50)
#' }
espn_wnba_event_probabilities <- function(event_id, limit = 200, ...) {
  .espn_basketball_event_probabilities(
    league   = "wnba",
    event_id = event_id,
    limit    = limit,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_event_officials
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Officials**
#' @name espn_wnba_event_officials
NULL
#' @title
#' **Get ESPN WNBA Event Officials**
#' @rdname espn_wnba_event_officials
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
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_officials(event_id = "401736171")
#' }
espn_wnba_event_officials <- function(event_id, ...) {
  .espn_basketball_event_officials(
    league   = "wnba",
    event_id = event_id,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_event_broadcasts
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Broadcasts**
#' @name espn_wnba_event_broadcasts
NULL
#' @title
#' **Get ESPN WNBA Event Broadcasts**
#' @rdname espn_wnba_event_broadcasts
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
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_broadcasts(event_id = "401736171")
#' }
espn_wnba_event_broadcasts <- function(event_id, ...) {
  .espn_basketball_event_broadcasts(
    league   = "wnba",
    event_id = event_id,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wnba_event_situation
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Situation (Live)**
#' @name espn_wnba_event_situation
NULL
#' @title
#' **Get ESPN WNBA Event Situation (Live)**
#' @rdname espn_wnba_event_situation
#' @author Saiem Gilani
#' @description
#' Returns the live game situation for one WNBA event: timeouts remaining,
#' team fouls, fouls to give, bonus state, and a `$ref` to the last play.
#' During a live game this reflects current state; after the game ends
#' the values are frozen.
#'
#' @param event_id ESPN event identifier.
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble with timeouts + fouls for both teams.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_situation(event_id = 401812680)
#' }
espn_wnba_event_situation <- function(event_id, ...) {
  .espn_basketball_event_situation(league = "wnba", event_id = event_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_predictor
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Predictor (Pre-game)**
#' @name espn_wnba_event_predictor
#' @title
#' **Get ESPN WNBA Event Predictor (Pre-game)**
#' @rdname espn_wnba_event_predictor
#' @author Saiem Gilani
#' @description
#' Returns pre-game predictor statistics for one WNBA event in long
#' format: one row per (team × statistic). Typical stats include
#' matchup quality, predicted score, win probability, and team
#' strength metrics. Returns empty for events without predictor data
#' (often the case for already-played games).
#'
#' @param event_id ESPN event identifier.
#' @param ... Additional arguments; currently unused.
#' @return A long tibble with rows for both home and away teams.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_predictor(event_id = 401812680)
#' }
espn_wnba_event_predictor <- function(event_id, ...) {
  .espn_basketball_event_predictor(league = "wnba", event_id = event_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_powerindex
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Power Index Index**
#' @name espn_wnba_event_powerindex
#' @title
#' **Get ESPN WNBA Event Power Index Index**
#' @rdname espn_wnba_event_powerindex
#' @author Saiem Gilani
#' @description
#' Returns the per-team power-index `$ref` URLs for one WNBA event.
#' Coverage is sparse — many events return zero items.
#'
#' @param event_id ESPN event identifier.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per team-game power-index entry.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_powerindex(event_id = 401812680)
#' }
espn_wnba_event_powerindex <- function(event_id, ...) {
  .espn_basketball_event_powerindex(league = "wnba", event_id = event_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_propbets
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Prop Bets (Long Format)**
#' @name espn_wnba_event_propbets
#' @title
#' **Get ESPN WNBA Event Prop Bets (Long Format)**
#' @rdname espn_wnba_event_propbets
#' @author Saiem Gilani
#' @description
#' Returns prop-bet markets for one WNBA event + provider in long format:
#' one row per (athlete × prop type). Each row has american / decimal /
#' fraction odds plus the current target (e.g. over/under line). Hits the
#' core-v2 `competitions/{id}/odds/{provider_id}/propBets` endpoint and
#' auto-paginates.
#'
#' @param event_id ESPN event identifier.
#' @param provider_id Sportsbook provider id (e.g. 58 = ESPN BET,
#'   100 = Caesars). Look up via [espn_wnba_event_odds()].
#' @param ... Additional arguments; currently unused.
#' @return A long tibble with one row per (athlete × prop type).
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_propbets(event_id = 401812680, provider_id = 58)
#' }
espn_wnba_event_propbets <- function(event_id, provider_id, ...) {
  .espn_basketball_event_propbets(league = "wnba", event_id = event_id,
                                    provider_id = provider_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_competitor_linescores
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Competitor Linescores (Per-Quarter)**
#' @name espn_wnba_event_competitor_linescores
NULL
#' @title
#' **Get ESPN WNBA Event Competitor Linescores (Per-Quarter)**
#' @rdname espn_wnba_event_competitor_linescores
#' @author Saiem Gilani
#' @description
#' Returns the per-quarter scoring breakdown for one team in one NBA
#' event. One row per period (regulation quarters + any overtime
#' periods).
#'
#' @param event_id ESPN event identifier.
#' @param team_id ESPN team identifier (the competitor whose linescore
#'   to fetch).
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per period.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_competitor_linescores(event_id = 401812680, team_id = 5)
#' }
espn_wnba_event_competitor_linescores <- function(event_id, team_id, ...) {
  .espn_basketball_event_competitor_linescores(league = "wnba",
                                                  event_id = event_id,
                                                  team_id = team_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_competitor_leaders
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Competitor Leaders (Top Performers)**
#' @name espn_wnba_event_competitor_leaders
NULL
#' @title
#' **Get ESPN WNBA Event Competitor Leaders (Top Performers)**
#' @rdname espn_wnba_event_competitor_leaders
#' @author Saiem Gilani
#' @description
#' Returns the per-team statistical leaders for one WNBA event in long
#' format: one row per (category x athlete rank). Categories typically
#' include points, rebounds, assists, and rating.
#'
#' @param event_id ESPN event identifier.
#' @param team_id ESPN team identifier.
#' @param ... Additional arguments; currently unused.
#' @return A long tibble with one row per (category x rank).
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_competitor_leaders(event_id = 401812680, team_id = 5)
#' }
espn_wnba_event_competitor_leaders <- function(event_id, team_id, ...) {
  .espn_basketball_event_competitor_leaders(league = "wnba",
                                              event_id = event_id,
                                              team_id = team_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_competitor_roster
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Competitor Roster (Game-Day)**
#' @name espn_wnba_event_competitor_roster
NULL
#' @title
#' **Get ESPN WNBA Event Competitor Roster (Game-Day)**
#' @rdname espn_wnba_event_competitor_roster
#' @author Saiem Gilani
#' @description
#' Returns the game-day roster index for one team in one WNBA event.
#' Each row carries the athlete id and the core-v2 `$ref` URL — use
#' the ref to dereference athlete-game splits or biographical data.
#'
#' @param event_id ESPN event identifier.
#' @param team_id ESPN team identifier.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per active athlete.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_competitor_roster(event_id = 401812680, team_id = 5)
#' }
espn_wnba_event_competitor_roster <- function(event_id, team_id, ...) {
  .espn_basketball_event_competitor_roster(league = "wnba",
                                             event_id = event_id,
                                             team_id = team_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_competitor_statistics
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Competitor Team Statistics (Long Format)**
#' @name espn_wnba_event_competitor_statistics
NULL
#' @title
#' **Get ESPN WNBA Event Competitor Team Statistics (Long Format)**
#' @rdname espn_wnba_event_competitor_statistics
#' @author Saiem Gilani
#' @description
#' Returns full team-game statistics for one team in one WNBA event in
#' long format: one row per (category x stat). Covers offensive,
#' defensive, and general categories with both raw values and display
#' strings.
#'
#' @param event_id ESPN event identifier.
#' @param team_id ESPN team identifier.
#' @param ... Additional arguments; currently unused.
#' @return A long tibble with one row per (category x stat).
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_competitor_statistics(event_id = 401812680, team_id = 5)
#' }
espn_wnba_event_competitor_statistics <- function(event_id, team_id, ...) {
  .espn_basketball_event_competitor_statistics(league = "wnba",
                                                 event_id = event_id,
                                                 team_id = team_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_competitor_records
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Competitor Records (At-Game Breakdown)**
#' @name espn_wnba_event_competitor_records
NULL
#' @title
#' **Get ESPN WNBA Event Competitor Records (At-Game Breakdown)**
#' @rdname espn_wnba_event_competitor_records
#' @author Saiem Gilani
#' @description
#' Returns team records as of the given WNBA event: overall, home,
#' away, conference, and division breakdowns where available. One row
#' per record type.
#'
#' @param event_id ESPN event identifier.
#' @param team_id ESPN team identifier.
#' @param ... Additional arguments; currently unused.
#' @return A tibble with one row per record type.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_competitor_records(event_id = 401812680, team_id = 5)
#' }
espn_wnba_event_competitor_records <- function(event_id, team_id, ...) {
  .espn_basketball_event_competitor_records(league = "wnba",
                                              event_id = event_id,
                                              team_id = team_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_player_box
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Player Box Score (Long Format)**
#' @name espn_wnba_event_player_box
NULL
#' @title
#' **Get ESPN WNBA Event Player Box Score (Long Format)**
#' @rdname espn_wnba_event_player_box
#' @author Saiem Gilani
#' @description
#' Returns the long-format per-game box score for a single athlete in one
#' WNBA event. One row per (category x stat). Same shape as
#' [espn_wnba_event_competitor_statistics()] but scoped to a single
#' athlete-in-event instead of the full team. `stat_type` defaults to 0
#' (regular-season aggregate as ESPN tags it for finished events).
#'
#' @param event_id ESPN event identifier.
#' @param team_id ESPN team identifier (the competitor the athlete played for).
#' @param athlete_id ESPN athlete identifier.
#' @param stat_type Integer stat-type segment. Defaults to 0 (the only type
#'   commonly populated for finished events).
#' @param ... Additional arguments; currently unused.
#' @return A long tibble with one row per (category x stat).
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_player_box(event_id = 401283399, team_id = 29,
#'                                athlete_id = 4066392)
#' }
espn_wnba_event_player_box <- function(event_id, team_id, athlete_id,
                                        stat_type = 0L, ...) {
  .espn_basketball_event_player_box(league = "wnba",
                                       event_id = event_id,
                                       team_id = team_id,
                                       athlete_id = athlete_id,
                                       stat_type = stat_type, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_competitor_roster_entry
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Competitor Roster Entry (Per-Athlete Game-Day Row)**
#' @name espn_wnba_event_competitor_roster_entry
NULL
#' @title
#' **Get ESPN WNBA Event Competitor Roster Entry (Per-Athlete Game-Day Row)**
#' @rdname espn_wnba_event_competitor_roster_entry
#' @author Saiem Gilani
#' @description
#' Returns a single-row tibble describing one athlete's game-day roster
#' entry for one WNBA event. Carries the **starter** flag, **didNotPlay**
#' flag with reason, ejection flag, and the substitution slot if the
#' athlete came in for another player. Pair with
#' [espn_wnba_event_competitor_roster()] to enumerate the roster.
#'
#' @param event_id ESPN event identifier.
#' @param team_id ESPN team identifier.
#' @param athlete_id ESPN athlete identifier.
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_competitor_roster_entry(event_id = 401283399,
#'                                             team_id = 29,
#'                                             athlete_id = 4066392)
#' }
espn_wnba_event_competitor_roster_entry <- function(event_id, team_id,
                                                     athlete_id, ...) {
  .espn_basketball_event_competitor_roster_entry(league = "wnba",
                                                   event_id = event_id,
                                                   team_id = team_id,
                                                   athlete_id = athlete_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_play
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Play Detail (Single Play)**
#' @name espn_wnba_event_play
NULL
#' @title
#' **Get ESPN WNBA Event Play Detail (Single Play)**
#' @rdname espn_wnba_event_play
#' @author Saiem Gilani
#' @description
#' Returns the rich detail block for a single WNBA play: sequence, period,
#' clock, text, scoring/shooting flags, current home/away score, team
#' `$ref`, and shot coordinates if applicable. Complements the bulk
#' [espn_wnba_pbp()] output by exposing the canonical core-v2 play record.
#'
#' @param event_id ESPN event identifier.
#' @param play_id ESPN play identifier (visible in `pbp()` output as
#'   `play_id` or extractable from `plays[].$ref`).
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_play(event_id = 401283399, play_id = 4012833997)
#' }
espn_wnba_event_play <- function(event_id, play_id, ...) {
  .espn_basketball_event_play(league = "wnba",
                                event_id = event_id,
                                play_id = play_id, ...)
}

# ---------------------------------------------------------------------------
# espn_wnba_event_play_personnel
# ---------------------------------------------------------------------------

#' **Get ESPN WNBA Event Play Personnel (On-Court Lineup at Play)**
#' @name espn_wnba_event_play_personnel
NULL
#' @title
#' **Get ESPN WNBA Event Play Personnel (On-Court Lineup at Play)**
#' @rdname espn_wnba_event_play_personnel
#' @author Saiem Gilani
#' @description
#' Returns the players on court at a specific WNBA play in long format
#' (one row per athlete entry across both competitors). Foundation for
#' lineup analysis. ESPN coverage is sparse — many plays return zero
#' rows; the wrapper returns a typed empty tibble in that case.
#'
#' @param event_id ESPN event identifier.
#' @param play_id ESPN play identifier.
#' @param ... Additional arguments; currently unused.
#' @return A long tibble with one row per on-court athlete.
#' @export
#' @family ESPN WNBA Functions
#' @examples
#' \donttest{
#'   espn_wnba_event_play_personnel(event_id = 401283399, play_id = 4012833997)
#' }
espn_wnba_event_play_personnel <- function(event_id, play_id, ...) {
  .espn_basketball_event_play_personnel(league = "wnba",
                                          event_id = event_id,
                                          play_id = play_id, ...)
}

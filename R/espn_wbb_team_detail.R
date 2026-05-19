# espn_wbb_team_detail.R
# Public WBB shims for ESPN team-detail endpoints.
# These are thin wrappers over the internal helpers in espn_basketball_team_helpers.R.

# ---------------------------------------------------------------------------
# espn_wbb_team
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Team Detail**
#' @name espn_wbb_team
NULL
#' @title
#' **Get ESPN Women's College Basketball Team Detail**
#' @rdname espn_wbb_team
#' @author Saiem Gilani
#' @param team_id ESPN team identifier (character or numeric).
#' @param season Season year (numeric, e.g. 2025). Defaults to the most
#'   recent WBB season.
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A named list of data frames: `Info`, `Record`, `NextEvent`,
#'   `StandingSummary`, `Coaches`.
#'
#'    **Info**
#'
#'    |col_name           |types     |description                                |
#'    |:------------------|:---------|:------------------------------------------|
#'    |id                 |character |Unique play identifcation number           |
#'    |uid                |character |ESPN UID string (universal identifier).    |
#'    |slug               |character |URL-safe identifier.                       |
#'    |abbreviation       |character |Short abbreviation.                        |
#'    |display_name       |character |Display name.                              |
#'    |short_display_name |character |Short display name.                        |
#'    |name               |character |Display name.                              |
#'    |nickname           |character |Team or athlete nickname.                  |
#'    |location           |character |Filter results by game location.           |
#'    |color              |character |Primary color (hex without leading '#').   |
#'    |alternate_color    |character |Alternate color (hex without leading '#'). |
#'    |logo               |character |Team or league logo URL.                   |
#'
#'    **Record**
#'
#'    |col_name |types     |description             |
#'    |:--------|:---------|:-----------------------|
#'    |type     |character |Record type / category. |
#'    |summary  |character |Summary.                |
#'    |stats    |list      |Stats.                  |
#'
#'    **NextEvent**
#'
#'    |col_name   |types     |description                      |
#'    |:----------|:---------|:--------------------------------|
#'    |id         |character |Unique play identifcation number |
#'    |date       |character |Date in YYYY-MM-DD format.       |
#'    |name       |character |Display name.                    |
#'    |short_name |character |Short display name.              |
#'
#'    **StandingSummary**
#'
#'    |col_name         |types     |description       |
#'    |:----------------|:---------|:-----------------|
#'    |standing_summary |character |Standing summary. |
#'
#'    **Coaches**
#'
#'    |col_name   |types     |description                       |
#'    |:----------|:---------|:---------------------------------|
#'    |id         |character |Unique play identifcation number  |
#'    |first_name |character |Player's first name.              |
#'    |last_name  |character |Player's last name.               |
#'    |experience |integer   |Years of professional experience. |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble select any_of bind_rows
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_team(team_id = "2509", season = 2025)
#' }
espn_wbb_team <- function(team_id,
                           season = most_recent_wbb_season(),
                           ...) {
  .espn_basketball_team(
    league   = "womens-college-basketball",
    team_id  = team_id,
    season   = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_team_roster
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Team Roster**
#' @name espn_wbb_team_roster
NULL
#' @title
#' **Get ESPN Women's College Basketball Team Roster**
#' @rdname espn_wbb_team_roster
#' @author Saiem Gilani
#' @param team_id ESPN team identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A single tibble with one row per athlete.
#'
#'    |col_name        |types     |description                                            |
#'    |:---------------|:---------|:------------------------------------------------------|
#'    |athlete_id      |character |Unique athlete identifier (ESPN).                      |
#'    |full_name       |character |Player's full name.                                    |
#'    |jersey          |character |Jersey number worn by the player.                      |
#'    |position_abbrev |character |Abbreviation for position.                             |
#'    |position_name   |character |Listed roster position ('Guard', 'Forward', 'Center'). |
#'    |height          |character |Player height (string e.g. '6-2' or inches).           |
#'    |weight          |character |Player weight in pounds.                               |
#'    |age             |character |Player age (in years).                                 |
#'    |birth_date      |character |Date of birth (YYYY-MM-DD).                            |
#'    |birth_place     |character |Place of birth.                                        |
#'    |headshot        |character |Headshot image URL.                                    |
#'    |link_web        |character |Web link / URL.                                        |
#'    |status          |character |Status label.                                          |
#'    |team_id         |character |Unique team identifier.                                |
#'    |season          |integer   |Season identifier (4-digit year or 'YYYY-YY' string).  |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_team_roster(team_id = "2509", season = 2025)
#' }
espn_wbb_team_roster <- function(team_id,
                                  season = most_recent_wbb_season(),
                                  ...) {
  .espn_basketball_team_roster(
    league   = "womens-college-basketball",
    team_id  = team_id,
    season   = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_team_schedule
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Team Schedule**
#' @name espn_wbb_team_schedule
NULL
#' @title
#' **Get ESPN Women's College Basketball Team Schedule**
#' @rdname espn_wbb_team_schedule
#' @author Saiem Gilani
#' @param team_id ESPN team identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param season_type Integer season type: 1 = preseason, 2 = regular (default),
#'   3 = postseason.
#' @param ... Additional arguments; currently unused.
#' @return A single tibble with one row per event.
#'
#'    |col_name               |types     |description                                                                                                        |
#'    |:----------------------|:---------|:------------------------------------------------------------------------------------------------------------------|
#'    |event_id               |character |Unique event / game identifier (ESPN).                                                                             |
#'    |season                 |integer   |Season identifier (4-digit year or 'YYYY-YY' string).                                                              |
#'    |season_type            |integer   |Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
#'    |week                   |integer   |Week number within the season.                                                                                     |
#'    |date                   |character |Date in YYYY-MM-DD format.                                                                                         |
#'    |name                   |character |Display name.                                                                                                      |
#'    |short_name             |character |Short display name.                                                                                                |
#'    |opponent_id            |character |Unique identifier for opponent.                                                                                    |
#'    |opponent_abbrev        |character |Abbreviation for opponent.                                                                                         |
#'    |home_away              |character |Game venue label ('home' or 'away').                                                                               |
#'    |neutral_site           |logical   |Neutral site.                                                                                                      |
#'    |conference_competition |logical   |Conference competition.                                                                                            |
#'    |venue_id               |character |Unique venue identifier.                                                                                           |
#'    |venue_name             |character |Venue name.                                                                                                        |
#'    |venue_city             |character |Venue city.                                                                                                        |
#'    |venue_state            |character |Venue state / region.                                                                                              |
#'    |broadcast              |character |Broadcast information string.                                                                                      |
#'    |result                 |character |Result.                                                                                                            |
#'    |team_score             |character |Team's score / final score.                                                                                        |
#'    |opponent_score         |character |Opponent score.                                                                                                    |
#'    |winner                 |logical   |Winner.                                                                                                            |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_team_schedule(team_id = "2509", season = 2025)
#' }
espn_wbb_team_schedule <- function(team_id,
                                    season      = most_recent_wbb_season(),
                                    season_type = 2,
                                    ...) {
  .espn_basketball_team_schedule(
    league      = "womens-college-basketball",
    team_id     = team_id,
    season      = season,
    season_type = season_type,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_team_leaders
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Team Leaders**
#' @name espn_wbb_team_leaders
NULL
#' @title
#' **Get ESPN Women's College Basketball Team Leaders**
#' @rdname espn_wbb_team_leaders
#' @author Saiem Gilani
#' @param team_id ESPN team identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A single long-format tibble (one row per category-rank-athlete).
#'
#'    |col_name     |types     |description                                                 |
#'    |:------------|:---------|:-----------------------------------------------------------|
#'    |team_id      |character |Unique team identifier.                                     |
#'    |season       |integer   |Season identifier (4-digit year or 'YYYY-YY' string).       |
#'    |category     |character |Category label.                                             |
#'    |display_name |character |Display name.                                               |
#'    |athlete_id   |character |Unique athlete identifier (ESPN).                           |
#'    |athlete_name |character |Athlete display name (ESPN).                                |
#'    |value        |numeric   |Numeric or string value field.                              |
#'    |rank         |integer   |Whether to include statistical ranks in the returned table. |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_team_leaders(team_id = "2509", season = 2025)
#' }
espn_wbb_team_leaders <- function(team_id,
                                   season = most_recent_wbb_season(),
                                   ...) {
  .espn_basketball_team_leaders(
    league   = "womens-college-basketball",
    team_id  = team_id,
    season   = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_team_season_profile
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Team-in-Season Profile**
#' @name espn_wbb_team_season_profile
NULL
#' @title
#' **Get ESPN WBB Team-in-Season Profile**
#' @rdname espn_wbb_team_season_profile
#' @author Saiem Gilani
#' @description
#' Era-correct team identity for a women's college basketball program in a
#' specific season, plus the available `$ref` URLs for deeper resources
#' (record, statistics, leaders, athletes/roster, coaches, college, etc.).
#' Backed by the core-v2 endpoint
#' `sports.core.api.espn.com/v2/sports/basketball/leagues/womens-college-basketball/seasons/{season}/teams/{team_id}`.
#'
#' Historical depth goes back to **1982** at ESPN (NCAA-tournament-era
#' forward). Older seasons return fewer `$ref` keys; missing refs become `NA`.
#'
#' @param team_id ESPN team identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A single-row tibble with team identity scalars and `_ref` URL
#'   columns. Selected columns:
#'
#'    |col_name              |types     |description                                       |
#'    |:---------------------|:---------|:-------------------------------------------------|
#'    |id                    |character |ESPN team identifier.                             |
#'    |guid                  |character |Stable cross-league team GUID.                    |
#'    |uid                   |character |ESPN UID string.                                  |
#'    |slug                  |character |URL-safe identifier.                              |
#'    |location              |character |School/program location (e.g. "UConn").           |
#'    |name                  |character |Team name (e.g. "Huskies").                       |
#'    |nickname              |character |Common nickname (often same as location).         |
#'    |abbreviation          |character |Short abbreviation (e.g. "CONN").                 |
#'    |display_name          |character |Full display name.                                |
#'    |short_display_name    |character |Short display name.                               |
#'    |color                 |character |Primary color (hex, no leading '#').              |
#'    |alternate_color       |character |Alternate color (hex, no leading '#').            |
#'    |is_active             |logical   |Whether the team was active in this season.       |
#'    |season                |integer   |Season year.                                      |
#'    |logo                  |character |Primary logo URL.                                 |
#'    |logo_dark             |character |Dark-mode logo URL.                               |
#'    |record_ref            |character |`$ref` to team record resource.                   |
#'    |statistics_ref        |character |`$ref` to team statistics resource.               |
#'    |athletes_ref          |character |`$ref` to team roster resource (college-only).    |
#'    |college_ref           |character |`$ref` to college (institution) resource.         |
#'    |coaches_ref           |character |`$ref` to team coaches resource.                  |
#'    |franchise_ref         |character |`$ref` to franchise resource.                     |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_team_season_profile(team_id = "2509", season = 2025)
#' }
espn_wbb_team_season_profile <- function(team_id,
                                          season = most_recent_wbb_season(),
                                          ...) {
  .espn_basketball_team_season_profile(
    league  = "womens-college-basketball",
    team_id = team_id,
    season  = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_team_season_statistics
# ---------------------------------------------------------------------------

#' **Get ESPN WBB Team Season Statistics (Long Format with Rank)**
#' @name espn_wbb_team_season_statistics
NULL
#' @title
#' **Get ESPN WBB Team Season Statistics (Long Format with Rank)**
#' @rdname espn_wbb_team_season_statistics
#' @author Saiem Gilani
#' @description
#' Returns the full team-season-type statistics sheet for one WBB team in
#' long format: one row per (category x stat). Each row carries the team's
#' league rank for that stat where ESPN provides it (`rank` +
#' `rank_display_value`). Complements W-L records (not directly wrapped for WBB)
#' with the full stat package.
#'
#' @param team_id ESPN team identifier.
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param season_type Integer season type: 1 = preseason, 2 = regular
#'   (default), 3 = postseason.
#' @param ... Additional arguments; currently unused.
#' @return A long tibble with one row per (category x stat).
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_team_season_statistics(team_id = 2509, season = 2024)
#' }
espn_wbb_team_season_statistics <- function(team_id,
                                              season      = most_recent_wbb_season(),
                                              season_type = 2L,
                                              ...) {
  .espn_basketball_team_season_statistics(league = "womens-college-basketball",
                                            team_id = team_id,
                                            season = season,
                                            season_type = season_type, ...)
}

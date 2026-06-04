# espn_wbb_athletes.R
# Public WBB shims for ESPN athlete endpoints.
# These are thin wrappers over the internal helpers in
# espn_basketball_athlete_helpers.R.

# ---------------------------------------------------------------------------
# espn_wbb_player_info
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Athlete Info**
#' @name espn_wbb_player_info
NULL
#' @title
#' **Get ESPN Women's College Basketball Athlete Info**
#' @rdname espn_wbb_player_info
#' @author Saiem Gilani
#' @param athlete_id ESPN athlete identifier (character or numeric).
#' @param ... Additional arguments; currently unused but retained for
#'   forward compatibility. Proxy configuration should use
#'   `options(wehoop.proxy = ...)` -- see `?wehoop` for details.
#' @return A named list of data frames: `Bio`, `Team`, `Position`,
#'   `Status`, `College`, `Draft`.
#'
#'    **Bio**
#'
#'    |col_name      |types     |description                       |
#'    |:-------------|:---------|:---------------------------------|
#'    |id            |character |Unique play identifcation number  |
#'    |full_name     |character |Player's full name.               |
#'    |display_name  |character |Display name.                     |
#'    |jersey        |character |Jersey number worn by the player. |
#'    |age           |character |Player age (in years).            |
#'    |date_of_birth |character |Date of birth (YYYY-MM-DD).       |
#'    |headshot_href |character |Headshot image URL.               |
#'
#'    **Team**
#'
#'    |col_name     |types     |description                      |
#'    |:------------|:---------|:--------------------------------|
#'    |id           |character |Unique play identifcation number |
#'    |abbreviation |character |Short abbreviation.              |
#'    |display_name |character |Display name.                    |
#'
#'    **Position**
#'
#'    |col_name     |types     |description                      |
#'    |:------------|:---------|:--------------------------------|
#'    |id           |character |Unique play identifcation number |
#'    |name         |character |Display name.                    |
#'    |abbreviation |character |Short abbreviation.              |
#'
#'    **Status**
#'
#'    |col_name |types     |description                      |
#'    |:--------|:---------|:--------------------------------|
#'    |id       |character |Unique play identifcation number |
#'    |name     |character |Display name.                    |
#'    |type     |character |Record type / category.          |
#'
#'    **College**
#'
#'    |col_name |types     |description                      |
#'    |:--------|:---------|:--------------------------------|
#'    |id       |character |Unique play identifcation number |
#'    |name     |character |Display name.                    |
#'    |mascot   |character |Team mascot.                     |
#'
#'    **Draft**
#'
#'    |col_name  |types     |description                 |
#'    |:---------|:---------|:---------------------------|
#'    |year      |character |4-digit year.               |
#'    |round     |character |Tournament / playoff round. |
#'    |selection |character |Selection.                  |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble select any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_player_info(athlete_id = "4433404")
#' }
espn_wbb_player_info <- function(athlete_id, ...) {
  .espn_basketball_athlete_info(
    league     = "womens-college-basketball",
    athlete_id = athlete_id,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_player_overview
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Athlete Overview**
#' @name espn_wbb_player_overview
NULL
#' @title
#' **Get ESPN Women's College Basketball Athlete Overview**
#' @rdname espn_wbb_player_overview
#' @author Saiem Gilani
#' @param athlete_id ESPN athlete identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A named list of data frames: `Statistics`, `NextGame`,
#'   `Last5Games`, `Headlines`, `FantasyOutlook`.
#'
#'    **Statistics**
#'
#'    |col_name |types     |description |
#'    |:--------|:---------|:-----------|
#'    |(varies) |character |            |
#'
#'    **NextGame**
#'
#'    |col_name   |types     |description                      |
#'    |:----------|:---------|:--------------------------------|
#'    |id         |character |Unique play identifcation number |
#'    |date       |character |Date in YYYY-MM-DD format.       |
#'    |name       |character |Display name.                    |
#'    |short_name |character |Short display name.              |
#'
#'    **Last5Games**
#'
#'    |col_name |types     |description |
#'    |:--------|:---------|:-----------|
#'    |(varies) |character |            |
#'
#'    **Headlines**
#'
#'    |col_name    |types     |description                       |
#'    |:-----------|:---------|:---------------------------------|
#'    |headline    |character |News headline.                    |
#'    |description |character |Long-form description text.       |
#'    |published   |character |Publication timestamp (ISO 8601). |
#'
#'    **FantasyOutlook**
#'
#'    |col_name |types     |description |
#'    |:--------|:---------|:-----------|
#'    |(varies) |character |            |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble select any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_player_overview(athlete_id = "4433404", season = 2025)
#' }
espn_wbb_player_overview <- function(athlete_id,
                                      season = most_recent_wbb_season(),
                                      ...) {
  .espn_basketball_athlete_overview(
    league     = "womens-college-basketball",
    athlete_id = athlete_id,
    season     = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_player_stats_v3
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Athlete Stats**
#' @name espn_wbb_player_stats_v3
NULL
#' @title
#' **Get ESPN Women's College Basketball Athlete Stats**
#' @rdname espn_wbb_player_stats_v3
#' @author Saiem Gilani
#' @param athlete_id ESPN athlete identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A wide `wehoop_data` tibble, one row per athlete-season-team, with
#'   the ESPN stat categories spread across prefixed columns:
#'
#'    |col_name      |types     |description                                              |
#'    |:-------------|:---------|:--------------------------------------------------------|
#'    |athlete_id    |character |ESPN athlete identifier (echoed input).                  |
#'    |season        |integer   |Season year for the stat line.                           |
#'    |team_id       |character |ESPN team identifier for that season.                    |
#'    |team_slug     |character |Team slug (e.g. 'iowa-hawkeyes').                        |
#'    |avg_*         |numeric   |Per-game season-average stats (e.g. `avg_avg_points`).   |
#'    |tot_*         |numeric   |Season-total stats (e.g. `tot_points`).                  |
#'    |misc_*        |numeric   |Miscellaneous season totals.                             |
#'
#'   Stat column names come from ESPN's positional `names` array per category,
#'   cleaned via [janitor::make_clean_names()]; the exact set varies by league
#'   and season.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble select any_of bind_rows bind_cols full_join mutate relocate across arrange tibble
#' @importFrom janitor clean_names make_clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_player_stats_v3(athlete_id = "4433985", season = 2025)
#' }
espn_wbb_player_stats_v3 <- function(athlete_id,
                                   season = most_recent_wbb_season(),
                                   ...) {
  .espn_basketball_athlete_stats(
    league     = "womens-college-basketball",
    athlete_id = athlete_id,
    season     = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_player_gamelog
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Athlete Gamelog**
#' @name espn_wbb_player_gamelog
NULL
#' @title
#' **Get ESPN Women's College Basketball Athlete Gamelog**
#' @rdname espn_wbb_player_gamelog
#' @author Saiem Gilani
#' @param athlete_id ESPN athlete identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A single tibble with one row per game. Column names reflect the
#'   stat labels returned by ESPN and will vary by season and player.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_player_gamelog(athlete_id = "4433404", season = 2025)
#' }
espn_wbb_player_gamelog <- function(athlete_id,
                                     season = most_recent_wbb_season(),
                                     ...) {
  .espn_basketball_athlete_gamelog(
    league     = "womens-college-basketball",
    athlete_id = athlete_id,
    season     = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_player_splits
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Athlete Splits**
#' @name espn_wbb_player_splits
NULL
#' @title
#' **Get ESPN Women's College Basketball Athlete Splits**
#' @rdname espn_wbb_player_splits
#' @author Saiem Gilani
#' @param athlete_id ESPN athlete identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A single long-format tibble. When data are present, columns include
#'   at minimum `category` and `split_name`, plus per-stat columns driven by
#'   ESPN labels.
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows select any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_player_splits(athlete_id = "4433404", season = 2025)
#' }
espn_wbb_player_splits <- function(athlete_id,
                                    season = most_recent_wbb_season(),
                                    ...) {
  .espn_basketball_athlete_splits(
    league     = "womens-college-basketball",
    athlete_id = athlete_id,
    season     = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_player_eventlog
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Athlete Eventlog**
#' @name espn_wbb_player_eventlog
NULL
#' @title
#' **Get ESPN Women's College Basketball Athlete Eventlog**
#' @rdname espn_wbb_player_eventlog
#' @author Saiem Gilani
#' @param athlete_id ESPN athlete identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A single tibble. Per-event `statistics.$ref` URLs from the ESPN
#'   core-v2 API are returned as the character column `statistics_ref` and
#'   are NOT resolved. Similarly, `event_ref`, `competition_ref`, and
#'   `team_ref` are returned as character columns.
#'
#'    |col_name        |types     |description                              |
#'    |:---------------|:---------|:----------------------------------------|
#'    |event_ref       |character |Reference link to the originating event. |
#'    |competition_ref |character |Competition ref.                         |
#'    |team_ref        |character |Team ref.                                |
#'    |statistics_ref  |character |Statistics ref.                          |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_player_eventlog(athlete_id = "4433404", season = 2025)
#' }
espn_wbb_player_eventlog <- function(athlete_id,
                                      season = most_recent_wbb_season(),
                                      ...) {
  .espn_basketball_athlete_eventlog(
    league     = "womens-college-basketball",
    athlete_id = athlete_id,
    season     = season,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_player_awards
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Athlete Awards**
#' @name espn_wbb_player_awards
NULL
#' @title
#' **Get ESPN Women's College Basketball Athlete Awards**
#' @rdname espn_wbb_player_awards
#' @author Saiem Gilani
#' @param athlete_id ESPN athlete identifier (character or numeric).
#' @param ... Additional arguments; currently unused.
#' @return A single tibble. This endpoint is sparse; many athletes have no
#'   award data, in which case an empty tibble with canonical columns is
#'   returned.
#'
#'    |col_name    |types     |description                                           |
#'    |:-----------|:---------|:-----------------------------------------------------|
#'    |season      |character |Season identifier (4-digit year or 'YYYY-YY' string). |
#'    |award_id    |character |Unique identifier for award.                          |
#'    |name        |character |Display name.                                         |
#'    |description |character |Long-form description text.                           |
#'    |date        |character |Date in YYYY-MM-DD format.                            |
#'    |type        |character |Record type / category.                               |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble select any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_player_awards(athlete_id = "4433404")
#' }
espn_wbb_player_awards <- function(athlete_id, ...) {
  .espn_basketball_athlete_awards(
    league     = "womens-college-basketball",
    athlete_id = athlete_id,
    ...
  )
}

# ---------------------------------------------------------------------------
# espn_wbb_player_statisticslog
# ---------------------------------------------------------------------------

#' **Get ESPN Women's College Basketball Athlete Statisticslog**
#' @name espn_wbb_player_statisticslog
NULL
#' @title
#' **Get ESPN Women's College Basketball Athlete Statisticslog**
#' @rdname espn_wbb_player_statisticslog
#' @author Saiem Gilani
#' @param athlete_id ESPN athlete identifier (character or numeric).
#' @param season Season year (numeric). Defaults to the most recent WBB season.
#' @param ... Additional arguments; currently unused.
#' @return A single tibble. When resolved, each row corresponds to one
#'   statistical entry in the core-v2 statistics log, with `event_ref` and
#'   `statistics_ref` character columns pointing to resolvable ESPN endpoints.
#'
#'    |col_name       |types     |description                              |
#'    |:--------------|:---------|:----------------------------------------|
#'    |event_ref      |character |Reference link to the originating event. |
#'    |statistics_ref |character |Statistics ref.                          |
#'
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble bind_rows any_of
#' @importFrom janitor clean_names
#' @export
#' @family ESPN WBB Functions
#' @examples
#' \donttest{
#'   espn_wbb_player_statisticslog(athlete_id = "4433404", season = 2025)
#' }
espn_wbb_player_statisticslog <- function(athlete_id,
                                           season = most_recent_wbb_season(),
                                           ...) {
  .espn_basketball_athlete_statisticslog(
    league     = "womens-college-basketball",
    athlete_id = athlete_id,
    season     = season,
    ...
  )
}

# **Load wehoop WNBA Stats Shots**

Loads shot events scraped from the WNBA Stats API
(`shotchartdetail`-style outputs). One row per shot attempt with court
coordinates, shot type, distance, and made/missed flag. Backed by the
`wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_shots` release tag.

`load_wnba_stats_shots_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats shots release tag without downloading any season's full data.

## Usage

``` r
load_wnba_stats_shots(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_shots_manifest()
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  1997)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the shots data table within the database

## Value

Returns a `wehoop_data` tibble with one row per shot attempt.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| game_id | character | Unique game identifier. |
| game_event_id | character | Unique identifier for game event. |
| player_id | character | Unique player identifier. |
| player_name | character | Player name. |
| team_id | character | Unique team identifier. |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| period | integer | Period of the game (1-4 quarters; 5+ for OT). |
| minutes_remaining | integer | Minutes remaining. |
| seconds_remaining | integer | Seconds remaining in the period. |
| event_type | character | Event / play type code (V2 PBP). |
| action_type | character | Action type label (e.g. 'Made Shot', 'Substitution'). |
| shot_type | character | Shot type label (e.g. 'Jump Shot', 'Layup'). |
| shot_zone_basic | character | Shot zone (e.g. 'Restricted Area', 'Mid-Range', 'Above the Break 3'). |
| shot_zone_area | character | Shot zone area ('Left Side', 'Right Side', 'Center'). |
| shot_zone_range | character | Shot zone range ('Less Than 8 ft.', '8-16 ft.', '16-24 ft.', etc.). |
| shot_distance | numeric | Shot distance from the basket, in feet. |
| loc_x | numeric | X coordinate on the court (units of inches; 0 = basket center). |
| loc_y | numeric | Y coordinate on the court (units of inches; baseline at 0). |
| coordinate_x | numeric | X coordinate on the court (half-court layout). |
| coordinate_y | numeric | Y coordinate on the court (half-court layout). |
| shot_attempted_flag | integer | 1 if a shot was attempted on this event. |
| shot_made_flag | integer | 1 if the shot was made; 0 if missed. |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_shots(seasons = most_recent_wnba_stats_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_shots/shots_2026.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_shots/shots_2026.rds>
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 0 × 0
# }
```

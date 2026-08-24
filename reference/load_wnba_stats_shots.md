# **Load wehoop WNBA Stats Shots**

Loads shot events scraped from the WNBA Stats API. One row per shot
attempt with legacy court coordinates, action/sub type, distance, and
made/missed result, carried through from the V3 play-by-play feed (not
`shotchartdetail`). Backed by the `wehoop-wnba-stats-data` pipeline that
reads raw JSONs from `wehoop-wnba-stats-raw` and publishes parquet/rds
artifacts to the `wnba_stats_shots` release tag.

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

  A vector of 4-digit years associated with given WNBA seasons.
  Published coverage runs 1997 through the most recent season, with no
  gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)

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
| game_id | character | Unique game identifier. |
| season | integer | Season identifier (4-digit year). |
| period | integer | Period of the game (1-4 quarters; 5+ for OT). |
| clock | character | Game clock remaining in the period (ISO 8601 duration). |
| team_id | integer | Unique team identifier for the shooting team. |
| team_tricode | character | Three-letter team code (e.g. 'LAS' / 'NYL'). |
| person_id | integer | Unique player identifier for the shooter. |
| player_name | character | Shooter's name. |
| action_type | character | Action type label ('Made Shot' or 'Missed Shot'). |
| sub_type | character | Shot sub type (e.g. 'Jump Shot', 'Layup', 'DUNK'). |
| shot_result | character | Shot result, 'Made' or 'Missed'. |
| shot_value | integer | Points the shot was worth (2 or 3). |
| shot_distance | integer | Shot distance from the basket, in feet. |
| x_legacy | integer | Legacy X coordinate on the court (0 = basket center). |
| y_legacy | integer | Legacy Y coordinate on the court (baseline at 0). |
| description | character | Text description of the play. |
| score_home | character | Home team score after the play. |
| score_away | character | Away team score after the play. |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_possessions()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_possessions.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_shots(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 27,606 × 18
#>    game_id    season period clock     team_id team_tricode person_id player_name
#>    <chr>       <int>  <int> <chr>       <int> <chr>            <int> <chr>      
#>  1 1022600001   2026      1 PT09M44.…  1.61e9 CON            1642800 Morrow     
#>  2 1022600001   2026      1 PT09M25.…  1.61e9 NYL            1627668 Stewart    
#>  3 1022600001   2026      1 PT09M17.…  1.61e9 CON            1641649 Miller     
#>  4 1022600001   2026      1 PT08M34.…  1.61e9 NYL            1629546 Johannes   
#>  5 1022600001   2026      1 PT08M21.…  1.61e9 CON             203398 Griner     
#>  6 1022600001   2026      1 PT08M15.…  1.61e9 NYL            1631136 Astier     
#>  7 1022600001   2026      1 PT07M56.…  1.61e9 NYL            1631136 Astier     
#>  8 1022600001   2026      1 PT07M36.…  1.61e9 CON             203398 Griner     
#>  9 1022600001   2026      1 PT07M20.…  1.61e9 NYL            1629546 Johannes   
#> 10 1022600001   2026      1 PT07M06.…  1.61e9 NYL             204335 Laney-Hami…
#> # ℹ 27,596 more rows
#> # ℹ 10 more variables: action_type <chr>, sub_type <chr>, shot_result <chr>,
#> #   shot_value <int>, shot_distance <int>, x_legacy <int>, y_legacy <int>,
#> #   description <chr>, score_home <chr>, score_away <chr>
# }
```

# **Load wehoop WNBA Stats Play-by-Play**

Loads season-level WNBA play-by-play (V3 with on-court five-on-each-side
player IDs, supplied by
[`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md)
in the upstream compile script). Backed by the `wehoop-wnba-stats-data`
pipeline that publishes parquet/rds artifacts to the `wnba_stats_pbp`
release tag.

`load_wnba_stats_pbp_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats play-by-play release tag without downloading any season's
full data.

## Usage

``` r
load_wnba_stats_pbp(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_pbp_manifest()
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

  The name of the play-by-play data table within the database

## Value

Returns a `wehoop_data` tibble of per-event play-by-play rows.

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_pbp(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 86,784 × 25
#>    action_number clock       period   team_id team_tricode person_id player_name
#>            <int> <chr>        <int>     <int> <chr>            <int> <chr>      
#>  1             2 PT10M00.00S      1    0      ""              0      ""         
#>  2             4 PT10M00.00S      1    1.61e9 "NYL"           1.63e6 "Jones"    
#>  3             7 PT09M44.00S      1    1.61e9 "CON"           1.64e6 "Morrow"   
#>  4             8 PT09M39.00S      1    1.61e9 "NYL"           1.63e6 "Johannes" 
#>  5             9 PT09M25.00S      1    1.61e9 "NYL"           1.63e6 "Stewart"  
#>  6            11 PT09M17.00S      1    1.61e9 "CON"           1.64e6 "Miller"   
#>  7            13 PT09M06.00S      1    1.61e9 "NYL"           1.63e6 "Stewart"  
#>  8            15 PT08M50.00S      1    1.61e9 "CON"           2.03e5 "Griner"   
#>  9            16 PT08M50.00S      1    0      ""              1.61e9 ""         
#> 10            17 PT08M34.00S      1    1.61e9 "NYL"           1.63e6 "Johannes" 
#> # ℹ 86,774 more rows
#> # ℹ 18 more variables: player_name_i <chr>, x_legacy <int>, y_legacy <int>,
#> #   shot_distance <int>, shot_result <chr>, is_field_goal <int>,
#> #   score_home <chr>, score_away <chr>, points_total <int>, location <chr>,
#> #   description <chr>, action_type <chr>, sub_type <chr>,
#> #   video_available <int>, shot_value <int>, action_id <int>, game_id <chr>,
#> #   season <int>
# }
```

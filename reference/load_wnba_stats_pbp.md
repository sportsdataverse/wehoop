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
#> # A tibble: 24,317 × 85
#>    game_id    event_num event_type event_action_type period clock    minute_game
#>    <chr>      <chr>     <chr>      <chr>              <int> <chr>          <dbl>
#>  1 1022600001 2         12         0                      1 PT10M00…        0   
#>  2 1022600001 4         10         0                      1 PT10M00…        0   
#>  3 1022600001 7         2          1                      1 PT09M44…        0.27
#>  4 1022600001 8         4          0                      1 PT09M39…        0.35
#>  5 1022600001 9         1          47                     1 PT09M25…        0.58
#>  6 1022600001 11        1          73                     1 PT09M17…        0.72
#>  7 1022600001 13        5          4                      1 PT09M06…        0.9 
#>  8 1022600001 15        5          8                      1 PT08M50…        1.17
#>  9 1022600001 16        7          1                      1 PT08M50…        1.17
#> 10 1022600001 17        1          80                     1 PT08M34…        1.43
#> # ℹ 24,307 more rows
#> # ℹ 78 more variables: time_remaining <dbl>, time_quarter <chr>,
#> #   minute_remaining_quarter <int>, seconds_remaining_quarter <int>,
#> #   action_type <chr>, sub_type <chr>, neutral_description <chr>,
#> #   description <chr>, location <chr>, score <chr>, away_score <int>,
#> #   home_score <int>, score_margin <chr>, person1type <chr>, player1_id <chr>,
#> #   player1_name <chr>, player1_team_id <chr>, …
# }
```

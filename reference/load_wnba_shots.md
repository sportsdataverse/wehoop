# **Load wehoop WNBA Shots**

`load_wnba_shots_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
shots release tag without downloading any season's full data.

Loads shot events parsed from ESPN WNBA play-by-play feeds. One row per
shot attempt (made or missed), with court coordinates and shot metadata.
Backed by the `wehoop-wnba-data` pipeline that reads raw JSONs from
`wehoop-wnba-raw` and publishes parquet/rds artifacts to the
`espn_wnba_shots` release tag.

## Usage

``` r
load_wnba_shots_manifest()

load_wnba_shots(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2002)

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
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| period_number | integer | Numeric period (1-4 for quarters; 5+ for OT). |
| clock_display_value | character | Game clock display string (e.g. '8:32'). |
| team_id | character | Unique team identifier. |
| athlete_id_1 | character | Primary athlete identifier (e.g. shooter). |
| athlete_id_2 | character | Secondary athlete identifier (e.g. assister / fouler). |
| type_id | character | Type identifier (numeric). |
| type_text | character | Display text for the type field. |
| scoring_play | logical | TRUE if the play resulted in points scored. |
| score_value | integer | Point value of the play (2 / 3 / 1). |
| coordinate_x | numeric | X coordinate on the court (half-court layout). |
| coordinate_y | numeric | Y coordinate on the court (half-court layout). |
| coordinate_x_raw | numeric | X coordinate as returned by the API before any adjustment. |
| coordinate_y_raw | numeric | Y coordinate as returned by the API before any adjustment. |

## See also

Other WNBA loader functions:
[`load_wnba_draft_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md),
[`load_wnba_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_game_rosters.md),
[`load_wnba_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_officials.md),
[`load_wnba_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_stats.md),
[`load_wnba_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_rosters.md),
[`load_wnba_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_standings.md),
[`load_wnba_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_shots(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 5,130 × 15
#>      game_id season period_number clock_display_value team_id athlete_id_1
#>        <int>  <int>         <int> <chr>                 <int>        <int>
#>  1 401856915   2026             1 9:40                     17      3149391
#>  2 401856915   2026             1 9:23                     20      3058901
#>  3 401856915   2026             1 9:15                     17      2529122
#>  4 401856915   2026             1 8:54                     20      4433402
#>  5 401856915   2026             1 8:54                     20      4433402
#>  6 401856915   2026             1 8:36                     17      3149391
#>  7 401856915   2026             1 8:18                     20      4433431
#>  8 401856915   2026             1 8:00                     17      2529122
#>  9 401856915   2026             1 7:26                     20      3142250
#> 10 401856915   2026             1 7:03                     17      2529122
#> # ℹ 5,120 more rows
#> # ℹ 9 more variables: athlete_id_2 <int>, type_id <int>, type_text <chr>,
#> #   scoring_play <lgl>, score_value <int>, coordinate_x <dbl>,
#> #   coordinate_y <dbl>, coordinate_x_raw <dbl>, coordinate_y_raw <dbl>
# }
```

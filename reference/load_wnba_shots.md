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

|                     |           |
|---------------------|-----------|
| col_name            | types     |
| game_id             | character |
| season              | integer   |
| period_number       | integer   |
| clock_display_value | character |
| team_id             | character |
| athlete_id_1        | character |
| athlete_id_2        | character |
| type_id             | character |
| type_text           | character |
| scoring_play        | logical   |
| score_value         | integer   |
| coordinate_x        | numeric   |
| coordinate_y        | numeric   |
| coordinate_x_raw    | numeric   |
| coordinate_y_raw    | numeric   |

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
#> # A tibble: 2,047 × 15
#>      game_id season period_number clock_display_value team_id athlete_id_1
#>        <int>  <int>         <int> <chr>                 <int>        <int>
#>  1 401856896   2026             1 9:24                     14      4432830
#>  2 401856896   2026             1 9:08                     18      4433635
#>  3 401856896   2026             1 9:04                     18      2490553
#>  4 401856896   2026             1 8:47                     14      3906753
#>  5 401856896   2026             1 8:31                     18      4433514
#>  6 401856896   2026             1 8:24                     14      5220150
#>  7 401856896   2026             1 8:14                     18      3922628
#>  8 401856896   2026             1 8:13                     18      3922628
#>  9 401856896   2026             1 8:13                     18      3922628
#> 10 401856896   2026             1 7:58                     14      3906753
#> # ℹ 2,037 more rows
#> # ℹ 9 more variables: athlete_id_2 <int>, type_id <int>, type_text <chr>,
#> #   scoring_play <lgl>, score_value <int>, coordinate_x <dbl>,
#> #   coordinate_y <dbl>, coordinate_x_raw <dbl>, coordinate_y_raw <dbl>
# }
```

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
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_shots/shots_2026.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_shots/shots_2026.rds>
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 0 × 0
# }
```

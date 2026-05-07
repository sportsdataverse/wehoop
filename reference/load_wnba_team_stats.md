# **Load wehoop WNBA Team Season Stats**

`load_wnba_team_stats_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
team season stats release tag without downloading any season's full
data.

Loads season-level WNBA team statistics scraped from ESPN. One row per
team-season-statistic-grouping. Backed by the `wehoop-wnba-data`
pipeline that reads raw JSONs from `wehoop-wnba-raw` and publishes
parquet/rds artifacts to the `espn_wnba_team_season_stats` release tag.

## Usage

``` r
load_wnba_team_stats_manifest()

load_wnba_team_stats(
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

  The name of the team season stats table within the database

## Value

Returns a `wehoop_data` tibble of team season stats.

|                    |           |
|--------------------|-----------|
| col_name           | types     |
| season             | integer   |
| season_type        | integer   |
| team_id            | character |
| team_slug          | character |
| team_location      | character |
| team_name          | character |
| team_abbreviation  | character |
| team_display_name  | character |
| category           | character |
| stat_name          | character |
| stat_display_name  | character |
| stat_value         | numeric   |
| stat_display_value | character |
| stat_rank          | integer   |

## See also

Other WNBA loader functions:
[`load_wnba_draft_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md),
[`load_wnba_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_game_rosters.md),
[`load_wnba_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_officials.md),
[`load_wnba_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_stats.md),
[`load_wnba_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_rosters.md),
[`load_wnba_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_shots.md),
[`load_wnba_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_standings.md)

## Examples

``` r
# \donttest{
  try(load_wnba_team_stats(seasons = most_recent_wnba_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_team_season_stats/team_season_stats_2026.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_team_season_stats/team_season_stats_2026.rds>
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 0 × 0
# }
```

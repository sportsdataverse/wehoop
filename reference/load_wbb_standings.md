# **Load wehoop WBB Standings**

`load_wbb_standings_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
standings release tag without downloading any season's full data.

Loads season-level conference and overall standings scraped from ESPN.
One row per team-season. Backed by the `wehoop-wbb-data` pipeline that
reads raw JSONs from `wehoop-wbb-raw` and publishes parquet/rds
artifacts to the `espn_womens_college_basketball_standings` release tag.

## Usage

``` r
load_wbb_standings_manifest()

load_wbb_standings(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given women's college
  basketball seasons. (Min: 2002)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the standings data table within the database

## Value

Returns a `wehoop_data` tibble of team standings.

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
| conference_id      | character |
| conference_name    | character |
| wins               | integer   |
| losses             | integer   |
| win_percent        | numeric   |
| games_played       | integer   |
| points_for         | numeric   |
| points_against     | numeric   |
| point_differential | numeric   |
| streak             | character |

## See also

Other WBB loader functions:
[`load_wbb_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md),
[`load_wbb_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_officials.md),
[`load_wbb_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_stats.md),
[`load_wbb_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_rosters.md),
[`load_wbb_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_shots.md),
[`load_wbb_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wbb_standings(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_standings/standings_2026.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_standings/standings_2026.rds>
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 0 × 0
# }
```

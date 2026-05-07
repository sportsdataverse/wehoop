# **Load wehoop WNBA Stats Game Rosters**

Loads per-game rosters scraped from the WNBA Stats API
(`boxscoretraditionalv3`-style outputs). One row per athlete-team-game
triple with jersey, position, starter flag, and DNP status. Backed by
the `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_game_rosters` release tag.

`load_wnba_stats_game_rosters_manifest()` returns the per-season
manifest CSV (`season`, `row_count`, `generated_at_utc`,
`source_endpoint`) for the WNBA Stats game rosters release tag without
downloading any season's full data.

## Usage

``` r
load_wnba_stats_game_rosters(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_game_rosters_manifest()
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

  The name of the game rosters data table within the database

## Value

Returns a `wehoop_data` tibble with one row per athlete-team-game.

|              |           |
|--------------|-----------|
| col_name     | types     |
| season       | integer   |
| game_id      | character |
| team_id      | character |
| team_city    | character |
| team_name    | character |
| team_tricode | character |
| athlete_id   | character |
| first_name   | character |
| family_name  | character |
| name_i       | character |
| player_slug  | character |
| jersey_num   | character |
| position     | character |
| starter      | logical   |
| did_not_play | logical   |
| status       | character |
| comment      | character |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_game_rosters(seasons = most_recent_wnba_stats_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_game_rosters/game_rosters_2026.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_game_rosters/game_rosters_2026.rds>
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 0 × 0
# }
```

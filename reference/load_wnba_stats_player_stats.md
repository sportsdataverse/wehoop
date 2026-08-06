# **Load wehoop WNBA Stats Player Season Stats**

**\[deprecated\]** Loads season-level WNBA player statistics.
**Deprecated**: the `wnba_stats_player_season_stats` release tag
(R-scraped, `Base`/`Advanced`/`Misc`/`Scoring`/`Usage`/ `Defense`
measures) is superseded by the `wnba_stats_leaguedash` tag
(Python-scraped parameter cube, same 6 measure types plus `player_bio`
and a wide `player_master` mega). This function reshapes the cube back
into the old stacked-by-`measure_type` contract for compatibility; call
the cube's `player_stats_*` / `player_master` assets directly for the
full surface.

`load_wnba_stats_player_stats_manifest()` returns the per-season
manifest CSV (`season`, `row_count`, `generated_at_utc`,
`source_endpoint`) for the WNBA Stats player season stats release tag
without downloading any season's full data.

## Usage

``` r
load_wnba_stats_player_stats(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_player_stats_manifest()
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

  The name of the player season stats table within the database

## Value

Returns a `wehoop_data` tibble of player season stats.

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_player_stats(seasons = most_recent_wnba_stats_season()))
#> Warning: `load_wnba_stats_player_stats()` was deprecated in wehoop 3.0.0.
#> ℹ Backing data moved from the wnba_stats_player_season_stats release tag to the
#>   wnba_stats_leaguedash release tag (a Python-scraped parameter cube). This
#>   call reshapes the cube's
#>   player_stats_{base,advanced,misc,scoring,usage,defense} assets back into the
#>   old stacked-by-measure_type contract.
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_base_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_base_2026.parquet>
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_advanced_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_advanced_2026.parquet>
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_misc_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_misc_2026.parquet>
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_scoring_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_scoring_2026.parquet>
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_usage_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_usage_2026.parquet>
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_defense_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/player_stats_defense_2026.parquet>
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 0 × 0
# }
```

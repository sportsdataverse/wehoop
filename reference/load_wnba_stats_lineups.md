# **Load wehoop WNBA Stats Lineups**

**\[deprecated\]** Loads season-level WNBA 5-man lineup statistics
(`leaguedashlineups`-style outputs). **Deprecated**: the
`wnba_stats_lineups` release tag (R-scraped, `Base`/`Advanced` measures,
5-man only) is superseded by the `wnba_stats_leaguedash` tag
(Python-scraped parameter cube: 6 measure types x 2/3/4/5-man). This
function reshapes the cube back into the old 5-man `Base`+`Advanced`
contract for compatibility; call the cube's `lineups_*` /
`lineups_master` assets directly for the full surface.

`load_wnba_stats_lineups_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
WNBA Stats lineups release tag without downloading any season's full
data.

## Usage

``` r
load_wnba_stats_lineups(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_lineups_manifest()
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

  The name of the lineups data table within the database

## Value

Returns a `wehoop_data` tibble of lineup stats.

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
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
  try(load_wnba_stats_lineups(seasons = most_recent_wnba_stats_season()))
#> Warning: `load_wnba_stats_lineups()` was deprecated in wehoop 3.0.0.
#> ℹ Backing data moved from the wnba_stats_lineups release tag (5-man
#>   Base+Advanced only) to the wnba_stats_leaguedash release tag (a
#>   Python-scraped parameter cube covering 2/3/4/5-man x 6 measure types). This
#>   call filters the cube's lineups_{base,advanced} assets down to group_quantity
#>   == 5 to match the old contract.
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/lineups_base_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/lineups_base_2026.parquet>
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/lineups_advanced_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/lineups_advanced_2026.parquet>
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 0 × 0
# }
```

# **Load wehoop WNBA Stats Team Season Stats**

**\[deprecated\]** Loads season-level team statistics
(`leaguedashteamstats`-style outputs). **Deprecated**: the
`wnba_stats_team_season_stats` release tag (R-scraped, `Base`/
`Advanced`/`Misc`/`Scoring`/`Defense`/`Opponent` measures) is superseded
by the `wnba_stats_leaguedash` tag (Python-scraped parameter cube, same
6 measures plus `Four Factors` and a wide `team_master` mega). This
function reshapes the cube back into the old stacked-by-`measure_type`
contract for compatibility; call the cube's `team_stats_*` /
`team_master` assets directly for the full surface.

`load_wnba_stats_team_stats_manifest()` returns the per-season manifest
CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
the WNBA Stats team season stats release tag without downloading any
season's full data.

## Usage

``` r
load_wnba_stats_team_stats(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_team_stats_manifest()
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

  The name of the team season stats table within the database

## Value

Returns a `wehoop_data` tibble of team season stats.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| season_type | character | Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
| team_id | character | Unique team identifier. |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| gp | integer | Games played. |
| w | integer | Wins. |
| l | integer | Losses. |
| w_pct | numeric | Wins percentage (0-1 decimal). |
| min | numeric | Minutes played. |
| fgm | numeric | Field goals made. |
| fga | numeric | Field goal attempts. |
| fg_pct | numeric | Field goal percentage (0-1). |
| fg3m | numeric | Three-point field goals made. |
| fg3a | numeric | Three-point field goal attempts. |
| fg3_pct | numeric | Three-point field goal percentage (0-1). |
| ftm | numeric | Free throws made. |
| fta | numeric | Free throw attempts. |
| ft_pct | numeric | Free throw percentage (0-1). |
| oreb | numeric | Offensive rebounds. |
| dreb | numeric | Defensive rebounds. |
| reb | numeric | Total rebounds. |
| ast | numeric | Assists. |
| tov | numeric | Turnovers. |
| stl | numeric | Steals. |
| blk | numeric | Blocks. |
| pf | numeric | Personal fouls. |
| pts | numeric | Points scored. |
| plus_minus | numeric | Plus/minus point differential while on court. |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_team_stats(seasons = most_recent_wnba_stats_season()))
#> Warning: `load_wnba_stats_team_stats()` was deprecated in wehoop 3.0.0.
#> ℹ Backing data moved from the wnba_stats_team_season_stats release tag to the
#>   wnba_stats_leaguedash release tag (a Python-scraped parameter cube). This
#>   call reshapes the cube's
#>   team_stats_{base,advanced,misc,scoring,defense,opponent} assets back into the
#>   old stacked-by-measure_type contract.
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_base_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_base_2026.parquet>
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_advanced_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_advanced_2026.parquet>
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_misc_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_misc_2026.parquet>
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_scoring_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_scoring_2026.parquet>
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_defense_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_defense_2026.parquet>
#> Warning: downloaded length 0 != reported length 9
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_opponent_2026.parquet': HTTP status was '404 Not Found'
#> Warning: Failed to download parquet from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_stats_leaguedash/team_stats_opponent_2026.parquet>
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 0 × 0
# }
```

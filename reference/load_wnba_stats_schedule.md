# **Load wehoop WNBA Stats Schedules**

Loads season-level WNBA schedules scraped from
`stats.wnba.com/leaguegamefinder` (regular season + playoffs combined,
pre-rejoined home/away). Backed by the `wehoop-wnba-stats-data` pipeline
that publishes parquet/rds artifacts to the `wnba_stats_schedules`
release tag.

`load_wnba_stats_schedule_manifest()` returns the per-season manifest
CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
the WNBA Stats schedules release tag without downloading any season's
full data.

## Usage

``` r
load_wnba_stats_schedule(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_schedule_manifest()
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons.
  Published coverage runs 1997 through the most recent season, with no
  gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the schedules data table within the database

## Value

Returns a `wehoop_data` tibble of per-season schedules, one row per game
with the home/away sides pre-joined into `home_*` / `away_*` columns.

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| season | integer | Season identifier (4-digit year). |
| season_type | character | Portion of the season: `regular-season` or `playoffs`. |
| game_date | character | Date the game was played, as an ISO `YYYY-MM-DD` string. |
| matchup | character | Matchup string, home side first (e.g. `WAS vs. NYL`). |
| home_team_id | integer | Unique WNBA Stats team identifier for the home team. |
| home_team_abbreviation | character | Home team abbreviation. |
| home_team_name | character | Home team full name. |
| home_pts | integer | Points scored by the home team. |
| home_wl | character | Home team result, `W` or `L`. |
| away_team_id | integer | Unique WNBA Stats team identifier for the away team. |
| away_team_abbreviation | character | Away team abbreviation. |
| away_team_name | character | Away team full name. |
| away_pts | integer | Points scored by the away team. |
| away_wl | character | Away team result, `W` or `L`. |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_possessions()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_possessions.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_schedule(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 202 × 15
#>    game_id    season season_type    game_date  matchup     home_team_id
#>    <chr>       <int> <chr>          <chr>      <chr>              <int>
#>  1 1022600001   2026 regular-season 2026-05-08 NYL vs. CON   1611661313
#>  2 1022600002   2026 regular-season 2026-05-08 TOR vs. WAS   1611661332
#>  3 1022600003   2026 regular-season 2026-05-08 SEA vs. GSV   1611661328
#>  4 1022600004   2026 regular-season 2026-05-09 IND vs. DAL   1611661325
#>  5 1022600005   2026 regular-season 2026-05-09 LVA vs. PHX   1611661319
#>  6 1022600006   2026 regular-season 2026-05-09 PDX vs. CHI   1611661327
#>  7 1022600007   2026 regular-season 2026-05-10 CON vs. SEA   1611661323
#>  8 1022600008   2026 regular-season 2026-05-10 WAS vs. NYL   1611661322
#>  9 1022600009   2026 regular-season 2026-05-10 LAS vs. LVA   1611661320
#> 10 1022600010   2026 regular-season 2026-05-09 MIN vs. ATL   1611661324
#> # ℹ 192 more rows
#> # ℹ 9 more variables: home_team_abbreviation <chr>, home_team_name <chr>,
#> #   home_pts <int>, home_wl <chr>, away_team_id <int>,
#> #   away_team_abbreviation <chr>, away_team_name <chr>, away_pts <int>,
#> #   away_wl <chr>
# }
```

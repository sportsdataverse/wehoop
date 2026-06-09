# **Load wehoop WNBA Stats Team Season Stats**

Loads season-level team statistics scraped from the WNBA Stats API
(`leaguedashteamstats`-style outputs). Backed by the
`wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_team_season_stats` release tag.

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
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 15 × 57
#>    team_id    team_name gp    w     l     w_pct min   opp_fgm opp_fga opp_fg_pct
#>    <chr>      <chr>     <chr> <chr> <chr> <chr> <chr> <chr>   <chr>   <chr>     
#>  1 1611661330 Atlanta … 10    7     3     0.7   40    29.8    65.5    0.455     
#>  2 1611661329 Chicago … 11    4     7     0.364 40    30.2    71.4    0.423     
#>  3 1611661323 Connecti… 13    2     11    0.154 40    30.3    63.8    0.475     
#>  4 1611661321 Dallas W… 10    7     3     0.7   40    31.1    66.4    0.468     
#>  5 1611661331 Golden S… 11    6     5     0.545 40    27.4    64.3    0.426     
#>  6 1611661325 Indiana … 11    6     5     0.545 40.5  29.3    65.7    0.445     
#>  7 1611661319 Las Vega… 11    8     3     0.727 37.2  27.4    67.1    0.408     
#>  8 1611661320 Los Ange… 11    5     6     0.455 40    32.2    68.5    0.469     
#>  9 1611661324 Minnesot… 11    9     2     0.818 40    26.2    69.1    0.379     
#> 10 1611661313 New York… 12    8     4     0.667 40.4  30      70.7    0.425     
#> 11 1611661317 Phoenix … 12    4     8     0.333 40    30.7    66.8    0.459     
#> 12 1611661327 Portland… 13    6     7     0.462 40    29.2    64.2    0.454     
#> 13 1611661328 Seattle … 13    3     10    0.231 37.7  27      64.5    0.419     
#> 14 1611661332 Toronto … 11    6     5     0.545 40    31.6    66.8    0.473     
#> 15 1611661322 Washingt… 10    4     6     0.4   41    28.9    67.8    0.426     
#> # ℹ 47 more variables: opp_fg3m <chr>, opp_fg3a <chr>, opp_fg3_pct <chr>,
#> #   opp_ftm <chr>, opp_fta <chr>, opp_ft_pct <chr>, opp_oreb <chr>,
#> #   opp_dreb <chr>, opp_reb <chr>, opp_ast <chr>, opp_tov <chr>, opp_stl <chr>,
#> #   opp_blk <chr>, opp_blka <chr>, opp_pf <chr>, opp_pfd <chr>, opp_pts <chr>,
#> #   plus_minus <chr>, gp_rank <chr>, w_rank <chr>, l_rank <chr>,
#> #   w_pct_rank <chr>, min_rank <chr>, opp_fgm_rank <chr>, opp_fga_rank <chr>,
#> #   opp_fg_pct_rank <chr>, opp_fg3m_rank <chr>, opp_fg3a_rank <chr>, …
# }
```

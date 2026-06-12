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
#> # A tibble: 90 × 177
#>    team_id    team_name   gp    w     l     w_pct min   fgm   fga   fg_pct fg3m 
#>    <chr>      <chr>       <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>  <chr>
#>  1 1611661330 Atlanta Dr… 11    8     3     0.727 40    29.5  68.1  0.434  8.7  
#>  2 1611661329 Chicago Sky 12    4     8     0.333 40    27.8  67.3  0.414  6.1  
#>  3 1611661323 Connecticu… 14    2     12    0.143 40.4  28.8  68.6  0.42   5.2  
#>  4 1611661321 Dallas Win… 11    7     4     0.636 40    32.5  71.7  0.452  8.7  
#>  5 1611661331 Golden Sta… 12    7     5     0.583 40    28.9  70.8  0.408  12.1 
#>  6 1611661325 Indiana Fe… 11    6     5     0.545 40.5  30.6  68.7  0.446  9.1  
#>  7 1611661319 Las Vegas … 11    8     3     0.727 40    33.9  70.2  0.483  8.1  
#>  8 1611661320 Los Angele… 12    6     6     0.5   40    31    66.8  0.464  8.5  
#>  9 1611661324 Minnesota … 12    10    2     0.833 40    35    69.7  0.502  7.7  
#> 10 1611661313 New York L… 12    8     4     0.667 40.4  29.2  64.7  0.451  9.4  
#> # ℹ 80 more rows
#> # ℹ 166 more variables: fg3a <chr>, fg3_pct <chr>, ftm <chr>, fta <chr>,
#> #   ft_pct <chr>, oreb <chr>, dreb <chr>, reb <chr>, ast <chr>, tov <chr>,
#> #   stl <chr>, blk <chr>, blka <chr>, pf <chr>, pfd <chr>, pts <chr>,
#> #   plus_minus <chr>, gp_rank <chr>, w_rank <chr>, l_rank <chr>,
#> #   w_pct_rank <chr>, min_rank <chr>, fgm_rank <chr>, fga_rank <chr>,
#> #   fg_pct_rank <chr>, fg3m_rank <chr>, fg3a_rank <chr>, fg3_pct_rank <chr>, …
# }
```

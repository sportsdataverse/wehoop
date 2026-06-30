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
#>  1 1611661330 Atlanta Dr… 19    12    7     0.632 40    30.7  70.2  0.437  8.6  
#>  2 1611661329 Chicago Sky 19    6     13    0.316 40.3  30.1  69.2  0.434  7    
#>  3 1611661323 Connecticu… 19    4     15    0.211 40.3  29.6  69.2  0.428  5.1  
#>  4 1611661321 Dallas Win… 19    11    8     0.579 40.3  33.2  72.4  0.459  8.1  
#>  5 1611661331 Golden Sta… 20    13    7     0.65  40    28.2  68.7  0.411  10.8 
#>  6 1611661325 Indiana Fe… 19    11    8     0.579 40.5  32.3  68.4  0.472  9.8  
#>  7 1611661319 Las Vegas … 19    14    5     0.737 40    33.4  68.4  0.488  8.5  
#>  8 1611661320 Los Angele… 18    8     10    0.444 40.3  31.2  68.4  0.455  8.4  
#>  9 1611661324 Minnesota … 19    15    4     0.789 40    34.4  70.6  0.488  7.7  
#> 10 1611661313 New York L… 20    12    8     0.6   40.3  29.5  64.1  0.46   10.2 
#> # ℹ 80 more rows
#> # ℹ 166 more variables: fg3a <chr>, fg3_pct <chr>, ftm <chr>, fta <chr>,
#> #   ft_pct <chr>, oreb <chr>, dreb <chr>, reb <chr>, ast <chr>, tov <chr>,
#> #   stl <chr>, blk <chr>, blka <chr>, pf <chr>, pfd <chr>, pts <chr>,
#> #   plus_minus <chr>, gp_rank <chr>, w_rank <chr>, l_rank <chr>,
#> #   w_pct_rank <chr>, min_rank <chr>, fgm_rank <chr>, fga_rank <chr>,
#> #   fg_pct_rank <chr>, fg3m_rank <chr>, fg3a_rank <chr>, fg3_pct_rank <chr>, …
# }
```

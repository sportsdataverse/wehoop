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
#>  1 1611661330 Atlanta Dr… 7     5     2     0.714 40    29.6  68.3  0.433  8.3  
#>  2 1611661329 Chicago Sky 8     3     5     0.375 40    28.5  69.8  0.409  5.9  
#>  3 1611661323 Connecticu… 9     1     8     0.111 40    28.1  69.2  0.406  5.2  
#>  4 1611661321 Dallas Win… 8     5     3     0.625 40    32.3  69.3  0.466  9.1  
#>  5 1611661331 Golden Sta… 7     5     2     0.714 40    29.3  71.1  0.412  10.9 
#>  6 1611661325 Indiana Fe… 7     4     3     0.571 40.7  32.1  71    0.453  9.4  
#>  7 1611661319 Las Vegas … 7     4     3     0.571 40    35.3  71.6  0.493  7.1  
#>  8 1611661320 Los Angele… 7     4     3     0.571 40    32.6  64.9  0.502  8.9  
#>  9 1611661324 Minnesota … 8     6     2     0.75  40    34    68.3  0.498  6.8  
#> 10 1611661313 New York L… 9     5     4     0.556 40.6  29.3  64.2  0.457  10.1 
#> # ℹ 80 more rows
#> # ℹ 166 more variables: fg3a <chr>, fg3_pct <chr>, ftm <chr>, fta <chr>,
#> #   ft_pct <chr>, oreb <chr>, dreb <chr>, reb <chr>, ast <chr>, tov <chr>,
#> #   stl <chr>, blk <chr>, blka <chr>, pf <chr>, pfd <chr>, pts <chr>,
#> #   plus_minus <chr>, gp_rank <chr>, w_rank <chr>, l_rank <chr>,
#> #   w_pct_rank <chr>, min_rank <chr>, fgm_rank <chr>, fga_rank <chr>,
#> #   fg_pct_rank <chr>, fg3m_rank <chr>, fg3a_rank <chr>, fg3_pct_rank <chr>, …
# }
```

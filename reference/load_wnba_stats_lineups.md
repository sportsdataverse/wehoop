# **Load wehoop WNBA Stats Lineups**

Loads season-level WNBA lineup statistics scraped from the WNBA Stats
API (`leaguedashlineups`-style outputs). Backed by the
`wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_lineups` release tag.

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
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 3,216 × 95
#>    group_set group_id     group_name team_id team_abbreviation gp    w     l    
#>    <chr>     <chr>        <chr>      <chr>   <chr>             <chr> <chr> <chr>
#>  1 Lineups   -203825-203… K. McBrid… 161166… MIN               11    9     2    
#>  2 Lineups   -1628277-16… A. Gray -… 161166… ATL               9     7     2    
#>  3 Lineups   -201886-163… D. Bonner… 161166… PHX               1     1     0    
#>  4 Lineups   -203398-162… B. Griner… 161166… CON               1     0     1    
#>  5 Lineups   -202252-162… A. Clark … 161166… DAL               1     1     0    
#>  6 Lineups   -203400-164… S. Diggin… 161166… CHI               3     2     1    
#>  7 Lineups   -1630446-16… M. Onyenw… 161166… WAS               1     1     0    
#>  8 Lineups   -203014-204… N. Ogwumi… 161166… LAS               3     2     1    
#>  9 Lineups   -1627668-16… B. Stewar… 161166… NYL               4     4     0    
#> 10 Lineups   -1627668-16… B. Stewar… 161166… NYL               1     0     1    
#> # ℹ 3,206 more rows
#> # ℹ 87 more variables: w_pct <chr>, min <chr>, fgm <chr>, fga <chr>,
#> #   fg_pct <chr>, fg3m <chr>, fg3a <chr>, fg3_pct <chr>, ftm <chr>, fta <chr>,
#> #   ft_pct <chr>, oreb <chr>, dreb <chr>, reb <chr>, ast <chr>, tov <chr>,
#> #   stl <chr>, blk <chr>, blka <chr>, pf <chr>, pfd <chr>, pts <chr>,
#> #   plus_minus <chr>, gp_rank <chr>, w_rank <chr>, l_rank <chr>,
#> #   w_pct_rank <chr>, min_rank <chr>, fgm_rank <chr>, fga_rank <chr>, …
# }
```

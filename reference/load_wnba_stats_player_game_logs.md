# **Load wehoop WNBA Stats Player Game Logs**

Loads per-player per-game logs scraped from
`stats.wnba.com/leaguegamelog?PlayerOrTeam=P` (one row per athlete-game
pair: minutes, shooting splits, rebounds, steals, blocks, turnovers,
personal fouls, plus/minus). Backed by the `wehoop-wnba-stats-data`
pipeline that publishes parquet/rds artifacts to the
`wnba_stats_player_game_logs` release tag.

`load_wnba_stats_player_game_logs_manifest()` returns the per-season
manifest CSV (`season`, `row_count`, `generated_at_utc`,
`source_endpoint`) for the WNBA Stats player game logs release tag
without downloading any season's full data.

## Usage

``` r
load_wnba_stats_player_game_logs(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_player_game_logs_manifest()
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

  The name of the player game logs table within the database

## Value

Returns a `wehoop_data` tibble of per-athlete per-game log rows.

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_player_game_logs(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 4,415 × 35
#>    season_id team_id team_abbreviation team_name game_id game_date matchup wl   
#>    <chr>       <int> <chr>             <chr>     <chr>   <chr>     <chr>   <chr>
#>  1 22026      1.61e9 CON               Connecti… 102260… 2026-05-… CON @ … L    
#>  2 22026      1.61e9 TOR               Toronto … 102260… 2026-05-… TOR vs… L    
#>  3 22026      1.61e9 NYL               New York… 102260… 2026-05-… NYL vs… W    
#>  4 22026      1.61e9 GSV               Golden S… 102260… 2026-05-… GSV @ … W    
#>  5 22026      1.61e9 SEA               Seattle … 102260… 2026-05-… SEA vs… L    
#>  6 22026      1.61e9 WAS               Washingt… 102260… 2026-05-… WAS @ … W    
#>  7 22026      1.61e9 IND               Indiana … 102260… 2026-05-… IND vs… L    
#>  8 22026      1.61e9 ATL               Atlanta … 102260… 2026-05-… ATL @ … W    
#>  9 22026      1.61e9 DAL               Dallas W… 102260… 2026-05-… DAL @ … W    
#> 10 22026      1.61e9 CHI               Chicago … 102260… 2026-05-… CHI @ … W    
#> # ℹ 4,405 more rows
#> # ℹ 27 more variables: min <int>, fgm <int>, fga <int>, fg_pct <dbl>,
#> #   fg3m <int>, fg3a <int>, fg3_pct <dbl>, ftm <int>, fta <int>, ft_pct <dbl>,
#> #   oreb <int>, dreb <int>, reb <int>, ast <int>, stl <int>, blk <int>,
#> #   tov <int>, pf <int>, pts <int>, plus_minus <int>, video_available <int>,
#> #   season <int>, season_type <chr>, player_id <int>, player_name <chr>,
#> #   fantasy_pts <dbl>, measure_type <chr>
# }
```

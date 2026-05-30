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
#> # A tibble: 1,177 × 34
#>    season_id player_id player_name   team_id team_abbreviation team_name game_id
#>    <chr>         <int> <chr>           <int> <chr>             <chr>     <chr>  
#>  1 22026       1643449 Charlisse Le…  1.61e9 CON               Connecti… 102260…
#>  2 22026       1643441 Raegan Beers   1.61e9 CON               Connecti… 102260…
#>  3 22026       1643429 Gianna Kneep…  1.61e9 CON               Connecti… 102260…
#>  4 22026       1642817 Hailey Van L…  1.61e9 CON               Connecti… 102260…
#>  5 22026       1642809 Saniya Rivers  1.61e9 CON               Connecti… 102260…
#>  6 22026       1642800 Aneesah Morr…  1.61e9 CON               Connecti… 102260…
#>  7 22026       1641649 Diamond Mill…  1.61e9 CON               Connecti… 102260…
#>  8 22026       1631135 Olivia Nelso…  1.61e9 CON               Connecti… 102260…
#>  9 22026       1629568 Kennedy Burke  1.61e9 CON               Connecti… 102260…
#> 10 22026        203398 Brittney Gri…  1.61e9 CON               Connecti… 102260…
#> # ℹ 1,167 more rows
#> # ℹ 27 more variables: game_date <chr>, matchup <chr>, wl <chr>, min <chr>,
#> #   fgm <chr>, fga <chr>, fg_pct <chr>, fg3m <chr>, fg3a <chr>, fg3_pct <chr>,
#> #   ftm <chr>, fta <chr>, ft_pct <chr>, oreb <chr>, dreb <chr>, reb <chr>,
#> #   ast <chr>, stl <chr>, blk <chr>, tov <chr>, pf <chr>, pts <chr>,
#> #   plus_minus <chr>, fantasy_pts <chr>, video_available <chr>,
#> #   team_location <chr>, season <int>
# }
```

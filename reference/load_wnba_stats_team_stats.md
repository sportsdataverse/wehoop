# **Load wehoop WNBA Stats Team Season Stats**

**\[deprecated\]** Loads season-level team statistics
(`leaguedashteamstats`-style outputs). **Deprecated**: the
`wnba_stats_team_season_stats` release tag (R-scraped, `Base`/
`Advanced`/`Misc`/`Scoring`/`Defense`/`Opponent` measures) is superseded
by the `wnba_stats_leaguedash` tag (Python-scraped parameter cube, same
6 measures plus `Four Factors` and a wide `team_master` mega). This
function reshapes the cube back into the old stacked-by-`measure_type`
contract for compatibility; call the cube's `team_stats_*` /
`team_master` assets directly with
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md)
for the full surface.

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
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_possessions()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_possessions.md),
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
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 90 × 179
#>       team_id team_name      gp     w     l w_pct   min   fgm   fga fg_pct fg3_m
#>         <int> <chr>       <int> <int> <int> <dbl> <dbl> <int> <int>  <dbl> <int>
#>  1 1611661330 Atlanta Dr…    32    20    12 0.625 1280.   992  2270  0.437   266
#>  2 1611661329 Chicago Sky    34    12    22 0.353 1370   1056  2369  0.446   254
#>  3 1611661323 Connecticu…    31     8    23 0.258 1245    915  2109  0.434   172
#>  4 1611661321 Dallas Win…    34    20    14 0.588 1370   1130  2436  0.464   279
#>  5 1611661331 Golden Sta…    33    24     9 0.727 1320    955  2235  0.427   356
#>  6 1611661325 Indiana Fe…    33    21    12 0.636 1335   1105  2270  0.487   343
#>  7 1611661319 Las Vegas …    34    23    11 0.676 1370   1132  2325  0.487   285
#>  8 1611661320 Los Angele…    32    12    20 0.375 1285   1031  2215  0.465   285
#>  9 1611661324 Minnesota …    35    28     7 0.8   1400   1211  2501  0.484   325
#> 10 1611661313 New York L…    34    20    14 0.588 1370   1061  2281  0.465   350
#> # ℹ 80 more rows
#> # ℹ 168 more variables: fg3_a <int>, fg3_pct <dbl>, ftm <int>, fta <int>,
#> #   ft_pct <dbl>, oreb <int>, dreb <int>, reb <int>, ast <int>, tov <dbl>,
#> #   stl <int>, blk <int>, blka <int>, pf <int>, pfd <int>, pts <int>,
#> #   plus_minus <dbl>, gp_rank <int>, w_rank <int>, l_rank <int>,
#> #   w_pct_rank <int>, min_rank <int>, fgm_rank <int>, fga_rank <int>,
#> #   fg_pct_rank <int>, fg3_m_rank <int>, fg3_a_rank <int>, …
# }
```

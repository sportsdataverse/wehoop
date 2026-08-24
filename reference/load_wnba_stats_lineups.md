# **Load wehoop WNBA Stats Lineups**

**\[deprecated\]** Loads season-level WNBA 5-man lineup statistics
(`leaguedashlineups`-style outputs). **Deprecated**: the
`wnba_stats_lineups` release tag (R-scraped, `Base`/`Advanced` measures,
5-man only) is superseded by the `wnba_stats_leaguedash` tag
(Python-scraped parameter cube: 6 measure types x 2/3/4/5-man). This
function reshapes the cube back into the old 5-man `Base`+`Advanced`
contract for compatibility; call the cube's `lineups_*` /
`lineups_master` assets directly with
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md)
for the full surface.

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

  The name of the lineups data table within the database

## Value

Returns a `wehoop_data` tibble of lineup stats.

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_possessions()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_possessions.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_lineups(seasons = most_recent_wnba_stats_season()))
#> Warning: `load_wnba_stats_lineups()` was deprecated in wehoop 3.0.0.
#> ℹ Backing data moved from the wnba_stats_lineups release tag (5-man
#>   Base+Advanced only) to the wnba_stats_leaguedash release tag (a
#>   Python-scraped parameter cube covering 2/3/4/5-man x 6 measure types). This
#>   call filters the cube's lineups_{base,advanced} assets down to group_quantity
#>   == 5 to match the old contract.
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 4,000 × 98
#>    group_set group_id     group_name team_id team_abbreviation    gp     w     l
#>    <chr>     <chr>        <chr>        <int> <chr>             <int> <int> <int>
#>  1 Lineups   -1628277-16… A. Gray -…  1.61e9 ATL                  29    20     9
#>  2 Lineups   -203825-203… K. McBrid…  1.61e9 MIN                  27    21     6
#>  3 Lineups   -203014-204… N. Ogwumi…  1.61e9 LAS                  24     8    16
#>  4 Lineups   -203833-203… C. Gray -…  1.61e9 LVA                  30    21     9
#>  5 Lineups   -203866-204… K. Thornt…  1.61e9 GSV                  25    19     6
#>  6 Lineups   -1629484-16… M. DiLeo …  1.61e9 PDX                  18     7    11
#>  7 Lineups   -1629481-16… A. Ogunbo…  1.61e9 DAL                  21    15     6
#>  8 Lineups   -203833-204… C. Gray -…  1.61e9 LVA                  28    19     9
#>  9 Lineups   -1630446-16… M. Onyenw…  1.61e9 WAS                  22    13     9
#> 10 Lineups   -1628881-16… M. Billin…  1.61e9 IND                  25    15    10
#> # ℹ 3,990 more rows
#> # ℹ 90 more variables: w_pct <dbl>, min <dbl>, fgm <int>, fga <int>,
#> #   fg_pct <dbl>, fg3_m <int>, fg3_a <int>, fg3_pct <dbl>, ftm <int>,
#> #   fta <int>, ft_pct <dbl>, oreb <int>, dreb <int>, reb <int>, ast <int>,
#> #   tov <dbl>, stl <int>, blk <int>, blka <int>, pf <int>, pfd <int>,
#> #   pts <int>, plus_minus <dbl>, gp_rank <int>, w_rank <int>, l_rank <int>,
#> #   w_pct_rank <int>, min_rank <int>, fgm_rank <int>, fga_rank <int>, …
# }
```

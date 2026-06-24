# **Get Fox Sports basketball boxscore**

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB)
boxscore.** `fox_wnba_boxscore()` hits the `wnba` slug;
`fox_wbb_boxscore()` hits the `wcbk` slug.

## Usage

``` r
fox_wnba_boxscore(game_id)

fox_wbb_boxscore(game_id)
```

## Arguments

- game_id:

  Fox Bifrost event id.

## Value

A `wehoop_data` tibble (long), one row per (player, stat): `game_id`,
`team`, `stat_group`, `player`, `athlete_id`, `stat`, `value`.

## See also

Other Fox Sports Functions:
[`fox_basketball_league_leaders`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md),
[`fox_basketball_odds`](https://wehoop.sportsdataverse.org/reference/fox_basketball_odds.md),
[`fox_basketball_pbp`](https://wehoop.sportsdataverse.org/reference/fox_basketball_pbp.md),
[`fox_basketball_standings`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md),
[`fox_basketball_team_gamelog`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_gamelog.md),
[`fox_basketball_team_roster`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_roster.md),
[`fox_basketball_team_stats`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_stats.md),
[`fox_basketball_teams`](https://wehoop.sportsdataverse.org/reference/fox_basketball_teams.md),
[`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md)

## Examples

``` r
# \donttest{
  try(fox_wnba_boxscore("2215"))
#> ── Fox Sports WNBA boxscore ──────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-24 02:03:05 UTC
#> # A tibble: 338 × 7
#>    game_id team  stat_group player     athlete_id stat  value
#>    <chr>   <chr> <chr>      <chr>      <chr>      <chr> <chr>
#>  1 2215    DREAM STARTERS   N. Hillmon 646        min   38   
#>  2 2215    DREAM STARTERS   N. Hillmon 646        off   2    
#>  3 2215    DREAM STARTERS   N. Hillmon 646        def   4    
#>  4 2215    DREAM STARTERS   N. Hillmon 646        reb   6    
#>  5 2215    DREAM STARTERS   N. Hillmon 646        ast   1    
#>  6 2215    DREAM STARTERS   N. Hillmon 646        stl   1    
#>  7 2215    DREAM STARTERS   N. Hillmon 646        blk   0    
#>  8 2215    DREAM STARTERS   N. Hillmon 646        to    0    
#>  9 2215    DREAM STARTERS   N. Hillmon 646        pf    3    
#> 10 2215    DREAM STARTERS   N. Hillmon 646        pts   16   
#> # ℹ 328 more rows
# }
# \donttest{
  try(fox_wbb_boxscore("388986"))
#> ── Fox Sports WCBK boxscore ──────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-24 02:03:06 UTC
#> # A tibble: 378 × 7
#>    game_id team  stat_group player      athlete_id stat  value
#>    <chr>   <chr> <chr>      <chr>       <chr>      <chr> <chr>
#>  1 388986  UTSA  STARTERS   E. Hardaway 15204      min   36   
#>  2 388986  UTSA  STARTERS   E. Hardaway 15204      off   0    
#>  3 388986  UTSA  STARTERS   E. Hardaway 15204      def   4    
#>  4 388986  UTSA  STARTERS   E. Hardaway 15204      reb   4    
#>  5 388986  UTSA  STARTERS   E. Hardaway 15204      ast   4    
#>  6 388986  UTSA  STARTERS   E. Hardaway 15204      stl   1    
#>  7 388986  UTSA  STARTERS   E. Hardaway 15204      blk   0    
#>  8 388986  UTSA  STARTERS   E. Hardaway 15204      to    6    
#>  9 388986  UTSA  STARTERS   E. Hardaway 15204      pf    1    
#> 10 388986  UTSA  STARTERS   E. Hardaway 15204      pts   11   
#> # ℹ 368 more rows
# }
```

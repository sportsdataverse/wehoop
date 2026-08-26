# **Get Fox Sports basketball play-by-play**

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB)
play-by-play.** `fox_wnba_pbp()` hits the `wnba` slug; `fox_wbb_pbp()`
hits the `wcbk` slug.

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB)
boxscore.** `fox_wnba_boxscore()` hits the `wnba` slug;
`fox_wbb_boxscore()` hits the `wcbk` slug.

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) game
odds.** `fox_wnba_odds()` hits the `wnba` slug; `fox_wbb_odds()` hits
the `wcbk` slug.

## Usage

``` r
fox_wnba_pbp(game_id)

fox_wbb_pbp(game_id)

fox_wnba_boxscore(game_id)

fox_wbb_boxscore(game_id)

fox_wnba_odds(game_id)

fox_wbb_odds(game_id)
```

## Arguments

- game_id:

  Fox Bifrost event id.

## Value

A `wehoop_data` tibble, one row per play: `game_id`, `period`,
`left_team`, `right_team`, `play_id`, `clock`, `team`,
`left_score_change`, `right_score_change`, `play_text`.

A `wehoop_data` tibble (long), one row per (player, stat): `game_id`,
`team`, `stat_group`, `player`, `athlete_id`, `stat`, `value`.

A `wehoop_data` tibble, one row per team: `game_id`, `team`, plus the
six-pack odds columns (spread / to-win / total). Empty when no market.

## See also

Other Fox Sports Functions:
[`fox_basketball_league_leaders`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md),
[`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md),
[`fox_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)

## Examples

``` r
# \donttest{
  try(fox_wnba_pbp("2215"))
#> ── Fox Sports WNBA pbp ───────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:12:17 UTC
#> # A tibble: 382 × 10
#>    game_id period     left_team right_team play_id clock team  left_score_change
#>    <chr>   <chr>      <chr>     <chr>      <chr>   <chr> <chr> <chr>            
#>  1 2215    1ST QUART… ATL       CHI        1       10:00 ATLA… FALSE            
#>  2 2215    1ST QUART… ATL       CHI        2       10:00 CHIC… FALSE            
#>  3 2215    1ST QUART… ATL       CHI        3       10:00 NA    FALSE            
#>  4 2215    1ST QUART… ATL       CHI        4       9:45  ATLA… FALSE            
#>  5 2215    1ST QUART… ATL       CHI        5       9:25  CHIC… FALSE            
#>  6 2215    1ST QUART… ATL       CHI        6       9:01  ATLA… TRUE             
#>  7 2215    1ST QUART… ATL       CHI        7       8:48  CHIC… FALSE            
#>  8 2215    1ST QUART… ATL       CHI        8       8:46  ATLA… FALSE            
#>  9 2215    1ST QUART… ATL       CHI        9       8:46  NA    FALSE            
#> 10 2215    1ST QUART… ATL       CHI        10      8:26  ATLA… TRUE             
#> # ℹ 372 more rows
#> # ℹ 2 more variables: right_score_change <chr>, play_text <chr>
# }
# \donttest{
  try(fox_wbb_pbp("388986"))
#> ── Fox Sports WCBK pbp ───────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:12:17 UTC
#> # A tibble: 312 × 10
#>    game_id period     left_team right_team play_id clock team  left_score_change
#>    <chr>   <chr>      <chr>     <chr>      <chr>   <chr> <chr> <chr>            
#>  1 388986  1ST QUART… UTSA      CONN       1       10:00 NA    FALSE            
#>  2 388986  1ST QUART… UTSA      CONN       2       9:29  UCON… FALSE            
#>  3 388986  1ST QUART… UTSA      CONN       3       9:27  UCON… FALSE            
#>  4 388986  1ST QUART… UTSA      CONN       4       9:19  UCON… FALSE            
#>  5 388986  1ST QUART… UTSA      CONN       5       9:17  UCON… FALSE            
#>  6 388986  1ST QUART… UTSA      CONN       6       9:00  UCON… FALSE            
#>  7 388986  1ST QUART… UTSA      CONN       7       8:41  UCON… FALSE            
#>  8 388986  1ST QUART… UTSA      CONN       8       8:39  UCON… FALSE            
#>  9 388986  1ST QUART… UTSA      CONN       9       8:30  UCON… FALSE            
#> 10 388986  1ST QUART… UTSA      CONN       10      8:30  UCON… FALSE            
#> # ℹ 302 more rows
#> # ℹ 2 more variables: right_score_change <chr>, play_text <chr>
# }
# \donttest{
  try(fox_wnba_boxscore("2215"))
#> ── Fox Sports WNBA boxscore ──────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:12:17 UTC
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
#> ℹ Data updated: 2026-08-26 20:12:18 UTC
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
# \donttest{
  try(fox_wnba_odds("2215"))
#> ── Fox Sports WNBA odds ──────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:12:18 UTC
#> # A tibble: 0 × 0
# }
# \donttest{
  try(fox_wbb_odds("388986"))
#> ── Fox Sports WCBK odds ──────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:12:18 UTC
#> # A tibble: 0 × 0
# }
```

# **Get Fox Sports basketball statistical leaders**

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB)
statistical leaders.** `fox_wnba_league_leaders()` hits the `wnba` slug;
`fox_wbb_league_leaders()` hits the `wcbk` slug.

## Usage

``` r
fox_wnba_league_leaders(category = "scoring", who = "player", page = 0)

fox_wbb_league_leaders(category = "scoring", who = "player", page = 0)
```

## Arguments

- category:

  Stat category (default `"scoring"`).

- who:

  `"player"` or `"team"` (default `"player"`).

- page:

  0-based page index (default `0`).

## Value

A `wehoop_data` tibble of leaderboard rows (`entity_id` + stat columns).

## See also

Other Fox Sports Functions:
[`fox_basketball_boxscore`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md),
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
  try(fox_wnba_league_leaders("scoring"))
#> ── Fox Sports WNBA league_leaders ────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-30 19:33:32 UTC
#> # A tibble: 75 × 6
#>    players v2           gp    entity_id min   mpg  
#>    <chr>   <chr>        <chr> <chr>     <chr> <chr>
#>  1 1       S. Dolson    20    31        NA    NA   
#>  2 2       K. Stokes    20    39        NA    NA   
#>  3 3       K. Thornton  20    136       NA    NA   
#>  4 4       G. Williams  20    177       NA    NA   
#>  5 5       D. Bonner    20    211       NA    NA   
#>  6 6       M. Johannes  20    217       NA    NA   
#>  7 7       H. Xu        20    224       NA    NA   
#>  8 8       N. Hiedeman  20    239       NA    NA   
#>  9 9       M. Gustafson 20    264       NA    NA   
#> 10 10      K. Charles   20    557       NA    NA   
#> # ℹ 65 more rows
# }
# \donttest{
  try(fox_wbb_league_leaders("scoring"))
#> ── Fox Sports WCBK league_leaders ────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-30 19:33:32 UTC
#> # A tibble: 100 × 8
#>    players v2          gp    entity_id gs    mpg   ppg   pts  
#>    <chr>   <chr>       <chr> <chr>     <chr> <chr> <chr> <chr>
#>  1 1       T. Sides    35    16309     NA    NA    NA    NA   
#>  2 2       G. Cox      35    16956     NA    NA    NA    NA   
#>  3 3       C. Runner   35    22561     NA    NA    NA    NA   
#>  4 4       E. Snyder   35    22562     NA    NA    NA    NA   
#>  5 5       J. Speiser  35    26074     NA    NA    NA    NA   
#>  6 6       G. Garcia   35    26076     NA    NA    NA    NA   
#>  7 7       S. Huber    35    27073     NA    NA    NA    NA   
#>  8 8       J. Savic    35    27074     NA    NA    NA    NA   
#>  9 9       G. Ferguson 35    27075     NA    NA    NA    NA   
#> 10 10      B. Ward     35    27076     NA    NA    NA    NA   
#> # ℹ 90 more rows
# }
```

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
[`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md),
[`fox_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md),
[`fox_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)

## Examples

``` r
# \donttest{
  try(fox_wnba_league_leaders("scoring"))
#> ── Fox Sports WNBA league_leaders ───────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-10-09 05:44:35 UTC
#> # A tibble: 75 × 6
#>    players v2             gp    entity_id min   mpg  
#>    <chr>   <chr>          <chr> <chr>     <chr> <chr>
#>  1 1       C. Zandalasini 5     21        NA    NA   
#>  2 2       T. Hayes       5     30        NA    NA   
#>  3 3       K. Stokes      5     39        NA    NA   
#>  4 4       C. Gray        5     61        NA    NA   
#>  5 5       C. Parker-Tyus 5     88        NA    NA   
#>  6 6       K. Thornton    5     136       NA    NA   
#>  7 7       G. Williams    5     177       NA    NA   
#>  8 8       A. Wilson      5     192       NA    NA   
#>  9 9       B. Turner      5     247       NA    NA   
#> 10 10      J. Young       5     258       NA    NA   
#> # ℹ 65 more rows
# }
# \donttest{
  try(fox_wbb_league_leaders("scoring"))
#> ── Fox Sports WCBK league_leaders ───────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-10-09 05:44:35 UTC
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

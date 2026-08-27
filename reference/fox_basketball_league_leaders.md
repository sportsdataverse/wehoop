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
#> ── Fox Sports WNBA league_leaders ────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:46 UTC
#> # A tibble: 75 × 6
#>    players v2            gp    entity_id min   mpg  
#>    <chr>   <chr>         <chr> <chr>     <chr> <chr>
#>  1 1       S. Talbot     39    24        NA    NA   
#>  2 2       S. Dolson     39    31        NA    NA   
#>  3 3       E. Williams   39    57        NA    NA   
#>  4 4       N. Howard     39    91        NA    NA   
#>  5 5       K. McBride    39    130       NA    NA   
#>  6 6       N. Coffey     39    165       NA    NA   
#>  7 7       K. Mitchell   39    186       NA    NA   
#>  8 8       A. Ogunbowale 39    266       NA    NA   
#>  9 9       M. Caldwell   39    592       NA    NA   
#> 10 10      L. Hull       39    648       NA    NA   
#> # ℹ 65 more rows
# }
# \donttest{
  try(fox_wbb_league_leaders("scoring"))
#> ── Fox Sports WCBK league_leaders ────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:48 UTC
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

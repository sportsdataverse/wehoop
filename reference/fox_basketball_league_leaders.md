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
#> ── Fox Sports WNBA league_leaders ────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-24 19:18:04 UTC
#> # A tibble: 75 × 6
#>    players v2          gp    entity_id min   mpg  
#>    <chr>   <chr>       <chr> <chr>     <chr> <chr>
#>  1 1       S. Talbot   44    24        NA    NA   
#>  2 2       S. Dolson   44    31        NA    NA   
#>  3 3       E. Williams 44    57        NA    NA   
#>  4 4       N. Howard   44    91        NA    NA   
#>  5 5       K. McBride  44    130       NA    NA   
#>  6 6       K. Thornton 44    136       NA    NA   
#>  7 7       A. Gray     44    138       NA    NA   
#>  8 8       N. Brodie   44    165       NA    NA   
#>  9 9       K. Mitchell 44    186       NA    NA   
#> 10 10      H. Xu       44    224       NA    NA   
#> # ℹ 65 more rows
# }
# \donttest{
  try(fox_wbb_league_leaders("scoring"))
#> ── Fox Sports WCBK league_leaders ────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-24 19:18:04 UTC
#> # A tibble: 100 × 8
#>    players v2        gp    entity_id gs    mpg   ppg   pts  
#>    <chr>   <chr>     <chr> <chr>     <chr> <chr> <chr> <chr>
#>  1 1       A. Joyner 9     14985     NA    NA    NA    NA   
#>  2 2       C. Baker  9     16263     NA    NA    NA    NA   
#>  3 3       I. Berry  9     21605     NA    NA    NA    NA   
#>  4 4       R. Graves 9     21606     NA    NA    NA    NA   
#>  5 5       R. Bender 9     21608     NA    NA    NA    NA   
#>  6 6       Z. Jones  9     21630     NA    NA    NA    NA   
#>  7 7       K. Ramsey 9     22498     NA    NA    NA    NA   
#>  8 8       V. Morris 9     22897     NA    NA    NA    NA   
#>  9 9       M. Hayes  9     25611     NA    NA    NA    NA   
#> 10 10      G. Mbugua 9     26179     NA    NA    NA    NA   
#> # ℹ 90 more rows
# }
```

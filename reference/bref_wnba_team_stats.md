# **Basketball-Reference WNBA Team Season Stats**

**Get WNBA team season statistics from
[Basketball-Reference](https://www.basketball-reference.com/wnba/).**

One row per team for a season. No account or API key is required.

## Usage

``` r
bref_wnba_team_stats(season = most_recent_wnba_season(), table = "per_game")
```

## Arguments

- season:

  Season, 4-digit year format (e.g. `2024`). Defaults to
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md).

- table:

  Which stats table – one of `"per_game"` (default), `"totals"`,
  `"per_poss"` or `"advanced"`.

## Value

A `wehoop_data` tibble with one row per team, carrying `season` and
`table` columns.

|           |           |
|-----------|-----------|
| col_name  | types     |
| team      | character |
| g         | numeric   |
| pts_per_g | numeric   |
| season    | integer   |
| table     | character |

## See also

Other WNBA Basketball-Reference Functions:
[`bref_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_player_stats.md),
[`bref_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_standings.md)

## Examples

``` r
# \donttest{
  try(bref_wnba_team_stats(season = 2024, table = "per_game"))
#> ── WNBA team season stats from basketball-reference.com ──────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:01:23 UTC
#> # A tibble: 12 × 27
#>    ranker team        g    mp    fg   fga fg_pct   fg3  fg3a fg3_pct   fg2  fg2a
#>     <dbl> <chr>   <dbl> <dbl> <dbl> <dbl>  <dbl> <dbl> <dbl>   <dbl> <dbl> <dbl>
#>  1      1 Las Ve…    40  201.  30.9  68.1  0.454   9.4  26.5   0.355  21.5  41.7
#>  2      2 New Yo…    40  200   30.8  68.7  0.448  10.1  29     0.349  20.6  39.7
#>  3      3 Indian…    40  201.  31.3  68.5  0.456   9.2  25.9   0.356  22.1  42.7
#>  4      4 Dallas…    40  202.  31.7  71    0.446   6.3  19.2   0.326  25.4  51.9
#>  5      5 Seattl…    40  201.  31.1  71.3  0.435   6.1  21     0.288  25    50.3
#>  6      6 Minnes…    40  202.  30.1  67.3  0.448   9.5  25     0.38   20.6  42.3
#>  7      7 Phoeni…    40  201.  29.1  66.3  0.439   8.5  26.2   0.326  20.6  40.2
#>  8      8 Connec…    40  201.  29.3  65.9  0.444   5.9  18     0.327  23.4  48  
#>  9      9 Washin…    40  201.  29    67    0.433   9.7  26.6   0.366  19.3  40.4
#> 10     10 Los An…    40  201.  28.1  66.4  0.423   7.2  22.6   0.32   20.9  43.8
#> 11     11 Chicag…    40  200   29.7  70.3  0.422   4.8  14.9   0.323  24.9  55.4
#> 12     12 Atlant…    40  202.  27.8  68.1  0.408   6    19.4   0.308  21.8  48.7
#> # ℹ 15 more variables: fg2_pct <dbl>, ft <dbl>, fta <dbl>, ft_pct <dbl>,
#> #   orb <dbl>, drb <dbl>, trb <dbl>, ast <dbl>, stl <dbl>, blk <dbl>,
#> #   tov <dbl>, pf <dbl>, pts <dbl>, season <int>, table <chr>
# }
```

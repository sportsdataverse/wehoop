# **Basketball-Reference WNBA Player Season Stats**

**Get WNBA league-wide player season statistics from
[Basketball-Reference](https://www.basketball-reference.com/wnba/).**

One row per player for a season. No account or API key is required.
Basketball-Reference rate-limits aggressive scraping (~20
requests/minute) – space repeated calls with
[`Sys.sleep()`](https://rdrr.io/r/base/Sys.sleep.html).

## Usage

``` r
bref_wnba_player_stats(season = most_recent_wnba_season(), table = "per_game")
```

## Arguments

- season:

  Season, in 4-digit year format (e.g. `2024`). Defaults to
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md).

- table:

  Which stats table – one of `"per_game"` (default), `"totals"` or
  `"advanced"`.

## Value

A `wehoop_data` tibble with one row per player, carrying `season` and
`table` columns.

|           |           |
|-----------|-----------|
| col_name  | types     |
| player    | character |
| team_id   | character |
| pos       | character |
| g         | numeric   |
| pts_per_g | numeric   |
| season    | integer   |
| table     | character |

## See also

Other WNBA Basketball-Reference Functions:
[`bref_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_standings.md),
[`bref_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_team_stats.md)

## Examples

``` r
# \donttest{
  try(bref_wnba_player_stats(season = 2024, table = "per_game"))
#> ── WNBA player season stats from basketball-reference.com ────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-12 23:26:20 UTC
#> # A tibble: 183 × 30
#>    player team  pos       g    mp   g_1    gs mp_per_g fg_per_g fga_per_g fg_pct
#>    <chr>  <chr> <chr> <dbl> <dbl> <dbl> <dbl>    <dbl>    <dbl>     <dbl>  <dbl>
#>  1 Linds… CHI   G        40   950    40    28     23.8      2.6       5.6  0.466
#>  2 Rebec… PHO   F-G      18   447    18    18     24.8      2.9       7    0.421
#>  3 Laeti… ATL   F        16    83    16     0      5.2      0.4       1.6  0.269
#>  4 Ariel… WAS   G        40  1196    40    40     29.9      5.4      12.4  0.437
#>  5 Amy A… PHO   F         6    59     6     0      9.8      0.7       2.5  0.267
#>  6 Shaki… WAS   C        12   238    12    11     19.8      4.3      10.1  0.43 
#>  7 Kiers… LVA   F         6    43     6     0      7.2      1         2.7  0.375
#>  8 Grace… IND   G        11   102    11     0      9.3      0.9       2.3  0.4  
#>  9 Caitl… CON   F         8    15     8     0      1.9      0         0.4  0    
#> 10 DeWan… CON   F-G      40  1271    40    39     31.8      5.3      12.8  0.415
#> # ℹ 173 more rows
#> # ℹ 19 more variables: fg3_per_g <dbl>, fg3a_per_g <dbl>, fg3_pct <dbl>,
#> #   fg2_per_g <dbl>, fg2a_per_g <dbl>, fg2_pct <dbl>, ft_per_g <dbl>,
#> #   fta_per_g <dbl>, ft_pct <dbl>, orb_per_g <dbl>, trb_per_g <dbl>,
#> #   ast_per_g <dbl>, stl_per_g <dbl>, blk_per_g <dbl>, tov_per_g <dbl>,
#> #   pf_per_g <dbl>, pts_per_g <dbl>, season <int>, table <chr>
# }
```

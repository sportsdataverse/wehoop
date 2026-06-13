# **Bart Torvik Women's T-Rank Ratings**

**Get women's college basketball T-Rank team ratings and adjusted
efficiencies from [barttorvik.com](https://barttorvik.com/ncaaw).**
Pulls the `/ncaaw/{year}_team_results.csv` file (one row per team). No
API key required.

## Usage

``` r
bart_wbb_ratings(year = most_recent_wbb_season())
```

## Arguments

- year:

  Season, 4-digit ending-year format (e.g. `2024`). Defaults to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

## Value

A `wehoop_data` tibble, one row per team: `rank`, `team`, `conf`,
`record`, `adjoe`, `adjde`, `barthag`, plus projection / SOS / quality
columns, and `year`.

## See also

Other Bart Torvik Functions:
[`bart_wbb_game_schedule()`](https://wehoop.sportsdataverse.org/reference/bart_wbb_game_schedule.md)

## Examples

``` r
# \donttest{
  try(bart_wbb_ratings(year = 2024))
#> ── Bart Torvik women's T-Rank ratings from barttorvik.com ────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-13 03:24:21 UTC
#> # A tibble: 360 × 46
#>     rank team     conf  record adjoe oe_rank adjde de_rank barthag rank_2 proj_w
#>    <int> <chr>    <chr> <chr>  <dbl>   <int> <dbl>   <int>   <dbl>  <int>  <dbl>
#>  1     1 South C… SEC   38-0    124.       2  73.6       1   0.997      1     38
#>  2     2 Connect… BE    33-6    121.       4  74.7       2   0.996      2     33
#>  3     3 Texas    B12   33-5    120.       5  76.4       8   0.995      3     33
#>  4     4 Iowa     B10   34-5    129.       1  84.6      42   0.992      4     34
#>  5     5 UCLA     P12   27-7    116.      13  75.9       6   0.992      5     27
#>  6     6 Stanford P12   30-6    121.       3  80.2      18   0.991      6     30
#>  7     7 LSU      SEC   31-6    119.       7  78.9      13   0.991      7     31
#>  8     8 USC      P12   29-6    117.      10  79.5      16   0.989      8     29
#>  9     9 Notre D… ACC   28-7    111.      26  75.7       3   0.988      9     28
#> 10    10 Ohio St. B10   26-6    115.      15  78.3      12   0.988     10     26
#> # ℹ 350 more rows
#> # ℹ 35 more variables: proj_l <dbl>, pro_con_w <dbl>, pro_con_l <dbl>,
#> #   con_rec <chr>, sos <dbl>, ncsos <dbl>, consos <dbl>, proj_sos <dbl>,
#> #   proj_noncon_sos <dbl>, proj_con_sos <dbl>, elite_sos <dbl>,
#> #   elite_noncon_sos <dbl>, opp_oe <dbl>, opp_de <dbl>, opp_proj_oe <dbl>,
#> #   opp_proj_de <dbl>, con_adj_oe <dbl>, con_adj_de <dbl>, qual_o <dbl>,
#> #   qual_d <dbl>, qual_barthag <dbl>, qual_games <dbl>, fun <dbl>, …
# }
```

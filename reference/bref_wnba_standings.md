# **Basketball-Reference WNBA Standings**

**Get WNBA standings (both conferences) from
[Basketball-Reference](https://www.basketball-reference.com/wnba/).**

One row per team with record and win percentage, labelled by a
`conference` column (`Eastern` / `Western`). No account or API key is
required.

## Usage

``` r
bref_wnba_standings(season = most_recent_wnba_season())
```

## Arguments

- season:

  Season, 4-digit year format (e.g. `2024`). Defaults to
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md).

## Value

A `wehoop_data` tibble with one row per team:

|              |           |
|--------------|-----------|
| col_name     | types     |
| team         | character |
| wins         | numeric   |
| losses       | numeric   |
| win_loss_pct | numeric   |
| conference   | character |
| season       | integer   |

## See also

Other WNBA Basketball-Reference Functions:
[`bref_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_player_stats.md),
[`bref_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_team_stats.md)

## Examples

``` r
# \donttest{
  try(bref_wnba_standings(season = 2024))
#> ── WNBA standings from basketball-reference.com ──────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 14:38:22 UTC
#> # A tibble: 12 × 11
#>    team         wins losses win_loss_pct gb    pts_per_g opp_pts_per_g wins_pyth
#>    <chr>       <dbl>  <dbl>        <dbl> <chr>     <dbl>         <dbl>     <dbl>
#>  1 New York L…    32      8        0.8   —          85.6          76.5        33
#>  2 Connecticu…    28     12        0.7   4.0        80.1          73.6        31
#>  3 Indiana Fe…    20     20        0.5   12.0       85            87.7        16
#>  4 Atlanta Dr…    15     25        0.375 17.0       77            79.8        15
#>  5 Washington…    14     26        0.35  18.0       79.3          82.3        15
#>  6 Chicago Sky    13     27        0.325 19.0       77.4          82.5        12
#>  7 Minnesota …    30     10        0.75  —          82            75.6        30
#>  8 Las Vegas …    27     13        0.675 3.0        86.4          80.9        29
#>  9 Seattle St…    25     15        0.625 5.0        83.2          78.8        27
#> 10 Phoenix Me…    19     21        0.475 11.0       81.5          84.8        15
#> 11 Dallas Win…     9     31        0.225 21.0       84.2          92.1         9
#> 12 Los Angele…     8     32        0.2   22.0       78.4          85.6         9
#> # ℹ 3 more variables: losses_pyth <dbl>, conference <chr>, season <int>
# }
```

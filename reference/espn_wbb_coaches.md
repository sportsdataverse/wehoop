# **Get ESPN Women's College Basketball Coaches**

**Get ESPN Women's College Basketball Coaches**

**Get ESPN Women's College Basketball Coaches**

## Usage

``` r
espn_wbb_coaches(season = most_recent_wbb_season(), ...)
```

## Arguments

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WBB
  season.

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)` – see
  [`?wehoop`](https://wehoop.sportsdataverse.org/reference/wehoop-package.md)
  for details.

## Value

A single `wehoop_data` tibble with one row per coach.

|            |           |                                   |
|------------|-----------|-----------------------------------|
| col_name   | types     | description                       |
| coach_id   | character | Unique identifier for coach.      |
| first_name | character | Player's first name.              |
| last_name  | character | Player's last name.               |
| full_name  | character | Player's full name.               |
| experience | integer   | Years of professional experience. |
| team_id    | character | Unique team identifier.           |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_coaches(season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Coaches from ESPN.com ──────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:21:26 UTC
#> # A tibble: 375 × 6
#>    coach_id first_name last_name full_name experience team_id
#>    <chr>    <chr>      <chr>     <chr>          <int> <chr>  
#>  1 NA       NA         NA        NA                NA NA     
#>  2 NA       NA         NA        NA                NA NA     
#>  3 NA       NA         NA        NA                NA NA     
#>  4 NA       NA         NA        NA                NA NA     
#>  5 NA       NA         NA        NA                NA NA     
#>  6 NA       NA         NA        NA                NA NA     
#>  7 NA       NA         NA        NA                NA NA     
#>  8 NA       NA         NA        NA                NA NA     
#>  9 NA       NA         NA        NA                NA NA     
#> 10 NA       NA         NA        NA                NA NA     
#> # ℹ 365 more rows
# }
```

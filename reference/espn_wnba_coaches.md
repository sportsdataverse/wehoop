# **Get ESPN WNBA Coaches**

**Get ESPN WNBA Coaches**

**Get ESPN WNBA Coaches**

## Usage

``` r
espn_wnba_coaches(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WNBA
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

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_coaches(season = 2025)
#> ── ESPN WNBA Coaches from ESPN.com ───────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:25 UTC
#> # A tibble: 12 × 6
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
#> 11 NA       NA         NA        NA                NA NA     
#> 12 NA       NA         NA        NA                NA NA     
# }
```

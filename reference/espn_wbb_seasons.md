# **Get ESPN Women's College Basketball Seasons**

**Get ESPN Women's College Basketball Seasons**

**Get ESPN Women's College Basketball Seasons**

## Usage

``` r
espn_wbb_seasons(...)
```

## Arguments

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)` – see
  [`?wehoop`](https://wehoop.sportsdataverse.org/reference/wehoop-package.md)
  for details.

## Value

A single `wehoop_data` tibble with one row per season.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| start_date | character | Start date (YYYY-MM-DD). |
| end_date | character | End date (YYYY-MM-DD). |
| display_name | character | Display name. |
| season_type_count | integer | Count of season type. |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_seasons()
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Seasons from ESPN.com ──────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:15 UTC
#> # A tibble: 1 × 5
#>   season start_date end_date display_name season_type_count
#>    <int> <chr>      <chr>    <chr>                    <int>
#> 1     NA NA         NA       NA                          NA
# }
```

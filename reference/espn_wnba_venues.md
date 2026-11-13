# **Get ESPN WNBA Venues**

**Get ESPN WNBA Venues**

**Get ESPN WNBA Venues**

## Usage

``` r
espn_wnba_venues(...)
```

## Arguments

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)` – see
  [`?wehoop`](https://wehoop.sportsdataverse.org/reference/wehoop-package.md)
  for details.

## Value

A single `wehoop_data` tibble with one row per venue.

Columns as documented in the shared
[espn_basketball_venues_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_venues_schema.md)
table.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_venues()
#> ── ESPN WNBA Venues from ESPN.com ────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:57:00 UTC
#> # A tibble: 227 × 9
#>    venue_id name  full_name address_city address_state capacity indoor grass
#>    <chr>    <chr> <chr>     <chr>        <chr>            <int> <lgl>  <lgl>
#>  1 NA       NA    NA        NA           NA                  NA NA     NA   
#>  2 NA       NA    NA        NA           NA                  NA NA     NA   
#>  3 NA       NA    NA        NA           NA                  NA NA     NA   
#>  4 NA       NA    NA        NA           NA                  NA NA     NA   
#>  5 NA       NA    NA        NA           NA                  NA NA     NA   
#>  6 NA       NA    NA        NA           NA                  NA NA     NA   
#>  7 NA       NA    NA        NA           NA                  NA NA     NA   
#>  8 NA       NA    NA        NA           NA                  NA NA     NA   
#>  9 NA       NA    NA        NA           NA                  NA NA     NA   
#> 10 NA       NA    NA        NA           NA                  NA NA     NA   
#> # ℹ 217 more rows
#> # ℹ 1 more variable: images_url <chr>
# }
```

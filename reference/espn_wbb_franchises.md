# **Get ESPN WBB Franchises Index**

Returns the full WBB franchises index from
`sports.core.api.espn.com/v2/sports/basketball/leagues/womens-college-basketball/franchises`.
Each row is one franchise with its ID and the canonical `$ref` URL –
pass an ID to
[`espn_wbb_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_franchise.md)
for full franchise detail.

## Usage

``` r
espn_wbb_franchises(...)
```

## Arguments

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per franchise.

|              |           |                                              |
|--------------|-----------|----------------------------------------------|
| col_name     | types     | description                                  |
| franchise_id | character | ESPN franchise identifier.                   |
| ref          | character | Full `$ref` URL for franchise detail.        |
| league       | character | League slug (`"womens-college-basketball"`). |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_franchises()
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Franchises Index ───────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:08:45 UTC
#> # A tibble: 200 × 3
#>    franchise_id ref                                                       league
#>    <chr>        <chr>                                                     <chr> 
#>  1 1            http://sports.core.api.espn.com/v2/sports/basketball/lea… women…
#>  2 2            http://sports.core.api.espn.com/v2/sports/basketball/lea… women…
#>  3 3            http://sports.core.api.espn.com/v2/sports/basketball/lea… women…
#>  4 4            http://sports.core.api.espn.com/v2/sports/basketball/lea… women…
#>  5 5            http://sports.core.api.espn.com/v2/sports/basketball/lea… women…
#>  6 6            http://sports.core.api.espn.com/v2/sports/basketball/lea… women…
#>  7 7            http://sports.core.api.espn.com/v2/sports/basketball/lea… women…
#>  8 8            http://sports.core.api.espn.com/v2/sports/basketball/lea… women…
#>  9 9            http://sports.core.api.espn.com/v2/sports/basketball/lea… women…
#> 10 11           http://sports.core.api.espn.com/v2/sports/basketball/lea… women…
#> # ℹ 190 more rows
# }
```

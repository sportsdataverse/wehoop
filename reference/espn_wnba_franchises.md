# **Get ESPN WNBA Franchises Index**

Returns the full WNBA franchises index from
`sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/franchises`.
Each row is one franchise with its ID and the canonical `$ref` URL –
pass an ID to
[`espn_wnba_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchise.md)
for full franchise detail.

## Usage

``` r
espn_wnba_franchises(...)
```

## Arguments

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per franchise.

|              |           |                                       |
|--------------|-----------|---------------------------------------|
| col_name     | types     | description                           |
| franchise_id | character | ESPN franchise identifier.            |
| ref          | character | Full `$ref` URL for franchise detail. |
| league       | character | League slug (`"wnba"`).               |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_franchises()
#> ── ESPN WNBA Franchises Index ────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:22:00 UTC
#> # A tibble: 15 × 3
#>    franchise_id ref                                                       league
#>    <chr>        <chr>                                                     <chr> 
#>  1 3            http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#>  2 5            http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#>  3 6            http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#>  4 8            http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#>  5 9            http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#>  6 11           http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#>  7 14           http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#>  8 16           http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#>  9 17           http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#> 10 18           http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#> 11 19           http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#> 12 20           http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#> 13 129689       http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#> 14 131935       http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
#> 15 132052       http://sports.core.api.espn.com/v2/sports/basketball/lea… wnba  
# }
```

# **Get ESPN WNBA Positions Index**

Returns the WNBA position dictionary index. One row per position with
its id and the canonical `$ref` URL – pass an id to
[`espn_wnba_position()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_position.md)
for full details (display name, abbreviation, leaf flag, parent link).

## Usage

``` r
espn_wnba_positions(...)
```

## Arguments

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per position.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_positions()
#> ── ESPN WNBA Positions Index ─────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:22:14 UTC
#> # A tibble: 12 × 3
#>    position_id ref                                                        league
#>    <chr>       <chr>                                                      <chr> 
#>  1 0           http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
#>  2 1           http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
#>  3 2           http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
#>  4 3           http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
#>  5 4           http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
#>  6 5           http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
#>  7 6           http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
#>  8 7           http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
#>  9 8           http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
#> 10 9           http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
#> 11 74          http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
#> 12 99          http://sports.core.api.espn.com/v2/sports/basketball/leag… wnba  
# }
```

# **Get ESPN WBB Positions Index**

Returns the WBB position dictionary index. One row per position with its
id and the canonical `$ref` URL – pass an id to
[`espn_wbb_position()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_position.md)
for full details (display name, abbreviation, leaf flag, parent link).

## Usage

``` r
espn_wbb_positions(...)
```

## Arguments

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per position.

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_positions()
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Positions Index ────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 11:36:49 UTC
#> # A tibble: 14 × 3
#>    position_id ref                                                        league
#>    <chr>       <chr>                                                      <chr> 
#>  1 0           http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#>  2 1           http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#>  3 2           http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#>  4 3           http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#>  5 4           http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#>  6 5           http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#>  7 6           http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#>  8 7           http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#>  9 8           http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#> 10 9           http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#> 11 10          http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#> 12 11          http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#> 13 12          http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
#> 14 74          http://sports.core.api.espn.com/v2/sports/basketball/leag… women…
# }
```

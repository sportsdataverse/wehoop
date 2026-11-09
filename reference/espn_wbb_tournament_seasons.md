# **Get ESPN WBB Tournament Seasons List**

Returns the seasons in which a given WBB tournament was held.

## Usage

``` r
espn_wbb_tournament_seasons(tournament_id, ...)
```

## Arguments

- tournament_id:

  ESPN tournament identifier.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per season.

|               |           |                                  |
|---------------|-----------|----------------------------------|
| col_name      | types     | description                      |
| league        | character | League slug.                     |
| tournament_id | character | ESPN tournament identifier.      |
| season        | integer   | Season year.                     |
| ref           | character | Full `$ref` URL for that season. |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_tournament_seasons(tournament_id = 3)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Tournament Seasons ─────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 20:19:30 UTC
#> # A tibble: 11 × 4
#>    league                    tournament_id season ref                           
#>    <chr>                     <chr>          <int> <chr>                         
#>  1 womens-college-basketball 3               2010 http://sports.core.api.espn.c…
#>  2 womens-college-basketball 3               2011 http://sports.core.api.espn.c…
#>  3 womens-college-basketball 3               2014 http://sports.core.api.espn.c…
#>  4 womens-college-basketball 3               2015 http://sports.core.api.espn.c…
#>  5 womens-college-basketball 3               2016 http://sports.core.api.espn.c…
#>  6 womens-college-basketball 3               2017 http://sports.core.api.espn.c…
#>  7 womens-college-basketball 3               2018 http://sports.core.api.espn.c…
#>  8 womens-college-basketball 3               2019 http://sports.core.api.espn.c…
#>  9 womens-college-basketball 3               2020 http://sports.core.api.espn.c…
#> 10 womens-college-basketball 3               2022 http://sports.core.api.espn.c…
#> 11 womens-college-basketball 3               2023 http://sports.core.api.espn.c…
# }
```

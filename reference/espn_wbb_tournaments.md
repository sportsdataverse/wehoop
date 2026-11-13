# **Get ESPN WBB Tournaments Index**

Returns the index of women's college basketball tournaments tracked by
ESPN – including the NCAA Tournament, WNIT, conference tournaments, and
other in-season events. Pass an ID to
[`espn_wbb_tournament()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament.md)
for the human-readable name and seasons-list ref.

Note: ESPN does not expose a tournaments endpoint for the WNBA.

## Usage

``` r
espn_wbb_tournaments(...)
```

## Arguments

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per tournament.

|               |           |                                              |
|---------------|-----------|----------------------------------------------|
| col_name      | types     | description                                  |
| tournament_id | character | ESPN tournament identifier.                  |
| ref           | character | Full `$ref` URL for the detail.              |
| league        | character | League slug (`"womens-college-basketball"`). |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_tournaments()
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Tournaments Index ──────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:23 UTC
#> # A tibble: 38 × 3
#>    tournament_id ref                                                      league
#>    <chr>         <chr>                                                    <chr> 
#>  1 3             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  2 1             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  3 39            http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  4 2             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  5 4             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  6 5             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  7 6             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  8 7             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  9 8             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#> 10 9             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#> # ℹ 28 more rows
# }
```

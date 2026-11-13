# **Get ESPN WBB Season Awards Index**

Returns the list of award IDs given out in a WBB season from
`sports.core.api.espn.com/v2/sports/basketball/leagues/womens-college-basketball/seasons/{season}/awards`.
The index only contains IDs and `$ref` URLs – pass an ID to
[`espn_wbb_award()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_award.md)
for the award name, description, and winners.

## Usage

``` r
espn_wbb_season_awards(season = most_recent_wbb_season(), ...)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WBB season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per award.

|          |           |                                              |
|----------|-----------|----------------------------------------------|
| col_name | types     | description                                  |
| season   | integer   | Season year.                                 |
| award_id | character | ESPN award identifier.                       |
| ref      | character | Full `$ref` URL for the award detail.        |
| league   | character | League slug (`"womens-college-basketball"`). |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_season_awards(season = 2024)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Awards Index ────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:49:55 UTC
#> # A tibble: 11 × 4
#>    season award_id ref                                                    league
#>     <int> <chr>    <chr>                                                  <chr> 
#>  1   2024 357      http://sports.core.api.espn.com/v2/sports/basketball/… women…
#>  2   2024 358      http://sports.core.api.espn.com/v2/sports/basketball/… women…
#>  3   2024 359      http://sports.core.api.espn.com/v2/sports/basketball/… women…
#>  4   2024 360      http://sports.core.api.espn.com/v2/sports/basketball/… women…
#>  5   2024 362      http://sports.core.api.espn.com/v2/sports/basketball/… women…
#>  6   2024 366      http://sports.core.api.espn.com/v2/sports/basketball/… women…
#>  7   2024 367      http://sports.core.api.espn.com/v2/sports/basketball/… women…
#>  8   2024 457      http://sports.core.api.espn.com/v2/sports/basketball/… women…
#>  9   2024 364      http://sports.core.api.espn.com/v2/sports/basketball/… women…
#> 10   2024 363      http://sports.core.api.espn.com/v2/sports/basketball/… women…
#> 11   2024 365      http://sports.core.api.espn.com/v2/sports/basketball/… women…
# }
```

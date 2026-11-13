# **Get ESPN WNBA Season Awards Index**

Returns the list of award IDs given out in a WNBA season from
`sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/{season}/awards`.
The index only contains IDs and `$ref` URLs – pass an ID to
[`espn_wnba_award()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_award.md)
for the award name, description, and winners.

## Usage

``` r
espn_wnba_season_awards(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per award.

|          |           |                                       |
|----------|-----------|---------------------------------------|
| col_name | types     | description                           |
| season   | integer   | Season year.                          |
| award_id | character | ESPN award identifier.                |
| ref      | character | Full `$ref` URL for the award detail. |
| league   | character | League slug (`"wnba"`).               |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_season_awards(season = 2024)
#> ── ESPN WNBA Season Awards Index ─────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:50:27 UTC
#> # A tibble: 14 × 4
#>    season award_id ref                                                    league
#>     <int> <chr>    <chr>                                                  <chr> 
#>  1   2024 241      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  2   2024 246      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  3   2024 244      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  4   2024 243      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  5   2024 242      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  6   2024 245      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  7   2024 257      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  8   2024 237      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  9   2024 250      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#> 10   2024 251      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#> 11   2024 238      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#> 12   2024 239      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#> 13   2024 248      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#> 14   2024 247      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
# }
```

# **Get ESPN WNBA Season Types Index**

Returns the index of season-type IDs that exist for one WNBA season
(typically 1 = preseason, 2 = regular, 3 = postseason, 4 = off-season).
Pass an ID to
[`espn_wnba_season_type()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_type.md)
for the start/end dates and whether that type carries groups, standings,
or legs.

## Usage

``` r
espn_wnba_season_types(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per season type.

|             |           |                                 |
|-------------|-----------|---------------------------------|
| col_name    | types     | description                     |
| league      | character | League slug (`"wnba"`).         |
| season      | integer   | Season year.                    |
| season_type | integer   | Season-type id (1/2/3/4).       |
| ref         | character | `$ref` URL for the type detail. |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_season_types(season = 2025)
#> ── ESPN WNBA Season Types Index ──────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:10:28 UTC
#> # A tibble: 4 × 4
#>   league season season_type ref                                                 
#>   <chr>   <int>       <int> <chr>                                               
#> 1 wnba     2025           1 http://sports.core.api.espn.com/v2/sports/basketbal…
#> 2 wnba     2025           2 http://sports.core.api.espn.com/v2/sports/basketbal…
#> 3 wnba     2025           3 http://sports.core.api.espn.com/v2/sports/basketbal…
#> 4 wnba     2025           4 http://sports.core.api.espn.com/v2/sports/basketbal…
# }
```

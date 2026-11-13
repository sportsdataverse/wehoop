# **Get ESPN WNBA Season Groups Index**

Returns the list of group IDs (conferences / divisions) for one (WNBA
season x season-type) via core-v2
`/seasons/{season}/types/{season_type}/groups`.

## Usage

``` r
espn_wnba_season_groups(
  season = most_recent_wnba_season(),
  season_type = c(2L, 3L),
  ...
)
```

## Arguments

- season:

  Season year. Defaults to most recent WNBA season.

- season_type:

  Season-type id (2 = regular (default)).

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per group.

|             |           |                                  |
|-------------|-----------|----------------------------------|
| col_name    | types     | description                      |
| league      | character | League slug.                     |
| season      | integer   | Season year.                     |
| season_type | integer   | Season-type id.                  |
| group_id    | character | ESPN group id.                   |
| ref         | character | `$ref` URL for the group detail. |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_season_groups(season = 2025)
#> ── ESPN WNBA Season Groups Index ─────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:39 UTC
#> # A tibble: 4 × 5
#>   league season season_type group_id ref                                        
#>   <chr>   <int>       <int> <chr>    <chr>                                      
#> 1 wnba     2025           2 1        http://sports.core.api.espn.com/v2/sports/…
#> 2 wnba     2025           2 2        http://sports.core.api.espn.com/v2/sports/…
#> 3 wnba     2025           3 1        http://sports.core.api.espn.com/v2/sports/…
#> 4 wnba     2025           3 2        http://sports.core.api.espn.com/v2/sports/…
# }
```

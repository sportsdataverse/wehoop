# **Get ESPN WBB Season Groups Index**

Returns the list of group IDs (conferences / divisions) for one (WBB
season x season-type) via core-v2
`/seasons/{season}/types/{season_type}/groups`.

## Usage

``` r
espn_wbb_season_groups(
  season = most_recent_wbb_season(),
  season_type = c(2L, 3L),
  ...
)
```

## Arguments

- season:

  Season year. Defaults to most recent WBB season.

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

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_season_groups(season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Groups Index ────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:21:43 UTC
#> # A tibble: 4 × 5
#>   league                    season season_type group_id ref                     
#>   <chr>                      <int>       <int> <chr>    <chr>                   
#> 1 womens-college-basketball   2025           2 50       http://sports.core.api.…
#> 2 womens-college-basketball   2025           2 51       http://sports.core.api.…
#> 3 womens-college-basketball   2025           3 50       http://sports.core.api.…
#> 4 womens-college-basketball   2025           3 51       http://sports.core.api.…
# }
```

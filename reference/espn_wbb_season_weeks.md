# **Get ESPN WBB Season Weeks Index**

Returns the list of week IDs for one (WBB season x season-type). WBB
uses a week structure inherited from ESPN's schema, but week-level
rankings are populated only for college (MBB / WBB).

## Usage

``` r
espn_wbb_season_weeks(
  season = most_recent_wbb_season(),
  season_type = c(2L, 3L),
  ...
)
```

## Arguments

- season:

  Season year. Defaults to most recent WBB season.

- season_type:

  Season-type id (2 = regular (default), 3 = postseason).

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per week.

|             |           |                                 |
|-------------|-----------|---------------------------------|
| col_name    | types     | description                     |
| league      | character | League slug.                    |
| season      | integer   | Season year.                    |
| season_type | integer   | Season-type id.                 |
| week        | integer   | Week number (1-based).          |
| ref         | character | `$ref` URL for the week detail. |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_season_weeks(season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Weeks Index ─────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:09:55 UTC
#> # A tibble: 24 × 5
#>    league                    season season_type  week ref                       
#>    <chr>                      <int>       <int> <int> <chr>                     
#>  1 womens-college-basketball   2025           2     1 http://sports.core.api.es…
#>  2 womens-college-basketball   2025           2     2 http://sports.core.api.es…
#>  3 womens-college-basketball   2025           2     3 http://sports.core.api.es…
#>  4 womens-college-basketball   2025           2     4 http://sports.core.api.es…
#>  5 womens-college-basketball   2025           2     5 http://sports.core.api.es…
#>  6 womens-college-basketball   2025           2     6 http://sports.core.api.es…
#>  7 womens-college-basketball   2025           2     7 http://sports.core.api.es…
#>  8 womens-college-basketball   2025           2     8 http://sports.core.api.es…
#>  9 womens-college-basketball   2025           2     9 http://sports.core.api.es…
#> 10 womens-college-basketball   2025           2    10 http://sports.core.api.es…
#> # ℹ 14 more rows
# }
```

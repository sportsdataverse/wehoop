# **Get ESPN WBB Season Rankings Index**

Returns the index of season-level rankings recorded for one WBB season.
Typical sources: AP Top 25 (id 1), Coaches Poll (id 2). Pass an
`ranking_id` to
[`espn_wbb_season_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_ranking.md)
for the ranked teams.

## Usage

``` r
espn_wbb_season_rankings(season = most_recent_wbb_season(), ...)
```

## Arguments

- season:

  Season year. Defaults to most recent WBB season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per ranking source.

|            |           |                                    |
|------------|-----------|------------------------------------|
| col_name   | types     | description                        |
| league     | character | League slug.                       |
| season     | integer   | Season year.                       |
| ranking_id | character | ESPN ranking id.                   |
| ref        | character | `$ref` URL for the ranking detail. |

## Details

**Get ESPN WBB Season Rankings Index**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_season_rankings(season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Rankings Index ──────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:09:53 UTC
#> # A tibble: 2 × 4
#>   league                    season ranking_id ref                               
#>   <chr>                      <int> <chr>      <chr>                             
#> 1 womens-college-basketball   2025 1          http://sports.core.api.espn.com/v…
#> 2 womens-college-basketball   2025 2          http://sports.core.api.espn.com/v…
# }
```

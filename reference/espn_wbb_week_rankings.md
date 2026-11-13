# **Get ESPN WBB Per-Week Rankings Index**

Returns the index of ranking sources available for one (WBB season x
season-type x week). Typical sources: AP Top 25 (id 1), Coaches Poll (id
2). Pass an id to
[`espn_wbb_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_ranking.md)
for the ranked teams.

## Usage

``` r
espn_wbb_week_rankings(
  week,
  season = most_recent_wbb_season(),
  season_type = 2L,
  ...
)
```

## Arguments

- week:

  Week number.

- season:

  Season year. Defaults to most recent WBB season.

- season_type:

  Season-type id (2 = regular (default)).

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per ranking source.

|             |           |                                         |
|-------------|-----------|-----------------------------------------|
| col_name    | types     | description                             |
| league      | character | League slug.                            |
| season      | integer   | Season year.                            |
| season_type | integer   | Season-type id.                         |
| week        | integer   | Week number.                            |
| ranking_id  | character | ESPN ranking id.                        |
| ref         | character | `$ref` URL for the ranked-teams detail. |

## Details

**Get ESPN WBB Per-Week Rankings Index**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_week_rankings(week = 5, season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Week Rankings Index ────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:56:37 UTC
#> # A tibble: 2 × 6
#>   league                    season season_type  week ranking_id ref             
#>   <chr>                      <int>       <int> <int> <chr>      <chr>           
#> 1 womens-college-basketball   2025           2     5 1          http://sports.c…
#> 2 womens-college-basketball   2025           2     5 2          http://sports.c…
# }
```

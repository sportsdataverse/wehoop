# **Get ESPN WNBA Season Weeks Index**

Returns the list of week IDs for one (WNBA season x season-type). WNBA
uses a week structure inherited from ESPN's schema, but week-level
rankings are populated only for college (MBB / WBB).

## Usage

``` r
espn_wnba_season_weeks(
  season = most_recent_wnba_season(),
  season_type = c(2L, 3L),
  ...
)
```

## Arguments

- season:

  Season year. Defaults to most recent WNBA season.

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

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_season_weeks(season = 2025)
#> ── ESPN WNBA Season Weeks Index ──────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:56:55 UTC
#> # A tibble: 0 × 5
#> # ℹ 5 variables: league <chr>, season <int>, season_type <int>, week <int>,
#> #   ref <chr>
# }
```

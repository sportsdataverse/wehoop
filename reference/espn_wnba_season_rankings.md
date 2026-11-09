# **Get ESPN WNBA Season Rankings Index**

Returns the index of season-level rankings recorded for one WNBA season.
WNBA typically returns zero rankings (ranking polls are a college
concept); the wrapper is provided for symmetry across leagues. For WBB
use the matching
[`espn_wbb_season_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_rankings.md).

## Usage

``` r
espn_wnba_season_rankings(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Season year. Defaults to most recent WNBA season.

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

**Get ESPN WNBA Season Rankings Index**

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_season_rankings(season = 2025)
#> ── ESPN WNBA Season Rankings Index ───────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:36 UTC
#> # A tibble: 0 × 4
#> # ℹ 4 variables: league <chr>, season <int>, ranking_id <chr>, ref <chr>
# }
```

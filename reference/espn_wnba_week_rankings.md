# **Get ESPN WNBA Per-Week Rankings Index**

Returns the index of ranking sources available for one (WNBA season x
season-type x week). WNBA does not publish weekly rankings, so this
typically returns an empty tibble; the wrapper is provided for symmetry
with college (MBB / WBB).

## Usage

``` r
espn_wnba_week_rankings(
  week,
  season = most_recent_wnba_season(),
  season_type = 2L,
  ...
)
```

## Arguments

- week:

  Week number.

- season:

  Season year. Defaults to most recent WNBA season.

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

**Get ESPN WNBA Per-Week Rankings Index**

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_week_rankings(week = 5, season = 2025)
#> ── ESPN WNBA Week Rankings Index ─────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:10:35 UTC
#> # A tibble: 0 × 6
#> # ℹ 6 variables: league <chr>, season <int>, season_type <int>, week <int>,
#> #   ranking_id <chr>, ref <chr>
# }
```

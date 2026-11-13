# **Get ESPN WBB Season-Week Detail**

Returns metadata for one week (number, start / end dates, text label,
and `$ref` to the per-week rankings endpoint).

## Usage

``` r
espn_wbb_season_week(
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

A single-row tibble.

Columns as documented in the shared
[espn_basketball_season_week_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_season_week_schema.md)
table.

## Details

**Get ESPN WBB Season-Week Detail**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_season_week(week = 5, season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Week Detail ─────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 18:16:22 UTC
#> # A tibble: 1 × 8
#>   league         season season_type  week text  start_date end_date rankings_ref
#>   <chr>           <int>       <int> <int> <chr> <chr>      <chr>    <chr>       
#> 1 womens-colleg…   2025           2     5 Week… 2024-12-0… 2024-12… http://spor…
# }
```

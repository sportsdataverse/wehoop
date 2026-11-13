# **Get ESPN WBB Season-Type Detail**

Returns metadata for one season-type within an WBB season: name,
abbreviation, start / end dates, and whether it carries groups,
standings, or playoff legs.

## Usage

``` r
espn_wbb_season_type(season_type = 2L, season = most_recent_wbb_season(), ...)
```

## Arguments

- season_type:

  Season-type id (1 = preseason, 2 = regular (default), 3 = postseason,
  4 = off-season).

- season:

  Season year. Defaults to most recent WBB season.

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

Columns as documented in the shared
[espn_basketball_season_type_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_season_type_schema.md)
table.

## Details

**Get ESPN WBB Season-Type Detail**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_season_type(season_type = 2, season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Type Detail ─────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:21:46 UTC
#> # A tibble: 1 × 16
#>   league   season season_type  type name  abbreviation  year start_date end_date
#>   <chr>     <int>       <int> <int> <chr> <chr>        <int> <chr>      <chr>   
#> 1 womens-…   2025           2     2 Regu… reg           2025 2024-11-0… 2025-03…
#> # ℹ 7 more variables: has_groups <lgl>, has_standings <lgl>, has_legs <lgl>,
#> #   slug <chr>, groups_ref <chr>, weeks_ref <chr>, leaders_ref <chr>
# }
```

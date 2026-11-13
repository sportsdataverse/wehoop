# **Get ESPN WBB Team Record Detail (Long Format)**

Returns one team's record detail in long format: one row per stat in the
record's `stats[]` array. Use the record-index endpoint to enumerate
available `record_id` values per team-season (overall / home / away /
conference + per-opponent breakdowns).

## Usage

``` r
espn_wbb_team_record_detail(team_id, season, record_id, season_type = 2L, ...)
```

## Arguments

- team_id:

  ESPN team identifier.

- season:

  Season year (numeric).

- record_id:

  Record identifier (from the record-index endpoint index).

- season_type:

  Integer season type: 1 = preseason, 2 = regular (default), 3 =
  postseason.

- ...:

  Additional arguments; currently unused.

## Value

A long tibble.

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_team_record_detail(team_id = 2509, season = 2024, record_id = 0)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Record Detail ─────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:21:51 UTC
#> # A tibble: 20 × 15
#>    league         team_id season season_type record_id record_name record_abbrev
#>    <chr>          <chr>    <int>       <int> <chr>     <chr>       <chr>        
#>  1 womens-colleg… 2509      2024           2 0         overall     Season       
#>  2 womens-colleg… 2509      2024           2 0         overall     Season       
#>  3 womens-colleg… 2509      2024           2 0         overall     Season       
#>  4 womens-colleg… 2509      2024           2 0         overall     Season       
#>  5 womens-colleg… 2509      2024           2 0         overall     Season       
#>  6 womens-colleg… 2509      2024           2 0         overall     Season       
#>  7 womens-colleg… 2509      2024           2 0         overall     Season       
#>  8 womens-colleg… 2509      2024           2 0         overall     Season       
#>  9 womens-colleg… 2509      2024           2 0         overall     Season       
#> 10 womens-colleg… 2509      2024           2 0         overall     Season       
#> 11 womens-colleg… 2509      2024           2 0         overall     Season       
#> 12 womens-colleg… 2509      2024           2 0         overall     Season       
#> 13 womens-colleg… 2509      2024           2 0         overall     Season       
#> 14 womens-colleg… 2509      2024           2 0         overall     Season       
#> 15 womens-colleg… 2509      2024           2 0         overall     Season       
#> 16 womens-colleg… 2509      2024           2 0         overall     Season       
#> 17 womens-colleg… 2509      2024           2 0         overall     Season       
#> 18 womens-colleg… 2509      2024           2 0         overall     Season       
#> 19 womens-colleg… 2509      2024           2 0         overall     Season       
#> 20 womens-colleg… 2509      2024           2 0         overall     Season       
#> # ℹ 8 more variables: record_display <chr>, record_type <chr>,
#> #   record_summary <chr>, stat_name <chr>, stat_abbrev <chr>,
#> #   stat_display <chr>, value <dbl>, stat_display_value <chr>
# }
```

# **Get ESPN WNBA Team Record Detail (Long Format)**

Returns one team's record detail in long format: one row per stat in the
record's `stats[]` array. Use
[`espn_wnba_team_record()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record.md)
to enumerate available `record_id` values per team-season (overall /
home / away / conference + per-opponent breakdowns).

## Usage

``` r
espn_wnba_team_record_detail(team_id, season, record_id, season_type = 2L, ...)
```

## Arguments

- team_id:

  ESPN team identifier.

- season:

  Season year (numeric).

- record_id:

  Record identifier (from
  [`espn_wnba_team_record()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record.md)
  index).

- season_type:

  Integer season type: 1 = preseason, 2 = regular (default), 3 =
  postseason.

- ...:

  Additional arguments; currently unused.

## Value

A long tibble.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_team_record_detail(team_id = 17, season = 2024, record_id = 0)
#> ── ESPN WNBA Team Record Detail ──────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:22:23 UTC
#> # A tibble: 21 × 15
#>    league team_id season season_type record_id record_name record_abbrev
#>    <chr>  <chr>    <int>       <int> <chr>     <chr>       <chr>        
#>  1 wnba   17        2024           2 0         overall     Total        
#>  2 wnba   17        2024           2 0         overall     Total        
#>  3 wnba   17        2024           2 0         overall     Total        
#>  4 wnba   17        2024           2 0         overall     Total        
#>  5 wnba   17        2024           2 0         overall     Total        
#>  6 wnba   17        2024           2 0         overall     Total        
#>  7 wnba   17        2024           2 0         overall     Total        
#>  8 wnba   17        2024           2 0         overall     Total        
#>  9 wnba   17        2024           2 0         overall     Total        
#> 10 wnba   17        2024           2 0         overall     Total        
#> # ℹ 11 more rows
#> # ℹ 8 more variables: record_display <chr>, record_type <chr>,
#> #   record_summary <chr>, stat_name <chr>, stat_abbrev <chr>,
#> #   stat_display <chr>, value <dbl>, stat_display_value <chr>
# }
```

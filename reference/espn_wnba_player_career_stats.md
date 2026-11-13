# **Get ESPN WNBA Athlete Career Stats (Long Format)**

Returns career stats for a WNBA athlete in long format. Default
`stat_type = 0L` fetches the standard "All Splits" / regular-season
view. Pass a vector like `c(0L, 1L, 2L)` to attempt multiple types and
bind them via a `stat_type_id` column; variants that 404 for that
athlete are silently skipped. Stat types: 0 = regular season (default
endpoint), 1 = postseason, 2 = career aggregate. Coverage of types 1 and
2 is sparse – many athletes only have type 0 populated.

## Usage

``` r
espn_wnba_player_career_stats(athlete_id, stat_type = 0L, ...)
```

## Arguments

- athlete_id:

  ESPN athlete identifier.

- stat_type:

  Integer or integer vector of stat-type codes. Default `0L` fetches the
  standard "All Splits" / regular-season view. Pass a vector like
  `c(0L, 1L, 2L)` to bind multiple types via a `stat_type_id` column;
  non-existent variants are silently skipped.

- ...:

  Additional arguments; currently unused.

## Value

A long tibble (one row per stat_type x split x category x stat).

Columns as documented in the shared
[espn_basketball_player_career_stats_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_player_career_stats_schema.md)
table.

## Details

**Get ESPN WNBA Athlete Career Stats (Long Format)**

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  # LeBron James -- regular + postseason combined
  espn_wnba_player_career_stats(athlete_id = 3149391)
#> ── ESPN WNBA Athlete Career Stats ────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:22:12 UTC
#> # A tibble: 112 × 17
#>    league athlete_id stat_type_id split_id split_name split_type category_name
#>    <chr>  <chr>      <chr>        <chr>    <chr>      <chr>      <chr>        
#>  1 wnba   3149391    0            0        All Splits total      defensive    
#>  2 wnba   3149391    0            0        All Splits total      defensive    
#>  3 wnba   3149391    0            0        All Splits total      defensive    
#>  4 wnba   3149391    0            0        All Splits total      defensive    
#>  5 wnba   3149391    0            0        All Splits total      defensive    
#>  6 wnba   3149391    0            0        All Splits total      defensive    
#>  7 wnba   3149391    0            0        All Splits total      defensive    
#>  8 wnba   3149391    0            0        All Splits total      defensive    
#>  9 wnba   3149391    0            0        All Splits total      defensive    
#> 10 wnba   3149391    0            0        All Splits total      defensive    
#> # ℹ 102 more rows
#> # ℹ 10 more variables: category_display <chr>, category_short <chr>,
#> #   category_abbrev <chr>, stat_name <chr>, stat_abbrev <chr>,
#> #   stat_display <chr>, stat_short <chr>, description <chr>, value <dbl>,
#> #   display_value <chr>
  # Just career aggregate
  espn_wnba_player_career_stats(athlete_id = 3149391, stat_type = 2L)
#> ── ESPN WNBA Athlete Career Stats ────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:22:12 UTC
#> # A tibble: 0 × 17
#> # ℹ 17 variables: league <chr>, athlete_id <chr>, stat_type_id <chr>,
#> #   split_id <chr>, split_name <chr>, split_type <chr>, category_name <chr>,
#> #   category_display <chr>, category_short <chr>, category_abbrev <chr>,
#> #   stat_name <chr>, stat_abbrev <chr>, stat_display <chr>, stat_short <chr>,
#> #   description <chr>, value <dbl>, display_value <chr>
# }
```

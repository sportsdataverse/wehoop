# **Get ESPN WBB Athlete Career Stats (Long Format)**

Returns career stats for a WBB athlete in long format. Default
`stat_type = 0L` fetches the standard "All Splits" / regular-season
view. Pass a vector like `c(0L, 1L, 2L)` to attempt multiple types and
bind them via a `stat_type_id` column; variants that 404 for that
athlete are silently skipped. Stat types: 0 = regular season (default
endpoint), 1 = postseason, 2 = career aggregate. Coverage of types 1 and
2 is sparse – many athletes only have type 0 populated.

## Usage

``` r
espn_wbb_player_career_stats(athlete_id, stat_type = 0L, ...)
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

**Get ESPN WBB Athlete Career Stats (Long Format)**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  # LeBron James -- regular + postseason combined
  espn_wbb_player_career_stats(athlete_id = 4433404)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Career Stats ───────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 19:05:13 UTC
#> # A tibble: 87 × 17
#>    league   athlete_id stat_type_id split_id split_name split_type category_name
#>    <chr>    <chr>      <chr>        <chr>    <chr>      <chr>      <chr>        
#>  1 womens-… 4433404    0            0        Season     season     defensive    
#>  2 womens-… 4433404    0            0        Season     season     defensive    
#>  3 womens-… 4433404    0            0        Season     season     defensive    
#>  4 womens-… 4433404    0            0        Season     season     defensive    
#>  5 womens-… 4433404    0            0        Season     season     defensive    
#>  6 womens-… 4433404    0            0        Season     season     defensive    
#>  7 womens-… 4433404    0            0        Season     season     defensive    
#>  8 womens-… 4433404    0            0        Season     season     defensive    
#>  9 womens-… 4433404    0            0        Season     season     general      
#> 10 womens-… 4433404    0            0        Season     season     general      
#> # ℹ 77 more rows
#> # ℹ 10 more variables: category_display <chr>, category_short <chr>,
#> #   category_abbrev <chr>, stat_name <chr>, stat_abbrev <chr>,
#> #   stat_display <chr>, stat_short <chr>, description <chr>, value <dbl>,
#> #   display_value <chr>
  # Just career aggregate
  espn_wbb_player_career_stats(athlete_id = 4433404, stat_type = 2L)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Career Stats ───────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 19:05:13 UTC
#> # A tibble: 0 × 17
#> # ℹ 17 variables: league <chr>, athlete_id <chr>, stat_type_id <chr>,
#> #   split_id <chr>, split_name <chr>, split_type <chr>, category_name <chr>,
#> #   category_display <chr>, category_short <chr>, category_abbrev <chr>,
#> #   stat_name <chr>, stat_abbrev <chr>, stat_display <chr>, stat_short <chr>,
#> #   description <chr>, value <dbl>, display_value <chr>
# }
```

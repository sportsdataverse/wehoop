# **Get ESPN WBB Coach Career Record (Long Format)**

Returns a coach's career record by type in long format (one row per stat
in the record's `stats[]` array). `record_type` codes commonly
populated: 0 = Total, 1 = Pre Season, 2 = Regular Season, 3 = Post
Season. Use
[`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md)
to discover coach_ids for a season.

## Usage

``` r
espn_wbb_coach_record(coach_id, record_type = 0L, ...)
```

## Arguments

- coach_id:

  ESPN coach identifier (use
  [`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md)
  to find).

- record_type:

  Integer record type: 0 = Total (default), 1 = Pre Season, 2 = Regular
  Season, 3 = Post Season.

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
  espn_wbb_coach_record(coach_id = 2167842, record_type = 2)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Coach Record ───────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:21:25 UTC
#> # A tibble: 5 × 12
#>   league          coach_id record_type_id record_name record_type record_summary
#>   <chr>           <chr>             <int> <chr>       <chr>       <chr>         
#> 1 womens-college… 2167842               2 Regular Se… Regular Se… 0-0-0         
#> 2 womens-college… 2167842               2 Regular Se… Regular Se… 0-0-0         
#> 3 womens-college… 2167842               2 Regular Se… Regular Se… 0-0-0         
#> 4 womens-college… 2167842               2 Regular Se… Regular Se… 0-0-0         
#> 5 womens-college… 2167842               2 Regular Se… Regular Se… 0-0-0         
#> # ℹ 6 more variables: record_display <chr>, stat_name <chr>, stat_abbrev <chr>,
#> #   stat_display <chr>, value <dbl>, stat_display_value <chr>
# }
```

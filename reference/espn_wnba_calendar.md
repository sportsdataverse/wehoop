# **Get ESPN WNBA Calendar**

**Get ESPN WNBA Calendar**

**Get ESPN WNBA Calendar**

## Usage

``` r
espn_wnba_calendar(season = most_recent_wnba_season())
```

## Arguments

- season:

  integer or character. Four-digit season year (e.g. `2025`). Defaults
  to
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md).

## Value

Returns a tibble of calendar entries.

Columns as documented in the shared
[espn_basketball_calendar_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_calendar_schema.md)
table.

## Details

Retrieve the ESPN WNBA schedule calendar for a given season. The
underlying scoreboard response contains a `leagues[[1]]$calendar` block
with season-type entries (pre-season, regular, post). Uses
`getOption("wehoop.proxy")` or `http_proxy`/`https_proxy` environment
variables for proxy configuration (per-call proxy override is not
supported for ESPN wrappers).

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_calendar(season = 2025)
#> ── ESPN WNBA Calendar from ESPN.com ──────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:16 UTC
#> # A tibble: 126 × 12
#>    season season_type season_type_label season_start_date season_end_date  
#>    <chr>  <chr>       <chr>             <chr>             <chr>            
#>  1 2025   NA          NA                2025-04-14T07:00Z 2025-10-20T06:59Z
#>  2 2025   NA          NA                2025-04-14T07:00Z 2025-10-20T06:59Z
#>  3 2025   NA          NA                2025-04-14T07:00Z 2025-10-20T06:59Z
#>  4 2025   NA          NA                2025-04-14T07:00Z 2025-10-20T06:59Z
#>  5 2025   NA          NA                2025-04-14T07:00Z 2025-10-20T06:59Z
#>  6 2025   NA          NA                2025-04-14T07:00Z 2025-10-20T06:59Z
#>  7 2025   NA          NA                2025-04-14T07:00Z 2025-10-20T06:59Z
#>  8 2025   NA          NA                2025-04-14T07:00Z 2025-10-20T06:59Z
#>  9 2025   NA          NA                2025-04-14T07:00Z 2025-10-20T06:59Z
#> 10 2025   NA          NA                2025-04-14T07:00Z 2025-10-20T06:59Z
#> # ℹ 116 more rows
#> # ℹ 7 more variables: calendar_type <chr>, label <chr>, alternate_label <chr>,
#> #   detail <chr>, value <chr>, start_date <chr>, end_date <chr>
# }
```

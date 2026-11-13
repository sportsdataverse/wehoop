# **Get ESPN Women's College Basketball Athletes Index**

**Get ESPN Women's College Basketball Athletes Index**

**Get ESPN Women's College Basketball Athletes Index**

## Usage

``` r
espn_wbb_athletes_index(
  season = most_recent_wbb_season(),
  active = TRUE,
  limit = 25000L,
  ...
)
```

## Arguments

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WBB
  season.

- active:

  logical. When `TRUE` (default) only active athletes are returned. Set
  to `FALSE` for the full historical roster.

- limit:

  integer. Maximum number of rows to return. Default 25000. WBB can
  return 6,000-12,000 athletes per season; increase if needed. Pass a
  small value (e.g. `limit = 50`) in tests to keep execution fast.

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)` – see
  [`?wehoop`](https://wehoop.sportsdataverse.org/reference/wehoop-package.md)
  for details.

## Value

A single `wehoop_data` tibble with one row per athlete.

Columns as documented in the shared
[espn_basketball_athletes_index_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_athletes_index_schema.md)
table.

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_athletes_index(season = 2025, limit = 50)
#> Fetching page 1 of 1 for womens-college-basketball athletes (season=2025)...
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athletes Index from ESPN.com ─────────────────
#> ℹ Data updated: 2026-11-13 11:56:09 UTC
#> # A tibble: 50 × 9
#>    athlete_id full_name jersey position team_id headshot status link     ref_url
#>    <chr>      <chr>     <chr>  <chr>    <chr>   <chr>    <chr>  <chr>    <chr>  
#>  1 8941       NA        NA     NA       NA      NA       NA     http://… http:/…
#>  2 19319      NA        NA     NA       NA      NA       NA     http://… http:/…
#>  3 19747      NA        NA     NA       NA      NA       NA     http://… http:/…
#>  4 19748      NA        NA     NA       NA      NA       NA     http://… http:/…
#>  5 19749      NA        NA     NA       NA      NA       NA     http://… http:/…
#>  6 19750      NA        NA     NA       NA      NA       NA     http://… http:/…
#>  7 2331675    NA        NA     NA       NA      NA       NA     http://… http:/…
#>  8 2331676    NA        NA     NA       NA      NA       NA     http://… http:/…
#>  9 2331677    NA        NA     NA       NA      NA       NA     http://… http:/…
#> 10 2331678    NA        NA     NA       NA      NA       NA     http://… http:/…
#> # ℹ 40 more rows
# }
```

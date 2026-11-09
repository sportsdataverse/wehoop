# **Get ESPN WNBA Athletes Index**

**Get ESPN WNBA Athletes Index**

**Get ESPN WNBA Athletes Index**

## Usage

``` r
espn_wnba_athletes_index(
  season = most_recent_wnba_season(),
  active = TRUE,
  limit = 5000L,
  ...
)
```

## Arguments

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WNBA
  season.

- active:

  logical. When `TRUE` (default) only active athletes are returned. Set
  to `FALSE` for the full historical roster.

- limit:

  integer. Maximum number of rows to return. Default 5000. Pass a small
  value (e.g. `limit = 50`) in tests to keep execution fast.

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

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_athletes_index(season = 2025, limit = 50)
#> Fetching page 1 of 1 for wnba athletes (season=2025)...
#> ── ESPN WNBA Athletes Index from ESPN.com ────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:10:05 UTC
#> # A tibble: 50 × 9
#>    athlete_id full_name jersey position team_id headshot status link     ref_url
#>    <chr>      <chr>     <chr>  <chr>    <chr>   <chr>    <chr>  <chr>    <chr>  
#>  1 924        NA        NA     NA       NA      NA       NA     http://… http:/…
#>  2 2529047    NA        NA     NA       NA      NA       NA     http://… http:/…
#>  3 3904577    NA        NA     NA       NA      NA       NA     http://… http:/…
#>  4 3906949    NA        NA     NA       NA      NA       NA     http://… http:/…
#>  5 3913881    NA        NA     NA       NA      NA       NA     http://… http:/…
#>  6 3920741    NA        NA     NA       NA      NA       NA     http://… http:/…
#>  7 4336633    NA        NA     NA       NA      NA       NA     http://… http:/…
#>  8 4398965    NA        NA     NA       NA      NA       NA     http://… http:/…
#>  9 4399415    NA        NA     NA       NA      NA       NA     http://… http:/…
#> 10 4433410    NA        NA     NA       NA      NA       NA     http://… http:/…
#> # ℹ 40 more rows
# }
```

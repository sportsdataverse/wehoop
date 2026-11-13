# **Get ESPN WNBA Conferences**

**Get ESPN WNBA Conferences**

**Get ESPN WNBA Conferences**

## Usage

``` r
espn_wnba_conferences()
```

## Value

A `wehoop_data` tibble with one row per conference:

Columns as documented in the shared
[espn_basketball_conferences_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_conferences_schema.md)
table.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wnba_conferences())
#> ✖ 2026-11-13 18:16:34.756566: Invalid arguments or no conferences info available!
#> ✖ Error: `select()` doesn't handle lists.
#> ── ESPN WNBA Conferences Information from ESPN.com ───────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 18:16:34 UTC
#> # A tibble: 0 × 7
#> # ℹ 7 variables: conference_uid <chr>, group_id <int>, conference_name <chr>,
#> #   conference_short_name <chr>, conference_logo <chr>, parent_group_id <int>,
#> #   conference_id <int>
# }
```

# **Get ESPN WBB Coach-in-Season Detail**

Per-season coach detail (name, birth info, `$ref`s to team/college/
person). ESPN's coverage of this endpoint is sparse; many (coach x
season) combinations return 404.

## Usage

``` r
espn_wbb_coach_season(coach_id, season = most_recent_wbb_season(), ...)
```

## Arguments

- coach_id:

  ESPN coach identifier.

- season:

  Season year. Defaults to most recent WBB season.

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

Columns as documented in the shared
[espn_basketball_coach_season_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_coach_season_schema.md)
table.

## Details

**Get ESPN WBB Coach-in-Season Detail**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_coach_season(coach_id = 2167842, season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Coach-in-Season Detail ─────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 19:05:04 UTC
#> # A tibble: 1 × 13
#>   league     season coach_id uid   first_name last_name date_of_birth birth_city
#>   <chr>       <int> <chr>    <chr> <chr>      <chr>     <chr>         <chr>     
#> 1 womens-co…   2025 2167842  s:40… Larry      Vickers   NA            Virginia …
#> # ℹ 5 more variables: birth_state <chr>, n_records <int>, person_ref <chr>,
#> #   college_ref <chr>, team_ref <chr>
# }
```

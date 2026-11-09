# **Get ESPN WBB Tournament Season Detail**

Returns single-row detail for one (tournament, season) pair: id, display
name, number of rounds, and `$ref`s to the season + bracketology
resources. Use
[`espn_wbb_tournament_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament_seasons.md)
to enumerate valid (tournament_id, season) pairs.

## Usage

``` r
espn_wbb_tournament_season(tournament_id, season, ...)
```

## Arguments

- tournament_id:

  ESPN tournament identifier.

- season:

  Season year (numeric).

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_tournament_season(tournament_id = 3, season = 2024)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Tournament Season Detail ───── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 20:19:30 UTC
#> # A tibble: 1 × 8
#>   league   tournament_id season display_name short_display_name number_of_rounds
#>   <chr>    <chr>          <int> <chr>        <chr>                         <int>
#> 1 womens-… 3               2024 ACC Tournam… ACC                               0
#> # ℹ 2 more variables: season_ref <chr>, bracketology_ref <chr>
# }
```

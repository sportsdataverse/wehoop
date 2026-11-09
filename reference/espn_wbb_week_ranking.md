# **Get ESPN WBB Per-Week Ranking Detail**

Returns the long-format ranked teams for one (season x season-type x
week x ranking-source). Typically 25 rows for WBB (AP Top 25).

## Usage

``` r
espn_wbb_week_ranking(
  ranking_id,
  week,
  season = most_recent_wbb_season(),
  season_type = 2L,
  ...
)
```

## Arguments

- ranking_id:

  Ranking source id (1 = AP, 2 = Coaches, etc.).

- week:

  Week number.

- season:

  Season year. Defaults to most recent WBB season.

- season_type:

  Season-type id (2 = regular (default)).

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per ranked team (typically 25).

Columns as documented in the shared
[espn_basketball_week_ranking_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_week_ranking_schema.md)
table.

## Details

**Get ESPN WBB Per-Week Ranking Detail**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_week_ranking(ranking_id = 1, week = 5, season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Week Ranking Detail ────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:10:05 UTC
#> # A tibble: 25 × 19
#>    league    season season_type  week ranking_id name  short_name type  headline
#>    <chr>      <int>       <int> <int> <chr>      <chr> <chr>      <chr> <chr>   
#>  1 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  2 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  3 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  4 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  5 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  6 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  7 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  8 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  9 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#> 10 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#> # ℹ 15 more rows
#> # ℹ 10 more variables: date <chr>, current <int>, previous <int>, points <dbl>,
#> #   first_place_votes <int>, trend <chr>, record_summary <chr>, team_id <chr>,
#> #   team_ref <chr>, last_updated <chr>
# }
```

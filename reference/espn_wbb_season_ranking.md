# **Get ESPN WBB Season Ranking Detail**

Returns the per-week snapshot index for one ranking source (e.g. AP Top
25). Each row is one weekly snapshot; the `ref` URL resolves to the
actual ranked teams for that (season-type x week) and will be wrapped by
a forthcoming `espn_LOWERWBB_week_ranking()`.

## Usage

``` r
espn_wbb_season_ranking(ranking_id, season = most_recent_wbb_season(), ...)
```

## Arguments

- ranking_id:

  ESPN ranking identifier (character or numeric).

- season:

  Season year. Defaults to most recent WBB season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per weekly snapshot.

Columns as documented in the shared
[espn_basketball_season_ranking_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_season_ranking_schema.md)
table.

## Details

**Get ESPN WBB Season Ranking Detail**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_season_ranking(ranking_id = 1, season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Ranking Snapshots Index ───────────────
#> ℹ Data updated: 2026-11-13 23:21:45 UTC
#> # A tibble: 21 × 9
#>    league       season ranking_id name  short_name type  season_type  week ref  
#>    <chr>         <int> <chr>      <chr> <chr>      <chr>       <int> <int> <chr>
#>  1 womens-coll…   2025 1          AP T… AP Poll    ap              2     1 http…
#>  2 womens-coll…   2025 1          AP T… AP Poll    ap              2     2 http…
#>  3 womens-coll…   2025 1          AP T… AP Poll    ap              2     3 http…
#>  4 womens-coll…   2025 1          AP T… AP Poll    ap              2     4 http…
#>  5 womens-coll…   2025 1          AP T… AP Poll    ap              2     5 http…
#>  6 womens-coll…   2025 1          AP T… AP Poll    ap              2     6 http…
#>  7 womens-coll…   2025 1          AP T… AP Poll    ap              2     7 http…
#>  8 womens-coll…   2025 1          AP T… AP Poll    ap              2     8 http…
#>  9 womens-coll…   2025 1          AP T… AP Poll    ap              2     9 http…
#> 10 womens-coll…   2025 1          AP T… AP Poll    ap              2    10 http…
#> # ℹ 11 more rows
# }
```

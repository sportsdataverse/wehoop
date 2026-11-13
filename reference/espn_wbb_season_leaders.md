# **Get ESPN WBB Season Leaders (Long Format)**

Returns the per-category leaderboard for one (WBB season x season-type),
in long format. Each row is one (category x rank) entry, e.g. "Points
Per Game x rank 1 x LeBron James".

## Usage

``` r
espn_wbb_season_leaders(
  season = most_recent_wbb_season(),
  season_type = c(2L, 3L),
  ...
)
```

## Arguments

- season:

  Season year. Defaults to most recent WBB season.

- season_type:

  Season-type id (2 = regular (default), 3 = postseason).

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per (category x leader).

Columns as documented in the shared
[espn_basketball_season_leaders_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_season_leaders_schema.md)
table.

## Details

**Get ESPN WBB Season Leaders (Long Format)**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_season_leaders(season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season-Type Leaders ────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:13 UTC
#> # A tibble: 350 × 15
#>    league       season season_type category_name category_display category_short
#>    <chr>         <int>       <int> <chr>         <chr>            <chr>         
#>  1 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  2 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  3 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  4 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  5 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  6 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  7 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  8 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  9 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#> 10 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#> # ℹ 340 more rows
#> # ℹ 9 more variables: category_abbrev <chr>, rank <int>, athlete_id <chr>,
#> #   team_id <chr>, display_value <chr>, value <dbl>, rel <chr>,
#> #   athlete_ref <chr>, team_ref <chr>
# }
```

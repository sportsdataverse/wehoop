# **Get ESPN WNBA Season Ranking Detail**

Returns the per-week snapshot index for one ranking source (e.g. AP Top
25). Each row is one weekly snapshot; the `ref` URL resolves to the
actual ranked teams for that (season-type x week) and will be wrapped by
a forthcoming `espn_LOWERWNBA_week_ranking()`.

## Usage

``` r
espn_wnba_season_ranking(ranking_id, season = most_recent_wnba_season(), ...)
```

## Arguments

- ranking_id:

  ESPN ranking identifier (character or numeric).

- season:

  Season year. Defaults to most recent WNBA season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per weekly snapshot.

Columns as documented in the shared
[espn_basketball_season_ranking_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_season_ranking_schema.md)
table.

## Details

**Get ESPN WNBA Season Ranking Detail**

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_season_ranking(ranking_id = 1, season = 2025)
#> ✖ 2026-11-09 20:19:49.956585: Failed to retrieve ESPN wnba ranking 1 for season=2025
#> ✖ Args: league = "wnba", season = 2025, ranking_id = 1
#> ✖ Error: The API returned an error
#> NULL
# }
```

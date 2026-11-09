# **Get ESPN WNBA Per-Week Ranking Detail**

Returns the long-format ranked teams for one (season x season-type x
week x ranking-source). WNBA typically returns an empty tibble.

## Usage

``` r
espn_wnba_week_ranking(
  ranking_id,
  week,
  season = most_recent_wnba_season(),
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

  Season year. Defaults to most recent WNBA season.

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

**Get ESPN WNBA Per-Week Ranking Detail**

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_week_ranking(ranking_id = 1, week = 5, season = 2025)
#> ✖ 2026-11-09 11:37:27.746145: Failed to retrieve ESPN wnba week-5 ranking 1 for season=2025
#> ✖ Args: league = "wnba", season = 2025, season_type = 2L, week = 5, ranking_id = 1
#> ✖ Error: The API returned an error
#> NULL
# }
```

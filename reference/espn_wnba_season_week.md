# **Get ESPN WNBA Season-Week Detail**

Returns metadata for one week (number, start / end dates, text label,
and `$ref` to the per-week rankings endpoint).

## Usage

``` r
espn_wnba_season_week(
  week,
  season = most_recent_wnba_season(),
  season_type = 2L,
  ...
)
```

## Arguments

- week:

  Week number.

- season:

  Season year. Defaults to most recent WNBA season.

- season_type:

  Season-type id (2 = regular (default)).

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

Columns as documented in the shared
[espn_basketball_season_week_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_season_week_schema.md)
table.

## Details

**Get ESPN WNBA Season-Week Detail**

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_season_week(week = 5, season = 2025)
#> ✖ 2026-11-09 20:19:50.588442: Failed to retrieve ESPN wnba week 5 for season=2025, season_type=2
#> ✖ Args: league = "wnba", season = 2025, season_type = 2L, week = 5
#> ✖ Error: The API returned an error
#> NULL
# }
```

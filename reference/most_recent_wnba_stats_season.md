# Most Recent WNBA Stats API Season

Returns the most recent WNBA Stats API season year as an integer. This
is a thin wrapper around
[`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md)
kept as a separate helper for naming symmetry with the `wnba_stats_*`
family of loaders (mirrors the `most_recent_*_season()` convention used
elsewhere in the package). The WNBA Stats API and ESPN's WNBA endpoints
share the same calendar-year season identifier, so the returned value is
identical to
[`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md).

## Usage

``` r
most_recent_wnba_stats_season()
```

## Value

An integer giving the WNBA season year (e.g. `2025`).

## Examples

``` r
most_recent_wnba_stats_season()
#> [1] 2026
```

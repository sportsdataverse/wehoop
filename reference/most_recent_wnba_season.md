# Most Recent WNBA Season

Returns the most recent WNBA season year as an integer based on the
current system date. The WNBA season runs from May through October
within a single calendar year; this helper rolls forward to the new
season starting in May.

## Usage

``` r
most_recent_wnba_season()
```

## Value

An integer giving the WNBA season year (e.g. `2025`).

## Examples

``` r
most_recent_wnba_season()
#> [1] 2026
```

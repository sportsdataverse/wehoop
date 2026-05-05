# Most Recent Women's College Basketball Season

Returns the most recent women's college basketball season year as an
integer based on the current system date. The NCAA WBB season spans two
calendar years; this helper rolls over to the next season starting in
October. For example, calls made on 2025-11-15 return `2026`, while
calls made on 2025-03-15 return `2025`.

## Usage

``` r
most_recent_wbb_season()
```

## Value

An integer giving the season-ending year (e.g. `2025` for the 2024-25
season).

## Examples

``` r
most_recent_wbb_season()
#> [1] 2026
```

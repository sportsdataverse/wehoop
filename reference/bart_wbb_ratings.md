# **Bart Torvik Women's T-Rank Ratings**

**Get women's college basketball T-Rank team ratings and adjusted
efficiencies from [barttorvik.com](https://barttorvik.com/ncaaw/).**
Pulls the `/ncaaw/{year}_team_results.csv` file (one row per team). No
API key required.

## Usage

``` r
bart_wbb_ratings(year = most_recent_wbb_season())
```

## Arguments

- year:

  Season, 4-digit ending-year format (e.g. `2024`). Defaults to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

## Value

A `wehoop_data` tibble, one row per team: `rank`, `team`, `conf`,
`record`, `adjoe`, `adjde`, `barthag`, plus projection / SOS / quality
columns, and `year`.

## See also

Other Bart Torvik Functions:
[`bart_wbb_game_schedule()`](https://wehoop.sportsdataverse.org/reference/bart_wbb_game_schedule.md)

## Examples

``` r
# \donttest{
  try(bart_wbb_ratings(year = 2024))
#> ✖ 2026-11-26 22:08:00.136329: No women's T-Rank ratings available for 2024!
#> ✖ Args: year = 2024
#> ✖ Error: HTTP 403 Forbidden from https://barttorvik.com/ncaaw/2024_team_results.csv
#> data frame with 0 columns and 0 rows
# }
```

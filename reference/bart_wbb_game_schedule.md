# **Bart Torvik Women's Season Schedule & Results**

**Get the full women's game-by-game schedule and results for a season
from [barttorvik.com](https://barttorvik.com/ncaaw/).** Pulls the
`/ncaaw/{year}_super_sked.json` file (one row per game). No API key
required.

## Usage

``` r
bart_wbb_game_schedule(year = most_recent_wbb_season())
```

## Arguments

- year:

  Season, 4-digit ending-year format (e.g. `2024`). Defaults to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

## Value

A `wehoop_data` tibble, one row per game: `muid`, `date`, `team1`,
`team2`, `t1pts`, `t2pts`, `winner`, `loser`, plus efficiency / quality
columns, and `year`.

## See also

Other Bart Torvik Functions:
[`bart_wbb_ratings()`](https://wehoop.sportsdataverse.org/reference/bart_wbb_ratings.md)

## Examples

``` r
# \donttest{
  try(bart_wbb_game_schedule(year = 2024))
#> ✖ 2026-08-23 23:06:19.117132: No women's schedule available for 2024!
#> ✖ Args: year = 2024
#> ✖ Error: lexical error: invalid char in json text.                                        <!DOCTYPE HTML PUBLIC "-//W3C//                      (right here) ------^ 
#> data frame with 0 columns and 0 rows
# }
```

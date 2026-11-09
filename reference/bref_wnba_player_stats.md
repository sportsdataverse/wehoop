# **Basketball-Reference WNBA Player Season Stats**

**Get WNBA league-wide player season statistics from
Basketball-Reference.**

One row per player for a season. No account or API key is required.
Basketball-Reference rate-limits aggressive scraping (~20
requests/minute) – space repeated calls with
[`Sys.sleep()`](https://rdrr.io/r/base/Sys.sleep.html).

## Usage

``` r
bref_wnba_player_stats(season = most_recent_wnba_season(), table = "per_game")
```

## Arguments

- season:

  Season, in 4-digit year format (e.g. `2024`). Defaults to
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md).

- table:

  Which stats table – one of `"per_game"` (default), `"totals"` or
  `"advanced"`.

## Value

A `wehoop_data` tibble with one row per player, carrying `season` and
`table` columns.

|           |           |
|-----------|-----------|
| col_name  | types     |
| player    | character |
| team_id   | character |
| pos       | character |
| g         | numeric   |
| pts_per_g | numeric   |
| season    | integer   |
| table     | character |

## See also

Other WNBA Basketball-Reference Functions:
[`bref_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_standings.md),
[`bref_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_team_stats.md)

## Examples

``` r
if (FALSE) { # interactive() && !nzchar(Sys.getenv("CI"))
# \donttest{
  try(bref_wnba_player_stats(season = 2024, table = "per_game"))
# }
}
```

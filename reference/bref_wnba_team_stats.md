# **Basketball-Reference WNBA Team Season Stats**

**Get WNBA team season statistics from Basketball-Reference.**

One row per team for a season. No account or API key is required.

## Usage

``` r
bref_wnba_team_stats(season = most_recent_wnba_season(), table = "per_game")
```

## Arguments

- season:

  Season, 4-digit year format (e.g. `2024`). Defaults to
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md).

- table:

  Which stats table – one of `"per_game"` (default), `"totals"`,
  `"per_poss"` or `"advanced"`.

## Value

A `wehoop_data` tibble with one row per team, carrying `season` and
`table` columns.

|           |           |
|-----------|-----------|
| col_name  | types     |
| team      | character |
| g         | numeric   |
| pts_per_g | numeric   |
| season    | integer   |
| table     | character |

## See also

Other WNBA Basketball-Reference Functions:
[`bref_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_player_stats.md),
[`bref_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_standings.md)

## Examples

``` r
if (FALSE) { # interactive()
# \donttest{
  try(bref_wnba_team_stats(season = 2024, table = "per_game"))
# }
}
```

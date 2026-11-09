# **Basketball-Reference WNBA Standings**

**Get WNBA standings (both conferences) from Basketball-Reference.**

One row per team with record and win percentage, labelled by a
`conference` column (`Eastern` / `Western`). No account or API key is
required.

## Usage

``` r
bref_wnba_standings(season = most_recent_wnba_season())
```

## Arguments

- season:

  Season, 4-digit year format (e.g. `2024`). Defaults to
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md).

## Value

A `wehoop_data` tibble with one row per team:

|              |           |
|--------------|-----------|
| col_name     | types     |
| team         | character |
| wins         | numeric   |
| losses       | numeric   |
| win_loss_pct | numeric   |
| conference   | character |
| season       | integer   |

## See also

Other WNBA Basketball-Reference Functions:
[`bref_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_player_stats.md),
[`bref_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_team_stats.md)

## Examples

``` r
if (FALSE) { # interactive() && !nzchar(Sys.getenv("CI"))
# \donttest{
  try(bref_wnba_standings(season = 2024))
# }
}
```

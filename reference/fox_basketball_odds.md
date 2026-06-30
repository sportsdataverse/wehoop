# **Get Fox Sports basketball game odds**

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) game
odds.** `fox_wnba_odds()` hits the `wnba` slug; `fox_wbb_odds()` hits
the `wcbk` slug.

## Usage

``` r
fox_wnba_odds(game_id)

fox_wbb_odds(game_id)
```

## Arguments

- game_id:

  Fox Bifrost event id.

## Value

A `wehoop_data` tibble, one row per team: `game_id`, `team`, plus the
six-pack odds columns (spread / to-win / total). Empty when no market.

## See also

Other Fox Sports Functions:
[`fox_basketball_boxscore`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md),
[`fox_basketball_league_leaders`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md),
[`fox_basketball_pbp`](https://wehoop.sportsdataverse.org/reference/fox_basketball_pbp.md),
[`fox_basketball_standings`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md),
[`fox_basketball_team_gamelog`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_gamelog.md),
[`fox_basketball_team_roster`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_roster.md),
[`fox_basketball_team_stats`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_stats.md),
[`fox_basketball_teams`](https://wehoop.sportsdataverse.org/reference/fox_basketball_teams.md),
[`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md)

## Examples

``` r
# \donttest{
  try(fox_wnba_odds("2215"))
#> ── Fox Sports WNBA odds ──────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-30 19:33:33 UTC
#> # A tibble: 0 × 0
# }
# \donttest{
  try(fox_wbb_odds("388986"))
#> ── Fox Sports WCBK odds ──────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-30 19:33:34 UTC
#> # A tibble: 0 × 0
# }
```

# **Get the WNBA cross-source schedule crosswalk**

Build a wide, one-row-per-game crosswalk linking ESPN and WNBA Stats
game ids (with NA Fox/Yahoo placeholders) for a season. Dates from both
sources are reduced to the local Eastern-Time game date before joining.
Note: the WNBA Stats CDN serves the current season only, so the live
builder is effectively current-season; historical coverage comes from
cached release artifacts.

## Usage

``` r
wnba_schedule_crosswalk(season = most_recent_wnba_season())
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

## Value

A `wehoop_data` tibble, one row per game (columns: `season`,
`season_type`, `game_date`, resolved
`home_espn_team_id`/`away_espn_team_id`, `espn_game_id`, `wnba_game_id`,
`wnba_game_code`, Fox/Yahoo placeholders, `match_method`,
`match_confidence`).

## See also

Other WNBA Crosswalk Functions:
[`load_wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_crosswalk.md),
[`load_wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule_crosswalk.md),
[`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_crosswalk.md),
[`wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_player_crosswalk.md),
[`wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(wnba_schedule_crosswalk(season = 2024))
#> ℹ WNBA CDN schedule is for season 2026, not 2024. For historical seasons use `load_wnba_schedule(seasons = 2024)`.
#> ── WNBA schedule crosswalk (ESPN / WNBA Stats) ───────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-13 06:06:28 UTC
#> # A tibble: 355 × 16
#>    season season_type game_date  home_espn_team_id away_espn_team_id
#>     <int> <chr>       <date>                 <int>             <int>
#>  1   2024 Pre-Season  2026-04-25                 9                 5
#>  2   2024 NA          2026-04-25                 6             17476
#>  3   2024 Pre-Season  2026-04-25                11                19
#>  4   2024 Pre-Season  2026-04-25                16                 8
#>  5   2024 Pre-Season  2026-04-25            129689                14
#>  6   2024 NA          2026-04-26                17             17475
#>  7   2024 NA          2026-04-27                 8             17476
#>  8   2024 Pre-Season  2026-04-29            131935                18
#>  9   2024 Pre-Season  2026-04-29                19                20
#> 10   2024 Pre-Season  2026-04-29                14            132052
#> # ℹ 345 more rows
#> # ℹ 11 more variables: espn_game_id <chr>, wnba_game_id <chr>,
#> #   wnba_game_code <chr>, wnba_home_team_id <chr>, wnba_away_team_id <chr>,
#> #   fox_game_id <chr>, fox_home_team_id <chr>, fox_away_team_id <chr>,
#> #   yahoo_game_id <chr>, match_method <chr>, match_confidence <dbl>
# }
```

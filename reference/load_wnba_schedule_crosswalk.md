# **Load cached WNBA schedule crosswalk**

Loads cached schedule-crosswalk snapshots that map ESPN game identifiers
to WNBA Stats API game identifiers. One row per game-season. Backed by
the `wnba_crosswalk` release tag in `sportsdataverse-data`.

## Usage

``` r
load_wnba_schedule_crosswalk(seasons = most_recent_wnba_season())
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2002)

## Value

A `wehoop_data` tibble of cached schedule-crosswalk rows.

## See also

Other WNBA Crosswalk Functions:
[`load_wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_crosswalk.md),
[`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_crosswalk.md),
[`wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_player_crosswalk.md),
[`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md),
[`wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(load_wnba_schedule_crosswalk(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 355 × 16
#>    season season_type game_date  home_espn_team_id away_espn_team_id
#>     <int> <chr>       <date>                 <int>             <int>
#>  1   2026 Pre-Season  2026-04-25                 9                 5
#>  2   2026 NA          2026-04-25                 6             17476
#>  3   2026 Pre-Season  2026-04-25                11                19
#>  4   2026 Pre-Season  2026-04-25                16                 8
#>  5   2026 Pre-Season  2026-04-25            129689                14
#>  6   2026 NA          2026-04-26                17             17475
#>  7   2026 NA          2026-04-27                 8             17476
#>  8   2026 Pre-Season  2026-04-29            131935                18
#>  9   2026 Pre-Season  2026-04-29                19                20
#> 10   2026 Pre-Season  2026-04-29                14            132052
#> # ℹ 345 more rows
#> # ℹ 11 more variables: espn_game_id <chr>, wnba_game_id <chr>,
#> #   wnba_game_code <chr>, wnba_home_team_id <chr>, wnba_away_team_id <chr>,
#> #   fox_game_id <chr>, fox_home_team_id <chr>, fox_away_team_id <chr>,
#> #   yahoo_game_id <chr>, match_method <chr>, match_confidence <dbl>
# }
```

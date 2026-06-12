# **Load cached WNBA player crosswalk**

Loads cached player-crosswalk snapshots that map ESPN athlete
identifiers to WNBA Stats API player identifiers. One row per
athlete-season. Backed by the `wnba_crosswalk` release tag in
`sportsdataverse-data`.

## Usage

``` r
load_wnba_player_crosswalk(seasons = most_recent_wnba_season())
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2002)

## Value

A `wehoop_data` tibble of cached player-crosswalk rows.

## See also

Other WNBA Crosswalk Functions:
[`load_wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule_crosswalk.md),
[`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_crosswalk.md),
[`wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_player_crosswalk.md),
[`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md),
[`wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(load_wnba_player_crosswalk(seasons = most_recent_wnba_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_crosswalk/wnba_player_crosswalk_2026.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wnba_crosswalk/wnba_player_crosswalk_2026.rds>
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 0 × 0
# }
```

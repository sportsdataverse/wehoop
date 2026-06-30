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
#> ✖ 2026-06-30 19:38:31.928918: Invalid arguments or no league schedule data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024
#> ✖ Error: lexical error: invalid char in json text.                                        <!DOCTYPE html> <html>  <head>                       (right here) ------^ 
#> ✖ 2026-06-30 19:38:32.035652: Invalid arguments or no league schedule data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024
#> ✖ Error: lexical error: invalid char in json text.                                        <!DOCTYPE html> <html>  <head>                       (right here) ------^ 
#> Error in UseMethod("transmute") : 
#>   no applicable method for 'transmute' applied to an object of class "NULL"
# }
```

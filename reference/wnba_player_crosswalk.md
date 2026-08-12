# **Get the WNBA cross-source player crosswalk**

Build a wide, one-row-per-player-per-team crosswalk linking ESPN, WNBA
Stats, and Fox player identities for a season. Matching is
deterministic: normalized exact name within a team block, then
Jaro-Winkler fuzzy with jersey/DOB tiebreakers. Yahoo columns are NA
placeholders.

## Usage

``` r
wnba_player_crosswalk(
  season = most_recent_wnba_season(),
  min_confidence = 0.92
)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- min_confidence:

  Jaro-Winkler similarity floor for fuzzy matches (default 0.92).

## Value

A `wehoop_data` tibble, one row per player per team (ESPN-anchored).

## See also

Other WNBA Crosswalk Functions:
[`load_wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_crosswalk.md),
[`load_wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule_crosswalk.md),
[`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_crosswalk.md),
[`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md),
[`wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(wnba_player_crosswalk(season = 2024))
#> ✖ 2026-08-12 22:00:08.574799: Invalid arguments or no league schedule data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024
#> ✖ Error: lexical error: invalid char in json text.                                        <!DOCTYPE html> <html>  <head>                       (right here) ------^ 
#> Error in UseMethod("transmute") : 
#>   no applicable method for 'transmute' applied to an object of class "NULL"
# }
```

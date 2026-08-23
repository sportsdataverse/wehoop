# **Get the WNBA cross-source team crosswalk**

Build a wide, one-row-per-team-per-season crosswalk linking ESPN, the
WNBA Stats API, and Fox Sports team identities, keyed on `espn_team_id`.
Yahoo columns are placeholders (NA) until that source is implemented.

## Usage

``` r
wnba_team_crosswalk(season = most_recent_wnba_season(), .schedule = NULL)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- .schedule:

  Internal. An already-fetched
  [`wnba_schedule()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule.md)
  frame, supplied by
  [`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md)
  to avoid a duplicate CDN request. Leave `NULL`.

## Value

A `wehoop_data` tibble, one row per team:

|                         |           |                                         |
|-------------------------|-----------|-----------------------------------------|
| col_name                | types     | description                             |
| season                  | integer   | Season year.                            |
| espn_team_id            | integer   | ESPN team id (canonical key).           |
| espn_abbreviation       | character | ESPN abbreviation.                      |
| espn_display_name       | character | ESPN display name.                      |
| espn_short_name         | character | ESPN short name.                        |
| espn_location           | character | ESPN team location.                     |
| espn_mascot             | character | ESPN team mascot/nickname.              |
| wnba_team_id            | character | WNBA Stats team id.                     |
| wnba_team_tricode       | character | WNBA Stats tricode.                     |
| wnba_team_name          | character | WNBA Stats team name.                   |
| wnba_team_city          | character | WNBA Stats team city.                   |
| wnba_team_slug          | character | WNBA Stats team slug.                   |
| fox_team_id             | character | Fox Bifrost team id.                    |
| fox_team_name           | character | Fox team name.                          |
| yahoo_team_id           | character | Yahoo team id (NA placeholder).         |
| yahoo_team_abbreviation | character | Yahoo abbreviation (NA placeholder).    |
| yahoo_team_name         | character | Yahoo team name (NA placeholder).       |
| match_method            | character | How the row was matched.                |
| match_confidence        | numeric   | Match confidence (1 for deterministic). |

## See also

Other WNBA Crosswalk Functions:
[`load_wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_crosswalk.md),
[`load_wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule_crosswalk.md),
[`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_crosswalk.md),
[`wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_player_crosswalk.md),
[`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md)

## Examples

``` r
# \donttest{
  try(wnba_team_crosswalk(season = 2024))
#> ✖ 2026-08-23 23:13:05.329677: Invalid arguments or no league schedule data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024
#> ✖ Error: lexical error: invalid char in json text.                                        <!DOCTYPE html> <html>  <head>                       (right here) ------^ 
#> Error in UseMethod("transmute") : 
#>   no applicable method for 'transmute' applied to an object of class "NULL"
# }
```

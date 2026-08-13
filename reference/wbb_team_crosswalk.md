# **Get the WBB cross-source team crosswalk**

Build a wide, one-row-per-team-per-season crosswalk linking ESPN, Fox
Sports (Bifrost), and Bart Torvik (barttorvik.com/ncaaw) women's college
basketball team identities, keyed on `espn_team_id`. Yahoo columns are
NA placeholders. ESPN is deduped by `team_id` (first occurrence kept).
Fox is joined on the full normalized mascot name (with a curated alias
bridge for cases where Fox and ESPN differ); Torvik is joined on the
normalized school/location name after a curated alias pass for common
divergences (e.g. "UConn" / "Connecticut", "Ole Miss" / "Mississippi").

## Usage

``` r
wbb_team_crosswalk(season = most_recent_wbb_season(), fox = NULL)
```

## Arguments

- season:

  Season year (4-digit, e.g. `2025`). Defaults to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

- fox:

  An already-fetched
  [`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md)
  frame, or `NULL` (default) to fetch live. Accepts a pre-fetched frame
  to avoid the ~60-second Fox enumeration when calling repeatedly.

## Value

A `wehoop_data` tibble, one row per ESPN team:

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season year. |
| espn_team_id | integer | ESPN team id (canonical key). |
| espn_abbreviation | character | ESPN abbreviation. |
| espn_display_name | character | ESPN display name (school + mascot). |
| espn_short_name | character | ESPN short name. |
| espn_location | character | ESPN school/location only. |
| espn_mascot | character | ESPN mascot/nickname. |
| espn_conference | character | ESPN conference name. |
| fox_team_id | character | Fox Bifrost team id (NA if unmatched). |
| fox_team_name | character | Fox team name (NA if unmatched). |
| fox_section | character | Fox conference/section label (NA if unmatched). |
| bart_team | character | Torvik team name (NA if unmatched). |
| bart_conf | character | Torvik conference abbreviation (NA if unmatched). |
| yahoo_team_id | character | Yahoo team id (NA placeholder). |
| yahoo_team_name | character | Yahoo team name (NA placeholder). |
| fox_match_confidence | numeric | 1 for matched, NA for unmatched. |
| bart_match_confidence | numeric | 1 for matched, NA for unmatched. |
| match_method | character | "fox+bart"/"fox_only"/"bart_only"/"espn_only". |

## See also

Other WBB Crosswalk Functions:
[`load_wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md),
[`load_wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_schedule_crosswalk.md),
[`load_wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_crosswalk.md),
[`wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_player_crosswalk.md),
[`wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_schedule_crosswalk.md)

## Examples

``` r
# \donttest{
  try(wbb_team_crosswalk(season = 2025))
#> ✖ 2026-08-13 08:27:48.836766: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "3", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:49.532121: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "200", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:49.826972: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "226", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:49.993284: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "230", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:50.166154: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "231", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:50.530151: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "350", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:50.813933: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "351", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:51.091222: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "352", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:51.446403: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "353", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:51.658928: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "354", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:51.851999: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "355", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:52.046234: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "356", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:52.309773: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "357", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:52.479373: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "358", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:52.66657: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "359", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:52.829955: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "360", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:53.050512: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "361", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:53.23219: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "362", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:53.393881: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "363", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:53.56866: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "364", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:53.750338: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "365", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:54.051645: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "367", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:54.218627: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "368", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:54.383438: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "369", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:54.550046: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "370", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:54.71761: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "371", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:54.886179: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "372", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-08-13 08:27:55.051368: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "373", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ── WBB team crosswalk (ESPN / Fox / Torvik) ──────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-13 08:27:55 UTC
#> # A tibble: 362 × 18
#>    season espn_team_id espn_abbreviation espn_display_name       espn_short_name
#>     <int>        <int> <chr>             <chr>                   <chr>          
#>  1   2025         2000 ACU               Abilene Christian Wild… Abilene Chrstn 
#>  2   2025         2005 AF                Air Force Falcons       Air Force      
#>  3   2025         2006 AKR               Akron Zips              Akron          
#>  4   2025         2010 AAMU              Alabama A&M Bulldogs    Alabama A&M    
#>  5   2025          333 ALA               Alabama Crimson Tide    Alabama        
#>  6   2025         2011 ALST              Alabama State Lady Hor… Alabama St     
#>  7   2025         2016 ALCN              Alcorn State Lady Brav… Alcorn St      
#>  8   2025           44 AMER              American University Ea… American       
#>  9   2025         2026 APP               App State Mountaineers  App State      
#> 10   2025            9 ASU               Arizona State Sun Devi… Arizona St     
#> # ℹ 352 more rows
#> # ℹ 13 more variables: espn_location <chr>, espn_mascot <chr>,
#> #   espn_conference <chr>, fox_team_id <chr>, fox_team_name <chr>,
#> #   fox_section <chr>, bart_team <chr>, bart_conf <chr>, yahoo_team_id <chr>,
#> #   yahoo_team_name <chr>, fox_match_confidence <dbl>,
#> #   bart_match_confidence <dbl>, match_method <chr>
# }
```

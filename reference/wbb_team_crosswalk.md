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
#> ✖ 2026-06-24 02:09:03.208315: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "3", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:04.37008: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "200", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:04.474291: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "226", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:04.637616: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "231", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:04.949719: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "350", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:05.163836: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "351", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:05.197433: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "352", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:05.471422: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "353", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:05.655934: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "354", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:05.940794: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "355", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:06.264847: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "356", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:06.3: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "357", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:06.344579: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "358", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:06.507512: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "359", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:06.681415: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "360", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:06.864404: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "361", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:07.044335: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "362", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:07.22012: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "363", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:07.368752: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "364", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:07.549846: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "365", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:07.828028: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "367", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:07.861755: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "368", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:08.023565: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "369", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:08.194003: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "370", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:08.33753: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "371", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:08.488062: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "372", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:08.65923: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "373", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:08.812306: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "374", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-06-24 02:09:08.971878: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "375", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ── WBB team crosswalk (ESPN / Fox / Torvik) ──────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-24 02:09:09 UTC
#> # A tibble: 361 × 18
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
#> # ℹ 351 more rows
#> # ℹ 13 more variables: espn_location <chr>, espn_mascot <chr>,
#> #   espn_conference <chr>, fox_team_id <chr>, fox_team_name <chr>,
#> #   fox_section <chr>, bart_team <chr>, bart_conf <chr>, yahoo_team_id <chr>,
#> #   yahoo_team_name <chr>, fox_match_confidence <dbl>,
#> #   bart_match_confidence <dbl>, match_method <chr>
# }
```

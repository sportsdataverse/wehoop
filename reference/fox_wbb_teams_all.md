# **Get the full Fox Sports women's college basketball team directory**

**Enumerate every WBB team in the Fox Sports (Bifrost) directory.** A
single
[`fox_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
call only returns the seed team's conference, so this walks unseen team
ids (calling one seed per conference) and unions the results.

## Usage

``` r
fox_wbb_teams_all(max_id = 500, max_calls = 60)
```

## Arguments

- max_id:

  Highest Fox team id to probe as a seed (default `500`).

- max_calls:

  Safety cap on the number of standings calls (default `60`).

## Value

A `wehoop_data` tibble, one row per team: `fox_team_id`,
`fox_team_name`, `fox_section`.

## See also

Other Fox Sports Functions:
[`fox_basketball_league_leaders`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md),
[`fox_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md),
[`fox_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)

## Examples

``` r
# \donttest{
  try(fox_wbb_teams_all())
#> ✖ 2026-11-01 19:32:00.704873: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "3", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:01.668322: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "200", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:01.795921: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "226", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:01.864192: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "230", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:01.899845: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "231", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.115859: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "350", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.180446: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "351", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.218888: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "352", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.280003: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "353", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.347049: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "354", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.407942: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "355", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.478766: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "356", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.574951: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "357", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.635542: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "358", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.697929: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "359", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.757814: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "360", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.815463: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "361", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.884195: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "362", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.919925: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "363", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:02.985857: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "364", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:03.022061: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "365", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:03.090844: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "367", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:03.170262: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "368", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:03.233634: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "369", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:03.662259: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "370", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:03.725641: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "371", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:03.775388: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "372", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-01 19:32:03.838551: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "373", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ── Fox Sports WBB full team directory ────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-01 19:32:03 UTC
#> # A tibble: 363 × 3
#>    fox_team_id fox_team_name                    fox_section                 
#>    <chr>       <chr>                            <chr>                       
#>  1 5           Umass Lowell River Hawks         America East                
#>  2 9           Vermont Catamounts               America East                
#>  3 4           Maine Black Bears                America East                
#>  4 1           University At Albany Great Danes America East                
#>  5 55          Njit Highlanders                 America East                
#>  6 2           Binghamton Bearcats              America East                
#>  7 6           New Hampshire Wildcats           America East                
#>  8 8           Umbc Retrievers                  America East                
#>  9 223         Bryant Bulldogs                  America East                
#> 10 130         Northeastern Huskies             Coastal Athletic Association
#> # ℹ 353 more rows
# }
```

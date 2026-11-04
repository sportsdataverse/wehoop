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
#> ✖ 2026-11-04 04:09:40.578296: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "3", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:42.607184: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "200", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:42.855057: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "226", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:42.96843: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "230", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:43.100236: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "231", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:43.742352: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "350", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:43.868494: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "351", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:44.000992: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "352", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:44.146582: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "353", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:44.28254: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "354", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:44.404158: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "355", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:44.535156: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "356", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:44.651258: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "357", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:44.782922: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "358", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:44.846555: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "359", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:44.969471: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "360", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:45.105589: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "361", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:45.171867: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "362", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:45.292918: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "363", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:45.428327: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "364", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:45.549221: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "365", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:45.623367: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "367", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:45.761707: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "368", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:45.848772: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "369", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:45.960819: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "370", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:46.07103: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "371", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:46.164104: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "372", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-04 04:09:46.240861: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "373", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ── Fox Sports WBB full team directory ────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-04 04:09:46 UTC
#> # A tibble: 363 × 3
#>    fox_team_id fox_team_name                    fox_section                 
#>    <chr>       <chr>                            <chr>                       
#>  1 223         Bryant Bulldogs                  America East                
#>  2 55          Njit Highlanders                 America East                
#>  3 6           New Hampshire Wildcats           America East                
#>  4 1           University At Albany Great Danes America East                
#>  5 8           Umbc Retrievers                  America East                
#>  6 5           Umass Lowell River Hawks         America East                
#>  7 9           Vermont Catamounts               America East                
#>  8 4           Maine Black Bears                America East                
#>  9 2           Binghamton Bearcats              America East                
#> 10 124         Charleston Cougars               Coastal Athletic Association
#> # ℹ 353 more rows
# }
```

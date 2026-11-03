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
#> ✖ 2026-11-03 18:17:38.675801: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "3", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:42.689286: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "200", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:43.067461: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "226", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:43.127052: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "230", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:43.197722: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "231", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:44.251342: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "350", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:44.322148: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "351", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:44.390863: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "352", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:44.465814: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "353", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:44.538819: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "354", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:44.622132: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "355", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:44.702903: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "356", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:44.776519: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "357", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:44.861717: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "358", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:44.94294: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "359", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:45.012991: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "360", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:45.341161: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "361", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:45.780198: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "362", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:45.852543: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "363", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:45.984772: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "364", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:46.075678: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "365", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:46.155191: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "367", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:46.228806: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "368", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:46.299598: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "369", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:46.386682: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "370", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:46.461511: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "371", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:46.542799: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "372", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-03 18:17:46.633911: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "373", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ── Fox Sports WBB full team directory ────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-03 18:17:46 UTC
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

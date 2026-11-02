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
#> ✖ 2026-11-02 13:50:09.335313: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "3", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:10.59714: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "200", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:10.778053: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "226", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:10.845655: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "230", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:10.930648: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "231", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:11.264174: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "350", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:11.380945: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "351", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:11.476631: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "352", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:11.582373: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "353", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:11.677924: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "354", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:11.7382: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "355", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:11.814019: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "356", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:11.977031: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "357", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.027048: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "358", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.101964: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "359", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.152104: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "360", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.204623: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "361", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.286118: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "362", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.366846: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "363", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.419628: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "364", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.53383: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "365", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.600153: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "367", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.696127: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "368", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.797773: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "369", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.881691: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "370", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:12.934712: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "371", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:13.024785: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "372", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ✖ 2026-11-02 13:50:13.103932: Invalid arguments or no Fox wcbk teams data available!
#> ✖ Args: sport = "wcbk", resource = "teams", game_id = NULL, team_id = "373", category = "scoring", who = "player", page = 0
#> ✖ Error: The API returned an error
#> ── Fox Sports WBB full team directory ────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-02 13:50:13 UTC
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

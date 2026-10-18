# **NBL Rosetta Outcomes**

Win-loss record and last 10, 5 and 3 results per team, keyed by team
name.

Endpoint:
`GET https://prod.rosetta.nbl.com.au/get/match/outcomes/for/{org}/teams/in/season/{season}/{season_type}`

## Usage

``` r
nbl_rosetta_outcomes(season, org = "wnbl", season_type = "regular")
```

## Arguments

- season:

  (*integer* required): Season END year (2026 = 2025-26). The runtime
  maps it to Rosetta's year: the START year for the NBL and WNBL from
  1998-99, the calendar year for NBL1 and the NBL / WNBL winter seasons
  up to 1998. END 1998 and 1999 both read Rosetta year 1998, which holds
  two seasons; the matches frame keeps the one asked for.

- org:

  (*character* default `"wnbl"`, the women's WNBL): Organisation: nbl
  (men's NBL), wnbl (women's) or nbl1 (the second tier, men's and
  women's conferences). One of `"nbl"`, `"wnbl"`, `"nbl1"`.

- season_type:

  (*character* default `"regular"`): Season type: all (every type of the
  year), regular (includes finals), preseason, in_season (cups, Blitz,
  NBAxNBL, All-Star) or test. One of `"all"`, `"regular"`,
  `"preseason"`, `"in_season"`, `"test"`.

## Value

A `wehoop_data` tibble (one row per team name):

|  |  |  |
|----|----|----|
| col_name | type | description |
| org | character | Organisation the row belongs to: nbl, wnbl or nbl1. From the row's competition, else from the request. |
| team_name | character | Name of the team, the key of Rosetta's outcomes map (the body carries no team id). |
| wins | integer | Wins of the team in the season type asked for. |
| losses | integer | Losses of the team in the season type asked for. |
| last10 | character | Results of the team's last 10 games as a W/L string, oldest first. |
| last5 | character | Results of the team's last 5 games as a W/L string, oldest first. |
| last3 | character | Results of the team's last 3 games as a W/L string, oldest first. |
| season_end_year | integer | sdv season key: the END year of the season (2026 = 2025-26), derived from season_year (a START year for the NBL and WNBL from 1998-99, a calendar year for NBL1 and the 1979-1997 winter seasons; year 1998 is split on the start date). Where the body carries no year it is the season asked for. |

Columns the body adds beyond these follow, in body order (sdv-py keeps
them too).

## Details

- Unofficial: the JSON proxy behind nbl.com.au (not an API the NBL
  documents or supports). The terms of use were not reviewed; payloads
  are not redistributed as release assets.

- Gated by a referer, not a key: every request carries Origin / Referer
  set to nbl.com.au (the runtime sends them); without them the host
  answers 403 MISSING_API_KEY, which is raised as `wehoop_asset_fetch`.

- Fills a hole in ESPN: ESPN's nbl feed has box scores but no plays for
  the 2025-26 NBL season (the stats provider changed from Genius Sports
  to Sportradar DataCore that year). nbl_rosetta_match_pbp has the full
  event log with shot x/y for 2025-26 and, in the same shape, back to
  2011-12 (WNBL about 2014-15). Matches from 1979 have box scores only.

- One host serves three organisations; pass org='nbl' (default), 'wnbl'
  or 'nbl1'. NBL1 is the second tier (men's and women's conferences,
  calendar-year seasons).

- Season = the END year (2026 = 2025-26) everywhere. Rosetta's own year
  is the START year for the NBL and WNBL from 1998-99 and a calendar
  year for NBL1 and the 1979-1997 winter seasons; the runtime maps it.
  Year 1998 holds two seasons (calendar 1998 and 1998-99).

- Ids: `<entity>`*id columns are DataCore ids (UUID v1; join on them),
  rosetta*`<entity>`\_id Rosetta's own. match_id is the DataCore fixture
  id every match route is keyed on.

- Unknown ids, orgs and types answer 200 with no rows
  (`wehoop_no_data`). Rosetta caches a body per path and serves it
  whatever the query string, so a page cut by someone else's limit is
  refused (`wehoop_asset_fetch`); retry after the cache entry expires.

Errors: `wehoop_no_data` when Rosetta answers 404 or no rows (an unknown
match, team, player or season id, an org or season type with nothing, or
no season in progress); `wehoop_asset_fetch` for the 403 gate body, a
stub or error envelope, a page cut by Rosetta's path cache, a body for
another org, season or entity than the one asked for, or any other
failed fetch; `wehoop_bad_request` for an unknown `org` / `season_type`,
a malformed id, or HTTP 400 / 422.

## See also

Other NBL Rosetta:
[`nbl_rosetta_match()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_match.md),
[`nbl_rosetta_match_by_id()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_match_by_id.md),
[`nbl_rosetta_match_pbp()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_match_pbp.md),
[`nbl_rosetta_match_player_box()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_match_player_box.md),
[`nbl_rosetta_match_player_period_box()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_match_player_period_box.md),
[`nbl_rosetta_match_team_box()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_match_team_box.md),
[`nbl_rosetta_matches()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_matches.md),
[`nbl_rosetta_next_match()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_next_match.md),
[`nbl_rosetta_next_match_team()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_next_match_team.md),
[`nbl_rosetta_next_matches()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_next_matches.md),
[`nbl_rosetta_player_game_log()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_player_game_log.md),
[`nbl_rosetta_player_stats()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_player_stats.md),
[`nbl_rosetta_players()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_players.md),
[`nbl_rosetta_seasons()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_seasons.md),
[`nbl_rosetta_seasons_current()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_seasons_current.md),
[`nbl_rosetta_standings()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_standings.md),
[`nbl_rosetta_stats_leaders()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_stats_leaders.md),
[`nbl_rosetta_team_players()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_team_players.md),
[`nbl_rosetta_team_stats()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_team_stats.md),
[`nbl_rosetta_team_stats_leaders()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_team_stats_leaders.md),
[`nbl_rosetta_teams()`](https://wehoop.sportsdataverse.org/reference/nbl_rosetta_teams.md)

## Examples

``` r
# \donttest{
  try(nbl_rosetta_outcomes(org = "nbl", season = 2026, season_type = "regular"))
#> ── NBL Rosetta outcomes from prod.rosetta.nbl.com.au ────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-10-18 14:06:51 UTC
#> # A tibble: 10 × 8
#>    org   team_name                wins losses last10 last5 last3 season_end_year
#>    <chr> <chr>                   <int>  <int> <chr>  <chr> <chr>           <int>
#>  1 nbl   Sydney Kings               29     11 WWWWW… WLWLW WLW              2026
#>  2 nbl   Adelaide 36ers             27     15 LLWLW… LWLWL LWL              2026
#>  3 nbl   South East Melbourne P…    24     13 LWWLW… LWLWL LWL              2026
#>  4 nbl   Perth Wildcats             22     15 WWWWL… WLWLL WLL              2026
#>  5 nbl   Melbourne United           21     14 WWWLL… WLWWL WWL              2026
#>  6 nbl   Tasmania JackJumpers       14     20 WLLLL… WWLLL LLL              2026
#>  7 nbl   NZ Breakers                14     20 WLLWL… LWLWW LWW              2026
#>  8 nbl   Brisbane Bullets            6     27 LLLLL… LLLLL LLL              2026
#>  9 nbl   Cairns Taipans              9     24 WLLLW… LLWLL WLL              2026
#> 10 nbl   Illawarra Hawks            13     20 LWWLL… WLLWW LWW              2026
# }
```

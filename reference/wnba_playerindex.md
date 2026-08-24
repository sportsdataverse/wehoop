# **Get WNBA Stats API Player Index**

**Get WNBA Stats API Player Index**

**Get WNBA Stats API Player Index**

## Usage

``` r
wnba_playerindex(
  college = "",
  country = "",
  draft_pick = "",
  draft_round = "",
  draft_year = "",
  height = "",
  historical = 1,
  league_id = "10",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  team_id = "0",
  weight = "",
  ...
)
```

## Arguments

- college:

  Player College

- country:

  Player Country

- draft_pick:

  Draft Pick

- draft_round:

  Draft Round

- draft_year:

  Draft Year

- height:

  Player Height

- historical:

  Whether to include only current players (0) or all historical (1).

- league_id:

  League - default: '00'. Other options include '10': WWNBA, '20':
  G-League

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- team_id:

  Team ID. Default: 0 (all teams).

- weight:

  Player weight

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: PlayerIndex

**PlayerIndex**

|  |  |  |
|----|----|----|
| col_name | types | description |
| PERSON_ID | character | Unique player identifier (V3 endpoints). |
| PLAYER_LAST_NAME | character |  |
| PLAYER_FIRST_NAME | character |  |
| PLAYER_SLUG | character | URL-safe player identifier. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_SLUG | character | URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). |
| IS_DEFUNCT | character |  |
| TEAM_CITY | character | Team city or region (e.g. 'Las Vegas'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| JERSEY_NUMBER | character |  |
| POSITION | character | Listed roster position (G, F, C, etc.). |
| HEIGHT | character | Player height (string e.g. '6-2' or inches). |
| WEIGHT | character | Player weight in pounds. |
| COLLEGE | character | College or school attended. |
| COUNTRY | character | Country (full name or code). |
| DRAFT_YEAR | character | Draft year (4-digit). |
| DRAFT_ROUND | character | Round of the draft selection. |
| DRAFT_NUMBER | character |  |
| ROSTER_STATUS | character |  |
| PTS | character | Points scored. |
| REB | character | Total rebounds. |
| AST | character | Assists. |
| STATS_TIMEFRAME | character |  |
| FROM_YEAR | character |  |
| TO_YEAR | character |  |

## Details

      wnba_playerindex()

## See also

Other WNBA Player Functions:
[`wnba_infographicfanduelplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_infographicfanduelplayer.md),
[`wnba_leaguedashplayerbiostats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerbiostats.md),
[`wnba_leaguedashplayerclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerclutch.md),
[`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md),
[`wnba_leaguedashplayerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerstats.md),
[`wnba_leagueplayerondetails()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueplayerondetails.md),
[`wnba_leagueseasonmatchups()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueseasonmatchups.md),
[`wnba_playerawards()`](https://wehoop.sportsdataverse.org/reference/wnba_playerawards.md),
[`wnba_playercareerbycollege()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollege.md),
[`wnba_playercareerbycollegerollup()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollegerollup.md),
[`wnba_playercareerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats.md),
[`wnba_playercompare()`](https://wehoop.sportsdataverse.org/reference/wnba_playercompare.md),
[`wnba_playerdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md),
[`wnba_playerestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_playerestimatedmetrics.md),
[`wnba_playerfantasyprofile()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofile.md),
[`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md),
[`wnba_playergamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelog.md),
[`wnba_playergamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelogs.md),
[`wnba_playergamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamestreakfinder.md),
[`wnba_playerheadshot()`](https://wehoop.sportsdataverse.org/reference/wnba_playerheadshot.md),
[`wnba_playernextngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playernextngames.md),
[`wnba_playerprofilev2()`](https://wehoop.sportsdataverse.org/reference/wnba_playerprofilev2.md),
[`wnba_playervsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_playervsplayer.md)

## Author

Saiem Gilani

# **Get WNBA Stats API Player vs Player**

**Get WNBA Stats API Player vs Player**

**Get WNBA Stats API Player vs Player**

## Usage

``` r
wnba_playervsplayer(
  date_from = "",
  date_to = "",
  game_segment = "",
  last_n_games = 0,
  league_id = "10",
  location = "",
  measure_type = "Base",
  month = 0,
  opponent_team_id = 0,
  outcome = "",
  pace_adjust = "N",
  per_mode = "Totals",
  period = 0,
  player_id = "1628932",
  plus_minus = "N",
  rank = "N",
  season = most_recent_wnba_season() - 1,
  season_segment = "",
  season_type = "Regular Season",
  vs_conference = "",
  vs_division = "",
  vs_player_id = "1629488",
  ...
)
```

## Arguments

- date_from:

  date_from

- date_to:

  date_to

- game_segment:

  game_segment

- last_n_games:

  last_n_games

- league_id:

  League - default: '00'. Other options include '10': WWNBA, '20':
  G-League

- location:

  location

- measure_type:

  measure_type

- month:

  month

- opponent_team_id:

  opponent_team_id

- outcome:

  outcome

- pace_adjust:

  pace_adjust

- per_mode:

  per_mode

- period:

  period

- player_id:

  Player ID

- plus_minus:

  plus_minus

- rank:

  rank

- season:

  Season - format 2020-21

- season_segment:

  season_segment

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- vs_player_id:

  vs_player_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: OnOffCourt, Overall, PlayerInfo,
ShotAreaOffCourt, ShotAreaOnCourt, ShotAreaOverall,
ShotDistanceOffCourt, ShotDistanceOnCourt, ShotDistanceOverall,
VsPlayerInfo

**Overall**

|                  |           |
|------------------|-----------|
| col_name         | types     |
| GROUP_SET        | character |
| GROUP_VALUE      | character |
| PLAYER_ID        | character |
| PLAYER_NAME      | character |
| GP               | character |
| W                | character |
| L                | character |
| W_PCT            | character |
| MIN              | character |
| FGM              | character |
| FGA              | character |
| FG_PCT           | character |
| FG3M             | character |
| FG3A             | character |
| FG3_PCT          | character |
| FTM              | character |
| FTA              | character |
| FT_PCT           | character |
| OREB             | character |
| DREB             | character |
| REB              | character |
| AST              | character |
| TOV              | character |
| STL              | character |
| BLK              | character |
| BLKA             | character |
| PF               | character |
| PFD              | character |
| PTS              | character |
| PLUS_MINUS       | character |
| WNBA_FANTASY_PTS | character |

**OnOffCourt**

|                  |           |
|------------------|-----------|
| col_name         | types     |
| GROUP_SET        | character |
| PLAYER_ID        | character |
| PLAYER_NAME      | character |
| VS_PLAYER_ID     | character |
| VS_PLAYER_NAME   | character |
| COURT_STATUS     | character |
| GP               | character |
| W                | character |
| L                | character |
| W_PCT            | character |
| MIN              | character |
| FGM              | character |
| FGA              | character |
| FG_PCT           | character |
| FG3M             | character |
| FG3A             | character |
| FG3_PCT          | character |
| FTM              | character |
| FTA              | character |
| FT_PCT           | character |
| OREB             | character |
| DREB             | character |
| REB              | character |
| AST              | character |
| TOV              | character |
| STL              | character |
| BLK              | character |
| BLKA             | character |
| PF               | character |
| PFD              | character |
| PTS              | character |
| PLUS_MINUS       | character |
| WNBA_FANTASY_PTS | character |

**ShotDistanceOverall**

|             |           |
|-------------|-----------|
| col_name    | types     |
| GROUP_SET   | character |
| GROUP_VALUE | character |
| PLAYER_ID   | character |
| PLAYER_NAME | character |
| FGM         | character |
| FGA         | character |
| FG_PCT      | character |

**ShotDistanceOnCourt**

|                |           |
|----------------|-----------|
| col_name       | types     |
| GROUP_SET      | character |
| PLAYER_ID      | character |
| PLAYER_NAME    | character |
| VS_PLAYER_ID   | character |
| VS_PLAYER_NAME | character |
| COURT_STATUS   | character |
| GROUP_VALUE    | character |
| FGM            | character |
| FGA            | character |
| FG_PCT         | character |

**ShotDistanceOffCourt**

|                |           |
|----------------|-----------|
| col_name       | types     |
| GROUP_SET      | character |
| PLAYER_ID      | character |
| PLAYER_NAME    | character |
| VS_PLAYER_ID   | character |
| VS_PLAYER_NAME | character |
| COURT_STATUS   | character |
| GROUP_VALUE    | character |
| FGM            | character |
| FGA            | character |
| FG_PCT         | character |

**ShotAreaOverall**

|             |           |
|-------------|-----------|
| col_name    | types     |
| GROUP_SET   | character |
| GROUP_VALUE | character |
| PLAYER_ID   | character |
| PLAYER_NAME | character |
| FGM         | character |
| FGA         | character |
| FG_PCT      | character |

**ShotAreaOnCourt**

|                |           |
|----------------|-----------|
| col_name       | types     |
| GROUP_SET      | character |
| PLAYER_ID      | character |
| PLAYER_NAME    | character |
| VS_PLAYER_ID   | character |
| VS_PLAYER_NAME | character |
| COURT_STATUS   | character |
| GROUP_VALUE    | character |
| FGM            | character |
| FGA            | character |
| FG_PCT         | character |

**ShotAreaOffCourt**

|                |           |
|----------------|-----------|
| col_name       | types     |
| GROUP_SET      | character |
| PLAYER_ID      | character |
| PLAYER_NAME    | character |
| VS_PLAYER_ID   | character |
| VS_PLAYER_NAME | character |
| COURT_STATUS   | character |
| GROUP_VALUE    | character |
| FGM            | character |
| FGA            | character |
| FG_PCT         | character |

**PlayerInfo**

|                          |           |
|--------------------------|-----------|
| col_name                 | types     |
| PERSON_ID                | character |
| FIRST_NAME               | character |
| LAST_NAME                | character |
| DISPLAY_FIRST_LAST       | character |
| DISPLAY_LAST_COMMA_FIRST | character |
| DISPLAY_FI_LAST          | character |
| BIRTHDATE                | character |
| SCHOOL                   | character |
| COUNTRY                  | character |
| LAST_AFFILIATION         | character |

**VsPlayerInfo**

|                          |           |
|--------------------------|-----------|
| col_name                 | types     |
| PERSON_ID                | character |
| FIRST_NAME               | character |
| LAST_NAME                | character |
| DISPLAY_FIRST_LAST       | character |
| DISPLAY_LAST_COMMA_FIRST | character |
| DISPLAY_FI_LAST          | character |
| BIRTHDATE                | character |
| SCHOOL                   | character |
| COUNTRY                  | character |
| LAST_AFFILIATION         | character |

## Details

     wnba_playervsplayer(player_id = '1628932', vs_player_id = '1629488')

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
[`wnba_playercareerbycollegerollup()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollegerollup.md),
[`wnba_playercareerbycollege()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollege.md),
[`wnba_playercareerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats.md),
[`wnba_playercompare()`](https://wehoop.sportsdataverse.org/reference/wnba_playercompare.md),
[`wnba_playerdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md),
[`wnba_playerdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbygamesplits.md),
[`wnba_playerdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbygeneralsplits.md),
[`wnba_playerdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbylastngames.md),
[`wnba_playerdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyopponent.md),
[`wnba_playerdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyshootingsplits.md),
[`wnba_playerdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyteamperformance.md),
[`wnba_playerdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyyearoveryear.md),
[`wnba_playerestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_playerestimatedmetrics.md),
[`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md),
[`wnba_playerfantasyprofile()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofile.md),
[`wnba_playergamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelogs.md),
[`wnba_playergamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelog.md),
[`wnba_playergamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamestreakfinder.md),
[`wnba_playerheadshot()`](https://wehoop.sportsdataverse.org/reference/wnba_playerheadshot.md),
[`wnba_playerindex()`](https://wehoop.sportsdataverse.org/reference/wnba_playerindex.md),
[`wnba_playernextngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playernextngames.md),
[`wnba_playerprofilev2()`](https://wehoop.sportsdataverse.org/reference/wnba_playerprofilev2.md)

## Author

Saiem Gilani

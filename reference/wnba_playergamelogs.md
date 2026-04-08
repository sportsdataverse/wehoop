# **Get WNBA Stats API Player Game Logs**

**Get WNBA Stats API Player Game Logs**

**Get WNBA Stats API Player Game Logs**

## Usage

``` r
wnba_playergamelogs(
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
  po_round = "",
  per_mode = "Totals",
  period = 0,
  player_id = "1628932",
  season = most_recent_wnba_season() - 1,
  season_segment = "",
  season_type = "Regular Season",
  team_id = "",
  vs_conference = "",
  vs_division = "",
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

- po_round:

  po_round

- per_mode:

  per_mode

- period:

  period

- player_id:

  Player ID

- season:

  Season - format 2020-21

- season_segment:

  season_segment

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- team_id:

  team_id

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: PlayerGameLogs

**PlayerGameLogs**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| SEASON_YEAR            | character |
| PLAYER_ID              | character |
| PLAYER_NAME            | character |
| NICKNAME               | character |
| TEAM_ID                | character |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| GAME_ID                | character |
| GAME_DATE              | character |
| MATCHUP                | character |
| WL                     | character |
| MIN                    | character |
| FGM                    | character |
| FGA                    | character |
| FG_PCT                 | character |
| FG3M                   | character |
| FG3A                   | character |
| FG3_PCT                | character |
| FTM                    | character |
| FTA                    | character |
| FT_PCT                 | character |
| OREB                   | character |
| DREB                   | character |
| REB                    | character |
| AST                    | character |
| TOV                    | character |
| STL                    | character |
| BLK                    | character |
| BLKA                   | character |
| PF                     | character |
| PFD                    | character |
| PTS                    | character |
| PLUS_MINUS             | character |
| WNBA_FANTASY_PTS       | character |
| DD2                    | character |
| TD3                    | character |
| WWNBA_FANTASY_PTS      | character |
| GP_RANK                | character |
| W_RANK                 | character |
| L_RANK                 | character |
| W_PCT_RANK             | character |
| MIN_RANK               | character |
| FGM_RANK               | character |
| FGA_RANK               | character |
| FG_PCT_RANK            | character |
| FG3M_RANK              | character |
| FG3A_RANK              | character |
| FG3_PCT_RANK           | character |
| FTM_RANK               | character |
| FTA_RANK               | character |
| FT_PCT_RANK            | character |
| OREB_RANK              | character |
| DREB_RANK              | character |
| REB_RANK               | character |
| AST_RANK               | character |
| TOV_RANK               | character |
| STL_RANK               | character |
| BLK_RANK               | character |
| BLKA_RANK              | character |
| PF_RANK                | character |
| PFD_RANK               | character |
| PTS_RANK               | character |
| PLUS_MINUS_RANK        | character |
| WNBA_FANTASY_PTS_RANK  | character |
| DD2_RANK               | character |
| TD3_RANK               | character |
| WWNBA_FANTASY_PTS_RANK | character |
| VIDEO_AVAILABLE_FLAG   | character |

## Details

     wnba_playergamelogs(player_id = '1628932')

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
[`wnba_playergamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelog.md),
[`wnba_playergamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamestreakfinder.md),
[`wnba_playerheadshot()`](https://wehoop.sportsdataverse.org/reference/wnba_playerheadshot.md),
[`wnba_playerindex()`](https://wehoop.sportsdataverse.org/reference/wnba_playerindex.md),
[`wnba_playernextngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playernextngames.md),
[`wnba_playerprofilev2()`](https://wehoop.sportsdataverse.org/reference/wnba_playerprofilev2.md),
[`wnba_playervsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_playervsplayer.md)

## Author

Saiem Gilani

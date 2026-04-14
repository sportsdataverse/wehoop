# **Get WNBA Stats API Player Dashboard by Shooting Splits**

**Get WNBA Stats API Player Dashboard by Shooting Splits**

**Get WNBA Stats API Player Dashboard by Shooting Splits**

## Usage

``` r
wnba_playerdashboardbyshootingsplits(
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
  pace_adjust = "N",
  per_mode = "Totals",
  period = 0,
  player_id = "1628932",
  plus_minus = "N",
  rank = "N",
  season = most_recent_wnba_season() - 1,
  season_segment = "",
  season_type = "Regular Season",
  shot_clock_range = "",
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

  league_id

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

- pace_adjust:

  pace_adjust

- per_mode:

  per_mode

- period:

  period

- player_id:

  player_id

- plus_minus:

  plus_minus

- rank:

  rank

- season:

  season

- season_segment:

  season_segment

- season_type:

  season_type

- shot_clock_range:

  shot_clock_range

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: AssistedBy,
AssitedShotPlayerDashboard, OverallPlayerDashboard,
Shot5FTPlayerDashboard, Shot8FTPlayerDashboard, ShotAreaPlayerDashboard,
ShotTypePlayerDashboard, ShotTypeSummaryPlayerDashboard

**OverallPlayerDashboard**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GROUP_SET         | character |
| GROUP_VALUE       | character |
| FGM               | character |
| FGA               | character |
| FG_PCT            | character |
| FG3M              | character |
| FG3A              | character |
| FG3_PCT           | character |
| EFG_PCT           | character |
| BLKA              | character |
| PCT_AST_2PM       | character |
| PCT_UAST_2PM      | character |
| PCT_AST_3PM       | character |
| PCT_UAST_3PM      | character |
| PCT_AST_FGM       | character |
| PCT_UAST_FGM      | character |
| FGM_RANK          | character |
| FGA_RANK          | character |
| FG_PCT_RANK       | character |
| FG3M_RANK         | character |
| FG3A_RANK         | character |
| FG3_PCT_RANK      | character |
| EFG_PCT_RANK      | character |
| BLKA_RANK         | character |
| PCT_AST_2PM_RANK  | character |
| PCT_UAST_2PM_RANK | character |
| PCT_AST_3PM_RANK  | character |
| PCT_UAST_3PM_RANK | character |
| PCT_AST_FGM_RANK  | character |
| PCT_UAST_FGM_RANK | character |

**Shot5FTPlayerDashboard**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GROUP_SET         | character |
| GROUP_VALUE       | character |
| FGM               | character |
| FGA               | character |
| FG_PCT            | character |
| FG3M              | character |
| FG3A              | character |
| FG3_PCT           | character |
| EFG_PCT           | character |
| BLKA              | character |
| PCT_AST_2PM       | character |
| PCT_UAST_2PM      | character |
| PCT_AST_3PM       | character |
| PCT_UAST_3PM      | character |
| PCT_AST_FGM       | character |
| PCT_UAST_FGM      | character |
| FGM_RANK          | character |
| FGA_RANK          | character |
| FG_PCT_RANK       | character |
| FG3M_RANK         | character |
| FG3A_RANK         | character |
| FG3_PCT_RANK      | character |
| EFG_PCT_RANK      | character |
| BLKA_RANK         | character |
| PCT_AST_2PM_RANK  | character |
| PCT_UAST_2PM_RANK | character |
| PCT_AST_3PM_RANK  | character |
| PCT_UAST_3PM_RANK | character |
| PCT_AST_FGM_RANK  | character |
| PCT_UAST_FGM_RANK | character |

**Shot8FTPlayerDashboard**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GROUP_SET         | character |
| GROUP_VALUE       | character |
| FGM               | character |
| FGA               | character |
| FG_PCT            | character |
| FG3M              | character |
| FG3A              | character |
| FG3_PCT           | character |
| EFG_PCT           | character |
| BLKA              | character |
| PCT_AST_2PM       | character |
| PCT_UAST_2PM      | character |
| PCT_AST_3PM       | character |
| PCT_UAST_3PM      | character |
| PCT_AST_FGM       | character |
| PCT_UAST_FGM      | character |
| FGM_RANK          | character |
| FGA_RANK          | character |
| FG_PCT_RANK       | character |
| FG3M_RANK         | character |
| FG3A_RANK         | character |
| FG3_PCT_RANK      | character |
| EFG_PCT_RANK      | character |
| BLKA_RANK         | character |
| PCT_AST_2PM_RANK  | character |
| PCT_UAST_2PM_RANK | character |
| PCT_AST_3PM_RANK  | character |
| PCT_UAST_3PM_RANK | character |
| PCT_AST_FGM_RANK  | character |
| PCT_UAST_FGM_RANK | character |

**ShotAreaPlayerDashboard**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GROUP_SET         | character |
| GROUP_VALUE       | character |
| FGM               | character |
| FGA               | character |
| FG_PCT            | character |
| FG3M              | character |
| FG3A              | character |
| FG3_PCT           | character |
| EFG_PCT           | character |
| BLKA              | character |
| PCT_AST_2PM       | character |
| PCT_UAST_2PM      | character |
| PCT_AST_3PM       | character |
| PCT_UAST_3PM      | character |
| PCT_AST_FGM       | character |
| PCT_UAST_FGM      | character |
| FGM_RANK          | character |
| FGA_RANK          | character |
| FG_PCT_RANK       | character |
| FG3M_RANK         | character |
| FG3A_RANK         | character |
| FG3_PCT_RANK      | character |
| EFG_PCT_RANK      | character |
| BLKA_RANK         | character |
| PCT_AST_2PM_RANK  | character |
| PCT_UAST_2PM_RANK | character |
| PCT_AST_3PM_RANK  | character |
| PCT_UAST_3PM_RANK | character |
| PCT_AST_FGM_RANK  | character |
| PCT_UAST_FGM_RANK | character |

**AssitedShotPlayerDashboard**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GROUP_SET         | character |
| GROUP_VALUE       | character |
| FGM               | character |
| FGA               | character |
| FG_PCT            | character |
| FG3M              | character |
| FG3A              | character |
| FG3_PCT           | character |
| EFG_PCT           | character |
| BLKA              | character |
| PCT_AST_2PM       | character |
| PCT_UAST_2PM      | character |
| PCT_AST_3PM       | character |
| PCT_UAST_3PM      | character |
| PCT_AST_FGM       | character |
| PCT_UAST_FGM      | character |
| FGM_RANK          | character |
| FGA_RANK          | character |
| FG_PCT_RANK       | character |
| FG3M_RANK         | character |
| FG3A_RANK         | character |
| FG3_PCT_RANK      | character |
| EFG_PCT_RANK      | character |
| BLKA_RANK         | character |
| PCT_AST_2PM_RANK  | character |
| PCT_UAST_2PM_RANK | character |
| PCT_AST_3PM_RANK  | character |
| PCT_UAST_3PM_RANK | character |
| PCT_AST_FGM_RANK  | character |
| PCT_UAST_FGM_RANK | character |

**ShotTypeSummaryPlayerDashboard**

|              |           |
|--------------|-----------|
| col_name     | types     |
| GROUP_SET    | character |
| GROUP_VALUE  | character |
| FGM          | character |
| FGA          | character |
| FG_PCT       | character |
| FG3M         | character |
| FG3A         | character |
| FG3_PCT      | character |
| EFG_PCT      | character |
| BLKA         | character |
| PCT_AST_2PM  | character |
| PCT_UAST_2PM | character |
| PCT_AST_3PM  | character |
| PCT_UAST_3PM | character |
| PCT_AST_FGM  | character |
| PCT_UAST_FGM | character |

**ShotTypePlayerDashboard**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GROUP_SET         | character |
| GROUP_VALUE       | character |
| FGM               | character |
| FGA               | character |
| FG_PCT            | character |
| FG3M              | character |
| FG3A              | character |
| FG3_PCT           | character |
| EFG_PCT           | character |
| BLKA              | character |
| PCT_AST_2PM       | character |
| PCT_UAST_2PM      | character |
| PCT_AST_3PM       | character |
| PCT_UAST_3PM      | character |
| PCT_AST_FGM       | character |
| PCT_UAST_FGM      | character |
| FGM_RANK          | character |
| FGA_RANK          | character |
| FG_PCT_RANK       | character |
| FG3M_RANK         | character |
| FG3A_RANK         | character |
| FG3_PCT_RANK      | character |
| EFG_PCT_RANK      | character |
| BLKA_RANK         | character |
| PCT_AST_2PM_RANK  | character |
| PCT_UAST_2PM_RANK | character |
| PCT_AST_3PM_RANK  | character |
| PCT_UAST_3PM_RANK | character |
| PCT_AST_FGM_RANK  | character |
| PCT_UAST_FGM_RANK | character |

**AssistedBy**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GROUP_SET         | character |
| PLAYER_ID         | character |
| PLAYER_NAME       | character |
| FGM               | character |
| FGA               | character |
| FG_PCT            | character |
| FG3M              | character |
| FG3A              | character |
| FG3_PCT           | character |
| EFG_PCT           | character |
| BLKA              | character |
| PCT_AST_2PM       | character |
| PCT_UAST_2PM      | character |
| PCT_AST_3PM       | character |
| PCT_UAST_3PM      | character |
| PCT_AST_FGM       | character |
| PCT_UAST_FGM      | character |
| FGM_RANK          | character |
| FGA_RANK          | character |
| FG_PCT_RANK       | character |
| FG3M_RANK         | character |
| FG3A_RANK         | character |
| FG3_PCT_RANK      | character |
| EFG_PCT_RANK      | character |
| BLKA_RANK         | character |
| PCT_AST_2PM_RANK  | character |
| PCT_UAST_2PM_RANK | character |
| PCT_AST_3PM_RANK  | character |
| PCT_UAST_3PM_RANK | character |
| PCT_AST_FGM_RANK  | character |
| PCT_UAST_FGM_RANK | character |

## Details

     wnba_playerdashboardbyshootingsplits(player_id = '1628932', season = most_recent_wnba_season() - 1)

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
[`wnba_playerdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbygamesplits.md),
[`wnba_playerdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbygeneralsplits.md),
[`wnba_playerdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbylastngames.md),
[`wnba_playerdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyopponent.md),
[`wnba_playerdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyteamperformance.md),
[`wnba_playerdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyyearoveryear.md),
[`wnba_playerestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_playerestimatedmetrics.md),
[`wnba_playerfantasyprofile()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofile.md),
[`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md),
[`wnba_playergamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelog.md),
[`wnba_playergamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelogs.md),
[`wnba_playergamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamestreakfinder.md),
[`wnba_playerheadshot()`](https://wehoop.sportsdataverse.org/reference/wnba_playerheadshot.md),
[`wnba_playerindex()`](https://wehoop.sportsdataverse.org/reference/wnba_playerindex.md),
[`wnba_playernextngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playernextngames.md),
[`wnba_playerprofilev2()`](https://wehoop.sportsdataverse.org/reference/wnba_playerprofilev2.md),
[`wnba_playervsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_playervsplayer.md)

Other WNBA Shooting Functions:
[`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md),
[`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md),
[`wnba_shotchartdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartdetail.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md),
[`wnba_teamdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyshootingsplits.md)

## Author

Saiem Gilani

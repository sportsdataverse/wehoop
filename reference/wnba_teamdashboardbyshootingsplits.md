# **Get WNBA Stats API Team Dashboard by Shooting Splits**

**Get WNBA Stats API Team Dashboard by Shooting Splits**

**Get WNBA Stats API Team Dashboard by Shooting Splits**

## Usage

``` r
wnba_teamdashboardbyshootingsplits(
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
  plus_minus = "N",
  po_round = "",
  per_mode = "Totals",
  period = 0,
  rank = "N",
  season = most_recent_wnba_season(),
  season_segment = "",
  season_type = "Regular Season",
  shot_clock_range = "",
  team_id = "1611661328",
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

- pace_adjust:

  pace_adjust

- plus_minus:

  plus_minus

- po_round:

  po_round

- per_mode:

  per_mode

- period:

  period

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

- team_id:

  team_id

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: AssistedBy,
AssitedShotTeamDashboard, OverallTeamDashboard, Shot5FTTeamDashboard,
Shot8FTTeamDashboard, ShotAreaTeamDashboard, ShotTypeTeamDashboard

**OverallTeamDashboard**

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

**Shot5FTTeamDashboard**

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

**Shot8FTTeamDashboard**

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

**ShotAreaTeamDashboard**

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

**AssitedShotTeamDashboard**

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

**ShotTypeTeamDashboard**

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

[Team Dashboard by Shooting
Splits](https://www.nba.com/stats/team/1610612749/shooting)

      wnba_teamdashboardbyshootingsplits(team_id = '1611661328', season = most_recent_wnba_season())

## See also

Other WNBA Team Functions:
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md),
[`wnba_teamdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbygamesplits.md),
[`wnba_teamdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbygeneralsplits.md),
[`wnba_teamdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbylastngames.md),
[`wnba_teamdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyopponent.md),
[`wnba_teamdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyteamperformance.md),
[`wnba_teamdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyyearoveryear.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md),
[`wnba_teamdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdetails.md),
[`wnba_teamestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_teamestimatedmetrics.md),
[`wnba_teamgamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelog.md),
[`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md),
[`wnba_teamgamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamestreakfinder.md),
[`wnba_teamhistoricalleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_teamhistoricalleaders.md),
[`wnba_teamplayerdashboard()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md),
[`wnba_teamplayeronoffdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffdetails.md),
[`wnba_teamplayeronoffsummary()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffsummary.md),
[`wnba_teams()`](https://wehoop.sportsdataverse.org/reference/wnba_teams.md),
[`wnba_teamvsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_teamvsplayer.md),
[`wnba_teamyearbyyearstats()`](https://wehoop.sportsdataverse.org/reference/wnba_teamyearbyyearstats.md)

Other WNBA Shooting Functions:
[`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md),
[`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md),
[`wnba_playerdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyshootingsplits.md),
[`wnba_shotchartdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartdetail.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md)

## Author

Saiem Gilani

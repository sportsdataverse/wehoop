# **Get WNBA Stats API Team Dashboard by General Splits**

**Get WNBA Stats API Team Dashboard by General Splits**

**Get WNBA Stats API Team Dashboard by General Splits**

## Usage

``` r
wnba_teamdashboardbygeneralsplits(
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

Return a named list of data frames: DaysRestTeamDashboard,
LocationTeamDashboard, MonthTeamDashboard, OverallTeamDashboard,
PrePostAllStarTeamDashboard, WinsLossesTeamDashboard

**OverallTeamDashboard**

|                 |           |                                               |
|-----------------|-----------|-----------------------------------------------|
| col_name        | types     | description                                   |
| GROUP_SET       | character |                                               |
| GROUP_VALUE     | character |                                               |
| SEASON_YEAR     | character | Season year string ('YYYY-YY' format).        |
| GP              | character | Games played.                                 |
| W               | character | Wins.                                         |
| L               | character | Losses.                                       |
| W_PCT           | character | Wins percentage (0-1 decimal).                |
| MIN             | character | Minutes played.                               |
| FGM             | character | Field goals made.                             |
| FGA             | character | Field goal attempts.                          |
| FG_PCT          | character | Field goal percentage (0-1).                  |
| FG3M            | character | Three-point field goals made.                 |
| FG3A            | character | Three-point field goal attempts.              |
| FG3_PCT         | character | Three-point field goal percentage (0-1).      |
| FTM             | character | Free throws made.                             |
| FTA             | character | Free throw attempts.                          |
| FT_PCT          | character | Free throw percentage (0-1).                  |
| OREB            | character | Offensive rebounds.                           |
| DREB            | character | Defensive rebounds.                           |
| REB             | character | Total rebounds.                               |
| AST             | character | Assists.                                      |
| TOV             | character | Turnovers.                                    |
| STL             | character | Steals.                                       |
| BLK             | character | Blocks.                                       |
| BLKA            | character |                                               |
| PF              | character | Personal fouls.                               |
| PFD             | character |                                               |
| PTS             | character | Points scored.                                |
| PLUS_MINUS      | character | Plus/minus point differential while on court. |
| GP_RANK         | character |                                               |
| W_RANK          | character |                                               |
| L_RANK          | character |                                               |
| W_PCT_RANK      | character |                                               |
| MIN_RANK        | character |                                               |
| FGM_RANK        | character |                                               |
| FGA_RANK        | character |                                               |
| FG_PCT_RANK     | character |                                               |
| FG3M_RANK       | character |                                               |
| FG3A_RANK       | character |                                               |
| FG3_PCT_RANK    | character |                                               |
| FTM_RANK        | character |                                               |
| FTA_RANK        | character |                                               |
| FT_PCT_RANK     | character |                                               |
| OREB_RANK       | character |                                               |
| DREB_RANK       | character |                                               |
| REB_RANK        | character |                                               |
| AST_RANK        | character |                                               |
| TOV_RANK        | character |                                               |
| STL_RANK        | character |                                               |
| BLK_RANK        | character |                                               |
| BLKA_RANK       | character |                                               |
| PF_RANK         | character |                                               |
| PFD_RANK        | character |                                               |
| PTS_RANK        | character |                                               |
| PLUS_MINUS_RANK | character |                                               |

**LocationTeamDashboard**

|                    |           |                                               |
|--------------------|-----------|-----------------------------------------------|
| col_name           | types     | description                                   |
| GROUP_SET          | character |                                               |
| GROUP_VALUE        | character |                                               |
| TEAM_GAME_LOCATION | character |                                               |
| GP                 | character | Games played.                                 |
| W                  | character | Wins.                                         |
| L                  | character | Losses.                                       |
| W_PCT              | character | Wins percentage (0-1 decimal).                |
| MIN                | character | Minutes played.                               |
| FGM                | character | Field goals made.                             |
| FGA                | character | Field goal attempts.                          |
| FG_PCT             | character | Field goal percentage (0-1).                  |
| FG3M               | character | Three-point field goals made.                 |
| FG3A               | character | Three-point field goal attempts.              |
| FG3_PCT            | character | Three-point field goal percentage (0-1).      |
| FTM                | character | Free throws made.                             |
| FTA                | character | Free throw attempts.                          |
| FT_PCT             | character | Free throw percentage (0-1).                  |
| OREB               | character | Offensive rebounds.                           |
| DREB               | character | Defensive rebounds.                           |
| REB                | character | Total rebounds.                               |
| AST                | character | Assists.                                      |
| TOV                | character | Turnovers.                                    |
| STL                | character | Steals.                                       |
| BLK                | character | Blocks.                                       |
| BLKA               | character |                                               |
| PF                 | character | Personal fouls.                               |
| PFD                | character |                                               |
| PTS                | character | Points scored.                                |
| PLUS_MINUS         | character | Plus/minus point differential while on court. |
| GP_RANK            | character |                                               |
| W_RANK             | character |                                               |
| L_RANK             | character |                                               |
| W_PCT_RANK         | character |                                               |
| MIN_RANK           | character |                                               |
| FGM_RANK           | character |                                               |
| FGA_RANK           | character |                                               |
| FG_PCT_RANK        | character |                                               |
| FG3M_RANK          | character |                                               |
| FG3A_RANK          | character |                                               |
| FG3_PCT_RANK       | character |                                               |
| FTM_RANK           | character |                                               |
| FTA_RANK           | character |                                               |
| FT_PCT_RANK        | character |                                               |
| OREB_RANK          | character |                                               |
| DREB_RANK          | character |                                               |
| REB_RANK           | character |                                               |
| AST_RANK           | character |                                               |
| TOV_RANK           | character |                                               |
| STL_RANK           | character |                                               |
| BLK_RANK           | character |                                               |
| BLKA_RANK          | character |                                               |
| PF_RANK            | character |                                               |
| PFD_RANK           | character |                                               |
| PTS_RANK           | character |                                               |
| PLUS_MINUS_RANK    | character |                                               |

**WinsLossesTeamDashboard**

|                 |           |                                               |
|-----------------|-----------|-----------------------------------------------|
| col_name        | types     | description                                   |
| GROUP_SET       | character |                                               |
| GROUP_VALUE     | character |                                               |
| GAME_RESULT     | character |                                               |
| GP              | character | Games played.                                 |
| W               | character | Wins.                                         |
| L               | character | Losses.                                       |
| W_PCT           | character | Wins percentage (0-1 decimal).                |
| MIN             | character | Minutes played.                               |
| FGM             | character | Field goals made.                             |
| FGA             | character | Field goal attempts.                          |
| FG_PCT          | character | Field goal percentage (0-1).                  |
| FG3M            | character | Three-point field goals made.                 |
| FG3A            | character | Three-point field goal attempts.              |
| FG3_PCT         | character | Three-point field goal percentage (0-1).      |
| FTM             | character | Free throws made.                             |
| FTA             | character | Free throw attempts.                          |
| FT_PCT          | character | Free throw percentage (0-1).                  |
| OREB            | character | Offensive rebounds.                           |
| DREB            | character | Defensive rebounds.                           |
| REB             | character | Total rebounds.                               |
| AST             | character | Assists.                                      |
| TOV             | character | Turnovers.                                    |
| STL             | character | Steals.                                       |
| BLK             | character | Blocks.                                       |
| BLKA            | character |                                               |
| PF              | character | Personal fouls.                               |
| PFD             | character |                                               |
| PTS             | character | Points scored.                                |
| PLUS_MINUS      | character | Plus/minus point differential while on court. |
| GP_RANK         | character |                                               |
| W_RANK          | character |                                               |
| L_RANK          | character |                                               |
| W_PCT_RANK      | character |                                               |
| MIN_RANK        | character |                                               |
| FGM_RANK        | character |                                               |
| FGA_RANK        | character |                                               |
| FG_PCT_RANK     | character |                                               |
| FG3M_RANK       | character |                                               |
| FG3A_RANK       | character |                                               |
| FG3_PCT_RANK    | character |                                               |
| FTM_RANK        | character |                                               |
| FTA_RANK        | character |                                               |
| FT_PCT_RANK     | character |                                               |
| OREB_RANK       | character |                                               |
| DREB_RANK       | character |                                               |
| REB_RANK        | character |                                               |
| AST_RANK        | character |                                               |
| TOV_RANK        | character |                                               |
| STL_RANK        | character |                                               |
| BLK_RANK        | character |                                               |
| BLKA_RANK       | character |                                               |
| PF_RANK         | character |                                               |
| PFD_RANK        | character |                                               |
| PTS_RANK        | character |                                               |
| PLUS_MINUS_RANK | character |                                               |

**MonthTeamDashboard**

|                   |           |                                               |
|-------------------|-----------|-----------------------------------------------|
| col_name          | types     | description                                   |
| GROUP_SET         | character |                                               |
| GROUP_VALUE       | character |                                               |
| SEASON_MONTH_NAME | character |                                               |
| GP                | character | Games played.                                 |
| W                 | character | Wins.                                         |
| L                 | character | Losses.                                       |
| W_PCT             | character | Wins percentage (0-1 decimal).                |
| MIN               | character | Minutes played.                               |
| FGM               | character | Field goals made.                             |
| FGA               | character | Field goal attempts.                          |
| FG_PCT            | character | Field goal percentage (0-1).                  |
| FG3M              | character | Three-point field goals made.                 |
| FG3A              | character | Three-point field goal attempts.              |
| FG3_PCT           | character | Three-point field goal percentage (0-1).      |
| FTM               | character | Free throws made.                             |
| FTA               | character | Free throw attempts.                          |
| FT_PCT            | character | Free throw percentage (0-1).                  |
| OREB              | character | Offensive rebounds.                           |
| DREB              | character | Defensive rebounds.                           |
| REB               | character | Total rebounds.                               |
| AST               | character | Assists.                                      |
| TOV               | character | Turnovers.                                    |
| STL               | character | Steals.                                       |
| BLK               | character | Blocks.                                       |
| BLKA              | character |                                               |
| PF                | character | Personal fouls.                               |
| PFD               | character |                                               |
| PTS               | character | Points scored.                                |
| PLUS_MINUS        | character | Plus/minus point differential while on court. |
| GP_RANK           | character |                                               |
| W_RANK            | character |                                               |
| L_RANK            | character |                                               |
| W_PCT_RANK        | character |                                               |
| MIN_RANK          | character |                                               |
| FGM_RANK          | character |                                               |
| FGA_RANK          | character |                                               |
| FG_PCT_RANK       | character |                                               |
| FG3M_RANK         | character |                                               |
| FG3A_RANK         | character |                                               |
| FG3_PCT_RANK      | character |                                               |
| FTM_RANK          | character |                                               |
| FTA_RANK          | character |                                               |
| FT_PCT_RANK       | character |                                               |
| OREB_RANK         | character |                                               |
| DREB_RANK         | character |                                               |
| REB_RANK          | character |                                               |
| AST_RANK          | character |                                               |
| TOV_RANK          | character |                                               |
| STL_RANK          | character |                                               |
| BLK_RANK          | character |                                               |
| BLKA_RANK         | character |                                               |
| PF_RANK           | character |                                               |
| PFD_RANK          | character |                                               |
| PTS_RANK          | character |                                               |
| PLUS_MINUS_RANK   | character |                                               |

**PrePostAllStarTeamDashboard**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GROUP_SET | character |  |
| GROUP_VALUE | character |  |
| SEASON_SEGMENT | character | Season segment filter ('Pre All-Star' / 'Post All-Star'). |
| GP | character | Games played. |
| W | character | Wins. |
| L | character | Losses. |
| W_PCT | character | Wins percentage (0-1 decimal). |
| MIN | character | Minutes played. |
| FGM | character | Field goals made. |
| FGA | character | Field goal attempts. |
| FG_PCT | character | Field goal percentage (0-1). |
| FG3M | character | Three-point field goals made. |
| FG3A | character | Three-point field goal attempts. |
| FG3_PCT | character | Three-point field goal percentage (0-1). |
| FTM | character | Free throws made. |
| FTA | character | Free throw attempts. |
| FT_PCT | character | Free throw percentage (0-1). |
| OREB | character | Offensive rebounds. |
| DREB | character | Defensive rebounds. |
| REB | character | Total rebounds. |
| AST | character | Assists. |
| TOV | character | Turnovers. |
| STL | character | Steals. |
| BLK | character | Blocks. |
| BLKA | character |  |
| PF | character | Personal fouls. |
| PFD | character |  |
| PTS | character | Points scored. |
| PLUS_MINUS | character | Plus/minus point differential while on court. |
| GP_RANK | character |  |
| W_RANK | character |  |
| L_RANK | character |  |
| W_PCT_RANK | character |  |
| MIN_RANK | character |  |
| FGM_RANK | character |  |
| FGA_RANK | character |  |
| FG_PCT_RANK | character |  |
| FG3M_RANK | character |  |
| FG3A_RANK | character |  |
| FG3_PCT_RANK | character |  |
| FTM_RANK | character |  |
| FTA_RANK | character |  |
| FT_PCT_RANK | character |  |
| OREB_RANK | character |  |
| DREB_RANK | character |  |
| REB_RANK | character |  |
| AST_RANK | character |  |
| TOV_RANK | character |  |
| STL_RANK | character |  |
| BLK_RANK | character |  |
| BLKA_RANK | character |  |
| PF_RANK | character |  |
| PFD_RANK | character |  |
| PTS_RANK | character |  |
| PLUS_MINUS_RANK | character |  |

**DaysRestTeamDashboard**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GROUP_SET | character |  |
| GROUP_VALUE | character |  |
| TEAM_DAYS_REST_RANGE | character |  |
| GP | character | Games played. |
| W | character | Wins. |
| L | character | Losses. |
| W_PCT | character | Wins percentage (0-1 decimal). |
| MIN | character | Minutes played. |
| FGM | character | Field goals made. |
| FGA | character | Field goal attempts. |
| FG_PCT | character | Field goal percentage (0-1). |
| FG3M | character | Three-point field goals made. |
| FG3A | character | Three-point field goal attempts. |
| FG3_PCT | character | Three-point field goal percentage (0-1). |
| FTM | character | Free throws made. |
| FTA | character | Free throw attempts. |
| FT_PCT | character | Free throw percentage (0-1). |
| OREB | character | Offensive rebounds. |
| DREB | character | Defensive rebounds. |
| REB | character | Total rebounds. |
| AST | character | Assists. |
| TOV | character | Turnovers. |
| STL | character | Steals. |
| BLK | character | Blocks. |
| BLKA | character |  |
| PF | character | Personal fouls. |
| PFD | character |  |
| PTS | character | Points scored. |
| PLUS_MINUS | character | Plus/minus point differential while on court. |
| GP_RANK | character |  |
| W_RANK | character |  |
| L_RANK | character |  |
| W_PCT_RANK | character |  |
| MIN_RANK | character |  |
| FGM_RANK | character |  |
| FGA_RANK | character |  |
| FG_PCT_RANK | character |  |
| FG3M_RANK | character |  |
| FG3A_RANK | character |  |
| FG3_PCT_RANK | character |  |
| FTM_RANK | character |  |
| FTA_RANK | character |  |
| FT_PCT_RANK | character |  |
| OREB_RANK | character |  |
| DREB_RANK | character |  |
| REB_RANK | character |  |
| AST_RANK | character |  |
| TOV_RANK | character |  |
| STL_RANK | character |  |
| BLK_RANK | character |  |
| BLKA_RANK | character |  |
| PF_RANK | character |  |
| PFD_RANK | character |  |
| PTS_RANK | character |  |
| PLUS_MINUS_RANK | character |  |

## Details

      wnba_teamdashboardbygeneralsplits(team_id = '1611661328', season = most_recent_wnba_season())

## See also

Other WNBA Team Functions:
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md),
[`wnba_teamdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbygamesplits.md),
[`wnba_teamdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbylastngames.md),
[`wnba_teamdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyopponent.md),
[`wnba_teamdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyshootingsplits.md),
[`wnba_teamdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyteamperformance.md),
[`wnba_teamdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyyearoveryear.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md),
[`wnba_teamdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdetails.md),
[`wnba_teamestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_teamestimatedmetrics.md),
[`wnba_teamgamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelog.md),
[`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md),
[`wnba_teamgamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamestreakfinder.md),
[`wnba_teamhistoricalleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_teamhistoricalleaders.md),
[`wnba_teaminfocommon()`](https://wehoop.sportsdataverse.org/reference/wnba_teaminfocommon.md),
[`wnba_teamplayerdashboard()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md),
[`wnba_teamplayeronoffdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffdetails.md),
[`wnba_teamplayeronoffsummary()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffsummary.md),
[`wnba_teams()`](https://wehoop.sportsdataverse.org/reference/wnba_teams.md),
[`wnba_teamvsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_teamvsplayer.md),
[`wnba_teamyearbyyearstats()`](https://wehoop.sportsdataverse.org/reference/wnba_teamyearbyyearstats.md)

## Author

Saiem Gilani

# **Get WNBA Stats API Player Dashboard by Clutch Splits**

**Get WNBA Stats API Player Dashboard by Clutch Splits**

**Get WNBA Stats API Player Dashboard by Clutch Splits**

**Get WNBA Stats API Player Dashboard by Game Splits**

**Get WNBA Stats API Player Dashboard by General Splits**

**Get WNBA Stats API Player Dashboard by Last N Games**

**Get WNBA Stats API Player Dashboard by Opponent**

**Get WNBA Stats API Player Dashboard by Shooting Splits**

**Get WNBA Stats API Player Dashboard by Team Performance**

**Get WNBA Stats API Player Dashboard Year over Year**

## Usage

``` r
wnba_playerdashboardbyclutch(
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

wnba_playerdashboardbygamesplits(
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

wnba_playerdashboardbygeneralsplits(
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

wnba_playerdashboardbylastngames(
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

wnba_playerdashboardbyopponent(
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

wnba_playerdashboardbyteamperformance(
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

wnba_playerdashboardbyyearoveryear(
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

Return a named list of data frames: Last10Sec3Point2PlayerDashboard,
Last10Sec3PointPlayerDashboard, Last1Min5PointPlayerDashboard,
Last1MinPlusMinus5PointPlayerDashboard, Last30Sec3Point2PlayerDashboard,
Last30Sec3PointPlayerDashboard, Last3Min5PointPlayerDashboard,
Last3MinPlusMinus5PointPlayerDashboard, Last5Min5PointPlayerDashboard,
Last5MinPlusMinus5PointPlayerDashboard, OverallPlayerDashboard

**OverallPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last5Min5PointPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last3Min5PointPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last1Min5PointPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last30Sec3PointPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last10Sec3PointPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last5MinPlusMinus5PointPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last3MinPlusMinus5PointPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last1MinPlusMinus5PointPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last30Sec3Point2PlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last10Sec3Point2PlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

Return a named list of data frames: ByActualMarginPlayerDashboard,
ByHalfPlayerDashboard, ByPeriodPlayerDashboard,
ByScoreMarginPlayerDashboard, OverallPlayerDashboard

**OverallPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**ByHalfPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**ByPeriodPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**ByScoreMarginPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**ByActualMarginPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

Return a named list of data frames: DaysRestPlayerDashboard,
LocationPlayerDashboard, MonthPlayerDashboard, OverallPlayerDashboard,
PrePostAllStarPlayerDashboard, StartingPosition,
WinsLossesPlayerDashboard

**OverallPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**LocationPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**WinsLossesPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**MonthPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**PrePostAllStarPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**StartingPosition**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**DaysRestPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

Return a named list of data frames: GameNumberPlayerDashboard,
Last10PlayerDashboard, Last15PlayerDashboard, Last20PlayerDashboard,
Last5PlayerDashboard, OverallPlayerDashboard

**OverallPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last5PlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last10PlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last15PlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**Last20PlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**GameNumberPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

Return a named list of data frames: ConferencePlayerDashboard,
DivisionPlayerDashboard, OpponentPlayerDashboard, OverallPlayerDashboard

**OverallPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**ConferencePlayerDashboard**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GROUP_SET | character |  |
| GROUP_VALUE | character |  |
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
| NBA_FANTASY_PTS | character |  |
| DD2 | character |  |
| TD3 | character |  |
| WNBA_FANTASY_PTS | character |  |
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
| WBA_FANTASY_PTS_RANK | character |  |
| DD2_RANK | character |  |
| TD3_RANK | character |  |
| WNBA_FANTASY_PTS_RANK | character |  |

**DivisionPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**OpponentPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

Return a named list of data frames: AssistedBy,
AssitedShotPlayerDashboard, OverallPlayerDashboard,
Shot5FTPlayerDashboard, Shot8FTPlayerDashboard, ShotAreaPlayerDashboard,
ShotTypePlayerDashboard, ShotTypeSummaryPlayerDashboard

**OverallPlayerDashboard**

Columns as documented in the shared
[wnba_shooting_splits_schema](https://wehoop.sportsdataverse.org/reference/wnba_shooting_splits_schema.md)
table.

**Shot5FTPlayerDashboard**

Columns as documented in the shared
[wnba_shooting_splits_schema](https://wehoop.sportsdataverse.org/reference/wnba_shooting_splits_schema.md)
table.

**Shot8FTPlayerDashboard**

Columns as documented in the shared
[wnba_shooting_splits_schema](https://wehoop.sportsdataverse.org/reference/wnba_shooting_splits_schema.md)
table.

**ShotAreaPlayerDashboard**

Columns as documented in the shared
[wnba_shooting_splits_schema](https://wehoop.sportsdataverse.org/reference/wnba_shooting_splits_schema.md)
table.

**AssitedShotPlayerDashboard**

Columns as documented in the shared
[wnba_shooting_splits_schema](https://wehoop.sportsdataverse.org/reference/wnba_shooting_splits_schema.md)
table.

**ShotTypeSummaryPlayerDashboard**

|              |           |                                          |
|--------------|-----------|------------------------------------------|
| col_name     | types     | description                              |
| GROUP_SET    | character |                                          |
| GROUP_VALUE  | character |                                          |
| FGM          | character | Field goals made.                        |
| FGA          | character | Field goal attempts.                     |
| FG_PCT       | character | Field goal percentage (0-1).             |
| FG3M         | character | Three-point field goals made.            |
| FG3A         | character | Three-point field goal attempts.         |
| FG3_PCT      | character | Three-point field goal percentage (0-1). |
| EFG_PCT      | character | Effective field goal percentage (0-1).   |
| BLKA         | character |                                          |
| PCT_AST_2PM  | character |                                          |
| PCT_UAST_2PM | character |                                          |
| PCT_AST_3PM  | character |                                          |
| PCT_UAST_3PM | character |                                          |
| PCT_AST_FGM  | character |                                          |
| PCT_UAST_FGM | character |                                          |

**ShotTypePlayerDashboard**

Columns as documented in the shared
[wnba_shooting_splits_schema](https://wehoop.sportsdataverse.org/reference/wnba_shooting_splits_schema.md)
table.

**AssistedBy**

Columns as documented in the shared
[wnba_shooting_splits_assisted_by_schema](https://wehoop.sportsdataverse.org/reference/wnba_shooting_splits_assisted_by_schema.md)
table.

Return a named list of data frames: OverallPlayerDashboard,
PointsScoredPlayerDashboard, PointsAgainstPlayerDashboard,
ScoreDifferentialPlayerDashboard

**OverallPlayerDashboard**

Columns as documented in the shared
[wnba_player_dashboard_schema](https://wehoop.sportsdataverse.org/reference/wnba_player_dashboard_schema.md)
table.

**ScoreDifferentialPlayerDashboard**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GROUP_SET | character |  |
| GROUP_VALUE_ORDER | character |  |
| GROUP_VALUE | character |  |
| GROUP_VALUE_2 | character |  |
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
| NBA_FANTASY_PTS | character |  |
| DD2 | character |  |
| TD3 | character |  |
| WNBA_FANTASY_PTS | character |  |
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
| NBA_FANTASY_PTS_RANK | character |  |
| DD2_RANK | character |  |
| TD3_RANK | character |  |
| WNBA_FANTASY_PTS_RANK | character |  |

**PointsScoredPlayerDashboard**

Same columns as the **ScoreDifferentialPlayerDashboard** table above.

**PontsAgainstPlayerDashboard**

Same columns as the **ScoreDifferentialPlayerDashboard** table above.

Return a named list of data frames: ByYearPlayerDashboard,
OverallPlayerDashboard

**OverallPlayerDashboard**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GROUP_SET | character |  |
| GROUP_VALUE | character |  |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| MAX_GAME_DATE | character |  |
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
| NBA_FANTASY_PTS | character |  |
| DD2 | character |  |
| TD3 | character |  |
| WNBA_FANTASY_PTS | character |  |
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
| NBA_FANTASY_PTS_RANK | character |  |
| DD2_RANK | character |  |
| TD3_RANK | character |  |
| WNBA_FANTASY_PTS_RANK | character |  |

**ByYearPlayerDashboard**

Same columns as the **OverallPlayerDashboard** table above.

## Details

     wnba_playerdashboardbyclutch(player_id = '1628932', season = most_recent_wnba_season() - 1)

     wnba_playerdashboardbygamesplits(player_id = '1628932', season = most_recent_wnba_season() - 1)

     wnba_playerdashboardbygeneralsplits(player_id = '1628932', season = most_recent_wnba_season() - 1)

     wnba_playerdashboardbylastngames(player_id = '1628932', season = most_recent_wnba_season() - 1)

     wnba_playerdashboardbyopponent(player_id = '1628932', season = most_recent_wnba_season() - 1)

     wnba_playerdashboardbyshootingsplits(player_id = '1628932', season = most_recent_wnba_season() - 1)

     wnba_playerdashboardbyteamperformance(player_id = '1628932', season = most_recent_wnba_season() - 1)

     wnba_playerdashboardbyyearoveryear(player_id = '1628932', season = most_recent_wnba_season() - 1)

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

Other WNBA Clutch Functions:
[`wnba_leaguedashteamclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamclutch.md),
[`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)

Other WNBA Shooting Functions:
[`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md),
[`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md),
[`wnba_shotchartdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartdetail.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md),
[`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)

## Author

Saiem Gilani

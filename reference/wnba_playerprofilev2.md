# **Get WNBA Stats API Player Profile V2**

**Get WNBA Stats API Player Profile V2**

**Get WNBA Stats API Player Profile V2**

## Usage

``` r
wnba_playerprofilev2(
  league_id = "10",
  per_mode = "Totals",
  player_id = "1628932",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WWNBA, '20':
  G-League

- per_mode:

  Season - format 2020-21

- player_id:

  Player ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: CareerHighs,
CareerTotalsAllStarSeason, CareerTotalsCollegeSeason,
CareerTotalsPostSeason, CareerTotalsPreseason,
CareerTotalsRegularSeason, NextGame, SeasonHighs,
SeasonRankingsPostSeason, SeasonRankingsRegularSeason,
SeasonTotalsAllStarSeason, SeasonTotalsCollegeSeason,
SeasonTotalsPostSeason, SeasonTotalsPreseason, SeasonTotalsRegularSeason

**SeasonTotalsRegularSeason**

|                   |           |                                          |
|-------------------|-----------|------------------------------------------|
| col_name          | types     | description                              |
| PLAYER_ID         | character | Unique player identifier.                |
| SEASON_ID         | character | Unique season identifier.                |
| LEAGUE_ID         | character | League identifier ('10' = WNBA).         |
| TEAM_ID           | character | Unique team identifier.                  |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS').    |
| PLAYER_AGE        | character |                                          |
| GP                | character | Games played.                            |
| GS                | character | Games started.                           |
| MIN               | character | Minutes played.                          |
| FGM               | character | Field goals made.                        |
| FGA               | character | Field goal attempts.                     |
| FG_PCT            | character | Field goal percentage (0-1).             |
| FG3M              | character | Three-point field goals made.            |
| FG3A              | character | Three-point field goal attempts.         |
| FG3_PCT           | character | Three-point field goal percentage (0-1). |
| FTM               | character | Free throws made.                        |
| FTA               | character | Free throw attempts.                     |
| FT_PCT            | character | Free throw percentage (0-1).             |
| OREB              | character | Offensive rebounds.                      |
| DREB              | character | Defensive rebounds.                      |
| REB               | character | Total rebounds.                          |
| AST               | character | Assists.                                 |
| STL               | character | Steals.                                  |
| BLK               | character | Blocks.                                  |
| TOV               | character | Turnovers.                               |
| PF                | character | Personal fouls.                          |
| PTS               | character | Points scored.                           |

**CareerTotalsRegularSeason**

|           |           |                                          |
|-----------|-----------|------------------------------------------|
| col_name  | types     | description                              |
| PLAYER_ID | character | Unique player identifier.                |
| LEAGUE_ID | character | League identifier ('10' = WNBA).         |
| TEAM_ID   | character | Unique team identifier.                  |
| GP        | character | Games played.                            |
| GS        | character | Games started.                           |
| MIN       | character | Minutes played.                          |
| FGM       | character | Field goals made.                        |
| FGA       | character | Field goal attempts.                     |
| FG_PCT    | character | Field goal percentage (0-1).             |
| FG3M      | character | Three-point field goals made.            |
| FG3A      | character | Three-point field goal attempts.         |
| FG3_PCT   | character | Three-point field goal percentage (0-1). |
| FTM       | character | Free throws made.                        |
| FTA       | character | Free throw attempts.                     |
| FT_PCT    | character | Free throw percentage (0-1).             |
| OREB      | character | Offensive rebounds.                      |
| DREB      | character | Defensive rebounds.                      |
| REB       | character | Total rebounds.                          |
| AST       | character | Assists.                                 |
| STL       | character | Steals.                                  |
| BLK       | character | Blocks.                                  |
| TOV       | character | Turnovers.                               |
| PF        | character | Personal fouls.                          |
| PTS       | character | Points scored.                           |

**SeasonTotalsPostSeason**

|                   |           |                                          |
|-------------------|-----------|------------------------------------------|
| col_name          | types     | description                              |
| PLAYER_ID         | character | Unique player identifier.                |
| SEASON_ID         | character | Unique season identifier.                |
| LEAGUE_ID         | character | League identifier ('10' = WNBA).         |
| TEAM_ID           | character | Unique team identifier.                  |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS').    |
| PLAYER_AGE        | character |                                          |
| GP                | character | Games played.                            |
| GS                | character | Games started.                           |
| MIN               | character | Minutes played.                          |
| FGM               | character | Field goals made.                        |
| FGA               | character | Field goal attempts.                     |
| FG_PCT            | character | Field goal percentage (0-1).             |
| FG3M              | character | Three-point field goals made.            |
| FG3A              | character | Three-point field goal attempts.         |
| FG3_PCT           | character | Three-point field goal percentage (0-1). |
| FTM               | character | Free throws made.                        |
| FTA               | character | Free throw attempts.                     |
| FT_PCT            | character | Free throw percentage (0-1).             |
| OREB              | character | Offensive rebounds.                      |
| DREB              | character | Defensive rebounds.                      |
| REB               | character | Total rebounds.                          |
| AST               | character | Assists.                                 |
| STL               | character | Steals.                                  |
| BLK               | character | Blocks.                                  |
| TOV               | character | Turnovers.                               |
| PF                | character | Personal fouls.                          |
| PTS               | character | Points scored.                           |

**CareerTotalsPostSeason**

|           |           |                                          |
|-----------|-----------|------------------------------------------|
| col_name  | types     | description                              |
| PLAYER_ID | character | Unique player identifier.                |
| LEAGUE_ID | character | League identifier ('10' = WNBA).         |
| TEAM_ID   | character | Unique team identifier.                  |
| GP        | character | Games played.                            |
| GS        | character | Games started.                           |
| MIN       | character | Minutes played.                          |
| FGM       | character | Field goals made.                        |
| FGA       | character | Field goal attempts.                     |
| FG_PCT    | character | Field goal percentage (0-1).             |
| FG3M      | character | Three-point field goals made.            |
| FG3A      | character | Three-point field goal attempts.         |
| FG3_PCT   | character | Three-point field goal percentage (0-1). |
| FTM       | character | Free throws made.                        |
| FTA       | character | Free throw attempts.                     |
| FT_PCT    | character | Free throw percentage (0-1).             |
| OREB      | character | Offensive rebounds.                      |
| DREB      | character | Defensive rebounds.                      |
| REB       | character | Total rebounds.                          |
| AST       | character | Assists.                                 |
| STL       | character | Steals.                                  |
| BLK       | character | Blocks.                                  |
| TOV       | character | Turnovers.                               |
| PF        | character | Personal fouls.                          |
| PTS       | character | Points scored.                           |

**SeasonTotalsAllStarSeason**

|                   |           |                                          |
|-------------------|-----------|------------------------------------------|
| col_name          | types     | description                              |
| PLAYER_ID         | character | Unique player identifier.                |
| SEASON_ID         | character | Unique season identifier.                |
| LEAGUE_ID         | character | League identifier ('10' = WNBA).         |
| TEAM_ID           | character | Unique team identifier.                  |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS').    |
| PLAYER_AGE        | character |                                          |
| GP                | character | Games played.                            |
| GS                | character | Games started.                           |
| MIN               | character | Minutes played.                          |
| FGM               | character | Field goals made.                        |
| FGA               | character | Field goal attempts.                     |
| FG_PCT            | character | Field goal percentage (0-1).             |
| FG3M              | character | Three-point field goals made.            |
| FG3A              | character | Three-point field goal attempts.         |
| FG3_PCT           | character | Three-point field goal percentage (0-1). |
| FTM               | character | Free throws made.                        |
| FTA               | character | Free throw attempts.                     |
| FT_PCT            | character | Free throw percentage (0-1).             |
| OREB              | character | Offensive rebounds.                      |
| DREB              | character | Defensive rebounds.                      |
| REB               | character | Total rebounds.                          |
| AST               | character | Assists.                                 |
| STL               | character | Steals.                                  |
| BLK               | character | Blocks.                                  |
| TOV               | character | Turnovers.                               |
| PF                | character | Personal fouls.                          |
| PTS               | character | Points scored.                           |

**CareerTotalsAllStarSeason**

|           |           |                                          |
|-----------|-----------|------------------------------------------|
| col_name  | types     | description                              |
| PLAYER_ID | character | Unique player identifier.                |
| LEAGUE_ID | character | League identifier ('10' = WNBA).         |
| TEAM_ID   | character | Unique team identifier.                  |
| GP        | character | Games played.                            |
| GS        | character | Games started.                           |
| MIN       | character | Minutes played.                          |
| FGM       | character | Field goals made.                        |
| FGA       | character | Field goal attempts.                     |
| FG_PCT    | character | Field goal percentage (0-1).             |
| FG3M      | character | Three-point field goals made.            |
| FG3A      | character | Three-point field goal attempts.         |
| FG3_PCT   | character | Three-point field goal percentage (0-1). |
| FTM       | character | Free throws made.                        |
| FTA       | character | Free throw attempts.                     |
| FT_PCT    | character | Free throw percentage (0-1).             |
| OREB      | character | Offensive rebounds.                      |
| DREB      | character | Defensive rebounds.                      |
| REB       | character | Total rebounds.                          |
| AST       | character | Assists.                                 |
| STL       | character | Steals.                                  |
| BLK       | character | Blocks.                                  |
| TOV       | character | Turnovers.                               |
| PF        | character | Personal fouls.                          |
| PTS       | character | Points scored.                           |

**SeasonTotalsCollegeSeason**

**CareerTotalsCollegeSeason**

**SeasonTotalsPreseason**

|                   |           |                                          |
|-------------------|-----------|------------------------------------------|
| col_name          | types     | description                              |
| PLAYER_ID         | character | Unique player identifier.                |
| SEASON_ID         | character | Unique season identifier.                |
| LEAGUE_ID         | character | League identifier ('10' = WNBA).         |
| TEAM_ID           | character | Unique team identifier.                  |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS').    |
| PLAYER_AGE        | character |                                          |
| GP                | character | Games played.                            |
| GS                | character | Games started.                           |
| MIN               | character | Minutes played.                          |
| FGM               | character | Field goals made.                        |
| FGA               | character | Field goal attempts.                     |
| FG_PCT            | character | Field goal percentage (0-1).             |
| FG3M              | character | Three-point field goals made.            |
| FG3A              | character | Three-point field goal attempts.         |
| FG3_PCT           | character | Three-point field goal percentage (0-1). |
| FTM               | character | Free throws made.                        |
| FTA               | character | Free throw attempts.                     |
| FT_PCT            | character | Free throw percentage (0-1).             |
| OREB              | character | Offensive rebounds.                      |
| DREB              | character | Defensive rebounds.                      |
| REB               | character | Total rebounds.                          |
| AST               | character | Assists.                                 |
| STL               | character | Steals.                                  |
| BLK               | character | Blocks.                                  |
| TOV               | character | Turnovers.                               |
| PF                | character | Personal fouls.                          |
| PTS               | character | Points scored.                           |

**CareerTotalsPreseason**

|           |           |                                          |
|-----------|-----------|------------------------------------------|
| col_name  | types     | description                              |
| PLAYER_ID | character | Unique player identifier.                |
| LEAGUE_ID | character | League identifier ('10' = WNBA).         |
| TEAM_ID   | character | Unique team identifier.                  |
| GP        | character | Games played.                            |
| GS        | character | Games started.                           |
| MIN       | character | Minutes played.                          |
| FGM       | character | Field goals made.                        |
| FGA       | character | Field goal attempts.                     |
| FG_PCT    | character | Field goal percentage (0-1).             |
| FG3M      | character | Three-point field goals made.            |
| FG3A      | character | Three-point field goal attempts.         |
| FG3_PCT   | character | Three-point field goal percentage (0-1). |
| FTM       | character | Free throws made.                        |
| FTA       | character | Free throw attempts.                     |
| FT_PCT    | character | Free throw percentage (0-1).             |
| OREB      | character | Offensive rebounds.                      |
| DREB      | character | Defensive rebounds.                      |
| REB       | character | Total rebounds.                          |
| AST       | character | Assists.                                 |
| STL       | character | Steals.                                  |
| BLK       | character | Blocks.                                  |
| TOV       | character | Turnovers.                               |
| PF        | character | Personal fouls.                          |
| PTS       | character | Points scored.                           |

**SeasonRankingsRegularSeason**

|                   |           |                                       |
|-------------------|-----------|---------------------------------------|
| col_name          | types     | description                           |
| PLAYER_ID         | character | Unique player identifier.             |
| SEASON_ID         | character | Unique season identifier.             |
| LEAGUE_ID         | character | League identifier ('10' = WNBA).      |
| TEAM_ID           | character | Unique team identifier.               |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| PLAYER_AGE        | character |                                       |
| GP                | character | Games played.                         |
| GS                | character | Games started.                        |
| RANK_MIN          | character |                                       |
| RANK_FGM          | character |                                       |
| RANK_FGA          | character |                                       |
| RANK_FG_PCT       | character |                                       |
| RANK_FG3M         | character |                                       |
| RANK_FG3A         | character |                                       |
| RANK_FG3_PCT      | character |                                       |
| RANK_FTM          | character |                                       |
| RANK_FTA          | character |                                       |
| RANK_FT_PCT       | character |                                       |
| RANK_OREB         | character |                                       |
| RANK_DREB         | character |                                       |
| RANK_REB          | character |                                       |
| RANK_AST          | character |                                       |
| RANK_STL          | character |                                       |
| RANK_BLK          | character |                                       |
| RANK_TOV          | character |                                       |
| RANK_PTS          | character |                                       |
| RANK_EFF          | character |                                       |

**SeasonRankingsPostSeason**

|                   |           |                                       |
|-------------------|-----------|---------------------------------------|
| col_name          | types     | description                           |
| PLAYER_ID         | character | Unique player identifier.             |
| SEASON_ID         | character | Unique season identifier.             |
| LEAGUE_ID         | character | League identifier ('10' = WNBA).      |
| TEAM_ID           | character | Unique team identifier.               |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| PLAYER_AGE        | character |                                       |
| GP                | character | Games played.                         |
| GS                | character | Games started.                        |
| RANK_MIN          | character |                                       |
| RANK_FGM          | character |                                       |
| RANK_FGA          | character |                                       |
| RANK_FG_PCT       | character |                                       |
| RANK_FG3M         | character |                                       |
| RANK_FG3A         | character |                                       |
| RANK_FG3_PCT      | character |                                       |
| RANK_FTM          | character |                                       |
| RANK_FTA          | character |                                       |
| RANK_FT_PCT       | character |                                       |
| RANK_OREB         | character |                                       |
| RANK_DREB         | character |                                       |
| RANK_REB          | character |                                       |
| RANK_AST          | character |                                       |
| RANK_STL          | character |                                       |
| RANK_BLK          | character |                                       |
| RANK_TOV          | character |                                       |
| RANK_PTS          | character |                                       |
| RANK_EFF          | character |                                       |

**SeasonHighs**

|                      |           |                           |
|----------------------|-----------|---------------------------|
| col_name             | types     | description               |
| PLAYER_ID            | character | Unique player identifier. |
| GAME_ID              | character | Unique game identifier.   |
| GAME_DATE            | character | Game date (YYYY-MM-DD).   |
| VS_TEAM_ID           | character |                           |
| VS_TEAM_CITY         | character |                           |
| VS_TEAM_NAME         | character |                           |
| VS_TEAM_ABBREVIATION | character |                           |
| STAT                 | character |                           |
| STAT_VALUE           | character | Stat value.               |
| STAT_ORDER           | character |                           |
| DATE_EST             | character |                           |

**CareerHighs**

|                      |           |                           |
|----------------------|-----------|---------------------------|
| col_name             | types     | description               |
| PLAYER_ID            | character | Unique player identifier. |
| GAME_ID              | character | Unique game identifier.   |
| GAME_DATE            | character | Game date (YYYY-MM-DD).   |
| VS_TEAM_ID           | character |                           |
| VS_TEAM_CITY         | character |                           |
| VS_TEAM_NAME         | character |                           |
| VS_TEAM_ABBREVIATION | character |                           |
| STAT                 | character |                           |
| STAT_VALUE           | character | Stat value.               |
| STAT_ORDER           | character |                           |
| DATE_EST             | character |                           |

**NextGame**

|                          |           |                                  |
|--------------------------|-----------|----------------------------------|
| col_name                 | types     | description                      |
| GAME_ID                  | character | Unique game identifier.          |
| GAME_DATE                | character | Game date (YYYY-MM-DD).          |
| GAME_TIME                | character | Game start time.                 |
| LOCATION                 | character | Filter results by game location. |
| PLAYER_TEAM_ID           | character |                                  |
| PLAYER_TEAM_CITY         | character |                                  |
| PLAYER_TEAM_NICKNAME     | character |                                  |
| PLAYER_TEAM_ABBREVIATION | character |                                  |
| VS_TEAM_ID               | character |                                  |
| VS_TEAM_CITY             | character |                                  |
| VS_TEAM_NICKNAME         | character |                                  |
| VS_TEAM_ABBREVIATION     | character |                                  |

## Details

      wnba_playerprofilev2(player_id = '1628932')

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
[`wnba_playervsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_playervsplayer.md)

## Author

Saiem Gilani

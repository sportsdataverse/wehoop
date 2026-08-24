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

Columns as documented in the shared
[wnba_playercareerstats_season_totals_schema](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats_season_totals_schema.md)
table.

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

Columns as documented in the shared
[wnba_playercareerstats_season_totals_schema](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats_season_totals_schema.md)
table.

**CareerTotalsPostSeason**

Same columns as the **CareerTotalsRegularSeason** table above.

**SeasonTotalsAllStarSeason**

Columns as documented in the shared
[wnba_playercareerstats_season_totals_schema](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats_season_totals_schema.md)
table.

**CareerTotalsAllStarSeason**

Same columns as the **CareerTotalsRegularSeason** table above.

**SeasonTotalsCollegeSeason**

**CareerTotalsCollegeSeason**

**SeasonTotalsPreseason**

Columns as documented in the shared
[wnba_playercareerstats_season_totals_schema](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats_season_totals_schema.md)
table.

**CareerTotalsPreseason**

Same columns as the **CareerTotalsRegularSeason** table above.

**SeasonRankingsRegularSeason**

Columns as documented in the shared
[wnba_playercareerstats_season_rankings_schema](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats_season_rankings_schema.md)
table.

**SeasonRankingsPostSeason**

Columns as documented in the shared
[wnba_playercareerstats_season_rankings_schema](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats_season_rankings_schema.md)
table.

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

Same columns as the **SeasonHighs** table above.

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
[`wnba_playerindex()`](https://wehoop.sportsdataverse.org/reference/wnba_playerindex.md),
[`wnba_playernextngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playernextngames.md),
[`wnba_playervsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_playervsplayer.md)

## Author

Saiem Gilani

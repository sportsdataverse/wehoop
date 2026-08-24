# **Get WNBA Stats API Game Rotation**

**Get WNBA Stats API Game Rotation**

**Get WNBA Stats API Game Rotation**

## Usage

``` r
wnba_gamerotation(game_id, league_id = "10", rotation_stat = "PLAYER_PTS", ...)
```

## Arguments

- game_id:

  Game ID

- league_id:

  League ID

- rotation_stat:

  Rotation stat to provide details on: PLAYER_PTS, PT_DIFF, USG_PCT

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: AwayTeam, HomeTeam

**AwayTeam**

|               |           |                                                 |
|---------------|-----------|-------------------------------------------------|
| col_name      | types     | description                                     |
| GAME_ID       | character | Unique game identifier.                         |
| TEAM_ID       | character | Unique team identifier.                         |
| TEAM_CITY     | character | Team city or region (e.g. 'Las Vegas').         |
| TEAM_NAME     | character | Full team display name (e.g. 'Las Vegas Aces'). |
| PERSON_ID     | character | Unique player identifier (V3 endpoints).        |
| PLAYER_FIRST  | character |                                                 |
| PLAYER_LAST   | character |                                                 |
| IN_TIME_REAL  | character |                                                 |
| OUT_TIME_REAL | character |                                                 |
| PLAYER_PTS    | character |                                                 |
| PT_DIFF       | character |                                                 |
| USG_PCT       | character | Usage percentage (0-1).                         |

**HomeTeam**

Same columns as the **AwayTeam** table above.

## Details

      wnba_gamerotation(game_id = "1022200034")

## See also

Other WNBA Boxscore Functions:
[`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md),
[`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md)

Other WNBA Lineup Functions:
[`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_possession_lineups()`](https://wehoop.sportsdataverse.org/reference/wnba_possession_lineups.md),
[`wnba_rapm()`](https://wehoop.sportsdataverse.org/reference/wnba_rapm.md),
[`wnba_shot_zones()`](https://wehoop.sportsdataverse.org/reference/wnba_shot_zones.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md)

## Author

Saiem Gilani

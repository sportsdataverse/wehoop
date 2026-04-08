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

|               |           |
|---------------|-----------|
| col_name      | types     |
| GAME_ID       | character |
| TEAM_ID       | character |
| TEAM_CITY     | character |
| TEAM_NAME     | character |
| PERSON_ID     | character |
| PLAYER_FIRST  | character |
| PLAYER_LAST   | character |
| IN_TIME_REAL  | character |
| OUT_TIME_REAL | character |
| PLAYER_PTS    | character |
| PT_DIFF       | character |
| USG_PCT       | character |

**HomeTeam**

|               |           |
|---------------|-----------|
| col_name      | types     |
| GAME_ID       | character |
| TEAM_ID       | character |
| TEAM_CITY     | character |
| TEAM_NAME     | character |
| PERSON_ID     | character |
| PLAYER_FIRST  | character |
| PLAYER_LAST   | character |
| IN_TIME_REAL  | character |
| OUT_TIME_REAL | character |
| PLAYER_PTS    | character |
| PT_DIFF       | character |
| USG_PCT       | character |

## Details

      wnba_gamerotation(game_id = "1022200034")

## See also

Other WNBA Boxscore Functions:
[`wnba_boxscoreadvancedv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv2.md),
[`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv2.md),
[`wnba_boxscoremiscv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv2.md),
[`wnba_boxscoreplayertrackv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md),
[`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv2.md),
[`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2.md),
[`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_boxscoreusagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev2.md),
[`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_hustlestatsboxscore.md)

Other WNBA Lineup Functions:
[`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md)

## Author

Saiem Gilani

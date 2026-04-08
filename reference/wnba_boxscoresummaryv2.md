# **Get WNBA Stats API Boxscore Summary V2**

**Get WNBA Stats API Boxscore Summary V2**

**Get WNBA Stats API Boxscore Summary V2**

## Usage

``` r
wnba_boxscoresummaryv2(game_id, ...)
```

## Arguments

- game_id:

  Game ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: AvailableVideo, GameInfo,
GameSummary, InactivePlayers, LastMeeting, LineScore, Officials,
OtherStats, SeasonSeries

**GameSummary**

|                                  |           |
|----------------------------------|-----------|
| col_name                         | types     |
| GAME_DATE_EST                    | character |
| GAME_SEQUENCE                    | character |
| GAME_ID                          | character |
| GAME_STATUS_ID                   | character |
| GAME_STATUS_TEXT                 | character |
| GAMECODE                         | character |
| HOME_TEAM_ID                     | character |
| VISITOR_TEAM_ID                  | character |
| SEASON                           | character |
| LIVE_PERIOD                      | character |
| LIVE_PC_TIME                     | character |
| NATL_TV_BROADCASTER_ABBREVIATION | character |
| LIVE_PERIOD_TIME_BCAST           | character |
| WH_STATUS                        | character |

**OtherStats**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| LEAGUE_ID         | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_CITY         | character |
| PTS_PAINT         | character |
| PTS_2ND_CHANCE    | character |
| PTS_FB            | character |
| LARGEST_LEAD      | character |
| LEAD_CHANGES      | character |
| TIMES_TIED        | character |
| TEAM_TURNOVERS    | character |
| TOTAL_TURNOVERS   | character |
| TEAM_REBOUNDS     | character |
| PTS_OFF_TO        | character |

**Officials**

|             |           |
|-------------|-----------|
| col_name    | types     |
| OFFICIAL_ID | character |
| FIRST_NAME  | character |
| LAST_NAME   | character |
| JERSEY_NUM  | character |

**InactivePlayers**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| PLAYER_ID         | character |
| FIRST_NAME        | character |
| LAST_NAME         | character |
| JERSEY_NUM        | character |
| TEAM_ID           | character |
| TEAM_CITY         | character |
| TEAM_NAME         | character |
| TEAM_ABBREVIATION | character |

**GameInfo**

|            |           |
|------------|-----------|
| col_name   | types     |
| GAME_DATE  | character |
| ATTENDANCE | character |
| GAME_TIME  | character |

**LineScore**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| GAME_DATE_EST     | character |
| GAME_SEQUENCE     | character |
| GAME_ID           | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_CITY_NAME    | character |
| TEAM_NICKNAME     | character |
| TEAM_WINS_LOSSES  | character |
| PTS_QTR1          | character |
| PTS_QTR2          | character |
| PTS_QTR3          | character |
| PTS_QTR4          | character |
| PTS_OT1           | character |
| PTS_OT2           | character |
| PTS_OT3           | character |
| PTS_OT4           | character |
| PTS_OT5           | character |
| PTS_OT6           | character |
| PTS_OT7           | character |
| PTS_OT8           | character |
| PTS_OT9           | character |
| PTS_OT10          | character |
| PTS               | character |

**LastMeeting**

|                                  |           |
|----------------------------------|-----------|
| col_name                         | types     |
| GAME_ID                          | character |
| LAST_GAME_ID                     | character |
| LAST_GAME_DATE_EST               | character |
| LAST_GAME_HOME_TEAM_ID           | character |
| LAST_GAME_HOME_TEAM_CITY         | character |
| LAST_GAME_HOME_TEAM_NAME         | character |
| LAST_GAME_HOME_TEAM_ABBREVIATION | character |
| LAST_GAME_HOME_TEAM_POINTS       | character |
| LAST_GAME_VISITOR_TEAM_ID        | character |
| LAST_GAME_VISITOR_TEAM_CITY      | character |
| LAST_GAME_VISITOR_TEAM_NAME      | character |
| LAST_GAME_VISITOR_TEAM_CITY1     | character |
| LAST_GAME_VISITOR_TEAM_POINTS    | character |

**SeasonSeries**

|                  |           |
|------------------|-----------|
| col_name         | types     |
| GAME_ID          | character |
| HOME_TEAM_ID     | character |
| VISITOR_TEAM_ID  | character |
| GAME_DATE_EST    | character |
| HOME_TEAM_WINS   | character |
| HOME_TEAM_LOSSES | character |
| SERIES_LEADER    | character |

**AvailableVideo**

|                      |           |
|----------------------|-----------|
| col_name             | types     |
| GAME_ID              | character |
| VIDEO_AVAILABLE_FLAG | character |
| PT_AVAILABLE         | character |
| PT_XYZ_AVAILABLE     | character |
| WH_STATUS            | character |
| HUSTLE_STATUS        | character |
| HISTORICAL_STATUS    | character |

## Details

      wnba_boxscoresummaryv2(game_id = "1022200034")

## See also

Other WNBA Boxscore Functions:
[`wnba_boxscoreadvancedv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv2.md),
[`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv2.md),
[`wnba_boxscoremiscv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv2.md),
[`wnba_boxscoreplayertrackv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md),
[`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv2.md),
[`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_boxscoreusagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev2.md),
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_hustlestatsboxscore.md)

## Author

Saiem Gilani

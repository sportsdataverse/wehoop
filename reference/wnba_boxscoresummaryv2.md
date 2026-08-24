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

Columns as documented in the shared
[wnba_boxscoresummaryv2_game_summary_schema](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2_game_summary_schema.md)
table.

**OtherStats**

|  |  |  |
|----|----|----|
| col_name | types | description |
| LEAGUE_ID | character | League identifier ('10' = WNBA). |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_CITY | character | Team city or region (e.g. 'Las Vegas'). |
| PTS_PAINT | character | Points scored in the paint. |
| PTS_2ND_CHANCE | character |  |
| PTS_FB | character |  |
| LARGEST_LEAD | character | Largest lead during the game. |
| LEAD_CHANGES | character | Lead changes. |
| TIMES_TIED | character | Times tied. |
| TEAM_TURNOVERS | character | Team turnovers (turnovers credited to the team rather than a player). |
| TOTAL_TURNOVERS | character | Total turnovers (player + team). |
| TEAM_REBOUNDS | character | Team rebounds (rebounds credited to the team rather than a player). |
| PTS_OFF_TO | character |  |

**Officials**

|             |           |                                       |
|-------------|-----------|---------------------------------------|
| col_name    | types     | description                           |
| OFFICIAL_ID | character | Unique official / referee identifier. |
| FIRST_NAME  | character | Player's first name.                  |
| LAST_NAME   | character | Player's last name.                   |
| JERSEY_NUM  | character | Jersey number worn by the player.     |

**InactivePlayers**

|  |  |  |
|----|----|----|
| col_name | types | description |
| PLAYER_ID | character | Unique player identifier. |
| FIRST_NAME | character | Player's first name. |
| LAST_NAME | character | Player's last name. |
| JERSEY_NUM | character | Jersey number worn by the player. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_CITY | character | Team city or region (e.g. 'Las Vegas'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |

**GameInfo**

|            |           |                         |
|------------|-----------|-------------------------|
| col_name   | types     | description             |
| GAME_DATE  | character | Game date (YYYY-MM-DD). |
| ATTENDANCE | character | Reported attendance.    |
| GAME_TIME  | character | Game start time.        |

**LineScore**

|                   |           |                                       |
|-------------------|-----------|---------------------------------------|
| col_name          | types     | description                           |
| GAME_DATE_EST     | character | Game date est.                        |
| GAME_SEQUENCE     | character | Game sequence.                        |
| GAME_ID           | character | Unique game identifier.               |
| TEAM_ID           | character | Unique team identifier.               |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_CITY_NAME    | character | Team city name.                       |
| TEAM_NICKNAME     | character | Team nickname.                        |
| TEAM_WINS_LOSSES  | character | Team wins losses.                     |
| PTS_QTR1          | character | Pts qtr1.                             |
| PTS_QTR2          | character | Pts qtr2.                             |
| PTS_QTR3          | character | Pts qtr3.                             |
| PTS_QTR4          | character | Pts qtr4.                             |
| PTS_OT1           | character | Pts ot1.                              |
| PTS_OT2           | character |                                       |
| PTS_OT3           | character |                                       |
| PTS_OT4           | character |                                       |
| PTS_OT5           | character |                                       |
| PTS_OT6           | character |                                       |
| PTS_OT7           | character |                                       |
| PTS_OT8           | character |                                       |
| PTS_OT9           | character |                                       |
| PTS_OT10          | character |                                       |
| PTS               | character | Points scored.                        |

**LastMeeting**

Columns as documented in the shared
[wnba_boxscoresummaryv2_last_meeting_schema](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2_last_meeting_schema.md)
table.

**SeasonSeries**

Columns as documented in the shared
[wnba_boxscoresummaryv2_season_series_schema](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2_season_series_schema.md)
table.

**AvailableVideo**

|                      |           |                         |
|----------------------|-----------|-------------------------|
| col_name             | types     | description             |
| GAME_ID              | character | Unique game identifier. |
| VIDEO_AVAILABLE_FLAG | character | Video available flag.   |
| PT_AVAILABLE         | character |                         |
| PT_XYZ_AVAILABLE     | character |                         |
| WH_STATUS            | character | Wh status.              |
| HUSTLE_STATUS        | character |                         |
| HISTORICAL_STATUS    | character |                         |

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

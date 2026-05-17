# **Get WNBA Stats API Scoreboard**

**Get WNBA Stats API Scoreboard**

**Get WNBA Stats API Scoreboard**

## Usage

``` r
wnba_scoreboard(
  league_id = "10",
  game_date = "2022-07-20",
  day_offset = 0,
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WWNBA, '20':
  G-League

- game_date:

  Game Date, format: 2022/05/17

- day_offset:

  Day Offset (integer 0,-1)

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: Available, EastConfStandingsByDay,
GameHeader, LastMeeting, LineScore, SeriesStandings,
WestConfStandingsByDay

**GameHeader**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GAME_DATE_EST | character | Game date est. |
| GAME_SEQUENCE | character | Game sequence. |
| GAME_ID | character | Unique game identifier. |
| GAME_STATUS_ID | character | Numeric game status identifier. |
| GAME_STATUS_TEXT | character | Game status display text (e.g. 'Final', '4:32 - 4th'). |
| GAMECODE | character | Gamecode. |
| HOME_TEAM_ID | character | Unique identifier for the home team. |
| VISITOR_TEAM_ID | character | Unique identifier for visitor team. |
| SEASON | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| LIVE_PERIOD | character | Live period. |
| LIVE_PC_TIME | character | Time / clock value. |
| NATL_TV_BROADCASTER_ABBREVIATION | character | Natl tv broadcaster abbreviation. |
| LIVE_PERIOD_TIME_BCAST | character | Live period time bcast. |
| WH_STATUS | character | Wh status. |

**LineScore**

|                   |           |                                          |
|-------------------|-----------|------------------------------------------|
| col_name          | types     | description                              |
| GAME_DATE_EST     | character | Game date est.                           |
| GAME_SEQUENCE     | character | Game sequence.                           |
| GAME_ID           | character | Unique game identifier.                  |
| TEAM_ID           | character | Unique team identifier.                  |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS').    |
| TEAM_CITY_NAME    | character | Team city name.                          |
| TEAM_WINS_LOSSES  | character | Team wins losses.                        |
| PTS_QTR1          | character | Pts qtr1.                                |
| PTS_QTR2          | character | Pts qtr2.                                |
| PTS_QTR3          | character | Pts qtr3.                                |
| PTS_QTR4          | character | Pts qtr4.                                |
| PTS_OT1           | character | Pts ot1.                                 |
| PTS_OT2           | character |                                          |
| PTS_OT3           | character |                                          |
| PTS_OT4           | character |                                          |
| PTS_OT5           | character |                                          |
| PTS_OT6           | character |                                          |
| PTS_OT7           | character |                                          |
| PTS_OT8           | character |                                          |
| PTS_OT9           | character |                                          |
| PTS_OT10          | character |                                          |
| PTS               | character | Points scored.                           |
| FG_PCT            | character | Field goal percentage (0-1).             |
| FT_PCT            | character | Free throw percentage (0-1).             |
| FG3_PCT           | character | Three-point field goal percentage (0-1). |
| AST               | character | Assists.                                 |
| REB               | character | Total rebounds.                          |
| TOV               | character | Turnovers.                               |

**SeriesStandings**

|                  |           |                                      |
|------------------|-----------|--------------------------------------|
| col_name         | types     | description                          |
| GAME_ID          | character | Unique game identifier.              |
| HOME_TEAM_ID     | character | Unique identifier for the home team. |
| VISITOR_TEAM_ID  | character | Unique identifier for visitor team.  |
| GAME_DATE_EST    | character | Game date est.                       |
| HOME_TEAM_WINS   | character | Home team's team wins.               |
| HOME_TEAM_LOSSES | character | Home team's team losses.             |
| SERIES_LEADER    | character |                                      |

**LastMeeting**

|                                  |           |                         |
|----------------------------------|-----------|-------------------------|
| col_name                         | types     | description             |
| GAME_ID                          | character | Unique game identifier. |
| LAST_GAME_ID                     | character |                         |
| LAST_GAME_DATE_EST               | character |                         |
| LAST_GAME_HOME_TEAM_ID           | character |                         |
| LAST_GAME_HOME_TEAM_CITY         | character |                         |
| LAST_GAME_HOME_TEAM_NAME         | character |                         |
| LAST_GAME_HOME_TEAM_ABBREVIATION | character |                         |
| LAST_GAME_HOME_TEAM_POINTS       | character |                         |
| LAST_GAME_VISITOR_TEAM_ID        | character |                         |
| LAST_GAME_VISITOR_TEAM_CITY      | character |                         |
| LAST_GAME_VISITOR_TEAM_NAME      | character |                         |
| LAST_GAME_VISITOR_TEAM_CITY1     | character |                         |
| LAST_GAME_VISITOR_TEAM_POINTS    | character |                         |

**EastConfStandingsByDay**

|               |           |                                        |
|---------------|-----------|----------------------------------------|
| col_name      | types     | description                            |
| TEAM_ID       | character | Unique team identifier.                |
| LEAGUE_ID     | character | League identifier ('10' = WNBA).       |
| SEASON_ID     | character | Unique season identifier.              |
| STANDINGSDATE | character |                                        |
| CONFERENCE    | character | Filter players or teams by conference. |
| TEAM          | character | Team-side label or team identifier.    |
| G             | character | Games played.                          |
| W             | character | Wins.                                  |
| L             | character | Losses.                                |
| W_PCT         | character | Wins percentage (0-1 decimal).         |
| HOME_RECORD   | character | Home win-loss record.                  |
| ROAD_RECORD   | character | Win-loss record for road.              |

**WestConfStandingsByDay**

|               |           |                                        |
|---------------|-----------|----------------------------------------|
| col_name      | types     | description                            |
| TEAM_ID       | character | Unique team identifier.                |
| LEAGUE_ID     | character | League identifier ('10' = WNBA).       |
| SEASON_ID     | character | Unique season identifier.              |
| STANDINGSDATE | character |                                        |
| CONFERENCE    | character | Filter players or teams by conference. |
| TEAM          | character | Team-side label or team identifier.    |
| G             | character | Games played.                          |
| W             | character | Wins.                                  |
| L             | character | Losses.                                |
| W_PCT         | character | Wins percentage (0-1 decimal).         |
| HOME_RECORD   | character | Home win-loss record.                  |
| ROAD_RECORD   | character | Win-loss record for road.              |

**Available**

|              |           |                         |
|--------------|-----------|-------------------------|
| col_name     | types     | description             |
| GAME_ID      | character | Unique game identifier. |
| PT_AVAILABLE | character |                         |

## Details

     wnba_scoreboard(league_id = '10', game_date = '2022-07-20')

## Author

Saiem Gilani

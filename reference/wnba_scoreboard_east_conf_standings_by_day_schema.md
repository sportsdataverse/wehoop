# Shared column schema: wnba scoreboard east conf standings by day schema

Columns shared verbatim across: wnba_scoreboard, wnba_scoreboardv2.

## Details

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

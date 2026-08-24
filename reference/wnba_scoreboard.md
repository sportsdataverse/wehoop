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

Columns as documented in the shared
[wnba_boxscoresummaryv2_game_summary_schema](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2_game_summary_schema.md)
table.

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

Columns as documented in the shared
[wnba_boxscoresummaryv2_season_series_schema](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2_season_series_schema.md)
table.

**LastMeeting**

Columns as documented in the shared
[wnba_boxscoresummaryv2_last_meeting_schema](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2_last_meeting_schema.md)
table.

**EastConfStandingsByDay**

Columns as documented in the shared
[wnba_scoreboard_east_conf_standings_by_day_schema](https://wehoop.sportsdataverse.org/reference/wnba_scoreboard_east_conf_standings_by_day_schema.md)
table.

**WestConfStandingsByDay**

Columns as documented in the shared
[wnba_scoreboard_east_conf_standings_by_day_schema](https://wehoop.sportsdataverse.org/reference/wnba_scoreboard_east_conf_standings_by_day_schema.md)
table.

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

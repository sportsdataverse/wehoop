# **Get WNBA Stats API All-time Leaders Grid**

**Get WNBA Stats API All-time Leaders Grid**

**Get WNBA Stats API All-time Leaders Grid**

## Usage

``` r
wnba_alltimeleadersgrids(
  league_id = "10",
  per_mode = "PerGame",
  season_type = "Regular Season",
  top_x = 10,
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WWNBA, '20':
  G-League

- per_mode:

  Per Mode - PerGame, Totals

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- top_x:

  Top X

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: ASTLeaders, BLKLeaders,
DREBLeaders, FG3ALeaders, FG3MLeaders, FG3_PCTLeaders, FGALeaders,
FGMLeaders, FG_PCTLeaders, FTALeaders, FTMLeaders, FT_PCTLeaders,
GPLeaders, OREBLeaders, PFLeaders, PTSLeaders, REBLeaders, STLLeaders,
TOVLeaders

**GPLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| GP             | character | Games played.             |
| GP_RANK        | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**PTSLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| PTS            | character | Points scored.            |
| PTS_RANK       | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**ASTLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| AST            | character | Assists.                  |
| AST_RANK       | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**STLLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| STL            | character | Steals.                   |
| STL_RANK       | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**OREBLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| OREB           | character | Offensive rebounds.       |
| OREB_RANK      | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**DREBLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| DREB           | character | Defensive rebounds.       |
| DREB_RANK      | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**REBLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| REB            | character | Total rebounds.           |
| REB_RANK       | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**BLKLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| BLK            | character | Blocks.                   |
| BLK_RANK       | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**FGMLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| FGM            | character | Field goals made.         |
| FGM_RANK       | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**FGALeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| FGA            | character | Field goal attempts.      |
| FGA_RANK       | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**FG_PCTLeaders**

|                |           |                              |
|----------------|-----------|------------------------------|
| col_name       | types     | description                  |
| PLAYER_ID      | character | Unique player identifier.    |
| PLAYER_NAME    | character | Player name.                 |
| FG_PCT         | character | Field goal percentage (0-1). |
| FG_PCT_RANK    | character |                              |
| IS_ACTIVE_FLAG | character |                              |

**TOVLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| TOV            | character | Turnovers.                |
| TOV_RANK       | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**FG3MLeaders**

|                |           |                               |
|----------------|-----------|-------------------------------|
| col_name       | types     | description                   |
| PLAYER_ID      | character | Unique player identifier.     |
| PLAYER_NAME    | character | Player name.                  |
| FG3M           | character | Three-point field goals made. |
| FG3M_RANK      | character |                               |
| IS_ACTIVE_FLAG | character |                               |

**FG3ALeaders**

|                |           |                                  |
|----------------|-----------|----------------------------------|
| col_name       | types     | description                      |
| PLAYER_ID      | character | Unique player identifier.        |
| PLAYER_NAME    | character | Player name.                     |
| FG3A           | character | Three-point field goal attempts. |
| FG3A_RANK      | character |                                  |
| IS_ACTIVE_FLAG | character |                                  |

**FG3_PCTLeaders**

|                |           |                                          |
|----------------|-----------|------------------------------------------|
| col_name       | types     | description                              |
| PLAYER_ID      | character | Unique player identifier.                |
| PLAYER_NAME    | character | Player name.                             |
| FG3_PCT        | character | Three-point field goal percentage (0-1). |
| FG3_PCT_RANK   | character |                                          |
| IS_ACTIVE_FLAG | character |                                          |

**PFLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| PF             | character | Personal fouls.           |
| PF_RANK        | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**FTMLeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| FTM            | character | Free throws made.         |
| FTM_RANK       | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**FTALeaders**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| PLAYER_ID      | character | Unique player identifier. |
| PLAYER_NAME    | character | Player name.              |
| FTA            | character | Free throw attempts.      |
| FTA_RANK       | character |                           |
| IS_ACTIVE_FLAG | character |                           |

**FT_PCTLeaders**

|                |           |                              |
|----------------|-----------|------------------------------|
| col_name       | types     | description                  |
| PLAYER_ID      | character | Unique player identifier.    |
| PLAYER_NAME    | character | Player name.                 |
| FT_PCT         | character | Free throw percentage (0-1). |
| FT_PCT_RANK    | character |                              |
| IS_ACTIVE_FLAG | character |                              |

## Details

      wnba_alltimeleadersgrids(league_id = '10')

## See also

Other WNBA Leaders Functions:
[`wnba_assistleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_assistleaders.md),
[`wnba_assisttracker()`](https://wehoop.sportsdataverse.org/reference/wnba_assisttracker.md),
[`wnba_homepagewidget()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagewidget.md),
[`wnba_leagueleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueleaders.md)

## Author

Saiem Gilani

# **Get WNBA Stats API Homepage Widget Leaders**

**Get WNBA Stats API Homepage Widget Leaders**

**Get WNBA Stats API Homepage Widget Leaders**

## Usage

``` r
wnba_homepagewidget(player_or_team = "Player", ...)
```

## Arguments

- player_or_team:

  Player or Team

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns, for current season, a named list of data frames: PTS, REB, AST,
BLK, STL, FG_PCT, FG3M, FG3_PCT, FANTASY_POINTS, TOTAL_PTS, TOTAL_REB,
TOTAL_AST, ALL_TIME_TD3, TD3, GAME_FG3M, GAME_PTS, GAME_AST, GAME_STL,
GAME_BLK, PCT_PTS_3PT, PCT_PTS_2PT, PCT_PTS_2PT_MR

**PTS**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| title             | character |
| deep_link         | character |
| name              | character |
| timestamp         | character |
| season            | character |
| seasontype        | character |
| permode           | character |
| RANK              | integer   |
| PLAYER_ID         | integer   |
| PLAYER_NAME       | character |
| TEAM_ID           | integer   |
| TEAM_ABBREVIATION | character |
| PTS               | numeric   |
| FIRST_NAME        | character |
| NICKNAME          | character |
| LAST_NAME         | character |
| JERSEY_NUM        | character |
| POSITION          | character |

**REB**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| title             | character |
| deep_link         | character |
| name              | character |
| timestamp         | character |
| season            | character |
| seasontype        | character |
| permode           | character |
| RANK              | integer   |
| PLAYER_ID         | integer   |
| PLAYER_NAME       | character |
| TEAM_ID           | integer   |
| TEAM_ABBREVIATION | character |
| REB               | numeric   |
| FIRST_NAME        | character |
| NICKNAME          | character |
| LAST_NAME         | character |
| JERSEY_NUM        | character |
| POSITION          | character |

**AST**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| title             | character |
| deep_link         | character |
| name              | character |
| timestamp         | character |
| season            | character |
| seasontype        | character |
| permode           | character |
| RANK              | integer   |
| PLAYER_ID         | integer   |
| PLAYER_NAME       | character |
| TEAM_ID           | integer   |
| TEAM_ABBREVIATION | character |
| AST               | numeric   |
| FIRST_NAME        | character |
| NICKNAME          | character |
| LAST_NAME         | character |
| JERSEY_NUM        | character |
| POSITION          | character |

**BLK**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| title             | character |
| deep_link         | character |
| name              | character |
| timestamp         | character |
| season            | character |
| seasontype        | character |
| permode           | character |
| RANK              | integer   |
| PLAYER_ID         | integer   |
| PLAYER_NAME       | character |
| TEAM_ID           | integer   |
| TEAM_ABBREVIATION | character |
| BLK               | numeric   |
| FIRST_NAME        | character |
| NICKNAME          | character |
| LAST_NAME         | character |
| JERSEY_NUM        | character |
| POSITION          | character |

**STL**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| title             | character |
| deep_link         | character |
| name              | character |
| timestamp         | character |
| season            | character |
| seasontype        | character |
| permode           | character |
| RANK              | integer   |
| PLAYER_ID         | integer   |
| PLAYER_NAME       | character |
| TEAM_ID           | integer   |
| TEAM_ABBREVIATION | character |
| STL               | numeric   |
| FIRST_NAME        | character |
| NICKNAME          | character |
| LAST_NAME         | character |
| JERSEY_NUM        | character |
| POSITION          | character |

**FG_PCT**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| title             | character |
| deep_link         | character |
| name              | character |
| timestamp         | character |
| season            | character |
| seasontype        | character |
| permode           | character |
| RANK              | integer   |
| PLAYER_ID         | integer   |
| PLAYER_NAME       | character |
| TEAM_ID           | integer   |
| TEAM_ABBREVIATION | character |
| FG_PCT            | numeric   |
| FIRST_NAME        | character |
| NICKNAME          | character |
| LAST_NAME         | character |
| JERSEY_NUM        | character |
| POSITION          | character |

**FG3M**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| title             | character |
| deep_link         | character |
| name              | character |
| timestamp         | character |
| season            | character |
| seasontype        | character |
| permode           | character |
| RANK              | integer   |
| PLAYER_ID         | integer   |
| PLAYER_NAME       | character |
| TEAM_ID           | integer   |
| TEAM_ABBREVIATION | character |
| FG3M              | integer   |
| FIRST_NAME        | character |
| NICKNAME          | character |
| LAST_NAME         | character |
| JERSEY_NUM        | character |
| POSITION          | character |

**FG3_PCT**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| title             | character |
| deep_link         | character |
| name              | character |
| timestamp         | character |
| season            | character |
| seasontype        | character |
| permode           | character |
| RANK              | integer   |
| PLAYER_ID         | integer   |
| PLAYER_NAME       | character |
| TEAM_ID           | integer   |
| TEAM_ABBREVIATION | character |
| FG3_PCT           | numeric   |
| FIRST_NAME        | character |
| NICKNAME          | character |
| LAST_NAME         | character |
| JERSEY_NUM        | character |
| POSITION          | character |

**FANTASY_POINTS**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| title             | character |
| deep_link         | character |
| name              | character |
| timestamp         | character |
| season            | character |
| seasontype        | character |
| permode           | character |
| PLAYER_ID         | integer   |
| PLAYER_NAME       | character |
| TEAM_ID           | integer   |
| TEAM_ABBREVIATION | character |
| FANTASY_POINTS    | numeric   |
| FIRST_NAME        | character |
| NICKNAME          | character |
| LAST_NAME         | character |
| JERSEY_NUM        | character |
| POSITION          | character |

**TOTAL_PTS**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| NICKNAME               | character |
| TEAM_ID                | integer   |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| PTS                    | integer   |

**TOTAL_REB**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| NICKNAME               | character |
| TEAM_ID                | integer   |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| REB                    | integer   |

**TOTAL_AST**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| NICKNAME               | character |
| TEAM_ID                | integer   |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| AST                    | integer   |

**ALL_TIME_TD3**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| TD3                    | integer   |

**TD3**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| TEAM_ABBREVIATION      | character |
| SEASON_YEAR            | character |
| TD3                    | integer   |

**GAME_FG3M**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| NICKNAME               | character |
| TEAM_ID                | integer   |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| FG3M                   | integer   |
| GAME_ID                | character |

**GAME_PTS**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| NICKNAME               | character |
| TEAM_ID                | integer   |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| PTS                    | integer   |
| GAME_ID                | character |

**GAME_AST**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| NICKNAME               | character |
| TEAM_ID                | integer   |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| AST                    | integer   |
| GAME_ID                | character |

**GAME_STL**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| NICKNAME               | character |
| TEAM_ID                | integer   |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| STL                    | integer   |
| GAME_ID                | character |

**GAME_BLK**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| NICKNAME               | character |
| TEAM_ID                | integer   |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| BLK                    | integer   |
| GAME_ID                | character |

**PCT_PTS_3PT**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| NICKNAME               | character |
| TEAM_ID                | integer   |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| PCT_PTS_3PT            | numeric   |

**PCT_PTS_2PT**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| NICKNAME               | character |
| TEAM_ID                | integer   |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| PCT_PTS_2PT            | numeric   |

**PCT_PTS_2PT_MR**

|                        |           |
|------------------------|-----------|
| col_name               | types     |
| title                  | character |
| deep_link              | character |
| name                   | character |
| timestamp              | character |
| permode                | character |
| season                 | character |
| seasontype             | character |
| PLAYER_ID              | integer   |
| PLAYER_NAME            | character |
| PLAYER_NAME_LAST_FIRST | character |
| NICKNAME               | character |
| TEAM_ID                | integer   |
| TEAM_ABBREVIATION      | character |
| TEAM_NAME              | character |
| PCT_PTS_2PT_MR         | numeric   |

## Details

     wnba_homepagewidget(player_or_team = "Player")
     wnba_homepagewidget(player_or_team = "Team")

## See also

Other WNBA Leaders Functions:
[`wnba_alltimeleadersgrids()`](https://wehoop.sportsdataverse.org/reference/wnba_alltimeleadersgrids.md),
[`wnba_assistleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_assistleaders.md),
[`wnba_assisttracker()`](https://wehoop.sportsdataverse.org/reference/wnba_assisttracker.md),
[`wnba_leagueleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueleaders.md)

## Author

Saiem Gilani

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

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| RANK | integer | Whether to include statistical ranks in the returned table. |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| PTS | numeric | Points scored. |
| FIRST_NAME | character | Player's first name. |
| NICKNAME | character | Team or athlete nickname. |
| LAST_NAME | character | Player's last name. |
| JERSEY_NUM | character | Jersey number worn by the player. |
| POSITION | character | Listed roster position (G, F, C, etc.). |

**REB**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| RANK | integer | Whether to include statistical ranks in the returned table. |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| REB | numeric | Total rebounds. |
| FIRST_NAME | character | Player's first name. |
| NICKNAME | character | Team or athlete nickname. |
| LAST_NAME | character | Player's last name. |
| JERSEY_NUM | character | Jersey number worn by the player. |
| POSITION | character | Listed roster position (G, F, C, etc.). |

**AST**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| RANK | integer | Whether to include statistical ranks in the returned table. |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| AST | numeric | Assists. |
| FIRST_NAME | character | Player's first name. |
| NICKNAME | character | Team or athlete nickname. |
| LAST_NAME | character | Player's last name. |
| JERSEY_NUM | character | Jersey number worn by the player. |
| POSITION | character | Listed roster position (G, F, C, etc.). |

**BLK**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| RANK | integer | Whether to include statistical ranks in the returned table. |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| BLK | numeric | Blocks. |
| FIRST_NAME | character | Player's first name. |
| NICKNAME | character | Team or athlete nickname. |
| LAST_NAME | character | Player's last name. |
| JERSEY_NUM | character | Jersey number worn by the player. |
| POSITION | character | Listed roster position (G, F, C, etc.). |

**STL**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| RANK | integer | Whether to include statistical ranks in the returned table. |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| STL | numeric | Steals. |
| FIRST_NAME | character | Player's first name. |
| NICKNAME | character | Team or athlete nickname. |
| LAST_NAME | character | Player's last name. |
| JERSEY_NUM | character | Jersey number worn by the player. |
| POSITION | character | Listed roster position (G, F, C, etc.). |

**FG_PCT**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| RANK | integer | Whether to include statistical ranks in the returned table. |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| FG_PCT | numeric | Field goal percentage (0-1). |
| FIRST_NAME | character | Player's first name. |
| NICKNAME | character | Team or athlete nickname. |
| LAST_NAME | character | Player's last name. |
| JERSEY_NUM | character | Jersey number worn by the player. |
| POSITION | character | Listed roster position (G, F, C, etc.). |

**FG3M**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| RANK | integer | Whether to include statistical ranks in the returned table. |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| FG3M | integer | Three-point field goals made. |
| FIRST_NAME | character | Player's first name. |
| NICKNAME | character | Team or athlete nickname. |
| LAST_NAME | character | Player's last name. |
| JERSEY_NUM | character | Jersey number worn by the player. |
| POSITION | character | Listed roster position (G, F, C, etc.). |

**FG3_PCT**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| RANK | integer | Whether to include statistical ranks in the returned table. |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| FG3_PCT | numeric | Three-point field goal percentage (0-1). |
| FIRST_NAME | character | Player's first name. |
| NICKNAME | character | Team or athlete nickname. |
| LAST_NAME | character | Player's last name. |
| JERSEY_NUM | character | Jersey number worn by the player. |
| POSITION | character | Listed roster position (G, F, C, etc.). |

**FANTASY_POINTS**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| FANTASY_POINTS | numeric |  |
| FIRST_NAME | character | Player's first name. |
| NICKNAME | character | Team or athlete nickname. |
| LAST_NAME | character | Player's last name. |
| JERSEY_NUM | character | Jersey number worn by the player. |
| POSITION | character | Listed roster position (G, F, C, etc.). |

**TOTAL_PTS**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| NICKNAME | character | Team or athlete nickname. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| PTS | integer | Points scored. |

**TOTAL_REB**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| NICKNAME | character | Team or athlete nickname. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| REB | integer | Total rebounds. |

**TOTAL_AST**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| NICKNAME | character | Team or athlete nickname. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| AST | integer | Assists. |

**ALL_TIME_TD3**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| TD3 | integer |  |

**TD3**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| SEASON_YEAR | character | Season year string ('YYYY-YY' format). |
| TD3 | integer |  |

**GAME_FG3M**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| NICKNAME | character | Team or athlete nickname. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| FG3M | integer | Three-point field goals made. |
| GAME_ID | character | Unique game identifier. |

**GAME_PTS**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| NICKNAME | character | Team or athlete nickname. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| PTS | integer | Points scored. |
| GAME_ID | character | Unique game identifier. |

**GAME_AST**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| NICKNAME | character | Team or athlete nickname. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| AST | integer | Assists. |
| GAME_ID | character | Unique game identifier. |

**GAME_STL**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| NICKNAME | character | Team or athlete nickname. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| STL | integer | Steals. |
| GAME_ID | character | Unique game identifier. |

**GAME_BLK**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| NICKNAME | character | Team or athlete nickname. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| BLK | integer | Blocks. |
| GAME_ID | character | Unique game identifier. |

**PCT_PTS_3PT**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| NICKNAME | character | Team or athlete nickname. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| PCT_PTS_3PT | numeric |  |

**PCT_PTS_2PT**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| NICKNAME | character | Team or athlete nickname. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| PCT_PTS_2PT | numeric |  |

**PCT_PTS_2PT_MR**

|  |  |  |
|----|----|----|
| col_name | types | description |
| title | character | Title or label for the record. |
| deep_link | character | Deep link URL into wnba.com / espn.com. |
| name | character | Display name. |
| timestamp | character | ISO 8601 UTC timestamp. |
| permode | character | Per-mode aggregation ('Totals', 'PerGame', 'Per40', 'Per100Possessions', etc.). |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| seasontype | character | Season type ('Regular Season', 'Playoffs', 'Pre Season', 'All Star'). |
| PLAYER_ID | integer | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| PLAYER_NAME_LAST_FIRST | character |  |
| NICKNAME | character | Team or athlete nickname. |
| TEAM_ID | integer | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| PCT_PTS_2PT_MR | numeric |  |

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

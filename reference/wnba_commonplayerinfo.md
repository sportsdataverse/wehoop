# **Get WNBA Stats API Player Info**

**Get WNBA Stats API Player Info**

**Get WNBA Stats API Player Info**

## Usage

``` r
wnba_commonplayerinfo(league_id = "10", player_id = "1628932", ...)
```

## Arguments

- league_id:

  league_id

- player_id:

  player_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: CommonPlayerInfo,
PlayerHeadlineStats, AvailableSeasons

**CommonPlayerInfo**

|  |  |  |
|----|----|----|
| col_name | types | description |
| PERSON_ID | character | Unique player identifier (V3 endpoints). |
| FIRST_NAME | character | Player's first name. |
| LAST_NAME | character | Player's last name. |
| DISPLAY_FIRST_LAST | character |  |
| DISPLAY_LAST_COMMA_FIRST | character |  |
| DISPLAY_FI_LAST | character |  |
| PLAYER_SLUG | character | URL-safe player identifier. |
| BIRTHDATE | character |  |
| SCHOOL | character | Player's school / college (when distinct from 'college'). |
| COUNTRY | character | Country (full name or code). |
| LAST_AFFILIATION | character |  |
| HEIGHT | character | Player height (string e.g. '6-2' or inches). |
| WEIGHT | character | Player weight in pounds. |
| SEASON_EXP | character |  |
| JERSEY | character | Jersey number worn by the player. |
| POSITION | character | Listed roster position (G, F, C, etc.). |
| ROSTERSTATUS | character |  |
| GAMES_PLAYED_CURRENT_SEASON_FLAG | character |  |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_CODE | character |  |
| TEAM_CITY | character | Team city or region (e.g. 'Las Vegas'). |
| PLAYERCODE | character |  |
| FROM_YEAR | character |  |
| TO_YEAR | character |  |
| DLEAGUE_FLAG | character |  |
| NBA_FLAG | character |  |
| GAMES_PLAYED_FLAG | character |  |
| DRAFT_YEAR | character | Draft year (4-digit). |
| DRAFT_ROUND | character | Round of the draft selection. |
| DRAFT_NUMBER | character |  |
| GREATEST_75_FLAG | character |  |

**PlayerHeadlineStats**

|                      |           |                           |
|----------------------|-----------|---------------------------|
| col_name             | types     | description               |
| PLAYER_ID            | character | Unique player identifier. |
| PLAYER_NAME          | character | Player name.              |
| TimeFrame            | character |                           |
| PTS                  | character | Points scored.            |
| AST                  | character | Assists.                  |
| REB                  | character | Total rebounds.           |
| ALL_STAR_APPEARANCES | character |                           |

**AvailableSeasons**

|           |           |                           |
|-----------|-----------|---------------------------|
| col_name  | types     | description               |
| SEASON_ID | character | Unique season identifier. |

## Details

     wnba_commonplayerinfo(league_id = '10', player_id = '1628932')

## See also

Other WNBA Roster Functions:
[`wnba_commonallplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_commonallplayers.md),
[`wnba_commonteamroster()`](https://wehoop.sportsdataverse.org/reference/wnba_commonteamroster.md)

## Author

Saiem Gilani

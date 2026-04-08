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

|                                  |           |
|----------------------------------|-----------|
| col_name                         | types     |
| PERSON_ID                        | character |
| FIRST_NAME                       | character |
| LAST_NAME                        | character |
| DISPLAY_FIRST_LAST               | character |
| DISPLAY_LAST_COMMA_FIRST         | character |
| DISPLAY_FI_LAST                  | character |
| PLAYER_SLUG                      | character |
| BIRTHDATE                        | character |
| SCHOOL                           | character |
| COUNTRY                          | character |
| LAST_AFFILIATION                 | character |
| HEIGHT                           | character |
| WEIGHT                           | character |
| SEASON_EXP                       | character |
| JERSEY                           | character |
| POSITION                         | character |
| ROSTERSTATUS                     | character |
| GAMES_PLAYED_CURRENT_SEASON_FLAG | character |
| TEAM_ID                          | character |
| TEAM_NAME                        | character |
| TEAM_ABBREVIATION                | character |
| TEAM_CODE                        | character |
| TEAM_CITY                        | character |
| PLAYERCODE                       | character |
| FROM_YEAR                        | character |
| TO_YEAR                          | character |
| DLEAGUE_FLAG                     | character |
| NBA_FLAG                         | character |
| GAMES_PLAYED_FLAG                | character |
| DRAFT_YEAR                       | character |
| DRAFT_ROUND                      | character |
| DRAFT_NUMBER                     | character |
| GREATEST_75_FLAG                 | character |

**PlayerHeadlineStats**

|                      |           |
|----------------------|-----------|
| col_name             | types     |
| PLAYER_ID            | character |
| PLAYER_NAME          | character |
| TimeFrame            | character |
| PTS                  | character |
| AST                  | character |
| REB                  | character |
| ALL_STAR_APPEARANCES | character |

**AvailableSeasons**

|           |           |
|-----------|-----------|
| col_name  | types     |
| SEASON_ID | character |

## Details

     wnba_commonplayerinfo(league_id = '10', player_id = '1628932')

## See also

Other WNBA Roster Functions:
[`wnba_commonallplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_commonallplayers.md),
[`wnba_commonteamroster()`](https://wehoop.sportsdataverse.org/reference/wnba_commonteamroster.md)

## Author

Saiem Gilani

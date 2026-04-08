# **Get WNBA Stats API Team Roster**

**Get WNBA Stats API Team Roster**

**Get WNBA Stats API Team Roster**

## Usage

``` r
wnba_commonteamroster(
  league_id = "10",
  season = most_recent_wnba_season() - 1,
  team_id = "1611661317",
  ...
)
```

## Arguments

- league_id:

  league_id

- season:

  season

- team_id:

  team_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: Coaches, CommonTeamRoster

**CommonTeamRoster**

|              |           |
|--------------|-----------|
| col_name     | types     |
| TeamID       | character |
| SEASON       | character |
| LeagueID     | character |
| PLAYER       | character |
| NICKNAME     | character |
| PLAYER_SLUG  | character |
| NUM          | character |
| POSITION     | character |
| HEIGHT       | character |
| WEIGHT       | character |
| BIRTH_DATE   | character |
| AGE          | character |
| EXP          | character |
| SCHOOL       | character |
| PLAYER_ID    | character |
| HOW_ACQUIRED | character |

**Coaches**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| TEAM_ID           | character |
| SEASON            | character |
| COACH_ID          | character |
| FIRST_NAME        | character |
| LAST_NAME         | character |
| COACH_NAME        | character |
| IS_ASSISTANT      | character |
| COACH_TYPE        | character |
| SORT_SEQUENCE     | character |
| SUB_SORT_SEQUENCE | character |

## Details

      wnba_commonteamroster(season = most_recent_wnba_season() - 1, team_id = '1611661317')

## See also

Other WNBA Roster Functions:
[`wnba_commonallplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_commonallplayers.md),
[`wnba_commonplayerinfo()`](https://wehoop.sportsdataverse.org/reference/wnba_commonplayerinfo.md)

## Author

Saiem Gilani

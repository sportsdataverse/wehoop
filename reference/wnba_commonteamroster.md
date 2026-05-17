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

|  |  |  |
|----|----|----|
| col_name | types | description |
| TeamID | character |  |
| SEASON | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| LeagueID | character |  |
| PLAYER | character |  |
| NICKNAME | character | Team or athlete nickname. |
| PLAYER_SLUG | character | URL-safe player identifier. |
| NUM | character |  |
| POSITION | character | Listed roster position (G, F, C, etc.). |
| HEIGHT | character | Player height (string e.g. '6-2' or inches). |
| WEIGHT | character | Player weight in pounds. |
| BIRTH_DATE | character | Date of birth (YYYY-MM-DD). |
| AGE | character | Player age (in years). |
| EXP | character |  |
| SCHOOL | character | Player's school / college (when distinct from 'college'). |
| PLAYER_ID | character | Unique player identifier. |
| HOW_ACQUIRED | character |  |

**Coaches**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| SEASON | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| COACH_ID | character | Unique identifier for coach. |
| FIRST_NAME | character | Player's first name. |
| LAST_NAME | character | Player's last name. |
| COACH_NAME | character |  |
| IS_ASSISTANT | character |  |
| COACH_TYPE | character |  |
| SORT_SEQUENCE | character |  |
| SUB_SORT_SEQUENCE | character |  |

## Details

      wnba_commonteamroster(season = most_recent_wnba_season() - 1, team_id = '1611661317')

## See also

Other WNBA Roster Functions:
[`wnba_commonallplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_commonallplayers.md),
[`wnba_commonplayerinfo()`](https://wehoop.sportsdataverse.org/reference/wnba_commonplayerinfo.md)

## Author

Saiem Gilani

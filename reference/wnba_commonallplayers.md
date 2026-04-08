# **Get WNBA Stats API All Players**

**Get WNBA Stats API All Players**

**Get WNBA Stats API All Players**

## Usage

``` r
wnba_commonallplayers(
  is_only_current_season = 0,
  league_id = "10",
  season = most_recent_wnba_season() - 1,
  ...
)
```

## Arguments

- is_only_current_season:

  is_only_current_season

- league_id:

  league_id

- season:

  season

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: CommonAllPlayers

**CommonAllPlayers**

|                          |           |
|--------------------------|-----------|
| col_name                 | types     |
| PERSON_ID                | character |
| DISPLAY_LAST_COMMA_FIRST | character |
| DISPLAY_FIRST_LAST       | character |
| ROSTERSTATUS             | character |
| FROM_YEAR                | character |
| TO_YEAR                  | character |
| PLAYERCODE               | character |
| PLAYER_SLUG              | character |
| TEAM_ID                  | character |
| TEAM_CITY                | character |
| TEAM_NAME                | character |
| TEAM_ABBREVIATION        | character |
| TEAM_CODE                | character |
| TEAM_SLUG                | character |
| IS_NBA_ASSIGNED          | character |
| NBA_ASSIGNED_TEAM_ID     | character |
| GAMES_PLAYED_FLAG        | character |

## Details

      wnba_commonallplayers(league_id = '10', season = most_recent_wnba_season() - 1)

## See also

Other WNBA Roster Functions:
[`wnba_commonplayerinfo()`](https://wehoop.sportsdataverse.org/reference/wnba_commonplayerinfo.md),
[`wnba_commonteamroster()`](https://wehoop.sportsdataverse.org/reference/wnba_commonteamroster.md)

## Author

Saiem Gilani

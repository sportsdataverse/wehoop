# **Get WNBA Stats API Team Details**

**Get WNBA Stats API Team Details**

**Get WNBA Stats API Team Details**

## Usage

``` r
wnba_teamdetails(team_id = "1611661328", ...)
```

## Arguments

- team_id:

  Team ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: TeamAwardsChampionships,
TeamAwardsConf, TeamAwardsDiv, TeamBackground, TeamHistory, TeamHof,
TeamRetired, TeamSocialSites

**TeamBackground**

|                    |           |                           |
|--------------------|-----------|---------------------------|
| col_name           | types     | description               |
| TEAM_ID            | character | Unique team identifier.   |
| ABBREVIATION       | character | Short abbreviation.       |
| NICKNAME           | character | Team or athlete nickname. |
| YEARFOUNDED        | character |                           |
| CITY               | character | City.                     |
| ARENA              | character |                           |
| ARENACAPACITY      | character |                           |
| OWNER              | character |                           |
| GENERALMANAGER     | character |                           |
| HEADCOACH          | character |                           |
| DLEAGUEAFFILIATION | character |                           |

**TeamHistory**

|                |           |                           |
|----------------|-----------|---------------------------|
| col_name       | types     | description               |
| TEAM_ID        | character | Unique team identifier.   |
| CITY           | character | City.                     |
| NICKNAME       | character | Team or athlete nickname. |
| YEARFOUNDED    | character |                           |
| YEARACTIVETILL | character |                           |

**TeamSocialSites**

|              |           |             |
|--------------|-----------|-------------|
| col_name     | types     | description |
| ACCOUNTTYPE  | character |             |
| WEBSITE_LINK | character |             |

**TeamAwardsChampionships**

|              |           |             |
|--------------|-----------|-------------|
| col_name     | types     | description |
| YEARAWARDED  | character |             |
| OPPOSITETEAM | character |             |

**TeamAwardsConf**

|              |         |             |
|--------------|---------|-------------|
| col_name     | types   | description |
| YEARAWARDED  | integer |             |
| OPPOSITETEAM | integer |             |

**TeamAwardsDiv**

Same columns as the **TeamAwardsConf** table above.

**TeamHof**

|                 |           |                                         |
|-----------------|-----------|-----------------------------------------|
| col_name        | types     | description                             |
| PLAYERID        | character |                                         |
| PLAYER          | character |                                         |
| POSITION        | character | Listed roster position (G, F, C, etc.). |
| JERSEY          | character | Jersey number worn by the player.       |
| SEASONSWITHTEAM | character |                                         |
| YEAR            | character | 4-digit year.                           |

**TeamRetired**

Same columns as the **TeamHof** table above.

## Details

     wnba_teamdetails(team_id = '1611661328')

## See also

[family_wnba_team](https://wehoop.sportsdataverse.org/reference/family_wnba_team.md)
lists every function in this family.

## Author

Saiem Gilani

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

Other WNBA Team Functions:
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md),
[`wnba_teamdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbygamesplits.md),
[`wnba_teamdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbygeneralsplits.md),
[`wnba_teamdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbylastngames.md),
[`wnba_teamdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyopponent.md),
[`wnba_teamdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyshootingsplits.md),
[`wnba_teamdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyteamperformance.md),
[`wnba_teamdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyyearoveryear.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md),
[`wnba_teamestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_teamestimatedmetrics.md),
[`wnba_teamgamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelog.md),
[`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md),
[`wnba_teamgamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamestreakfinder.md),
[`wnba_teamhistoricalleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_teamhistoricalleaders.md),
[`wnba_teaminfocommon()`](https://wehoop.sportsdataverse.org/reference/wnba_teaminfocommon.md),
[`wnba_teamplayerdashboard()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md),
[`wnba_teamplayeronoffdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffdetails.md),
[`wnba_teamplayeronoffsummary()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffsummary.md),
[`wnba_teams()`](https://wehoop.sportsdataverse.org/reference/wnba_teams.md),
[`wnba_teamvsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_teamvsplayer.md),
[`wnba_teamyearbyyearstats()`](https://wehoop.sportsdataverse.org/reference/wnba_teamyearbyyearstats.md)

## Author

Saiem Gilani

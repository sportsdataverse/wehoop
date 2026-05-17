# **Get WNBA Stats API Team Common Info**

**Get WNBA Stats API Team Common Info**

**Get WNBA Stats API Team Common Info**

## Usage

``` r
wnba_teaminfocommon(
  league_id = "10",
  season = most_recent_wnba_season(),
  season_type = "Regular Season",
  team_id = "1611661328",
  ...
)
```

## Arguments

- league_id:

  League - default: '10'. Other options include '00': NBA, '20':
  G-League

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- team_id:

  Team ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: AvailableSeasons, TeamInfoCommon,
TeamSeasonRanks

**TeamInfoCommon**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| SEASON_YEAR | character | Season year string ('YYYY-YY' format). |
| TEAM_CITY | character | Team city or region (e.g. 'Las Vegas'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_CONFERENCE | character |  |
| TEAM_DIVISION | character |  |
| TEAM_CODE | character |  |
| TEAM_SLUG | character | URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). |
| W | character | Wins. |
| L | character | Losses. |
| PCT | character |  |
| CONF_RANK | character |  |
| DIV_RANK | character |  |
| MIN_YEAR | character |  |
| MAX_YEAR | character |  |

**TeamSeasonRanks**

|              |           |                                  |
|--------------|-----------|----------------------------------|
| col_name     | types     | description                      |
| LEAGUE_ID    | character | League identifier ('10' = WNBA). |
| SEASON_ID    | character | Unique season identifier.        |
| TEAM_ID      | character | Unique team identifier.          |
| PTS_RANK     | character |                                  |
| PTS_PG       | character |                                  |
| REB_RANK     | character |                                  |
| REB_PG       | character |                                  |
| AST_RANK     | character |                                  |
| AST_PG       | character |                                  |
| OPP_PTS_RANK | character |                                  |
| OPP_PTS_PG   | character |                                  |

**AvailableSeasons**

|           |           |                           |
|-----------|-----------|---------------------------|
| col_name  | types     | description               |
| SEASON_ID | character | Unique season identifier. |

## Details

      wnba_teaminfocommon(team_id = '1611661328')

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
[`wnba_teamdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdetails.md),
[`wnba_teamestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_teamestimatedmetrics.md),
[`wnba_teamgamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelog.md),
[`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md),
[`wnba_teamgamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamestreakfinder.md),
[`wnba_teamhistoricalleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_teamhistoricalleaders.md),
[`wnba_teamplayerdashboard()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md),
[`wnba_teamplayeronoffdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffdetails.md),
[`wnba_teamplayeronoffsummary()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffsummary.md),
[`wnba_teams()`](https://wehoop.sportsdataverse.org/reference/wnba_teams.md),
[`wnba_teamvsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_teamvsplayer.md),
[`wnba_teamyearbyyearstats()`](https://wehoop.sportsdataverse.org/reference/wnba_teamyearbyyearstats.md)

## Author

Saiem Gilani

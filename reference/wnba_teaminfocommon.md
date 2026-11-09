# **Get WNBA Stats API Team Common Info**

**Get WNBA Stats API Team Common Info**

**Get WNBA Stats API Team Common Info**

## Usage

``` r
wnba_teaminfocommon(
  league_id = "10",
  season = most_recent_wnba_season() - 1,
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

[family_wnba_team](https://wehoop.sportsdataverse.org/reference/family_wnba_team.md)
lists every function in this family.

## Author

Saiem Gilani

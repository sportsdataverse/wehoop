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

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| TEAM_ID           | character |
| SEASON_YEAR       | character |
| TEAM_CITY         | character |
| TEAM_NAME         | character |
| TEAM_ABBREVIATION | character |
| TEAM_CONFERENCE   | character |
| TEAM_DIVISION     | character |
| TEAM_CODE         | character |
| TEAM_SLUG         | character |
| W                 | character |
| L                 | character |
| PCT               | character |
| CONF_RANK         | character |
| DIV_RANK          | character |
| MIN_YEAR          | character |
| MAX_YEAR          | character |

**TeamSeasonRanks**

|              |           |
|--------------|-----------|
| col_name     | types     |
| LEAGUE_ID    | character |
| SEASON_ID    | character |
| TEAM_ID      | character |
| PTS_RANK     | character |
| PTS_PG       | character |
| REB_RANK     | character |
| REB_PG       | character |
| AST_RANK     | character |
| AST_PG       | character |
| OPP_PTS_RANK | character |
| OPP_PTS_PG   | character |

**AvailableSeasons**

|           |           |
|-----------|-----------|
| col_name  | types     |
| SEASON_ID | character |

## Details

      wnba_teaminfocommon(team_id = '1611661328')

## Author

Saiem Gilani

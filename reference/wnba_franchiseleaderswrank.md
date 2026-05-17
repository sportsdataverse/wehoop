# **Get WNBA Stats API Franchise Leaders with Rank**

**Get WNBA Stats API Franchise Leaders with Rank**

**Get WNBA Stats API Franchise Leaders with Rank**

## Usage

``` r
wnba_franchiseleaderswrank(
  league_id = "10",
  per_mode = "Totals",
  season_type = "Regular Season",
  team_id = "1611661324",
  ...
)
```

## Arguments

- league_id:

  league_id

- per_mode:

  per_mode

- season_type:

  season_type

- team_id:

  team_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: FranchiseLeaderswRank

**FranchiseLeaderswRank**

|  |  |  |
|----|----|----|
| col_name | types | description |
| LEAGUE_ID | character | League identifier ('10' = WNBA). |
| TEAM_ID | character | Unique team identifier. |
| TEAM | character | Team-side label or team identifier. |
| PERSON_ID | character | Unique player identifier (V3 endpoints). |
| PLAYER | character |  |
| SEASON_TYPE | character | Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
| ACTIVE_WITH_TEAM | character |  |
| GP | character | Games played. |
| MINUTES | character | Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
| FGM | character | Field goals made. |
| FGA | character | Field goal attempts. |
| FG_PCT | character | Field goal percentage (0-1). |
| FG3M | character | Three-point field goals made. |
| FG3A | character | Three-point field goal attempts. |
| FG3_PCT | character | Three-point field goal percentage (0-1). |
| FTM | character | Free throws made. |
| FTA | character | Free throw attempts. |
| FT_PCT | character | Free throw percentage (0-1). |
| OREB | character | Offensive rebounds. |
| DREB | character | Defensive rebounds. |
| REB | character | Total rebounds. |
| AST | character | Assists. |
| PF | character | Personal fouls. |
| STL | character | Steals. |
| TOV | character | Turnovers. |
| BLK | character | Blocks. |
| PTS | character | Points scored. |
| F_RANK_GP | character |  |
| F_RANK_MINUTES | character |  |
| F_RANK_FGM | character |  |
| F_RANK_FGA | character |  |
| F_RANK_FG_PCT | character |  |
| F_RANK_FG3M | character |  |
| F_RANK_FG3A | character |  |
| F_RANK_FG3_PCT | character |  |
| F_RANK_FTM | character |  |
| F_RANK_FTA | character |  |
| F_RANK_FT_PCT | character |  |
| F_RANK_OREB | character |  |
| F_RANK_DREB | character |  |
| F_RANK_REB | character |  |
| F_RANK_AST | character |  |
| F_RANK_PF | character |  |
| F_RANK_STL | character |  |
| F_RANK_TOV | character |  |
| F_RANK_BLK | character |  |
| F_RANK_PTS | character |  |

## Details

[Franchise
Leaders](https://stats.wnba.com/team/1611661324/franchise-leaders)

     wnba_franchiseleaderswrank(league_id = '10', team_id = '1611661324')

## See also

Other WNBA Franchise Functions:
[`wnba_franchisehistory()`](https://wehoop.sportsdataverse.org/reference/wnba_franchisehistory.md),
[`wnba_franchiseleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaders.md),
[`wnba_franchiseplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseplayers.md)

## Author

Saiem Gilani

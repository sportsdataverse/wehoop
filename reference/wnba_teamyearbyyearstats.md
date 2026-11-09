# **Get WNBA Stats API Team Year by Year Stats**

**Get WNBA Stats API Team Year by Year Stats**

**Get WNBA Stats API Team Year by Year Stats**

## Usage

``` r
wnba_teamyearbyyearstats(
  league_id = "10",
  per_mode = "Totals",
  season_type = "Regular Season",
  team_id = "1611661328",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- per_mode:

  Per Mode

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- team_id:

  Team ID

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: TeamStats

**TeamStats**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| TEAM_CITY | character | Team city or region (e.g. 'Las Vegas'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| YEAR | character | 4-digit year. |
| GP | character | Games played. |
| WINS | character | Total wins. |
| LOSSES | character | Total losses. |
| WIN_PCT | character | Win percentage (0-1 decimal). |
| CONF_RANK | character |  |
| DIV_RANK | character |  |
| PO_WINS | character |  |
| PO_LOSSES | character |  |
| CONF_COUNT | character |  |
| DIV_COUNT | character |  |
| NBA_FINALS_APPEARANCE | character |  |
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
| PTS_RANK | character |  |

## Details

     wnba_teamyearbyyearstats(team_id = '1611661328')

## See also

[family_wnba_team](https://wehoop.sportsdataverse.org/reference/family_wnba_team.md)
lists every function in this family.

## Author

Saiem Gilani

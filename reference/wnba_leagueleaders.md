# **Get WNBA Stats API League Leaders**

**Get WNBA Stats API League Leaders**

**Get WNBA Stats API League Leaders**

## Usage

``` r
wnba_leagueleaders(
  active_flag = "",
  league_id = "10",
  per_mode = "Totals",
  scope = "S",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  stat_category = "PTS",
  ...
)
```

## Arguments

- active_flag:

  Active Flag

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- per_mode:

  Per Mode - Totals, PerGame, Per48

- scope:

  Scope - RS, S, Rookies

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs

- stat_category:

  Stat Category: PTS, REB, AST, FG_PCT, FT_PCT, FG3_PCT, STL, BLK

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: LeagueLeaders

**LeagueLeaders**

|  |  |  |
|----|----|----|
| col_name | types | description |
| PLAYER_ID | character | Unique player identifier. |
| RANK | character | Whether to include statistical ranks in the returned table. |
| PLAYER | character |  |
| TEAM_ID | character | Unique team identifier. |
| TEAM | character | Team-side label or team identifier. |
| GP | character | Games played. |
| MIN | character | Minutes played. |
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
| STL | character | Steals. |
| BLK | character | Blocks. |
| TOV | character | Turnovers. |
| PF | character | Personal fouls. |
| PTS | character | Points scored. |
| EFF | character |  |
| AST_TOV | character |  |
| STL_TOV | character |  |

## Details

     wnba_leagueleaders(league_id = '10')

## See also

Other WNBA Leaders Functions:
[`wnba_alltimeleadersgrids()`](https://wehoop.sportsdataverse.org/reference/wnba_alltimeleadersgrids.md),
[`wnba_assistleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_assistleaders.md),
[`wnba_assisttracker()`](https://wehoop.sportsdataverse.org/reference/wnba_assisttracker.md),
[`wnba_homepagewidget()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagewidget.md)

## Author

Saiem Gilani

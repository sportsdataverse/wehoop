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

|           |           |
|-----------|-----------|
| col_name  | types     |
| PLAYER_ID | character |
| RANK      | character |
| PLAYER    | character |
| TEAM_ID   | character |
| TEAM      | character |
| GP        | character |
| MIN       | character |
| FGM       | character |
| FGA       | character |
| FG_PCT    | character |
| FG3M      | character |
| FG3A      | character |
| FG3_PCT   | character |
| FTM       | character |
| FTA       | character |
| FT_PCT    | character |
| OREB      | character |
| DREB      | character |
| REB       | character |
| AST       | character |
| STL       | character |
| BLK       | character |
| TOV       | character |
| PF        | character |
| PTS       | character |
| EFF       | character |
| AST_TOV   | character |
| STL_TOV   | character |

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

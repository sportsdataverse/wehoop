# **Get WNBA Stats API Leaders Tiles**

**Get WNBA Stats API Leaders Tiles**

**Get WNBA Stats API Leaders Tiles**

## Usage

``` r
wnba_leaderstiles(
  league_id = "10",
  game_scope = "Season",
  player_or_team = "Team",
  player_scope = "All Players",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  stat = "PTS",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WNBA, '20':
  G-League

- game_scope:

  Game Scope - Season, Last 10, ,Yesterday, Finals

- player_or_team:

  Player or Team

- player_scope:

  Player Scope - All Players, Rookies

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs

- stat:

  Stat - PTS, REB, AST, FG_PCT, FT_PCT, FG3_PCT, STL, BLK

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: AllTimeSeasonHigh, LastSeasonHigh,
LeadersTiles, LowSeasonHigh,

**LeadersTiles**

|  |  |  |
|----|----|----|
| col_name | types | description |
| RANK | character | Whether to include statistical ranks in the returned table. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| PTS | character | Points scored. |

**AllTimeSeasonHigh**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| SEASON_YEAR | character | Season year string ('YYYY-YY' format). |
| PTS | character | Points scored. |

**LastSeasonHigh**

|  |  |  |
|----|----|----|
| col_name | types | description |
| RANK | character | Whether to include statistical ranks in the returned table. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| PTS | character | Points scored. |

**LowSeasonHigh**

|  |  |  |
|----|----|----|
| col_name | types | description |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| SEASON_YEAR | character | Season year string ('YYYY-YY' format). |
| PTS | character | Points scored. |

## Details

      wnba_leaderstiles(league_id = '10', player_or_team = "Player")
      wnba_leaderstiles(league_id = '10', player_or_team = "Team")

## Author

Saiem Gilani

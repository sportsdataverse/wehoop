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

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| RANK              | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| PTS               | character |

**AllTimeSeasonHigh**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| SEASON_YEAR       | character |
| PTS               | character |

**LastSeasonHigh**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| RANK              | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| PTS               | character |

**LowSeasonHigh**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| SEASON_YEAR       | character |
| PTS               | character |

## Details

      wnba_leaderstiles(league_id = '10', player_or_team = "Player")
      wnba_leaderstiles(league_id = '10', player_or_team = "Team")

## Author

Saiem Gilani

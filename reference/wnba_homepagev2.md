# **Get WNBA Stats API HomepageV2 Leaders**

**Get WNBA Stats API HomepageV2 Leaders**

**Get WNBA Stats API HomepageV2 Leaders**

## Usage

``` r
wnba_homepagev2(
  league_id = "10",
  game_scope = "Season",
  player_or_team = "Team",
  player_scope = "All Players",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  stat_type = "Traditional",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WWNBA, '20':
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

- stat_type:

  Stat Type - Traditional, Advanced, Tracking

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: HomePageStat1, HomePageStat2,
HomePageStat3, HomePageStat4, HomePageStat5, HomePageStat6,
HomePageStat7, HomePageStat8

**HomePageStat1**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| RANK              | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| PTS               | character |

**HomePageStat2**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| RANK              | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| REB               | character |

**HomePageStat3**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| RANK              | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| AST               | character |

**HomePageStat4**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| RANK              | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| STL               | character |

**HomePageStat5**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| RANK              | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| FG_PCT            | character |

**HomePageStat6**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| RANK              | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| FT_PCT            | character |

**HomePageStat7**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| RANK              | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| FG3_PCT           | character |

**HomePageStat8**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| RANK              | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| BLK               | character |

## Details

     wnba_homepagev2(league_id = '10', player_or_team = "Player")
     wnba_homepagev2(league_id = '10', player_or_team = "Team")

## Author

Saiem Gilani

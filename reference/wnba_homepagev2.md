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

|  |  |  |
|----|----|----|
| col_name | types | description |
| RANK | character | Whether to include statistical ranks in the returned table. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| PTS | character | Points scored. |

**HomePageStat2**

|  |  |  |
|----|----|----|
| col_name | types | description |
| RANK | character | Whether to include statistical ranks in the returned table. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| REB | character | Total rebounds. |

**HomePageStat3**

|  |  |  |
|----|----|----|
| col_name | types | description |
| RANK | character | Whether to include statistical ranks in the returned table. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| AST | character | Assists. |

**HomePageStat4**

|  |  |  |
|----|----|----|
| col_name | types | description |
| RANK | character | Whether to include statistical ranks in the returned table. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| STL | character | Steals. |

**HomePageStat5**

|  |  |  |
|----|----|----|
| col_name | types | description |
| RANK | character | Whether to include statistical ranks in the returned table. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| FG_PCT | character | Field goal percentage (0-1). |

**HomePageStat6**

|  |  |  |
|----|----|----|
| col_name | types | description |
| RANK | character | Whether to include statistical ranks in the returned table. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| FT_PCT | character | Free throw percentage (0-1). |

**HomePageStat7**

|  |  |  |
|----|----|----|
| col_name | types | description |
| RANK | character | Whether to include statistical ranks in the returned table. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| FG3_PCT | character | Three-point field goal percentage (0-1). |

**HomePageStat8**

|  |  |  |
|----|----|----|
| col_name | types | description |
| RANK | character | Whether to include statistical ranks in the returned table. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_ABBREVIATION | character | Short team abbreviation (e.g. 'LAS'). |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| BLK | character | Blocks. |

## Details

     wnba_homepagev2(league_id = '10', player_or_team = "Player")
     wnba_homepagev2(league_id = '10', player_or_team = "Team")

## Author

Saiem Gilani

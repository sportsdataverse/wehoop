# **Get WNBA Stats API Homepage Leaders**

**Get WNBA Stats API Homepage Leaders**

**Get WNBA Stats API Homepage Leaders**

## Usage

``` r
wnba_homepageleaders(
  league_id = "10",
  game_scope = "Season",
  player_or_team = "Team",
  player_scope = "All Players",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  stat_category = "Points",
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

- stat_category:

  Stat Category: Points, Rebounds, Assists, Defense, Clutch, Playmaking,
  Efficiency, Fast Break, Scoring Breakdown

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: HomePageLeaders, LeagueAverage,
LeagueMax

**HomePageLeaders**

|                   |           |
|-------------------|-----------|
| col_name          | types     |
| RANK              | character |
| PLAYERID          | character |
| PLAYER            | character |
| TEAM_ID           | character |
| TEAM_ABBREVIATION | character |
| TEAM_NAME         | character |
| PTS               | character |
| FG_PCT            | character |
| FG3_PCT           | character |
| FT_PCT            | character |
| EFG_PCT           | character |
| TS_PCT            | character |
| PTS_PER48         | character |

**LeagueAverage**

|           |         |
|-----------|---------|
| col_name  | types   |
| PTS       | numeric |
| FG_PCT    | numeric |
| FG3_PCT   | numeric |
| FT_PCT    | numeric |
| EFG_PCT   | numeric |
| TS_PCT    | numeric |
| PTS_PER48 | numeric |

**LeagueMax**

|           |         |
|-----------|---------|
| col_name  | types   |
| PTS       | numeric |
| FG_PCT    | numeric |
| FG3_PCT   | numeric |
| FT_PCT    | numeric |
| EFG_PCT   | numeric |
| TS_PCT    | numeric |
| PTS_PER48 | numeric |

## Details

      wnba_homepageleaders(league_id = '10', player_or_team = "Player")
      wnba_homepageleaders(league_id = '10', player_or_team = "Team")

## Author

Saiem Gilani

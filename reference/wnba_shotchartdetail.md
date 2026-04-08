# **Get WNBA Stats API Shot Chart Detail**

**Get WNBA Stats API Shot Chart Detail**

**Get WNBA Stats API Shot Chart Detail**

## Usage

``` r
wnba_shotchartdetail(
  context_measure = "FGA",
  date_from = "",
  date_to = "",
  game_id = "",
  game_segment = "",
  last_n_games = 0,
  league_id = "10",
  location = "",
  month = 0,
  opponent_team_id = 0,
  outcome = "",
  period = 0,
  player_id = "1628932",
  player_position = "",
  rookie_year = "",
  season = most_recent_wnba_season() - 1,
  season_segment = "",
  season_type = "Regular Season",
  team_id = 0,
  vs_conference = "",
  vs_division = "",
  ...
)
```

## Arguments

- context_measure:

  context_measure

- date_from:

  date_from

- date_to:

  date_to

- game_id:

  game_id

- game_segment:

  game_segment

- last_n_games:

  last_n_games

- league_id:

  league_id

- location:

  location

- month:

  month

- opponent_team_id:

  opponent_team_id

- outcome:

  outcome

- period:

  period

- player_id:

  player_id

- player_position:

  player_position

- rookie_year:

  rookie_year

- season:

  season

- season_segment:

  season_segment

- season_type:

  season_type

- team_id:

  team_id

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: LeagueAverages, Shot_Chart_Detail

**Shot_Chart_Detail**

|                     |           |
|---------------------|-----------|
| col_name            | types     |
| GRID_TYPE           | character |
| GAME_ID             | character |
| GAME_EVENT_ID       | character |
| PLAYER_ID           | character |
| PLAYER_NAME         | character |
| TEAM_ID             | character |
| TEAM_NAME           | character |
| PERIOD              | character |
| MINUTES_REMAINING   | character |
| SECONDS_REMAINING   | character |
| EVENT_TYPE          | character |
| ACTION_TYPE         | character |
| SHOT_TYPE           | character |
| SHOT_ZONE_BASIC     | character |
| SHOT_ZONE_AREA      | character |
| SHOT_ZONE_RANGE     | character |
| SHOT_DISTANCE       | character |
| LOC_X               | character |
| LOC_Y               | character |
| SHOT_ATTEMPTED_FLAG | character |
| SHOT_MADE_FLAG      | character |
| GAME_DATE           | character |
| HTM                 | character |
| VTM                 | character |

**LeagueAverages**

|                 |           |
|-----------------|-----------|
| col_name        | types     |
| GRID_TYPE       | character |
| SHOT_ZONE_BASIC | character |
| SHOT_ZONE_AREA  | character |
| SHOT_ZONE_RANGE | character |
| FGA             | character |
| FGM             | character |
| FG_PCT          | character |

## Details

     wnba_shotchartdetail(league_id = '10', player_id = '1628932', season = most_recent_wnba_season() - 1)

## See also

Other WNBA Shooting Functions:
[`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md),
[`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md),
[`wnba_playerdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyshootingsplits.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md),
[`wnba_teamdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyshootingsplits.md)

## Author

Saiem Gilani

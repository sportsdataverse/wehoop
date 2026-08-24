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

|  |  |  |
|----|----|----|
| col_name | types | description |
| GRID_TYPE | character |  |
| GAME_ID | character | Unique game identifier. |
| GAME_EVENT_ID | character | Unique identifier for game event. |
| PLAYER_ID | character | Unique player identifier. |
| PLAYER_NAME | character | Player name. |
| TEAM_ID | character | Unique team identifier. |
| TEAM_NAME | character | Full team display name (e.g. 'Las Vegas Aces'). |
| PERIOD | character | Period of the game (1-4 quarters; 5+ for OT). |
| MINUTES_REMAINING | character | Minutes remaining. |
| SECONDS_REMAINING | character | Seconds remaining in the period. |
| EVENT_TYPE | character | Event / play type code (V2 PBP). |
| ACTION_TYPE | character | Action type label (e.g. 'Made Shot', 'Substitution'). |
| SHOT_TYPE | character | Shot type label (e.g. 'Jump Shot', 'Layup'). |
| SHOT_ZONE_BASIC | character | Shot zone (e.g. 'Restricted Area', 'Mid-Range', 'Above the Break 3'). |
| SHOT_ZONE_AREA | character | Shot zone area ('Left Side', 'Right Side', 'Center'). |
| SHOT_ZONE_RANGE | character | Shot zone range ('Less Than 8 ft.', '8-16 ft.', '16-24 ft.', etc.). |
| SHOT_DISTANCE | character | Shot distance from the basket, in feet. |
| LOC_X | character | X coordinate on the court (units of inches; 0 = basket center). |
| LOC_Y | character | Y coordinate on the court (units of inches; baseline at 0). |
| SHOT_ATTEMPTED_FLAG | character | 1 if a shot was attempted on this event. |
| SHOT_MADE_FLAG | character | 1 if the shot was made; 0 if missed. |
| GAME_DATE | character | Game date (YYYY-MM-DD). |
| HTM | character |  |
| VTM | character |  |

**LeagueAverages**

Columns as documented in the shared
[wnba_shotchartdetail_league_averages_schema](https://wehoop.sportsdataverse.org/reference/wnba_shotchartdetail_league_averages_schema.md)
table.

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

# **Get WNBA Stats API Shot Chart for Lineups**

**Get WNBA Stats API Shot Chart for Lineups**

**Get WNBA Stats API Shot Chart for Lineups**

## Usage

``` r
wnba_shotchartlineupdetail(
  ahead_behind = "",
  cfid = "",
  cfparams = "",
  clutch_time = "",
  conference = "",
  context_filter = "",
  context_measure = "FGA",
  date_from = "",
  date_to = "",
  division = "",
  end_period = "10",
  end_range = "28800",
  group_id = "-1628899-1629481-1630096-1631019-1642784-",
  game_event_id = "",
  game_id = "",
  game_segment = "",
  group_mode = "",
  group_quantity = "5",
  last_n_games = "0",
  league_id = "10",
  location = "",
  month = "0",
  on_off = "",
  opp_player_id = "",
  opponent_team_id = "0",
  outcome = "",
  po_round = "0",
  period = "0",
  player_id = "0",
  player_id1 = "",
  player_id2 = "",
  player_id3 = "",
  player_id4 = "",
  player_id5 = "",
  player_position = "",
  point_diff = "",
  position = "",
  range_type = "0",
  rookie_year = "",
  season = most_recent_wnba_season(),
  season_segment = "",
  season_type = "Regular Season",
  shot_clock_range = "",
  start_period = "1",
  start_range = "0",
  starter_bench = "",
  team_id = "1611661321",
  vs_conference = "",
  vs_division = "",
  vs_player_id1 = "",
  vs_player_id2 = "",
  vs_player_id3 = "",
  vs_player_id4 = "",
  vs_player_id5 = "",
  vs_team_id = "",
  ...
)
```

## Arguments

- ahead_behind:

  ahead_behind

- cfid:

  cfid

- cfparams:

  cfparams

- clutch_time:

  clutch_time

- conference:

  conference

- context_filter:

  context_filter

- context_measure:

  context_measure

- date_from:

  date_from

- date_to:

  date_to

- division:

  division

- end_period:

  end_period

- end_range:

  end_range

- group_id:

  group_id

- game_event_id:

  game_event_id

- game_id:

  game_id

- game_segment:

  game_segment

- group_mode:

  group_mode

- group_quantity:

  group_quantity

- last_n_games:

  last_n_games

- league_id:

  league_id

- location:

  location

- month:

  month

- on_off:

  on_off

- opp_player_id:

  opp_player_id

- opponent_team_id:

  opponent_team_id

- outcome:

  outcome

- po_round:

  po_round

- period:

  period

- player_id:

  player_id

- player_id1:

  player_id1

- player_id2:

  player_id2

- player_id3:

  player_id3

- player_id4:

  player_id4

- player_id5:

  player_id5

- player_position:

  player_position

- point_diff:

  point_diff

- position:

  position

- range_type:

  range_type

- rookie_year:

  rookie_year

- season:

  season

- season_segment:

  season_segment

- season_type:

  season_type

- shot_clock_range:

  shot_clock_range

- start_period:

  start_period

- start_range:

  start_range

- starter_bench:

  starter_bench

- team_id:

  team_id

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- vs_player_id1:

  vs_player_id1

- vs_player_id2:

  vs_player_id2

- vs_player_id3:

  vs_player_id3

- vs_player_id4:

  vs_player_id4

- vs_player_id5:

  vs_player_id5

- vs_team_id:

  vs_team_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a named list of data frames: ShotChartLineupDetail,
ShotChartLineupLeagueAverage

**ShotChartLineupDetail**

|  |  |  |
|----|----|----|
| col_name | types | description |
| GRID_TYPE | character |  |
| GAME_ID | character | Unique game identifier. |
| GAME_EVENT_ID | character | Unique identifier for game event. |
| GROUP_ID | character | Group identifier (e.g. conference group_id). |
| GROUP_NAME | character | Group name. |
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

**ShotChartLineupLeagueAverage**

Columns as documented in the shared
[wnba_shotchartdetail_league_averages_schema](https://wehoop.sportsdataverse.org/reference/wnba_shotchartdetail_league_averages_schema.md)
table.

## Details

     wnba_shotchartlineupdetail(group_id = '-1628899-1629481-1630096-1631019-1642784-', opponent_team_id = '1611661324', season = most_recent_wnba_season())

## See also

Other WNBA Shooting Functions:
[`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md),
[`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md),
[`wnba_playerdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyshootingsplits.md),
[`wnba_shotchartdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartdetail.md),
[`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md),
[`wnba_teamdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyshootingsplits.md)

Other WNBA Lineup Functions:
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_possession_lineups()`](https://wehoop.sportsdataverse.org/reference/wnba_possession_lineups.md),
[`wnba_rapm()`](https://wehoop.sportsdataverse.org/reference/wnba_rapm.md),
[`wnba_shot_zones()`](https://wehoop.sportsdataverse.org/reference/wnba_shot_zones.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md)

## Author

Saiem Gilani

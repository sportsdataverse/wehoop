# **Get WNBA Stats API Boxscore Advanced V3**

**Get WNBA Stats API Boxscore Advanced V3**

**Get WNBA Stats API Boxscore Advanced V3**

## Usage

``` r
wnba_boxscoreadvancedv3(
  game_id = "1022200034",
  start_period = 0,
  end_period = 14,
  start_range = 0,
  end_range = 0,
  range_type = 0,
  ...
)
```

## Arguments

- game_id:

  Game ID

- start_period:

  start_period

- end_period:

  end_period

- start_range:

  start_range

- end_range:

  end_range

- range_type:

  range_type

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

A list of data frames: home_team_player_advanced,
away_team_player_advanced, home_team_totals_advanced,
away_team_totals_advanced

**home_team_player_advanced**

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| away_team_id | integer | Unique identifier for the away team. |
| home_team_id | integer | Unique identifier for the home team. |
| team_id | integer | Unique team identifier. |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_city | character | Team city or region (e.g. 'Las Vegas'). |
| team_tricode | character | Three-letter team code (e.g. 'LAS' / 'NYL'). |
| team_slug | character | URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). |
| person_id | integer | Unique player identifier (V3 endpoints). |
| first_name | character | Player's first name. |
| family_name | character | Player's family / last name. |
| name_i | character | Initialed name (e.g. 'A. Wilson'). |
| player_slug | character | URL-safe player identifier. |
| position | character | Listed roster position (G, F, C, etc.). |
| comment | character | Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |
| jersey_num | character | Jersey number worn by the player. |
| minutes | character | Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
| estimated_offensive_rating | numeric | Estimated offensive rating (points per 100 possessions estimate). |
| offensive_rating | numeric | Offensive rating (points per 100 possessions). |
| estimated_defensive_rating | numeric | Estimated defensive rating (points allowed per 100 possessions estimate). |
| defensive_rating | numeric | Defensive rating (points allowed per 100 possessions). |
| estimated_net_rating | numeric | Estimated net rating (off rating - def rating). |
| net_rating | numeric | Net rating (off rating - def rating). |
| assist_percentage | numeric | Assist percentage (0-1). |
| assist_to_turnover | numeric | Assist-to-turnover ratio. |
| assist_ratio | numeric | Assist ratio (assists per 100 possessions used). |
| offensive_rebound_percentage | numeric | Offensive rebound percentage (0-1). |
| defensive_rebound_percentage | numeric | Defensive rebound percentage (0-1). |
| rebound_percentage | numeric | Total rebound percentage (0-1). |
| turnover_ratio | numeric | Turnover ratio (turnovers per 100 possessions used). |
| effective_field_goal_percentage | numeric | Effective field goal percentage (0-1). |
| true_shooting_percentage | numeric | True shooting percentage (0-1). |
| usage_percentage | numeric | Usage percentage (0-1). |
| estimated_usage_percentage | numeric | Estimated usage percentage (0-1). |
| estimated_pace | numeric | Estimated possessions per 48 minutes. |
| pace | numeric | Possessions per 48 minutes. |
| pace_per40 | numeric | Pace per40. |
| possessions | numeric | Possessions used. |
| pie | numeric | Player Impact Estimate (0-1). |

**away_team_player_advanced**

Same columns as the **home_team_player_advanced** table above.

**home_team_totals_advanced**

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| away_team_id | integer | Unique identifier for the away team. |
| home_team_id | integer | Unique identifier for the home team. |
| team_id | integer | Unique team identifier. |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_city | character | Team city or region (e.g. 'Las Vegas'). |
| team_tricode | character | Three-letter team code (e.g. 'LAS' / 'NYL'). |
| team_slug | character | URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). |
| minutes | character | Minutes played, formatted MM:SS (V3 PT-duration parsed) or decimal minutes (V2). |
| estimated_offensive_rating | numeric | Estimated offensive rating (points per 100 possessions estimate). |
| offensive_rating | numeric | Offensive rating (points per 100 possessions). |
| estimated_defensive_rating | numeric | Estimated defensive rating (points allowed per 100 possessions estimate). |
| defensive_rating | numeric | Defensive rating (points allowed per 100 possessions). |
| estimated_net_rating | numeric | Estimated net rating (off rating - def rating). |
| net_rating | numeric | Net rating (off rating - def rating). |
| assist_percentage | numeric | Assist percentage (0-1). |
| assist_to_turnover | numeric | Assist-to-turnover ratio. |
| assist_ratio | numeric | Assist ratio (assists per 100 possessions used). |
| offensive_rebound_percentage | numeric | Offensive rebound percentage (0-1). |
| defensive_rebound_percentage | numeric | Defensive rebound percentage (0-1). |
| rebound_percentage | numeric | Total rebound percentage (0-1). |
| estimated_team_turnover_percentage | numeric | Estimated team turnover percentage (0-1). |
| turnover_ratio | numeric | Turnover ratio (turnovers per 100 possessions used). |
| effective_field_goal_percentage | numeric | Effective field goal percentage (0-1). |
| true_shooting_percentage | numeric | True shooting percentage (0-1). |
| usage_percentage | numeric | Usage percentage (0-1). |
| estimated_usage_percentage | numeric | Estimated usage percentage (0-1). |
| estimated_pace | numeric | Estimated possessions per 48 minutes. |
| pace | numeric | Possessions per 48 minutes. |
| pace_per40 | numeric | Pace per40. |
| possessions | numeric | Possessions used. |
| pie | numeric | Player Impact Estimate (0-1). |

**away_team_totals_advanced**

Same columns as the **home_team_totals_advanced** table above.

## Details

     wnba_boxscoreadvancedv3(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md),
[`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md),
[`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md),
[`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md),
[`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md),
[`wnba_boxscoresummaryv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv3.md),
[`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md),
[`wnba_boxscoreusagev3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev3.md)

## Author

Saiem Gilani

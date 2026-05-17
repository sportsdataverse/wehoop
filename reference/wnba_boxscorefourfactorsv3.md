# **Get WNBA Stats API Boxscore Four Factors V3**

**Get WNBA Stats API Boxscore Four Factors V3**

**Get WNBA Stats API Boxscore Four Factors V3**

## Usage

``` r
wnba_boxscorefourfactorsv3(
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

A list of data frames: home_team_player_four_factors,
away_team_player_four_factors, home_team_totals_four_factors,
away_team_totals_four_factors

**home_team_player_four_factors**

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
| effective_field_goal_percentage | numeric | Effective field goal percentage (0-1). |
| free_throw_attempt_rate | numeric | Free throw attempt rate (FTA / FGA). |
| team_turnover_percentage | numeric | Team turnover percentage (0-1). |
| offensive_rebound_percentage | numeric | Offensive rebound percentage (0-1). |
| opp_effective_field_goal_percentage | numeric | Opponent effective field goal percentage (0-1 decimal). |
| opp_free_throw_attempt_rate | numeric | Opponent free throw attempt rate. |
| opp_team_turnover_percentage | numeric | Opponent team turnover percentage (0-1 decimal). |
| opp_offensive_rebound_percentage | numeric | Opponent offensive rebound percentage (0-1 decimal). |

**away_team_player_four_factors**

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
| effective_field_goal_percentage | numeric | Effective field goal percentage (0-1). |
| free_throw_attempt_rate | numeric | Free throw attempt rate (FTA / FGA). |
| team_turnover_percentage | numeric | Team turnover percentage (0-1). |
| offensive_rebound_percentage | numeric | Offensive rebound percentage (0-1). |
| opp_effective_field_goal_percentage | numeric | Opponent effective field goal percentage (0-1 decimal). |
| opp_free_throw_attempt_rate | numeric | Opponent free throw attempt rate. |
| opp_team_turnover_percentage | numeric | Opponent team turnover percentage (0-1 decimal). |
| opp_offensive_rebound_percentage | numeric | Opponent offensive rebound percentage (0-1 decimal). |

**home_team_totals_four_factors**

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
| effective_field_goal_percentage | numeric | Effective field goal percentage (0-1). |
| free_throw_attempt_rate | numeric | Free throw attempt rate (FTA / FGA). |
| team_turnover_percentage | numeric | Team turnover percentage (0-1). |
| offensive_rebound_percentage | numeric | Offensive rebound percentage (0-1). |
| opp_effective_field_goal_percentage | numeric | Opponent effective field goal percentage (0-1 decimal). |
| opp_free_throw_attempt_rate | numeric | Opponent free throw attempt rate. |
| opp_team_turnover_percentage | numeric | Opponent team turnover percentage (0-1 decimal). |
| opp_offensive_rebound_percentage | numeric | Opponent offensive rebound percentage (0-1 decimal). |

**away_team_totals_four_factors**

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
| effective_field_goal_percentage | numeric | Effective field goal percentage (0-1). |
| free_throw_attempt_rate | numeric | Free throw attempt rate (FTA / FGA). |
| team_turnover_percentage | numeric | Team turnover percentage (0-1). |
| offensive_rebound_percentage | numeric | Offensive rebound percentage (0-1). |
| opp_effective_field_goal_percentage | numeric | Opponent effective field goal percentage (0-1 decimal). |
| opp_free_throw_attempt_rate | numeric | Opponent free throw attempt rate. |
| opp_team_turnover_percentage | numeric | Opponent team turnover percentage (0-1 decimal). |
| opp_offensive_rebound_percentage | numeric | Opponent offensive rebound percentage (0-1 decimal). |

## Details

     wnba_boxscorefourfactorsv3(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv3.md),
[`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md),
[`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md),
[`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md),
[`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md),
[`wnba_boxscoresummaryv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv3.md),
[`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md),
[`wnba_boxscoreusagev3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev3.md)

## Author

Saiem Gilani

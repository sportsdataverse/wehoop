# **Get WNBA Stats API Boxscore Traditional V3**

**Get WNBA Stats API Boxscore Traditional V3**

**Get WNBA Stats API Boxscore Traditional V3**

## Usage

``` r
wnba_boxscoretraditionalv3(
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

A list of data frames: home_team_player_traditional,
away_team_player_traditional, home_team_totals_traditional,
away_team_totals_traditional, home_team_starters_totals,
away_team_starters_totals, home_team_bench_totals,
away_team_bench_totals

**home_team_player_traditional**

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
| field_goals_made | integer | Field goals made (2-pt + 3-pt). |
| field_goals_attempted | integer | Field goal attempts (2-pt + 3-pt). |
| field_goals_percentage | numeric | Field goal percentage (0-1 decimal). |
| three_pointers_made | integer | Three-point field goals made. |
| three_pointers_attempted | integer | Three-point field goal attempts. |
| three_pointers_percentage | numeric | Three-point field goal percentage (0-1 decimal). |
| free_throws_made | integer | Free throws made. |
| free_throws_attempted | integer | Free throw attempts. |
| free_throws_percentage | numeric | Free throw percentage (0-1 decimal). |
| rebounds_offensive | integer | Offensive rebounds. |
| rebounds_defensive | integer | Defensive rebounds. |
| rebounds_total | integer | Total rebounds. |
| assists | integer | Total assists. |
| steals | integer | Total steals. |
| blocks | integer | Total blocks. |
| turnovers | integer | Total turnovers. |
| fouls_personal | integer | Personal fouls. |
| points | integer | Points scored. |
| plus_minus_points | numeric | Plus/minus point differential while on court. |

**away_team_player_traditional**

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
| field_goals_made | integer | Field goals made (2-pt + 3-pt). |
| field_goals_attempted | integer | Field goal attempts (2-pt + 3-pt). |
| field_goals_percentage | numeric | Field goal percentage (0-1 decimal). |
| three_pointers_made | integer | Three-point field goals made. |
| three_pointers_attempted | integer | Three-point field goal attempts. |
| three_pointers_percentage | numeric | Three-point field goal percentage (0-1 decimal). |
| free_throws_made | integer | Free throws made. |
| free_throws_attempted | integer | Free throw attempts. |
| free_throws_percentage | numeric | Free throw percentage (0-1 decimal). |
| rebounds_offensive | integer | Offensive rebounds. |
| rebounds_defensive | integer | Defensive rebounds. |
| rebounds_total | integer | Total rebounds. |
| assists | integer | Total assists. |
| steals | integer | Total steals. |
| blocks | integer | Total blocks. |
| turnovers | integer | Total turnovers. |
| fouls_personal | integer | Personal fouls. |
| points | integer | Points scored. |
| plus_minus_points | numeric | Plus/minus point differential while on court. |

**home_team_totals_traditional**

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
| field_goals_made | integer | Field goals made (2-pt + 3-pt). |
| field_goals_attempted | integer | Field goal attempts (2-pt + 3-pt). |
| field_goals_percentage | numeric | Field goal percentage (0-1 decimal). |
| three_pointers_made | integer | Three-point field goals made. |
| three_pointers_attempted | integer | Three-point field goal attempts. |
| three_pointers_percentage | numeric | Three-point field goal percentage (0-1 decimal). |
| free_throws_made | integer | Free throws made. |
| free_throws_attempted | integer | Free throw attempts. |
| free_throws_percentage | numeric | Free throw percentage (0-1 decimal). |
| rebounds_offensive | integer | Offensive rebounds. |
| rebounds_defensive | integer | Defensive rebounds. |
| rebounds_total | integer | Total rebounds. |
| assists | integer | Total assists. |
| steals | integer | Total steals. |
| blocks | integer | Total blocks. |
| turnovers | integer | Total turnovers. |
| fouls_personal | integer | Personal fouls. |
| points | integer | Points scored. |
| plus_minus_points | numeric | Plus/minus point differential while on court. |

**away_team_totals_traditional**

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
| field_goals_made | integer | Field goals made (2-pt + 3-pt). |
| field_goals_attempted | integer | Field goal attempts (2-pt + 3-pt). |
| field_goals_percentage | numeric | Field goal percentage (0-1 decimal). |
| three_pointers_made | integer | Three-point field goals made. |
| three_pointers_attempted | integer | Three-point field goal attempts. |
| three_pointers_percentage | numeric | Three-point field goal percentage (0-1 decimal). |
| free_throws_made | integer | Free throws made. |
| free_throws_attempted | integer | Free throw attempts. |
| free_throws_percentage | numeric | Free throw percentage (0-1 decimal). |
| rebounds_offensive | integer | Offensive rebounds. |
| rebounds_defensive | integer | Defensive rebounds. |
| rebounds_total | integer | Total rebounds. |
| assists | integer | Total assists. |
| steals | integer | Total steals. |
| blocks | integer | Total blocks. |
| turnovers | integer | Total turnovers. |
| fouls_personal | integer | Personal fouls. |
| points | integer | Points scored. |
| plus_minus_points | numeric | Plus/minus point differential while on court. |

**home_team_starters_totals**

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
| field_goals_made | integer | Field goals made (2-pt + 3-pt). |
| field_goals_attempted | integer | Field goal attempts (2-pt + 3-pt). |
| field_goals_percentage | numeric | Field goal percentage (0-1 decimal). |
| three_pointers_made | integer | Three-point field goals made. |
| three_pointers_attempted | integer | Three-point field goal attempts. |
| three_pointers_percentage | numeric | Three-point field goal percentage (0-1 decimal). |
| free_throws_made | integer | Free throws made. |
| free_throws_attempted | integer | Free throw attempts. |
| free_throws_percentage | numeric | Free throw percentage (0-1 decimal). |
| rebounds_offensive | integer | Offensive rebounds. |
| rebounds_defensive | integer | Defensive rebounds. |
| rebounds_total | integer | Total rebounds. |
| assists | integer | Total assists. |
| steals | integer | Total steals. |
| blocks | integer | Total blocks. |
| turnovers | integer | Total turnovers. |
| fouls_personal | integer | Personal fouls. |
| points | integer | Points scored. |

**away_team_starters_totals**

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
| field_goals_made | integer | Field goals made (2-pt + 3-pt). |
| field_goals_attempted | integer | Field goal attempts (2-pt + 3-pt). |
| field_goals_percentage | numeric | Field goal percentage (0-1 decimal). |
| three_pointers_made | integer | Three-point field goals made. |
| three_pointers_attempted | integer | Three-point field goal attempts. |
| three_pointers_percentage | numeric | Three-point field goal percentage (0-1 decimal). |
| free_throws_made | integer | Free throws made. |
| free_throws_attempted | integer | Free throw attempts. |
| free_throws_percentage | numeric | Free throw percentage (0-1 decimal). |
| rebounds_offensive | integer | Offensive rebounds. |
| rebounds_defensive | integer | Defensive rebounds. |
| rebounds_total | integer | Total rebounds. |
| assists | integer | Total assists. |
| steals | integer | Total steals. |
| blocks | integer | Total blocks. |
| turnovers | integer | Total turnovers. |
| fouls_personal | integer | Personal fouls. |
| points | integer | Points scored. |

**home_team_bench_totals**

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
| field_goals_made | integer | Field goals made (2-pt + 3-pt). |
| field_goals_attempted | integer | Field goal attempts (2-pt + 3-pt). |
| field_goals_percentage | numeric | Field goal percentage (0-1 decimal). |
| three_pointers_made | integer | Three-point field goals made. |
| three_pointers_attempted | integer | Three-point field goal attempts. |
| three_pointers_percentage | numeric | Three-point field goal percentage (0-1 decimal). |
| free_throws_made | integer | Free throws made. |
| free_throws_attempted | integer | Free throw attempts. |
| free_throws_percentage | numeric | Free throw percentage (0-1 decimal). |
| rebounds_offensive | integer | Offensive rebounds. |
| rebounds_defensive | integer | Defensive rebounds. |
| rebounds_total | integer | Total rebounds. |
| assists | integer | Total assists. |
| steals | integer | Total steals. |
| blocks | integer | Total blocks. |
| turnovers | integer | Total turnovers. |
| fouls_personal | integer | Personal fouls. |
| points | integer | Points scored. |

**away_team_bench_totals**

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
| field_goals_made | integer | Field goals made (2-pt + 3-pt). |
| field_goals_attempted | integer | Field goal attempts (2-pt + 3-pt). |
| field_goals_percentage | numeric | Field goal percentage (0-1 decimal). |
| three_pointers_made | integer | Three-point field goals made. |
| three_pointers_attempted | integer | Three-point field goal attempts. |
| three_pointers_percentage | numeric | Three-point field goal percentage (0-1 decimal). |
| free_throws_made | integer | Free throws made. |
| free_throws_attempted | integer | Free throw attempts. |
| free_throws_percentage | numeric | Free throw percentage (0-1 decimal). |
| rebounds_offensive | integer | Offensive rebounds. |
| rebounds_defensive | integer | Defensive rebounds. |
| rebounds_total | integer | Total rebounds. |
| assists | integer | Total assists. |
| steals | integer | Total steals. |
| blocks | integer | Total blocks. |
| turnovers | integer | Total turnovers. |
| fouls_personal | integer | Personal fouls. |
| points | integer | Points scored. |

## Details

     wnba_boxscoretraditionalv3(game_id = "1022200034")

## See also

Other WNBA Boxscore V3 Functions:
[`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv3.md),
[`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md),
[`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md),
[`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md),
[`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md),
[`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md),
[`wnba_boxscoresummaryv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv3.md),
[`wnba_boxscoreusagev3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev3.md)

## Author

Saiem Gilani

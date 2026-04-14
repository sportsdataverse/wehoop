# Get ESPN women's college basketball game data (play-by-play, team and player box)

Get ESPN women's college basketball game data (play-by-play, team and
player box)

## Usage

``` r
espn_wbb_game_all(game_id)
```

## Arguments

- game_id:

  Game ID

## Value

A named list of dataframes: Plays, Team, Player

**Plays**

|                           |           |
|---------------------------|-----------|
| col_name                  | types     |
| id                        | character |
| sequence_number           | character |
| text                      | character |
| away_score                | integer   |
| home_score                | integer   |
| scoring_play              | logical   |
| score_value               | integer   |
| wallclock                 | character |
| shooting_play             | logical   |
| type_id                   | integer   |
| type_text                 | character |
| period_number             | integer   |
| period_display_value      | character |
| clock_display_value       | character |
| team_id                   | integer   |
| coordinate_x_raw          | numeric   |
| coordinate_y_raw          | numeric   |
| coordinate_x              | numeric   |
| coordinate_y              | numeric   |
| play_id                   | character |
| athlete_id_1              | integer   |
| athlete_id_2              | integer   |
| home_team_id              | integer   |
| home_team_mascot          | character |
| home_team_name            | character |
| home_team_abbrev          | character |
| home_team_logo            | character |
| home_team_logo_dark       | character |
| home_team_full_name       | character |
| home_team_color           | character |
| home_team_alternate_color | character |
| home_team_score           | integer   |
| home_team_winner          | logical   |
| home_team_record          | character |
| away_team_id              | integer   |
| away_team_mascot          | character |
| away_team_name            | character |
| away_team_abbrev          | character |
| away_team_logo            | character |
| away_team_logo_dark       | character |
| away_team_full_name       | character |
| away_team_color           | character |
| away_team_alternate_color | character |
| away_team_score           | integer   |
| away_team_winner          | logical   |
| away_team_record          | character |
| game_id                   | integer   |
| season                    | integer   |
| season_type               | integer   |
| game_date                 | Date      |
| game_date_time            | POSIXct   |

**Team**

|                                   |           |
|-----------------------------------|-----------|
| col_name                          | types     |
| game_id                           | integer   |
| season                            | integer   |
| season_type                       | integer   |
| game_date                         | Date      |
| game_date_time                    | POSIXct   |
| team_id                           | integer   |
| team_uid                          | character |
| team_slug                         | character |
| team_location                     | character |
| team_name                         | character |
| team_abbreviation                 | character |
| team_display_name                 | character |
| team_short_display_name           | character |
| team_color                        | character |
| team_alternate_color              | character |
| team_logo                         | character |
| team_home_away                    | character |
| team_score                        | integer   |
| team_winner                       | logical   |
| assists                           | integer   |
| blocks                            | integer   |
| defensive_rebounds                | integer   |
| field_goal_pct                    | numeric   |
| field_goals_made                  | integer   |
| field_goals_attempted             | integer   |
| flagrant_fouls                    | integer   |
| fouls                             | integer   |
| free_throw_pct                    | numeric   |
| free_throws_made                  | integer   |
| free_throws_attempted             | integer   |
| largest_lead                      | character |
| offensive_rebounds                | integer   |
| steals                            | integer   |
| team_turnovers                    | integer   |
| technical_fouls                   | integer   |
| three_point_field_goal_pct        | numeric   |
| three_point_field_goals_made      | integer   |
| three_point_field_goals_attempted | integer   |
| total_rebounds                    | integer   |
| total_technical_fouls             | integer   |
| total_turnovers                   | integer   |
| turnovers                         | integer   |
| opponent_team_id                  | integer   |
| opponent_team_uid                 | character |
| opponent_team_slug                | character |
| opponent_team_location            | character |
| opponent_team_name                | character |
| opponent_team_abbreviation        | character |
| opponent_team_display_name        | character |
| opponent_team_short_display_name  | character |
| opponent_team_color               | character |
| opponent_team_alternate_color     | character |
| opponent_team_logo                | character |
| opponent_team_score               | integer   |

**Player**

|                                   |           |
|-----------------------------------|-----------|
| col_name                          | types     |
| game_id                           | integer   |
| season                            | integer   |
| season_type                       | integer   |
| game_date                         | Date      |
| game_date_time                    | POSIXct   |
| athlete_id                        | integer   |
| athlete_display_name              | character |
| team_id                           | integer   |
| team_name                         | character |
| team_location                     | character |
| team_short_display_name           | character |
| minutes                           | numeric   |
| field_goals_made                  | integer   |
| field_goals_attempted             | integer   |
| three_point_field_goals_made      | integer   |
| three_point_field_goals_attempted | integer   |
| free_throws_made                  | integer   |
| free_throws_attempted             | integer   |
| offensive_rebounds                | integer   |
| defensive_rebounds                | integer   |
| rebounds                          | integer   |
| assists                           | integer   |
| steals                            | integer   |
| blocks                            | integer   |
| turnovers                         | integer   |
| fouls                             | integer   |
| points                            | integer   |
| starter                           | logical   |
| ejected                           | logical   |
| did_not_play                      | logical   |
| active                            | logical   |
| athlete_jersey                    | character |
| athlete_short_name                | character |
| athlete_headshot_href             | character |
| athlete_position_name             | character |
| athlete_position_abbreviation     | character |
| team_display_name                 | character |
| team_uid                          | character |
| team_slug                         | character |
| team_logo                         | character |
| team_abbreviation                 | character |
| team_color                        | character |
| team_alternate_color              | character |
| home_away                         | character |
| team_winner                       | logical   |
| team_score                        | integer   |
| opponent_team_id                  | integer   |
| opponent_team_name                | character |
| opponent_team_location            | character |
| opponent_team_display_name        | character |
| opponent_team_abbreviation        | character |
| opponent_team_logo                | character |
| opponent_team_color               | character |
| opponent_team_alternate_color     | character |
| opponent_team_score               | integer   |

## See also

Other ESPN WBB Functions:
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md),
[`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md),
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wbb_game_all(game_id = 401276115))
#> $Plays
#> ── ESPN WBB Play-by-Play Information from ESPN.com ───────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-04-14 04:27:08 UTC
#> # A tibble: 386 × 53
#>    id       sequence_number text  away_score home_score scoring_play score_value
#>    <chr>    <chr>           <chr>      <int>      <int> <lgl>              <int>
#>  1 4012761… 101899901       Jump…          0          0 FALSE                  0
#>  2 4012761… 101904901       Morg…          0          2 TRUE                   2
#>  3 4012761… 101907701       Kian…          3          2 TRUE                   3
#>  4 4012761… 101914901       Vale…          3          2 FALSE                  2
#>  5 4012761… 101914902       Morg…          3          2 FALSE                  0
#>  6 4012761… 101915701       Kour…          3          5 TRUE                   3
#>  7 4012761… 101919001       Dana…          3          5 FALSE                  3
#>  8 4012761… 101919002       Kian…          3          5 FALSE                  0
#>  9 4012761… 101919501       Myka…          5          5 TRUE                   2
#> 10 4012761… 101924601       Morg…          5          5 FALSE                  2
#> # ℹ 376 more rows
#> # ℹ 46 more variables: wallclock <chr>, shooting_play <lgl>,
#> #   points_attempted <int>, short_description <chr>, type_id <int>,
#> #   type_text <chr>, period_number <int>, period_display_value <chr>,
#> #   clock_display_value <chr>, team_id <int>, coordinate_x_raw <dbl>,
#> #   coordinate_y_raw <dbl>, coordinate_x <dbl>, coordinate_y <dbl>,
#> #   play_id <chr>, athlete_id_1 <int>, athlete_id_2 <int>, …
#> 
#> $Team
#> ── ESPN WBB Team Box Information from ESPN.com ───────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-04-14 04:27:09 UTC
#> # A tibble: 2 × 56
#>     game_id season season_type game_date  game_date_time      team_id team_uid  
#>       <int>  <int>       <int> <date>     <dttm>                <int> <chr>     
#> 1 401276115   2021           2 2021-02-21 2021-02-21 14:00:00      97 s:40~l:54…
#> 2 401276115   2021           2 2021-02-21 2021-02-21 14:00:00      52 s:40~l:54…
#> # ℹ 49 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>,
#> #   field_goals_made <int>, field_goals_attempted <int>, fouls <int>, …
#> 
#> $Player
#> ── ESPN WBB Player Box Information from ESPN.com ─────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-04-14 04:27:09 UTC
#> # A tibble: 25 × 54
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4433426
#>  2 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4433412
#>  3 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398604
#>  4 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4281919
#>  5 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4281190
#>  6 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4703211
#>  7 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398591
#>  8 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398589
#>  9 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4433094
#> 10 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398835
#> # ℹ 15 more rows
#> # ℹ 48 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
#> 
 # }
```

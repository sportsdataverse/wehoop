# Get ESPN's WNBA game data (play-by-play, team and player box)

Get ESPN's WNBA game data (play-by-play, team and player box)

Get ESPN's WNBA play by play data

Get ESPN's WNBA team box data

Get ESPN's WNBA player box data

**Get ESPN WNBA game rosters**

## Usage

``` r
espn_wnba_game_all(game_id)

espn_wnba_pbp(game_id)

espn_wnba_team_box(game_id)

espn_wnba_player_box(game_id)

espn_wnba_game_rosters(game_id)
```

## Arguments

- game_id:

  Game ID

## Value

A named list of dataframes: Plays, Team, Player

**Plays**

Columns as documented in the shared
[espn_basketball_game_all_plays_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_all_plays_schema.md)
table.

**Team**

Columns as documented in the shared
[espn_basketball_team_box_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_team_box_schema.md)
table.

**Player**

Columns as documented in the shared
[espn_basketball_game_all_player_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_all_player_schema.md)
table.

Returns a play-by-play data frame

**Plays**

Columns as documented in the shared
[espn_basketball_game_all_plays_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_all_plays_schema.md)
table.

Returns a team boxscore data frame

**Team**

Columns as documented in the shared
[espn_basketball_team_box_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_team_box_schema.md)
table.

Returns a player boxscore data frame

**Player**

Columns as documented in the shared
[espn_basketball_game_all_player_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_all_player_schema.md)
table.

A game rosters data frame

|  |  |  |
|----|----|----|
| col_name | types | description |
| athlete_id | integer | Unique athlete identifier (ESPN). |
| athlete_uid | character | ESPN athlete UID (universal identifier). |
| athlete_guid | character | ESPN athlete GUID. |
| athlete_type | character | Athlete type / class. |
| sdr | integer | Sdr. |
| first_name | character | Player's first name. |
| last_name | character | Player's last name. |
| full_name | character | Player's full name. |
| athlete_display_name | character | Athlete display name (full). |
| short_name | character | Short display name. |
| weight | numeric | Player weight in pounds. |
| display_weight | character | Player weight in display format (e.g. '180 lbs'). |
| height | numeric | Player height (string e.g. '6-2' or inches). |
| display_height | character | Player height in display format (e.g. '6-2'). |
| age | integer | Player age (in years). |
| date_of_birth | character | Date of birth (YYYY-MM-DD). |
| slug | character | URL-safe identifier. |
| headshot_href | character | Headshot image URL. |
| headshot_alt | character | Alternative-text label for the headshot. |
| jersey | character | Jersey number worn by the player. |
| position_id | integer | Unique position identifier. |
| position_name | character | Listed roster position ('Guard', 'Forward', 'Center'). |
| position_display_name | character | Position display name. |
| position_abbreviation | character | Position abbreviation ('G' / 'F' / 'C'). |
| position_leaf | logical | Position leaf. |
| linked | logical | TRUE if the record is linked to a related entity. |
| years | integer | Years. |
| active | logical | TRUE if the row represents an active record (player / team / season). |
| status_id | integer | Status identifier. |
| status_name | character | Status label. |
| status_type | character | Status type. |
| status_abbreviation | character | Status abbreviation. |
| birth_place_city | character | Birth place city. |
| birth_place_state | character | Birth place state. |
| birth_place_country | character | Birth place country. |
| starter | logical | TRUE if the player was in the starting lineup; FALSE otherwise. |
| valid | logical | Valid. |
| did_not_play | logical | TRUE if the player did not appear in the game. |
| display_name | character | Display name. |
| reason | character | Reason. |
| ejected | logical | TRUE if the player was ejected from the game. |
| team_id | integer | Unique team identifier. |
| team_guid | character | ESPN team GUID. |
| team_uid | character | ESPN universal team identifier (UID format 's:40~l:...~t:...'). |
| team_sdr | integer | ESPN team SDR identifier. |
| team_slug | character | URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). |
| team_location | character | Team city or location string. |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| team_display_name | character | Full team display name. |
| team_short_display_name | character | Short team display name (e.g. 'Aces'). |
| team_color | character | Team primary color (hex without leading '#'). |
| team_alternate_color | character | Team alternate color (hex without leading '#'). |
| team_is_active | logical | TRUE if the team is currently active. |
| is_all_star | logical | Is all star. |
| logo_href | character | Team or league logo URL. |
| logo_dark_href | character | Logo URL for dark backgrounds. |
| logos_href_2 | character | Logos href 2. |
| logos_href_3 | character | Logos href 3. |
| game_id | integer | Unique game identifier. |
| order | integer | Display order within the result set. |
| home_away | character | Game venue label ('home' or 'away'). |
| winner | logical | Winner. |
| draft_display_text | character | Draft display text. |
| draft_round | integer | Round of the draft selection. |
| draft_year | integer | Draft year (4-digit). |
| draft_selection | integer | Draft selection. |
| hand_type | character | Hand type. |
| hand_abbreviation | character | Hand abbreviation. |
| hand_display_value | character | Hand display value. |
| citizenship | character | Citizenship. |

## See also

Other ESPN WNBA Functions:
[`espn_wnba_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athletes_index.md),
[`espn_wnba_award()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_award.md),
[`espn_wnba_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_calendar.md),
[`espn_wnba_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coach_season.md),
[`espn_wnba_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coaches.md),
[`espn_wnba_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_conferences.md),
[`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md),
[`espn_wnba_draft_athlete_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athlete_detail.md),
[`espn_wnba_draft_pick()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_pick.md),
[`espn_wnba_draft_rounds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md),
[`espn_wnba_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchise.md),
[`espn_wnba_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchises.md),
[`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md),
[`espn_wnba_futures()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_futures.md),
[`espn_wnba_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md),
[`espn_wnba_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_official_detail.md),
[`espn_wnba_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play.md),
[`espn_wnba_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play_personnel.md),
[`espn_wnba_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_player_box.md),
[`espn_wnba_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_probabilities.md),
[`espn_wnba_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_propbets.md),
[`espn_wnba_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md),
[`espn_wnba_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_roster_entry.md),
[`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md),
[`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md),
[`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md),
[`espn_wnba_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_awards.md),
[`espn_wnba_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_career_stats.md),
[`espn_wnba_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog_v2.md),
[`espn_wnba_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_info.md),
[`espn_wnba_player_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md),
[`espn_wnba_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_seasons.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_position()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_position.md),
[`espn_wnba_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_positions.md),
[`espn_wnba_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_powerindex.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_awards.md),
[`espn_wnba_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group.md),
[`espn_wnba_season_groups()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_groups.md),
[`espn_wnba_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_info.md),
[`espn_wnba_season_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_leaders.md),
[`espn_wnba_season_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_ranking.md),
[`espn_wnba_season_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_rankings.md),
[`espn_wnba_season_type()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_type.md),
[`espn_wnba_season_types()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_types.md),
[`espn_wnba_season_week()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_week.md),
[`espn_wnba_season_weeks()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_weeks.md),
[`espn_wnba_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_seasons.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md),
[`espn_wnba_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_injuries.md),
[`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md),
[`espn_wnba_team_record()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record.md),
[`espn_wnba_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record_detail.md),
[`espn_wnba_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_schedule.md),
[`espn_wnba_team_season_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_roster.md),
[`espn_wnba_team_season_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_statistics.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md),
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md),
[`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md),
[`espn_wnba_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_venues.md),
[`espn_wnba_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_ranking.md),
[`espn_wnba_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_rankings.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wnba_game_all(game_id = 401244185))
#> $Plays
#> ── ESPN WNBA Play-by-Play Information from ESPN.com ──────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:07:09 UTC
#> # A tibble: 388 × 54
#>    id       sequence_number text  away_score home_score scoring_play score_value
#>    <chr>    <chr>           <chr>      <int>      <int> <lgl>              <int>
#>  1 4012441… 4               Caro…          0          0 FALSE                  0
#>  2 4012441… 7               Nata…          0          0 FALSE                  0
#>  3 4012441… 9               Nata…          0          0 FALSE                  0
#>  4 4012441… 10              Dani…          0          0 FALSE                  0
#>  5 4012441… 11              Caro…          0          0 FALSE                  0
#>  6 4012441… 12              Caro…          2          0 TRUE                   2
#>  7 4012441… 13              Sue …          2          0 FALSE                  0
#>  8 4012441… 14              Las …          2          0 FALSE                  0
#>  9 4012441… 15              A'ja…          4          0 TRUE                   2
#> 10 4012441… 17              Ange…          4          0 FALSE                  0
#> # ℹ 378 more rows
#> # ℹ 47 more variables: wallclock <chr>, shooting_play <lgl>,
#> #   points_attempted <int>, short_description <chr>, type_id <int>,
#> #   type_text <chr>, period_number <int>, period_display_value <chr>,
#> #   clock_display_value <chr>, team_id <int>, coordinate_x_raw <dbl>,
#> #   coordinate_y_raw <dbl>, coordinate_x <dbl>, coordinate_y <dbl>,
#> #   play_id <chr>, athlete_id_1 <int>, athlete_id_2 <int>, …
#> 
#> $Team
#> ── ESPN WNBA Team Box Information from ESPN.com ──────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:07:09 UTC
#> # A tibble: 2 × 57
#>     game_id season season_type game_date  game_date_time      team_id team_uid  
#>       <int>  <int>       <int> <date>     <dttm>                <int> <chr>     
#> 1 401244185   2020           3 2020-10-06 2020-10-06 19:00:00      17 s:40~l:59…
#> 2 401244185   2020           3 2020-10-06 2020-10-06 19:00:00      14 s:40~l:59…
#> # ℹ 50 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>,
#> #   field_goals_made <int>, field_goals_attempted <int>, …
#> 
#> $Player
#> ── ESPN WNBA Player Box Information from ESPN.com ────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:07:09 UTC
#> # A tibble: 25 × 57
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401244185   2020           3 2020-10-06 2020-10-06 19:00:00        872
#>  2 401244185   2020           3 2020-10-06 2020-10-06 19:00:00        982
#>  3 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    3149391
#>  4 401244185   2020           3 2020-10-06 2020-10-06 19:00:00       1014
#>  5 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2529205
#>  6 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2284331
#>  7 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2566452
#>  8 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2491197
#>  9 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    3058908
#> 10 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    4065870
#> # ℹ 15 more rows
#> # ℹ 51 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
#> 
# }

# \donttest{
   try(espn_wnba_pbp(game_id = 401455681))
#> ── ESPN WNBA Play-by-Play Information from ESPN.com ──────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:07:10 UTC
#> # A tibble: 343 × 54
#>    id       sequence_number text  away_score home_score scoring_play score_value
#>    <chr>    <chr>           <chr>      <int>      <int> <lgl>              <int>
#>  1 4014556… 4               Jonq…          0          0 FALSE                  0
#>  2 4014556… 7               A'ja…          0          2 TRUE                   2
#>  3 4014556… 9               Nati…          0          2 FALSE                  0
#>  4 4014556… 10              Kiah…          0          2 FALSE                  0
#>  5 4014556… 11              Jack…          0          5 TRUE                   3
#>  6 4014556… 13              Nati…          3          5 TRUE                   3
#>  7 4014556… 15              A'ja…          3          7 TRUE                   2
#>  8 4014556… 17              Cour…          3          7 FALSE                  0
#>  9 4014556… 18              Kels…          3          7 FALSE                  0
#> 10 4014556… 19              A'ja…          3          9 TRUE                   2
#> # ℹ 333 more rows
#> # ℹ 47 more variables: wallclock <chr>, shooting_play <lgl>,
#> #   points_attempted <int>, short_description <chr>, type_id <int>,
#> #   type_text <chr>, period_number <int>, period_display_value <chr>,
#> #   clock_display_value <chr>, team_id <int>, coordinate_x_raw <dbl>,
#> #   coordinate_y_raw <dbl>, coordinate_x <dbl>, coordinate_y <dbl>,
#> #   play_id <chr>, athlete_id_1 <int>, athlete_id_2 <int>, …
# }

# \donttest{
   try(espn_wnba_team_box(game_id = 401244185))
#> ── ESPN WNBA Team Box Information from ESPN.com ──────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:07:10 UTC
#> # A tibble: 2 × 57
#>     game_id season season_type game_date  game_date_time      team_id team_uid  
#>       <int>  <int>       <int> <date>     <dttm>                <int> <chr>     
#> 1 401244185   2020           3 2020-10-06 2020-10-06 19:00:00      17 s:40~l:59…
#> 2 401244185   2020           3 2020-10-06 2020-10-06 19:00:00      14 s:40~l:59…
#> # ℹ 50 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>,
#> #   field_goals_made <int>, field_goals_attempted <int>, …
# }
# \donttest{
  try(espn_wnba_player_box(game_id = 401244185))
#> ── ESPN WNBA Player Box Information from ESPN.com ────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:07:11 UTC
#> # A tibble: 25 × 57
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401244185   2020           3 2020-10-06 2020-10-06 19:00:00        872
#>  2 401244185   2020           3 2020-10-06 2020-10-06 19:00:00        982
#>  3 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    3149391
#>  4 401244185   2020           3 2020-10-06 2020-10-06 19:00:00       1014
#>  5 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2529205
#>  6 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2284331
#>  7 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2566452
#>  8 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    2491197
#>  9 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    3058908
#> 10 401244185   2020           3 2020-10-06 2020-10-06 19:00:00    4065870
#> # ℹ 15 more rows
#> # ℹ 51 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
# }

# \donttest{
  try(espn_wnba_game_rosters(game_id = 401244185))
#> ── ESPN WNBA Game Roster Information from ESPN.com ───────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:07:12 UTC
#> # A tibble: 24 × 156
#>    athlete_id athlete_uid  athlete_guid athlete_type    sdr first_name last_name
#>         <int> <chr>        <chr>        <chr>         <int> <chr>      <chr>    
#>  1        924 s:40~l:59~a… 09609790-79… basketball   2.24e6 Alysha     Clark    
#>  2    2998928 s:40~l:59~a… 4d83d500-2f… basketball   3.00e6 Breanna    Stewart  
#>  3         91 s:40~l:59~a… e28a886c-1b… basketball   2.09e6 Sue        Bird     
#>  4    2987869 s:40~l:59~a… 6268520f-7d… basketball   2.99e6 Jewell     Loyd     
#>  5        805 s:40~l:59~a… 54d95e90-71… basketball   2.17e6 Crystal    Langhorne
#>  6    2998929 s:40~l:59~a… 2d61e8fa-19… basketball   3.00e6 Morgan     Tuck     
#>  7    4420318 s:40~l:59~a… 1a2b36a5-ad… basketball   4.42e6 Ezi        Magbegor 
#>  8    3056672 s:40~l:59~a… fc7acd4e-21… basketball   3.06e6 Mercedes   Russell  
#>  9        882 s:40~l:59~a… 0230e8a4-7b… basketball   2.28e6 Epiphanny  Prince   
#> 10    3142250 s:40~l:59~a… 6e517eae-e6… basketball   3.14e6 Jordin     Canada   
#> # ℹ 14 more rows
#> # ℹ 149 more variables: full_name <chr>, athlete_display_name <chr>,
#> #   short_name <chr>, weight <dbl>, display_weight <chr>, height <dbl>,
#> #   display_height <chr>, age <int>, date_of_birth <chr>, slug <chr>,
#> #   headshot_href <chr>, headshot_alt <chr>, jersey_x <chr>, position_id <int>,
#> #   position_name <chr>, position_display_name <chr>,
#> #   position_abbreviation <chr>, position_leaf <lgl>, linked <lgl>, …
# }
```

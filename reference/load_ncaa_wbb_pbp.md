# **Load cleaned NCAA women's college basketball play-by-play from the data repo**

Loads season-level NCAA women's college basketball play-by-play. One row
per event, with reconstructed 5-man lineups, possession numbering, shot
context (transition/paint/second-chance), and an ESPN game-id crosswalk.
Produced by the sdv-py `ncaa_wbb` engine (stats.ncaa.org play-by-play
parsed, cleaned, and enriched); backed by the `ncaa-wbb-hoops-data`
pipeline, published to the `ncaa_wbb_pbp` release tag as
csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_pbp(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit season-ending years for NCAA women's college
  basketball (e.g. `2024` for the 2023-24 season). Published coverage
  runs 2010 through the most recent season, with no gaps. Pass
  `seasons = TRUE` for every published season. (Min: 2010)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

Returns a `wehoop_data` tibble with one row per play-by-play event.

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_date | character | Date the game was played (MM/DD/YYYY). |
| home | character | Home team name. |
| away | character | Away team name. |
| period | integer | Period of the game (1-2 halves pre-2016, 1-4 quarters 2016+). |
| clock | character | Game clock remaining in the period (MM:SS). |
| game_time | character | Elapsed game time (MM:SS). |
| game_seconds | integer | Elapsed game time in seconds from tip-off. |
| home_score | integer | Home team score after the event. |
| away_score | integer | Away team score after the event. |
| event_team | character | Team name credited with the play event. |
| event_description | character | Raw play-by-play text description. |
| player_1 | character | Primary player name involved in the event (raw, upper-cased). |
| player_2 | character | Secondary player name involved in the event (raw, upper-cased). |
| event_type | character | Play event type label (e.g. 'made Layup', 'won Jumpball'). |
| event_result | character | Event result ('made', 'missed', or NA for non-shot events). |
| shot_value | integer | Point value of a shot event (2 or 3). |
| event_length | integer | Duration of the event in seconds. |
| poss_num | integer | Sequential possession number within the game. |
| poss_team | character | Team name on offense for the possession. |
| poss_length | integer | Duration of the possession in seconds. |
| is_transition | logical | Whether the play occurred in transition. |
| home_1 | character | Home lineup slot 1 player name (raw). |
| home_2 | character | Home lineup slot 2 player name (raw). |
| home_3 | character | Home lineup slot 3 player name (raw). |
| home_4 | character | Home lineup slot 4 player name (raw). |
| home_5 | character | Home lineup slot 5 player name (raw). |
| away_1 | character | Away lineup slot 1 player name (raw). |
| away_2 | character | Away lineup slot 2 player name (raw). |
| away_3 | character | Away lineup slot 3 player name (raw). |
| away_4 | character | Away lineup slot 4 player name (raw). |
| away_5 | character | Away lineup slot 5 player name (raw). |
| status | character | Row QA status flag ('CLEAN' or a data-quality note). |
| is_garbage_time | logical | Whether the event occurred in garbage time. |
| sub_deviate | integer | Substitution-inference deviation counter used by the lineup reconstructor. |
| contest_id | character | Unique stats.ncaa.org contest identifier. |
| home_ncaa_team_id | character | stats.ncaa.org team identifier for the home team. |
| home_espn_team_id | character | ESPN team identifier for the home team. |
| away_ncaa_team_id | character | stats.ncaa.org team identifier for the away team. |
| away_espn_team_id | character | ESPN team identifier for the away team. |
| event_team_ncaa_team_id | character | stats.ncaa.org team identifier for the event team. |
| event_team_espn_team_id | character | ESPN team identifier for the event team. |
| poss_team_ncaa_team_id | character | stats.ncaa.org team identifier for the possession team. |
| poss_team_espn_team_id | character | ESPN team identifier for the possession team. |
| player_1_id | character | stats.ncaa.org player identifier for player_1. |
| player_1_clean_name | character | Cleaned/title-cased display name for player_1. |
| player_2_id | character | stats.ncaa.org player identifier for player_2. |
| player_2_clean_name | character | Cleaned/title-cased display name for player_2. |
| home_1_player_id | character | stats.ncaa.org player identifier for home lineup slot 1. |
| home_1_clean_name | character | Cleaned display name for home lineup slot 1. |
| home_2_player_id | character | stats.ncaa.org player identifier for home lineup slot 2. |
| home_2_clean_name | character | Cleaned display name for home lineup slot 2. |
| home_3_player_id | character | stats.ncaa.org player identifier for home lineup slot 3. |
| home_3_clean_name | character | Cleaned display name for home lineup slot 3. |
| home_4_player_id | character | stats.ncaa.org player identifier for home lineup slot 4. |
| home_4_clean_name | character | Cleaned display name for home lineup slot 4. |
| home_5_player_id | character | stats.ncaa.org player identifier for home lineup slot 5. |
| home_5_clean_name | character | Cleaned display name for home lineup slot 5. |
| away_1_player_id | character | stats.ncaa.org player identifier for away lineup slot 1. |
| away_1_clean_name | character | Cleaned display name for away lineup slot 1. |
| away_2_player_id | character | stats.ncaa.org player identifier for away lineup slot 2. |
| away_2_clean_name | character | Cleaned display name for away lineup slot 2. |
| away_3_player_id | character | stats.ncaa.org player identifier for away lineup slot 3. |
| away_3_clean_name | character | Cleaned display name for away lineup slot 3. |
| away_4_player_id | character | stats.ncaa.org player identifier for away lineup slot 4. |
| away_4_clean_name | character | Cleaned display name for away lineup slot 4. |
| away_5_player_id | character | stats.ncaa.org player identifier for away lineup slot 5. |
| away_5_clean_name | character | Cleaned display name for away lineup slot 5. |
| espn_game_id | character | ESPN game identifier crosswalked to this contest. |
| is_fastbreak | logical | Whether the play was a fastbreak possession. |
| is_from_turnover | logical | Whether the possession began off a turnover. |
| is_paint | logical | Whether the shot was taken in the paint. |
| is_second_chance | logical | Whether the possession followed an offensive rebound. |
| assist_player | character | Cleaned display name of the player credited with the assist. |
| ft_number | integer | Free throw number within the trip to the line (1st, 2nd, ...). |
| ft_attempts | integer | Total free throws awarded on the trip to the line. |
| foul_class | character | Foul classification ('personal', 'technical', etc.). |
| is_shooting_foul | logical | Whether the foul was a shooting foul. |
| is_looseball_foul | logical | Whether the foul was a loose-ball foul. |
| is_one_and_one | logical | Whether the free throw trip was a one-and-one bonus. |
| is_flagrant | logical | Whether the foul was flagrant. |
| foul_tech_class | character | Technical foul sub-classification (e.g. 'administrative'). |
| ft_awarded | integer | Total free throws awarded for the foul. |
| turnover_type | character | Turnover sub-type (e.g. 'shotclock', 'travel'). |
| is_team_turnover | logical | Whether the turnover is a team turnover (no individual credited). |
| timeout_type | character | Timeout sub-type (e.g. 'short', 'full'). |
| challenge_outcome | character | Replay-challenge outcome, when the event was a review. |
| season | integer | Season identifier (4-digit season-ending year). |

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md),
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_matchup_stints.md),
[`load_ncaa_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_player_box.md),
[`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_possessions.md),
[`load_ncaa_wbb_rapm_within_team()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm_within_team.md),
[`load_ncaa_wbb_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rosters.md),
[`load_ncaa_wbb_schedule()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_schedule.md),
[`load_ncaa_wbb_shots()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_shots.md),
[`load_ncaa_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_box.md),
[`load_ncaa_wbb_team_ids()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_ids.md),
[`load_ncaa_wbb_team_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_rosters.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_ncaa_wbb_pbp(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 2,986,683 × 87
#>    game_date  home          away  period clock game_time game_seconds home_score
#>    <chr>      <chr>         <chr>  <int> <chr> <chr>            <int>      <int>
#>  1 11/03/2025 George Washi… Dist…      1 09:59 00:01                1          0
#>  2 11/03/2025 George Washi… Dist…      1 09:59 00:01                1          0
#>  3 11/03/2025 George Washi… Dist…      1 09:38 00:22               22          0
#>  4 11/03/2025 George Washi… Dist…      1 09:11 00:49               49          0
#>  5 11/03/2025 George Washi… Dist…      1 08:44 01:16               76          2
#>  6 11/03/2025 George Washi… Dist…      1 08:19 01:41              101          2
#>  7 11/03/2025 George Washi… Dist…      1 08:16 01:44              104          2
#>  8 11/03/2025 George Washi… Dist…      1 08:10 01:50              110          5
#>  9 11/03/2025 George Washi… Dist…      1 07:44 02:16              136          5
#> 10 11/03/2025 George Washi… Dist…      1 07:23 02:37              157          5
#> # ℹ 2,986,673 more rows
#> # ℹ 79 more variables: away_score <int>, event_team <chr>,
#> #   event_description <chr>, player_1 <chr>, player_2 <chr>, event_type <chr>,
#> #   event_result <chr>, shot_value <int>, event_length <int>, poss_num <int>,
#> #   poss_team <chr>, poss_length <int>, is_transition <lgl>, home_1 <chr>,
#> #   home_2 <chr>, home_3 <chr>, home_4 <chr>, home_5 <chr>, away_1 <chr>,
#> #   away_2 <chr>, away_3 <chr>, away_4 <chr>, away_5 <chr>, status <chr>, …
# }
```

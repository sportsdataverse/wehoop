# **Load cleaned NCAA women's college basketball play-by-play from the data repo**

Loads season-level NCAA women's college basketball play-by-play. One row
per event, with reconstructed 5-man lineups, possession numbering, shot
context (transition/paint/second-chance), and an ESPN game-id crosswalk.
Produced by the sdv-py `ncaa_wbb` engine (stats.ncaa.org play-by-play
parsed, cleaned, and enriched); backed by the `ncaa-wbb-hoops-data`
pipeline, published to the `ncaa_wbb_pbp` release tag as
csv.gz/parquet/rds.

Loads shot-chart events for NCAA women's college basketball – one row
per field goal attempt, with court coordinates, distance, shot zone, and
made/missed result. Coordinates are only available from the 2019 season
onward (stats.ncaa.org did not publish shot-location data before then),
so `seasons` has a 2019 floor even though most sibling NCAA WBB datasets
start at 2010. Produced by the sdv-py `ncaa_wbb` engine; backed by the
`ncaa-wbb-hoops-data` pipeline, published to the `ncaa_wbb_shots`
release tag as csv.gz/parquet/rds.

Loads reconstructed 5-man lineup stints for NCAA women's college
basketball – one row per contiguous stretch a specific 5-player lineup
was on court for a team, with on/off scoring, shooting, and rebounding
splits plus the matching opponent (`opp_*`) splits. Produced by the
sdv-py `ncaa_wbb` engine's lineup reconstructor; backed by the
`ncaa-wbb-hoops-data` pipeline, published to the `ncaa_wbb_lineups`
release tag as csv.gz/parquet/rds.

Loads reconstructed 10-man matchup stints (the home 5-man lineup crossed
with the away 5-man lineup) for NCAA women's college basketball – one
row per contiguous stretch both lineups were on court together, with the
score at stint start/end and both team's lineup rosters. Produced by the
sdv-py `ncaa_wbb` engine's lineup reconstructor; backed by the
`ncaa-wbb-hoops-data` pipeline, published to the
`ncaa_wbb_matchup_stints` release tag as csv.gz/parquet/rds.

Loads possession-level data for NCAA women's college basketball – one
row per offensive possession, with the on-court 5-man lineups for both
teams, points scored, assist/transition/garbage-time flags, and the
possession's first and last event types. Produced by the sdv-py
`ncaa_wbb` engine's possession detector; backed by the
`ncaa-wbb-hoops-data` pipeline, published to the `ncaa_wbb_possessions`
release tag as csv.gz/parquet/rds.

Loads within-team regularized adjusted plus-minus (RAPM) ratings for
NCAA women's college basketball – one row per player-team-season, fit
against teammate lineup variation within that team's own possessions
(not a cross-team national RAPM). Produced by the sdv-py `ncaa_wbb`
engine's RAPM model on top of the reconstructed lineup/possession data;
backed by the `ncaa-wbb-hoops-data` pipeline, published to the
`ncaa_wbb_rapm_within_team` release tag as csv.gz/parquet/rds.

Loads league-wide regularized adjusted plus-minus (RAPM) ratings for
NCAA women's college basketball – one row per player-season, fit against
lineup variation across all Division I stints for that season (not a
within-team RAPM). Produced by the sdv-py `ncaa_wbb` engine's
league-wide stint-ridge RAPM solver (Torvik-gated to Division I teams)
on top of the reconstructed lineup/possession data; backed by the
`ncaa-wbb-hoops-data` pipeline, published to the `ncaa_wbb_rapm` release
tag as csv.gz/parquet/rds.

Loads advanced per-player, per-game box scores for NCAA women's college
basketball – one row per player-game, with shooting splits by zone
(rim/mid/3), transition and half-court splits, assisted-vs-unassisted
splits, and shot-zone efficiency rates. A superset of the traditional
box score (points/rebounds/assists/steals/blocks/turnovers/fouls are
included alongside the advanced splits). Produced by the sdv-py
`ncaa_wbb` engine; backed by the `ncaa-wbb-hoops-data` pipeline,
published to the `ncaa_wbb_player_box` release tag as
csv.gz/parquet/rds.

Loads advanced per-team, per-game box scores for NCAA women's college
basketball – one row per team-game, with offensive/defensive ratings,
shot-zone rates and efficiency (rim/mid/3), rebounding/assist/turnover
rates, and the matching opponent (`d_*`) splits. Produced by the sdv-py
`ncaa_wbb` engine; backed by the `ncaa-wbb-hoops-data` pipeline,
published to the `ncaa_wbb_team_box` release tag as csv.gz/parquet/rds.

Loads a lightweight season roster for NCAA women's college basketball –
one row per player-team-season with a games-played count. For the fuller
roster (jersey, class, position, height, hometown, high school), use
`load_ncaa_wbb_team_rosters()`. Produced by the sdv-py `ncaa_wbb`
engine; backed by the `ncaa-wbb-hoops-data` pipeline, published to the
`ncaa_wbb_rosters` release tag as csv.gz/parquet/rds.

Loads the full season roster for NCAA women's college basketball – one
row per player-team-season with jersey number, class year, position,
height, hometown, high school, and games played/started. Produced by the
sdv-py `ncaa_wbb` engine; backed by the `ncaa-wbb-hoops-data` pipeline,
published to the `ncaa_wbb_team_rosters` release tag as
csv.gz/parquet/rds.

Loads season schedules/results for NCAA women's college basketball – one
row per game with home/away teams and final scores. Produced by the
sdv-py `ncaa_wbb` engine; backed by the `ncaa-wbb-hoops-data` pipeline,
published to the `ncaa_wbb_schedule` release tag as csv.gz/parquet/rds.

Loads the season-level stats.ncaa.org team-id / conference crosswalk for
NCAA women's college basketball – one row per team-season. Useful for
joining `ncaa_team_id` columns on the other `ncaa_wbb_*` datasets back
to a team name and conference. Produced by the sdv-py `ncaa_wbb` engine;
backed by the `ncaa-wbb-hoops-data` pipeline, published to the
`ncaa_wbb_team_ids` release tag as csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_pbp(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_shots(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_lineups(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_matchup_stints(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_possessions(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_rapm_within_team(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_rapm(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_player_box(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_team_box(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_rosters(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_team_rosters(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_schedule(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_ncaa_wbb_team_ids(
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

Returns a `wehoop_data` tibble with one row per shot attempt.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit season-ending year). |
| team_id | character | Team name of the shooting team (raw scrape field; despite the column name it holds the team name string, not a numeric id – see ncaa_team_id / espn_team_id for the crosswalked ids). |
| shooter_id | character | Raw scrape key for the shooter (see shooter_player_id for the stats.ncaa.org id). |
| shot_x | numeric | Shot chart X coordinate. |
| shot_y | numeric | Shot chart Y coordinate. |
| dist_ft | numeric | Shot distance from the basket, in feet. |
| shot_zone | character | Shot zone label (e.g. 'abovebreak3', 'rim'). |
| shot_type | character | Shot type label from the source play description. |
| made | logical | Whether the shot was made. |
| point_value | integer | Point value of the shot (2 or 3). |
| period | logical | Period of the game (1-2 halves pre-2016, 1-4 quarters 2016+). |
| sec_left | logical | Seconds remaining in the period at the time of the shot. |
| source | character | Source system for the shot record (e.g. 'ncaa'). |
| contest_id | character | Unique stats.ncaa.org contest identifier. |
| ncaa_team_id | character | stats.ncaa.org team identifier for the shooting team. |
| espn_team_id | character | ESPN team identifier for the shooting team. |
| shooter_player_id | character | stats.ncaa.org player identifier for the shooter. |
| shooter_clean_name | character | Cleaned display name for the shooter. |
| espn_game_id | character | ESPN game identifier crosswalked to this contest. |

Returns a `wehoop_data` tibble with one row per lineup stint.

|  |  |  |
|----|----|----|
| col_name | types | description |
| lineup_key | character | Hash key uniquely identifying the 5-player lineup. |
| date | character | Game date/time (ISO 8601). |
| location_type | character | Home/away designation for `team` in this stint ('Home' or 'Away'). |
| team | character | Team name. |
| team_year | integer | Season-start calendar year for the stint. |
| opponent | character | Opponent team name. |
| lineup_id | character | Human-readable lineup identifier built from the five player codes. |
| start_min | numeric | Game-clock minute the lineup entered. |
| end_min | numeric | Game-clock minute the lineup exited. |
| duration_mins | numeric | Minutes the lineup was on court together. |
| player_1 | character | Lineup slot 1 player display name ('Last, First'). |
| player_2 | character | Lineup slot 2 player display name ('Last, First'). |
| player_3 | character | Lineup slot 3 player display name ('Last, First'). |
| player_4 | character | Lineup slot 4 player display name ('Last, First'). |
| player_5 | character | Lineup slot 5 player display name ('Last, First'). |
| players_in | character | Player(s) substituted into the lineup at the start of the stint. |
| players_out | character | Player(s) substituted out of the lineup at the start of the stint. |
| start_scored | integer | Team's points scored at the moment the lineup entered. |
| start_allowed | integer | Points allowed at the moment the lineup entered. |
| end_scored | integer | Team's points scored at the moment the lineup exited. |
| end_allowed | integer | Points allowed at the moment the lineup exited. |
| start_diff | integer | Score differential at the moment the lineup entered. |
| end_diff | integer | Score differential at the moment the lineup exited. |
| player_count_error | logical | Flag set when fewer/more than 5 players were reconstructed for the stint. |
| poss | integer | Possessions played by the lineup. |
| pts | integer | Points scored. |
| plus_minus | integer | Point differential while the lineup was on court. |
| fga | integer | Field goal attempts by the lineup. |
| fgm | integer | Field goals made by the lineup. |
| rima | integer | Rim-area shot attempts. |
| rimm | integer | Rim-area shots made. |
| rim_ast | integer | Rim-area makes that came off an assist. |
| mida | integer | Mid-range shot attempts. |
| midm | integer | Mid-range shots made. |
| mid_ast | integer | Mid-range makes that came off an assist. |
| fg2a | integer | 2-point field goal attempts by the lineup. |
| fg2m | integer | 2-point field goals made by the lineup. |
| tpa | integer | 3-point field goal attempts. |
| tpm | integer | 3-point field goals made. |
| tp_ast | integer | 3-pointers made that came off an assist. |
| fta | integer | Free throw attempts by the lineup. |
| ftm | integer | Free throws made by the lineup. |
| orb | integer | Offensive rebounds. |
| drb | integer | Defensive rebounds. |
| to | integer | Turnovers by the lineup. |
| stl | integer | Steals. |
| blk | integer | Blocks. |
| ast | integer | Assists. |
| foul | integer | Personal fouls. |
| opp_poss | integer | Opponent possessions while this lineup was on court. |
| opp_pts | integer | Opponent points scored while this lineup was on court. |
| opp_plus_minus | integer | Opponent point differential while this lineup was on court (negative of `plus_minus`). |
| opp_fga | integer | Opponent field goal attempts. |
| opp_fgm | integer | Opponent field goals made. |
| opp_rima | integer | Opponent rim-area shot attempts. |
| opp_rimm | integer | Opponent rim-area shots made. |
| opp_rim_ast | integer | Opponent rim-area makes that came off an assist. |
| opp_mida | integer | Opponent mid-range shot attempts. |
| opp_midm | integer | Opponent mid-range shots made. |
| opp_mid_ast | integer | Opponent mid-range makes that came off an assist. |
| opp_fg2a | integer | Opponent 2-point field goal attempts. |
| opp_fg2m | integer | Opponent 2-point field goals made. |
| opp_tpa | integer | Opponent 3-point field goal attempts. |
| opp_tpm | integer | Opponent 3-point field goals made. |
| opp_tp_ast | integer | Opponent 3-pointers made that came off an assist. |
| opp_fta | integer | Opponent free throw attempts. |
| opp_ftm | integer | Opponent free throws made. |
| opp_orb | integer | Opponent offensive rebounds. |
| opp_drb | integer | Opponent defensive rebounds. |
| opp_to | integer | Opponent turnovers. |
| opp_stl | integer | Opponent steals. |
| opp_blk | integer | Opponent blocks. |
| opp_ast | integer | Opponent assists. |
| opp_foul | integer | Opponent personal fouls. |
| stint_num | integer | Sequential stint number for this lineup within the game. |
| contest_id | character | Unique stats.ncaa.org contest identifier. |
| season | integer | Season identifier (4-digit season-ending year). |

Returns a `wehoop_data` tibble with one row per matchup stint.

|  |  |  |
|----|----|----|
| col_name | types | description |
| contest_id | character | Unique stats.ncaa.org contest identifier. |
| season | integer | Season identifier (4-digit season-ending year). |
| game_date | character | Date the game was played (MM/DD/YYYY). |
| home | character | Home team name. |
| away | character | Away team name. |
| game_stint_num | integer | Sequential stint number within the game (all 10-man matchups). |
| period | integer | Period of the game (1-2 halves pre-2016, 1-4 quarters 2016+). |
| start_seconds | integer | Elapsed game seconds at the start of the stint. |
| end_seconds | integer | Elapsed game seconds at the end of the stint. |
| duration_seconds | integer | Duration of the stint in seconds. |
| matchup_key | character | Hash key uniquely identifying the home-lineup/away-lineup matchup. |
| home_lineup_key | character | Hash key for the home team's 5-player lineup. |
| away_lineup_key | character | Hash key for the away team's 5-player lineup. |
| home_lineup | character | Pipe-delimited list of the 5 home players on court. |
| away_lineup | character | Pipe-delimited list of the 5 away players on court. |
| end_home_score | integer | Home team score at the end of the stint. |
| end_away_score | integer | Away team score at the end of the stint. |
| n_events | integer | Number of play-by-play events within the stint. |
| n_possessions | integer | Number of possessions within the stint. |
| start_home_score | integer | Home team score at the start of the stint. |
| start_away_score | integer | Away team score at the start of the stint. |
| home_pts | integer | Points scored by the home team during the stint. |
| away_pts | integer | Points scored by the away team during the stint. |
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

Returns a `wehoop_data` tibble with one row per possession.

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_date | character | Date the game was played (MM/DD/YYYY). |
| home | character | Home team name. |
| away | character | Away team name. |
| period | integer | Period of the game (1-2 halves pre-2016, 1-4 quarters 2016+). |
| poss_num | integer | Sequential possession number within the game. |
| poss_team | character | Team name on offense for the possession. |
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
| home_score | integer | Home team score after the event. |
| away_score | integer | Away team score after the event. |
| pts | integer | Points scored. |
| is_assisted | integer | Whether the possession ended in an assisted make. |
| is_transition | integer | Whether the play occurred in transition. |
| is_garbage_time | integer | Whether the event occurred in garbage time. |
| start_event_type | character | Event type that started the possession. |
| first_shot_time | integer | Elapsed game seconds at the possession's first shot attempt. |
| first_shot_type | character | Event type of the possession's first shot attempt. |
| last_event_time | integer | Elapsed game seconds at the possession's final event. |
| last_event_type | character | Event type of the possession's final event. |
| contest_id | character | Unique stats.ncaa.org contest identifier. |
| home_ncaa_team_id | character | stats.ncaa.org team identifier for the home team. |
| home_espn_team_id | character | ESPN team identifier for the home team. |
| away_ncaa_team_id | character | stats.ncaa.org team identifier for the away team. |
| away_espn_team_id | character | ESPN team identifier for the away team. |
| poss_team_ncaa_team_id | character | stats.ncaa.org team identifier for the possession team. |
| poss_team_espn_team_id | character | ESPN team identifier for the possession team. |
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
| season | integer | Season identifier (4-digit season-ending year). |

Returns a `wehoop_data` tibble with one row per player-team-season.

|  |  |  |
|----|----|----|
| col_name | types | description |
| team | character | Team name. |
| player_code | character | Player display name as 'Last, First' used as the RAPM join key. |
| rapm_off | numeric | Within-team offensive regularized adjusted plus-minus. |
| rapm_def | numeric | Within-team defensive regularized adjusted plus-minus. |
| team_off_poss | numeric | Team offensive possessions used in the RAPM fit. |
| num_players | integer | Number of teammates included in the within-team RAPM fit. |
| rapm_net | numeric | Within-team net regularized adjusted plus-minus (rapm_off + rapm_def). |
| season | integer | Season identifier (4-digit season-ending year). |
| player_id | character | stats.ncaa.org player identifier. |
| team_id | character | Unique team identifier. |
| person_id | character | Internal person identifier used to join across seasons/teams. |

Returns a `wehoop_data` tibble with one row per player-season.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit season-ending year). |
| player_id | character | stats.ncaa.org player identifier. |
| person_id | character | Internal person identifier used to join across seasons/teams. |
| player | character | Player display name ('LAST.FIRST' format). |
| team | character | Team name. |
| orapm | numeric | League-wide offensive regularized adjusted plus-minus. |
| drapm | numeric | League-wide defensive regularized adjusted plus-minus. |
| rapm_net | numeric | League-wide net regularized adjusted plus-minus (orapm + drapm). |
| off_poss | integer | Offensive possessions used in the RAPM fit. |
| def_poss | integer | Defensive possessions used in the RAPM fit. |
| estimand | character | Estimand tag for the RAPM fit (e.g. 'league' for the Division I stint solve). |

Returns a `wehoop_data` tibble with one row per player-game.

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_date | character | Date the game was played (MM/DD/YYYY). |
| home | character | Home team name. |
| away | character | Away team name. |
| team | character | Team name. |
| player | character | Player name (raw, upper-cased). |
| mins | numeric | Minutes played. |
| o_poss | numeric | Offensive possessions played. |
| pts | numeric | Points scored. |
| orb | numeric | Offensive rebounds. |
| drb | numeric | Defensive rebounds. |
| ast | numeric | Assists. |
| stl | numeric | Steals. |
| blk | numeric | Blocks. |
| tov | numeric | Turnovers. |
| pf | numeric | Personal fouls. |
| ts_pct | numeric | True shooting percentage. |
| efg_pct | numeric | Effective field goal percentage. |
| fgm | numeric | Field goals made by the lineup. |
| fga | numeric | Field goal attempts by the lineup. |
| fg_pct | numeric | Field goal percentage. |
| tpm | numeric | 3-point field goals made. |
| tpa | numeric | 3-point field goal attempts. |
| tp_pct | numeric | 3-point field goal percentage. |
| ftm | numeric | Free throws made by the lineup. |
| fta | numeric | Free throw attempts by the lineup. |
| ft_pct | numeric | Free throw percentage. |
| rimm | numeric | Rim-area shots made. |
| rima | numeric | Rim-area shot attempts. |
| rim_pct | numeric | Rim-area field goal percentage. |
| midm | numeric | Mid-range shots made. |
| mida | numeric | Mid-range shot attempts. |
| mid_pct | numeric | Mid-range field goal percentage. |
| pbackm | numeric | Post/back-to-basket shots made. |
| pbacka | numeric | Post/back-to-basket attempts. |
| pback_pct | numeric | Post/back-to-basket shooting percentage. |
| blk_rim | numeric | Blocked shots at the rim. |
| blk_mid | numeric | Blocked mid-range shots. |
| blk_three | numeric | Blocked 3-point attempts. |
| pct_fga_trans | numeric | Share of field goal attempts taken in transition. |
| pct_tpa_trans | numeric | Share of 3-point attempts taken in transition. |
| pct_rima_trans | numeric | Share of rim-area attempts taken in transition. |
| pct_fgm_trans | numeric | Share of field goals made in transition. |
| pct_tpm_trans | numeric | Share of 3-pointers made in transition. |
| pct_rimm_trans | numeric | Share of rim-area shots made in transition. |
| pct_fgm_ast | numeric | Share of field goals made that were assisted. |
| pct_tpm_ast | numeric | Share of 3-pointers made that were assisted. |
| pct_rimm_ast | numeric | Share of rim-area shots made that were assisted. |
| pts_trans | numeric | Points scored in transition. |
| orb_trans | numeric | Offensive rebounds in transition possessions. |
| drb_trans | numeric | Defensive rebounds in transition possessions. |
| ast_trans | numeric | Assists in transition possessions. |
| stl_trans | numeric | Steals in transition possessions. |
| blk_trans | numeric | Blocks in transition possessions. |
| tov_trans | numeric | Turnovers in transition possessions. |
| ts_pct_trans | numeric | True shooting percentage in transition possessions. |
| efg_pct_trans | numeric | Effective field goal percentage in transition possessions. |
| fgm_trans | numeric | Field goals made in transition possessions. |
| fga_trans | numeric | Field goal attempts in transition possessions. |
| fg_pct_trans | numeric | Field goal percentage in transition possessions. |
| tpm_trans | numeric | 3-point field goals made in transition possessions. |
| tpa_trans | numeric | 3-point field goal attempts in transition possessions. |
| tp_pct_trans | numeric | 3-point field goal percentage in transition possessions. |
| ftm_trans | numeric | Free throws made in transition possessions. |
| fta_trans | numeric | Free throw attempts in transition possessions. |
| ft_pct_trans | numeric | Free throw percentage in transition possessions. |
| rimm_trans | numeric | Rim-area shots made in transition possessions. |
| rima_trans | numeric | Rim-area shot attempts in transition possessions. |
| rim_pct_trans | numeric | Rim-area field goal percentage in transition possessions. |
| midm_trans | numeric | Mid-range shots made in transition possessions. |
| mida_trans | numeric | Mid-range shot attempts in transition possessions. |
| mid_pct_trans | numeric | Mid-range field goal percentage in transition possessions. |
| pts_half | numeric | Points scored in half-court possessions. |
| orb_half | numeric | Offensive rebounds in half-court possessions. |
| drb_half | numeric | Defensive rebounds in half-court possessions. |
| ast_half | numeric | Assists in half-court possessions. |
| stl_half | numeric | Steals in half-court possessions. |
| blk_half | numeric | Blocks in half-court possessions. |
| tov_half | numeric | Turnovers in half-court possessions. |
| ts_pct_half | numeric | True shooting percentage in half-court possessions. |
| efg_pct_half | numeric | Effective field goal percentage in half-court possessions. |
| fgm_half | numeric | Field goals made in half-court possessions. |
| fga_half | numeric | Field goal attempts in half-court possessions. |
| fg_pct_half | numeric | Field goal percentage in half-court possessions. |
| tpm_half | numeric | 3-point field goals made in half-court possessions. |
| tpa_half | numeric | 3-point field goal attempts in half-court possessions. |
| tp_pct_half | numeric | 3-point field goal percentage in half-court possessions. |
| ftm_half | numeric | Free throws made in half-court possessions. |
| fta_half | numeric | Free throw attempts in half-court possessions. |
| ft_pct_half | numeric | Free throw percentage in half-court possessions. |
| rimm_half | numeric | Rim-area shots made in half-court possessions. |
| rima_half | numeric | Rim-area shot attempts in half-court possessions. |
| rim_pct_half | numeric | Rim-area field goal percentage in half-court possessions. |
| midm_half | numeric | Mid-range shots made in half-court possessions. |
| mida_half | numeric | Mid-range shot attempts in half-court possessions. |
| mid_pct_half | numeric | Mid-range field goal percentage in half-court possessions. |
| pts_ast | numeric | Points scored off an assisted make. |
| fgm_ast | numeric | Field goals made that came off an assist. |
| tpm_ast | numeric | 3-point field goals made that came off an assist. |
| rimm_ast | numeric | Rim-area shots made that came off an assist. |
| midm_ast | numeric | Mid-range shots made that came off an assist. |
| pts_unast | numeric | Points scored off an unassisted make. |
| efg_pct_unast | numeric | Effective field goal percentage that were unassisted. |
| fgm_unast | numeric | Field goals made that were unassisted. |
| fga_unast | numeric | Field goal attempts that were unassisted. |
| fg_pct_unast | numeric | Field goal percentage that were unassisted. |
| tpm_unast | numeric | 3-point field goals made that were unassisted. |
| tpa_unast | numeric | 3-point field goal attempts that were unassisted. |
| tp_pct_unast | numeric | 3-point field goal percentage that were unassisted. |
| rimm_unast | numeric | Rim-area shots made that were unassisted. |
| rima_unast | numeric | Rim-area shot attempts that were unassisted. |
| rim_pct_unast | numeric | Rim-area field goal percentage that were unassisted. |
| midm_unast | numeric | Mid-range shots made that were unassisted. |
| mida_unast | numeric | Mid-range shot attempts that were unassisted. |
| mid_pct_unast | numeric | Mid-range field goal percentage that were unassisted. |
| contest_id | character | Unique stats.ncaa.org contest identifier. |
| home_ncaa_team_id | character | stats.ncaa.org team identifier for the home team. |
| home_espn_team_id | character | ESPN team identifier for the home team. |
| away_ncaa_team_id | character | stats.ncaa.org team identifier for the away team. |
| away_espn_team_id | character | ESPN team identifier for the away team. |
| team_ncaa_team_id | character | stats.ncaa.org team identifier. |
| team_espn_team_id | character | ESPN team identifier. |
| player_id | character | stats.ncaa.org player identifier. |
| clean_name | character | Cleaned/title-cased display name. |
| espn_game_id | character | ESPN game identifier crosswalked to this contest. |
| season | integer | Season identifier (4-digit season-ending year). |

Returns a `wehoop_data` tibble with one row per team-game.

|  |  |  |
|----|----|----|
| col_name | types | description |
| home | character | Home team name. |
| away | character | Away team name. |
| team | character | Team name. |
| mins | numeric | Minutes played. |
| o_mins | numeric | Minutes with the team on offense. |
| d_mins | numeric | Minutes with the team on defense. |
| o_poss | numeric | Offensive possessions played. |
| d_poss | numeric | Defensive possessions played. |
| ortg | numeric | Offensive rating (points per 100 possessions). |
| drtg | numeric | Defensive rating (points allowed per 100 possessions). |
| netrtg | numeric | Net rating (ortg minus drtg). |
| pts | numeric | Points scored. |
| d_pts | numeric | Points allowed. |
| fga | numeric | Field goal attempts by the lineup. |
| d_fga | numeric | Opponent field goal attempts. |
| fgm | numeric | Field goals made by the lineup. |
| d_fgm | numeric | Opponent field goals made. |
| tpa | numeric | 3-point field goal attempts. |
| d_tpa | numeric | Opponent 3-point attempts. |
| tpm | numeric | 3-point field goals made. |
| d_tpm | numeric | Opponent 3-pointers made. |
| fta | numeric | Free throw attempts by the lineup. |
| d_fta | numeric | Opponent free throw attempts. |
| ftm | numeric | Free throws made by the lineup. |
| d_ftm | numeric | Opponent free throws made. |
| rima | numeric | Rim-area shot attempts. |
| d_rima | numeric | Opponent rim-area attempts. |
| rimm | numeric | Rim-area shots made. |
| d_rimm | numeric | Opponent rim-area shots made. |
| orb | numeric | Offensive rebounds. |
| d_orb | numeric | Opponent offensive rebounds. |
| drb | numeric | Defensive rebounds. |
| d_drb | numeric | Opponent defensive rebounds. |
| blk | numeric | Blocks. |
| d_blk | numeric | Opponent blocks. |
| to | numeric | Turnovers by the lineup. |
| d_to | numeric | Opponent turnovers. |
| ast | numeric | Assists. |
| d_ast | numeric | Opponent assists. |
| e_poss | numeric | Estimated possessions (alternate possession estimator). |
| fg_pct | numeric | Field goal percentage. |
| d_fg_pct | numeric | Opponent field goal percentage. |
| tpp | numeric | 3-point field goal percentage. |
| d_tpp | numeric | Opponent 3-point percentage. |
| ftp | numeric | Free throw percentage. |
| d_ftp | numeric | Opponent free throw percentage. |
| efg_pct | numeric | Effective field goal percentage. |
| d_efg_pct | numeric | Opponent effective field goal percentage. |
| ts_pct | numeric | True shooting percentage. |
| d_ts_pct | numeric | Opponent true shooting percentage. |
| rim_pct | numeric | Rim-area field goal percentage. |
| d_rim_pct | numeric | Opponent rim-area field goal percentage. |
| mid_pct | numeric | Mid-range field goal percentage. |
| d_mid_pct | numeric | Opponent mid-range field goal percentage. |
| tp_rate | numeric | Share of shot attempts taken from 3-point range. |
| d_tp_rate | numeric | Opponent share of shot attempts from 3-point range. |
| rim_rate | numeric | Share of shot attempts taken at the rim. |
| d_rim_rate | numeric | Opponent share of shot attempts at the rim. |
| mid_rate | numeric | Share of shot attempts taken mid-range. |
| d_mid_rate | numeric | Opponent share of shot attempts mid-range. |
| ft_rate | numeric | Free throw rate (FTA per FGA). |
| d_ft_rate | numeric | Opponent free throw rate. |
| ast_rate | numeric | Assist rate. |
| d_ast_rate | numeric | Opponent assist rate. |
| to_rate | numeric | Turnover rate. |
| d_to_rate | numeric | Opponent turnover rate. |
| blk_rate | numeric | Block rate. |
| o_blk_rate | numeric | Offensive possessions ending in a block allowed, as a rate. |
| orb_pct | numeric | Offensive rebound percentage. |
| drb_pct | numeric | Defensive rebound percentage. |
| time_per_poss | numeric | Average seconds per possession. |
| d_time_per_poss | numeric | Opponent average seconds per possession. |
| contest_id | character | Unique stats.ncaa.org contest identifier. |
| home_ncaa_team_id | character | stats.ncaa.org team identifier for the home team. |
| home_espn_team_id | character | ESPN team identifier for the home team. |
| away_ncaa_team_id | character | stats.ncaa.org team identifier for the away team. |
| away_espn_team_id | character | ESPN team identifier for the away team. |
| team_ncaa_team_id | character | stats.ncaa.org team identifier. |
| team_espn_team_id | character | ESPN team identifier. |
| espn_game_id | character | ESPN game identifier crosswalked to this contest. |
| season | integer | Season identifier (4-digit season-ending year). |

Returns a `wehoop_data` tibble with one row per player-team-season.

|          |           |                                                 |
|----------|-----------|-------------------------------------------------|
| col_name | types     | description                                     |
| season   | integer   | Season identifier (4-digit season-ending year). |
| team     | character | Team name.                                      |
| player   | character | Player name (raw, upper-cased).                 |
| games    | integer   | Games played (season total).                    |

Returns a `wehoop_data` tibble with one row per player-team-season.

|             |           |                                                 |
|-------------|-----------|-------------------------------------------------|
| col_name    | types     | description                                     |
| season      | integer   | Season identifier (4-digit season-ending year). |
| team_id     | character | Unique team identifier.                         |
| team        | character | Team name.                                      |
| player_id   | character | stats.ncaa.org player identifier.               |
| player      | character | Player name (raw, upper-cased).                 |
| clean_name  | character | Cleaned/title-cased display name.               |
| name        | character | Player full display name.                       |
| jersey      | character | Jersey number.                                  |
| class       | character | Class year (e.g. 'Fr.', 'So.', 'Jr.', 'Sr.').   |
| position    | character | Position abbreviation.                          |
| height      | character | Height as a 'feet-inches' string (e.g. '6-1').  |
| ht_inches   | integer   | Height in total inches.                         |
| hometown    | character | Player hometown (city, state).                  |
| high_school | character | Player high school.                             |
| gp          | character | Games played.                                   |
| gs          | character | Games started.                                  |

Returns a `wehoop_data` tibble with one row per game.

|            |           |                                                 |
|------------|-----------|-------------------------------------------------|
| col_name   | types     | description                                     |
| contest_id | character | Unique stats.ncaa.org contest identifier.       |
| game_date  | character | Date the game was played (MM/DD/YYYY).          |
| home       | character | Home team name.                                 |
| away       | character | Away team name.                                 |
| home_score | integer   | Home team score after the event.                |
| away_score | integer   | Away team score after the event.                |
| season     | integer   | Season identifier (4-digit season-ending year). |

Returns a `wehoop_data` tibble with one row per team-season.

|            |           |                                                 |
|------------|-----------|-------------------------------------------------|
| col_name   | types     | description                                     |
| team       | character | Team name.                                      |
| conference | character | Conference affiliation.                         |
| id         | character | stats.ncaa.org team identifier.                 |
| season     | integer   | Season identifier (4-digit season-ending year). |

## Details

League-wide regularized adjusted plus-minus – a single ridge fit over
all Division I stints per season, distinct from
`load_ncaa_wbb_rapm_within_team()`'s within-team fit. Published coverage
runs seasons 2011 through 2026.

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
# \donttest{
  try(load_ncaa_wbb_shots(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 708,038 × 19
#>    season team_id     shooter_id shot_x shot_y dist_ft shot_zone shot_type made 
#>     <int> <chr>       <chr>       <dbl>  <dbl>   <dbl> <chr>     <chr>     <lgl>
#>  1   2026 Dist. Colu… KrHarris      9    18.5    20.6  mid       unknown   TRUE 
#>  2   2026 George Was… MiJames      -8    13.8    16.0  mid       unknown   TRUE 
#>  3   2026 Dist. Colu… DaColeman   -16.5  18.5    24.8  abovebre… unknown   FALSE
#>  4   2026 George Was… KaSims       22     6.28   22.9  corner3   unknown   TRUE 
#>  5   2026 Dist. Colu… AiEllis       2     2.52    3.22 rim       unknown   TRUE 
#>  6   2026 George Was… EmTheodor…   -2.5   2.52    3.55 rim       unknown   TRUE 
#>  7   2026 George Was… KaSims      -14.5  21.3    25.8  abovebre… unknown   TRUE 
#>  8   2026 Dist. Colu… AiEllis       3.5  -0.3     3.51 rim       unknown   FALSE
#>  9   2026 George Was… GaReynolds  -19    17.6    25.9  abovebre… unknown   TRUE 
#> 10   2026 Dist. Colu… AiEllis       3    24.1    24.3  abovebre… unknown   FALSE
#> # ℹ 708,028 more rows
#> # ℹ 10 more variables: point_value <int>, period <???>, sec_left <???>,
#> #   source <chr>, contest_id <chr>, ncaa_team_id <chr>, espn_team_id <chr>,
#> #   shooter_player_id <chr>, shooter_clean_name <chr>, espn_game_id <chr>
# }
# \donttest{
  try(load_ncaa_wbb_lineups(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 286,277 × 77
#>    lineup_key   date  location_type team  team_year opponent lineup_id start_min
#>    <chr>        <chr> <chr>         <chr>     <int> <chr>    <chr>         <dbl>
#>  1 df6fae292b6… 2025… Home          Geor…      2025 Dist. C… MiJames_…      0   
#>  2 2f2aac04c50… 2025… Home          Geor…      2025 Dist. C… CoPhiri_…     33.3 
#>  3 24edf54ac02… 2025… Home          Geor…      2025 Dist. C… CoPhiri_…     34.2 
#>  4 985e9726e60… 2025… Home          Geor…      2025 Dist. C… MiJames_…     34.6 
#>  5 f4de5f52ce5… 2025… Home          Geor…      2025 Dist. C… CoPhiri_…     36.9 
#>  6 e1c6a31d4f9… 2025… Home          Geor…      2025 Dist. C… CoPhiri_…      9.10
#>  7 b9749a2194c… 2025… Home          Geor…      2025 Dist. C… EmTheodo…     10   
#>  8 b00030feb96… 2025… Home          Geor…      2025 Dist. C… JaWilson…     12.4 
#>  9 f0274ff383f… 2025… Home          Geor…      2025 Dist. C… GaReynol…     14.5 
#> 10 893c7c14841… 2025… Home          Geor…      2025 Dist. C… CoPhiri_…     15.6 
#> # ℹ 286,267 more rows
#> # ℹ 69 more variables: end_min <dbl>, duration_mins <dbl>, player_1 <chr>,
#> #   player_2 <chr>, player_3 <chr>, player_4 <chr>, player_5 <chr>,
#> #   players_in <chr>, players_out <chr>, start_scored <int>,
#> #   start_allowed <int>, end_scored <int>, end_allowed <int>, start_diff <int>,
#> #   end_diff <int>, player_count_error <???>, poss <int>, pts <int>,
#> #   plus_minus <int>, fga <int>, fgm <int>, rima <int>, rimm <int>, …
# }
# \donttest{
  try(load_ncaa_wbb_matchup_stints(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 208,582 × 33
#>    contest_id season game_date  home   away  game_stint_num period start_seconds
#>    <chr>       <int> <chr>      <chr>  <chr>          <int>  <int>         <int>
#>  1 6387146      2026 11/03/2025 Georg… Dist…              1      1             1
#>  2 6387146      2026 11/03/2025 Georg… Dist…              2      1           264
#>  3 6387146      2026 11/03/2025 Georg… Dist…              3      1           351
#>  4 6387146      2026 11/03/2025 Georg… Dist…              4      1           402
#>  5 6387146      2026 11/03/2025 Georg… Dist…              5      1           482
#>  6 6387146      2026 11/03/2025 Georg… Dist…              6      1           543
#>  7 6387146      2026 11/03/2025 Georg… Dist…              7      1           554
#>  8 6387146      2026 11/03/2025 Georg… Dist…              8      2           600
#>  9 6387146      2026 11/03/2025 Georg… Dist…              9      2           685
#> 10 6387146      2026 11/03/2025 Georg… Dist…             10      2           794
#> # ℹ 208,572 more rows
#> # ℹ 25 more variables: end_seconds <int>, duration_seconds <int>,
#> #   matchup_key <chr>, home_lineup_key <chr>, away_lineup_key <chr>,
#> #   home_lineup <chr>, away_lineup <chr>, end_home_score <int>,
#> #   end_away_score <int>, n_events <int>, n_possessions <int>,
#> #   start_home_score <int>, start_away_score <int>, home_pts <int>,
#> #   away_pts <int>, home_1 <chr>, home_2 <chr>, home_3 <chr>, home_4 <chr>, …
# }
# \donttest{
  try(load_ncaa_wbb_possessions(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 862,940 × 56
#>    game_date  home   away  period poss_num poss_team home_1 home_2 home_3 home_4
#>    <chr>      <chr>  <chr>  <int>    <int> <chr>     <chr>  <chr>  <chr>  <chr> 
#>  1 11/03/2025 Georg… Dist…      1        1 George W… EMMA.… GABBY… KAMAR… MIA.J…
#>  2 11/03/2025 Georg… Dist…      1        2 Dist. Co… EMMA.… GABBY… KAMAR… MIA.J…
#>  3 11/03/2025 Georg… Dist…      1        3 George W… EMMA.… GABBY… KAMAR… MIA.J…
#>  4 11/03/2025 Georg… Dist…      1        4 Dist. Co… EMMA.… GABBY… KAMAR… MIA.J…
#>  5 11/03/2025 Georg… Dist…      1        5 George W… EMMA.… GABBY… KAMAR… MIA.J…
#>  6 11/03/2025 Georg… Dist…      1        6 Dist. Co… EMMA.… GABBY… KAMAR… MIA.J…
#>  7 11/03/2025 Georg… Dist…      1        7 George W… EMMA.… GABBY… KAMAR… MIA.J…
#>  8 11/03/2025 Georg… Dist…      1        8 Dist. Co… EMMA.… GABBY… KAMAR… MIA.J…
#>  9 11/03/2025 Georg… Dist…      1        9 George W… EMMA.… GABBY… KAMAR… MIA.J…
#> 10 11/03/2025 Georg… Dist…      1       10 Dist. Co… EMMA.… GABBY… KAMAR… MIA.J…
#> # ℹ 862,930 more rows
#> # ℹ 46 more variables: home_5 <chr>, away_1 <chr>, away_2 <chr>, away_3 <chr>,
#> #   away_4 <chr>, away_5 <chr>, home_score <int>, away_score <int>, pts <int>,
#> #   is_assisted <int>, is_transition <int>, is_garbage_time <int>,
#> #   start_event_type <chr>, first_shot_time <int>, first_shot_type <chr>,
#> #   last_event_time <int>, last_event_type <chr>, contest_id <chr>,
#> #   home_ncaa_team_id <chr>, home_espn_team_id <chr>, …
# }
# \donttest{
  try(load_ncaa_wbb_rapm_within_team(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 4,118 × 11
#>    team  player_code rapm_off rapm_def team_off_poss num_players rapm_net season
#>    <chr> <chr>          <dbl>    <dbl>         <dbl>       <int>    <dbl>  <int>
#>  1 A&M-… Shelton, M…   -1.90     2.36           1862           9    -4.26   2026
#>  2 A&M-… Walker, As…   -2.05     2.22           1862           9    -4.27   2026
#>  3 A&M-… Slocum, Tr…   -2.71    -0.310          1862           9    -2.40   2026
#>  4 A&M-… Wooten, Ch…   -3.07     2.35           1862           9    -5.42   2026
#>  5 A&M-… Sevier, To…   -2.27    -0.119          1862           9    -2.15   2026
#>  6 A&M-… Holliday, …   -0.962    0.345          1862           9    -1.31   2026
#>  7 A&M-… Williams, …   -1.44     1.35           1862           9    -2.79   2026
#>  8 A&M-… Watson, Sa…   -1.13     2.46           1862           9    -3.59   2026
#>  9 A&M-… Anguera, B…   -2.57     0.988          1862           9    -3.56   2026
#> 10 Abil… Davis, Bre…    1.87    -0.929          2168          12     2.80   2026
#> # ℹ 4,108 more rows
#> # ℹ 3 more variables: player_id <chr>, team_id <chr>, person_id <chr>
# }
# \donttest{
  try(load_ncaa_wbb_rapm(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 4,596 × 11
#>    season player_id person_id     player     team  orapm drapm rapm_net off_poss
#>     <int> <chr>     <chr>         <chr>      <chr> <dbl> <dbl>    <dbl>    <int>
#>  1   2026 9341835   pedde933d1164 SARAH.STR… UConn 11.2   8.44     19.7     1954
#>  2   2026 9342055   p04aec3b0b845 MADISON.B… Texas  8.53  9.21     17.7     2328
#>  3   2026 10809355  pa5aeb0eead4a AZZI.FUDD  UConn  8.04  8.95     17.0     2088
#>  4   2026 9342023   p664f8ed3b328 JOYCE.EDW… Sout…  8.33  7.52     15.9     2270
#>  5   2026 9343365   pab59a68757fa GABRIELA.… UCLA   8.72  6.03     14.8     1998
#>  6   2026 9341960   p3950ead3c152 HANNAH.HI… Notr…  6.84  7.68     14.5     2316
#>  7   2026 10802884  p1b97dafd99e9 MADINA.OK… Sout…  8.93  4.96     13.9     1678
#>  8   2026 9342060   p81f1d7261d79 JORDAN.LEE Texas  8.86  4.61     13.5     2260
#>  9   2026 10011276  p0e80e1c24e79 MILAYSIA.… LSU    6.47  6.95     13.4     1567
#> 10   2026 9341828   p797f514500dc ASHLYNN.S… UConn  4.69  8.40     13.1     1934
#> # ℹ 4,586 more rows
#> # ℹ 2 more variables: def_poss <int>, estimand <chr>
# }
# \donttest{
  try(load_ncaa_wbb_player_box(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 121,918 × 125
#>    game_date home  away  team  player  mins o_poss   pts   orb   drb   ast   stl
#>    <chr>     <chr> <chr> <chr> <chr>  <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1 11/03/20… Geor… Dist… Dist… AIYAN…  34.8     60     4     1     2     1     1
#>  2 11/03/20… Geor… Dist… Dist… CALIS…  26.5     47     8     1     1     0     0
#>  3 11/03/20… Geor… Dist… Dist… DASHA…  27.2     46    10     0     1     1     1
#>  4 11/03/20… Geor… Dist… Dist… KRIST…  33.0     55     6     1     1     4     0
#>  5 11/03/20… Geor… Dist… Dist… LEASI…  29.7     53     6     2     4     0     0
#>  6 11/03/20… Geor… Dist… Dist… MAYA.…  31.6     52    10     0     2     1     0
#>  7 11/03/20… Geor… Dist… Dist… NHAIK…  16.6     27     3     1     0     1     1
#>  8 11/03/20… Geor… Dist… Geor… CAIA.…   6.7     11     2     0     3     0     0
#>  9 11/03/20… Geor… Dist… Geor… COLLE…  22.7     41    18     3     2     2     0
#> 10 11/03/20… Geor… Dist… Geor… EMMA.…  18.3     36    10     0     3     2     0
#> # ℹ 121,908 more rows
#> # ℹ 113 more variables: blk <dbl>, tov <dbl>, pf <dbl>, ts_pct <dbl>,
#> #   efg_pct <dbl>, fgm <dbl>, fga <dbl>, fg_pct <dbl>, tpm <dbl>, tpa <dbl>,
#> #   tp_pct <dbl>, ftm <dbl>, fta <dbl>, ft_pct <dbl>, rimm <dbl>, rima <dbl>,
#> #   rim_pct <dbl>, midm <dbl>, mida <dbl>, mid_pct <dbl>, pbackm <dbl>,
#> #   pbacka <dbl>, pback_pct <dbl>, blk_rim <dbl>, blk_mid <dbl>,
#> #   blk_three <dbl>, pct_fga_trans <dbl>, pct_tpa_trans <dbl>, …
# }
# \donttest{
  try(load_ncaa_wbb_team_box(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 12,038 × 81
#>    home   away  team   mins o_mins d_mins o_poss d_poss  ortg  drtg netrtg   pts
#>    <chr>  <chr> <chr> <dbl>  <dbl>  <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl> <dbl>
#>  1 Georg… Dist… Dist…  39.4   20.8   18.6     68     70  69.1 123.  -53.7     47
#>  2 Georg… Dist… Geor…  39.4   18.6   20.8     70     68 123.   69.1  53.7     86
#>  3 Temple Geor… Geor…  38.9   22.2   16.7     69     71  72.5 121.  -48.7     50
#>  4 Temple Geor… Temp…  38.9   16.7   22.2     71     69 121.   72.5  48.7     86
#>  5 Georg… Howa… Geor…  39.8   21.4   18.4     68     69  88.2  89.9  -1.62    60
#>  6 Georg… Howa… Howa…  39.8   18.4   21.4     69     68  89.9  88.2   1.62    62
#>  7 Longw… Geor… Geor…  39.8   19.4   20.4     76     76  81.6  93.4 -11.8     62
#>  8 Longw… Geor… Long…  39.8   20.4   19.4     76     76  93.4  81.6  11.8     71
#>  9 Georg… Geor… Geor…  38.7   20.0   18.7     69     71  72.5 111.  -38.8     50
#> 10 Georg… Geor… Geor…  38.7   18.7   20.0     71     69 111.   72.5  38.8     79
#> # ℹ 12,028 more rows
#> # ℹ 69 more variables: d_pts <dbl>, fga <dbl>, d_fga <dbl>, fgm <dbl>,
#> #   d_fgm <dbl>, tpa <dbl>, d_tpa <dbl>, tpm <dbl>, d_tpm <dbl>, fta <dbl>,
#> #   d_fta <dbl>, ftm <dbl>, d_ftm <dbl>, rima <dbl>, d_rima <dbl>, rimm <dbl>,
#> #   d_rimm <dbl>, orb <dbl>, d_orb <dbl>, drb <dbl>, d_drb <dbl>, blk <dbl>,
#> #   d_blk <dbl>, to <dbl>, d_to <dbl>, ast <dbl>, d_ast <dbl>, e_poss <dbl>,
#> #   fg_pct <dbl>, d_fg_pct <dbl>, tpp <dbl>, d_tpp <dbl>, ftp <dbl>, …
# }
# \donttest{
  try(load_ncaa_wbb_rosters(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 8,382 × 4
#>    season team               player              games
#>     <int> <chr>              <chr>               <int>
#>  1   2026 A&M-Corpus Christi ASHA.WALKER            29
#>  2   2026 A&M-Corpus Christi BRUNA.ANGUERA          23
#>  3   2026 A&M-Corpus Christi CHELSEA.WOOTEN         28
#>  4   2026 A&M-Corpus Christi KNARI.HOLLIDAY         27
#>  5   2026 A&M-Corpus Christi MARISSA.SHELTON        29
#>  6   2026 A&M-Corpus Christi RAYNA.WILLIAMS         29
#>  7   2026 A&M-Corpus Christi SAMORA.WATSON          22
#>  8   2026 A&M-Corpus Christi TAMAR.VOOR.DE.POORT    19
#>  9   2026 A&M-Corpus Christi TORIE.SEVIER           29
#> 10   2026 A&M-Corpus Christi TRINITY.SLOCUM         28
#> # ℹ 8,372 more rows
# }
# \donttest{
  try(load_ncaa_wbb_team_rosters(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 4,969 × 16
#>    season team_id team   player_id player clean_name name  jersey class position
#>     <int> <chr>   <chr>  <chr>     <chr>  <chr>      <chr> <chr>  <chr> <chr>   
#>  1   2026 610016  A&M-C… 10005559  ASHA.… Asha Walk… Asha… 11     Jr.   G       
#>  2   2026 610016  A&M-C… 9341790   BRUNA… Bruna Ang… Brun… 14     Sr.   C       
#>  3   2026 610016  A&M-C… 10005568  CHELS… Chelsea W… Chel… 3      Sr.   G       
#>  4   2026 610016  A&M-C… 10005541  KNARI… K'Nari Ho… K'Na… 32     Sr.   F       
#>  5   2026 610016  A&M-C… 10005553  MARIS… Marissa S… Mari… 4      Sr.   G       
#>  6   2026 610016  A&M-C… 9341797   NAIYA… Naiya Car… Naiy… 0      So.   G       
#>  7   2026 610016  A&M-C… 10005564  RAYNA… Rayna Wil… Rayn… 12     So.   F       
#>  8   2026 610016  A&M-C… 9341791   SAMOR… Samora Wa… Samo… 5      Sr.   G       
#>  9   2026 610016  A&M-C… 10005543  SYDNE… Sydney Pe… Sydn… 21     Jr.   F       
#> 10   2026 610016  A&M-C… 10005549  TAMAR… Tamar voo… Tama… 2      Sr.   G       
#> # ℹ 4,959 more rows
#> # ℹ 6 more variables: height <chr>, ht_inches <int>, hometown <chr>,
#> #   high_school <chr>, gp <chr>, gs <chr>
# }
# \donttest{
  try(load_ncaa_wbb_schedule(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 6,019 × 7
#>    contest_id game_date  home              away     home_score away_score season
#>    <chr>      <chr>      <chr>             <chr>         <int>      <int>  <int>
#>  1 6387146    11/03/2025 George Washington Dist. C…         86         47   2026
#>  2 6387150    11/07/2025 Temple            George …         86         50   2026
#>  3 6387163    11/11/2025 George Washington Howard           60         62   2026
#>  4 6387165    11/17/2025 Longwood          George …         71         62   2026
#>  5 6387168    11/21/2025 Georgetown        George …         79         50   2026
#>  6 6387172    11/23/2025 George Washington Morgan …         82         56   2026
#>  7 6387173    12/06/2025 George Washington Brown            53         48   2026
#>  8 6387176    12/10/2025 Delaware          George …         59         63   2026
#>  9 6387179    12/14/2025 George Washington American         70         44   2026
#> 10 6387182    12/21/2025 George Washington Northwe…         75         62   2026
#> # ℹ 6,009 more rows
# }
# \donttest{
  try(load_ncaa_wbb_team_ids(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 359 × 4
#>    team               conference id     season
#>    <chr>              <chr>      <chr>   <int>
#>  1 A&M-Corpus Christi Southland  610016   2026
#>  2 Abilene Christian  WAC        610128   2026
#>  3 Air Force          MWC        609930   2026
#>  4 Akron              MAC        610133   2026
#>  5 Alabama            SEC        610143   2026
#>  6 Alabama A&M        SWAC       610135   2026
#>  7 Alabama St.        SWAC       610138   2026
#>  8 Alcorn             SWAC       610153   2026
#>  9 American           Patriot    610157   2026
#> 10 App State          Sun Belt   610159   2026
#> # ℹ 349 more rows
# }
```

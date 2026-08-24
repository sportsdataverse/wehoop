# **Load NCAA women's college basketball possessions from the data repo**

Loads possession-level data for NCAA women's college basketball – one
row per offensive possession, with the on-court 5-man lineups for both
teams, points scored, assist/transition/garbage-time flags, and the
possession's first and last event types. Produced by the sdv-py
`ncaa_wbb` engine's possession detector; backed by the
`ncaa-wbb-hoops-data` pipeline, published to the `ncaa_wbb_possessions`
release tag as csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_possessions(
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

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md),
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_matchup_stints.md),
[`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_pbp.md),
[`load_ncaa_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_player_box.md),
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
```

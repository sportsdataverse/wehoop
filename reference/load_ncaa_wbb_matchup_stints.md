# **Load NCAA women's college basketball 10-man matchup stints from the data repo**

Loads reconstructed 10-man matchup stints (the home 5-man lineup crossed
with the away 5-man lineup) for NCAA women's college basketball – one
row per contiguous stretch both lineups were on court together, with the
score at stint start/end and both team's lineup rosters. Produced by the
sdv-py `ncaa_wbb` engine's lineup reconstructor; backed by the
`ncaa-wbb-hoops-data` pipeline, published to the
`ncaa_wbb_matchup_stints` release tag as csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_matchup_stints(
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

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md),
[`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_pbp.md),
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
```

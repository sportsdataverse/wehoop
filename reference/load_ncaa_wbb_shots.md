# **Load NCAA women's college basketball shot events from the data repo**

Loads shot-chart events for NCAA women's college basketball – one row
per field goal attempt, with court coordinates, distance, shot zone, and
made/missed result. Coordinates are only available from the 2019 season
onward (stats.ncaa.org did not publish shot-location data before then),
so `seasons` has a 2019 floor even though most sibling NCAA WBB datasets
start at 2010. Produced by the sdv-py `ncaa_wbb` engine; backed by the
`ncaa-wbb-hoops-data` pipeline, published to the `ncaa_wbb_shots`
release tag as csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_shots(
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
  runs 2019 through the most recent season, with no gaps. Pass
  `seasons = TRUE` for every published season. (Min: 2019)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

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

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md),
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_matchup_stints.md),
[`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_pbp.md),
[`load_ncaa_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_player_box.md),
[`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_possessions.md),
[`load_ncaa_wbb_rapm()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm.md),
[`load_ncaa_wbb_rapm_within_team()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm_within_team.md),
[`load_ncaa_wbb_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rosters.md),
[`load_ncaa_wbb_schedule()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_schedule.md),
[`load_ncaa_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_box.md),
[`load_ncaa_wbb_team_ids()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_ids.md),
[`load_ncaa_wbb_team_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_rosters.md)

## Author

Saiem Gilani

## Examples

``` r
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
```

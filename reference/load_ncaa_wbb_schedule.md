# **Load NCAA women's college basketball schedules from the data repo**

Loads season schedules/results for NCAA women's college basketball – one
row per game with home/away teams and final scores. Produced by the
sdv-py `ncaa_wbb` engine; backed by the `ncaa-wbb-hoops-data` pipeline,
published to the `ncaa_wbb_schedule` release tag as csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_schedule(
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

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md),
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_matchup_stints.md),
[`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_pbp.md),
[`load_ncaa_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_player_box.md),
[`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_possessions.md),
[`load_ncaa_wbb_rapm_within_team()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm_within_team.md),
[`load_ncaa_wbb_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rosters.md),
[`load_ncaa_wbb_shots()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_shots.md),
[`load_ncaa_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_box.md),
[`load_ncaa_wbb_team_ids()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_ids.md),
[`load_ncaa_wbb_team_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_rosters.md)

## Author

Saiem Gilani

## Examples

``` r
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
```

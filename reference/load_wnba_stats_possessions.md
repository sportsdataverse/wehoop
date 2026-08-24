# **Load cleaned WNBA Stats API possessions from the data repo**

Loads possession-level data derived from the WNBA Stats API play-by-play
– one row per possession, with the on-court 5-man lineups for both
teams, shooting/rebounding/turnover splits, and the possession start
type. Backed by the `wehoop-wnba-stats-data` pipeline that reads raw
JSONs from `wehoop-wnba-stats-raw` and publishes csv.gz/parquet/rds
artifacts to the `wnba_stats_possessions` release tag.

## Usage

``` r
load_wnba_stats_possessions(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons.
  Published coverage runs 1997 through the most recent season, with no
  gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)

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
| game_id | character | Unique game identifier. |
| period | integer | Period of the game (1-2 halves pre-2016, 1-4 quarters 2016+). |
| possession_number | integer | Sequential possession number within the game. |
| offense_team_id | integer | Team identifier for the team on offense. |
| defense_team_id | integer | Team identifier for the team on defense. |
| start_order_index | integer | Play-by-play order index at the start of the possession. |
| end_order_index | integer | Play-by-play order index at the end of the possession. |
| start_seconds_remaining | numeric | Seconds remaining in the period at possession start. |
| end_seconds_remaining | numeric | Seconds remaining in the period at possession end. |
| points | integer | Points scored on the possession. |
| is_second_chance | logical | Whether the possession followed an offensive rebound. |
| number_in_period | integer | Sequential possession number within the period. |
| possession_start_type | character | How the possession started (e.g. 'OffDeadball', 'OffRebound'). |
| count_as_possession | logical | Whether the event counts as a scoreable possession. |
| fg2a | integer | 2-point field goal attempts by the lineup. |
| fg2m | integer | 2-point field goals made by the lineup. |
| fg3a | integer | Fg3a. |
| fg3m | integer | Fg3m. |
| fta | integer | Free throw attempts by the lineup. |
| ftm | integer | Free throws made by the lineup. |
| oreb | integer | Offensive rebounds. |
| dreb | integer | Defensive rebounds. |
| tov | integer | Turnovers. |
| off_player_1 | integer | Offensive lineup slot 1 player identifier. |
| off_player_2 | integer | Offensive lineup slot 2 player identifier. |
| off_player_3 | integer | Offensive lineup slot 3 player identifier. |
| off_player_4 | integer | Offensive lineup slot 4 player identifier. |
| off_player_5 | integer | Offensive lineup slot 5 player identifier. |
| def_player_1 | integer | Defensive lineup slot 1 player identifier. |
| def_player_2 | integer | Defensive lineup slot 2 player identifier. |
| def_player_3 | integer | Defensive lineup slot 3 player identifier. |
| def_player_4 | integer | Defensive lineup slot 4 player identifier. |
| def_player_5 | integer | Defensive lineup slot 5 player identifier. |
| season | integer | Season identifier (4-digit year). |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_wnba_stats_possessions(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 32,265 × 34
#>    game_id    period possession_number offense_team_id defense_team_id
#>    <chr>       <int>             <int>           <int>           <int>
#>  1 1022600001      1                 1      1611661323      1611661313
#>  2 1022600001      1                 2      1611661313      1611661323
#>  3 1022600001      1                 3      1611661323      1611661313
#>  4 1022600001      1                 4      1611661313      1611661323
#>  5 1022600001      1                 5      1611661323      1611661313
#>  6 1022600001      1                 6      1611661313      1611661323
#>  7 1022600001      1                 7      1611661323      1611661313
#>  8 1022600001      1                 8      1611661313      1611661323
#>  9 1022600001      1                 9      1611661323      1611661313
#> 10 1022600001      1                10      1611661313      1611661323
#> # ℹ 32,255 more rows
#> # ℹ 29 more variables: start_order_index <int>, end_order_index <int>,
#> #   start_seconds_remaining <dbl>, end_seconds_remaining <dbl>, points <int>,
#> #   is_second_chance <lgl>, number_in_period <int>,
#> #   possession_start_type <chr>, count_as_possession <lgl>, fg2a <int>,
#> #   fg2m <int>, fg3a <int>, fg3m <int>, fta <int>, ftm <int>, oreb <int>,
#> #   dreb <int>, tov <int>, off_player_1 <int>, off_player_2 <int>, …
# }
```

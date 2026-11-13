# **Load wehoop WNBA Stats per-event game lineups**

Loads the on-court lineups for every event of the WNBA Stats API
play-by-play: one row per game and `action_number`, with the five home
and five away player ids on the floor at that event. Join it to
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
on `game_id` + `action_number`. Backed by the `wnba_stats_game_lineups`
release tag (assets `wnba_lineups_{season}`, labelled by the calendar
year the season was played).

## Usage

``` r
load_wnba_stats_game_lineups(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Source

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_stats_game_lineups>

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

  The name of the game lineups data table within the database

## Value

Returns a `wehoop_data` tibble with one row per play-by-play event.

|               |           |                                                 |
|---------------|-----------|-------------------------------------------------|
| col_name      | types     | description                                     |
| game_id       | character | Unique game identifier (10-digit, zero-padded). |
| action_number | integer   | Play-by-play action number within the game.     |
| period        | integer   | Period of the game.                             |
| home_player_1 | integer   | Home lineup slot 1 player identifier.           |
| home_player_2 | integer   | Home lineup slot 2 player identifier.           |
| home_player_3 | integer   | Home lineup slot 3 player identifier.           |
| home_player_4 | integer   | Home lineup slot 4 player identifier.           |
| home_player_5 | integer   | Home lineup slot 5 player identifier.           |
| away_player_1 | integer   | Away lineup slot 1 player identifier.           |
| away_player_2 | integer   | Away lineup slot 2 player identifier.           |
| away_player_3 | integer   | Away lineup slot 3 player identifier.           |
| away_player_4 | integer   | Away lineup slot 4 player identifier.           |
| away_player_5 | integer   | Away lineup slot 5 player identifier.           |
| season        | integer   | Season identifier (4-digit year).               |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_metric_curves()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_metric_curves.md),
[`load_wnba_stats_player_boxscores()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_boxscores.md),
[`load_wnba_stats_rolling_windows()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rolling_windows.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)

## Examples

``` r
# \donttest{
  # A season of this table is a multi-MB download, so the example runs interactively only.
  try(load_wnba_stats_game_lineups(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 149,921 × 14
#>    game_id    action_number period home_player_1 home_player_2 home_player_3
#>    <chr>              <int>  <int>         <int>         <int>         <int>
#>  1 1022600001             2      1        204335       1627668       1627673
#>  2 1022600001             4      1        204335       1627668       1627673
#>  3 1022600001             7      1        204335       1627668       1627673
#>  4 1022600001             8      1        204335       1627668       1627673
#>  5 1022600001             9      1        204335       1627668       1627673
#>  6 1022600001            11      1        204335       1627668       1627673
#>  7 1022600001            13      1        204335       1627668       1627673
#>  8 1022600001            15      1        204335       1627668       1627673
#>  9 1022600001            16      1        204335       1627668       1627673
#> 10 1022600001            17      1        204335       1627668       1627673
#> # ℹ 149,911 more rows
#> # ℹ 8 more variables: home_player_4 <int>, home_player_5 <int>,
#> #   away_player_1 <int>, away_player_2 <int>, away_player_3 <int>,
#> #   away_player_4 <int>, away_player_5 <int>, season <int>
# }
```

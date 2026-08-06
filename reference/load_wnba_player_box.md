# **Load wehoop WNBA player box scores**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

## Usage

``` r
load_wnba_player_box(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2002)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database (used by
  [`update_wnba_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_db.md)).

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the player box data table within the database

## Value

Returns a tibble

## Examples

``` r
# \donttest{
  try(load_wnba_player_box())
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 5,271 × 57
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401857105   2026           2 2026-08-01 2026-08-01 13:00:00    3099736
#>  2 401857105   2026           2 2026-08-01 2026-08-01 13:00:00    4398776
#>  3 401857105   2026           2 2026-08-01 2026-08-01 13:00:00    3149391
#>  4 401857105   2026           2 2026-08-01 2026-08-01 13:00:00    2529122
#>  5 401857105   2026           2 2026-08-01 2026-08-01 13:00:00    4065870
#>  6 401857105   2026           2 2026-08-01 2026-08-01 13:00:00    3142086
#>  7 401857105   2026           2 2026-08-01 2026-08-01 13:00:00    4433633
#>  8 401857105   2026           2 2026-08-01 2026-08-01 13:00:00    2987869
#>  9 401857105   2026           2 2026-08-01 2026-08-01 13:00:00    4281190
#> 10 401857105   2026           2 2026-08-01 2026-08-01 13:00:00    2529458
#> # ℹ 5,261 more rows
#> # ℹ 51 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
# }
```

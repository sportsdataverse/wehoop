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
#> # A tibble: 655 × 57
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401856914   2026           2 2026-05-17 2026-05-17 19:00:00    4433630
#>  2 401856914   2026           2 2026-05-17 2026-05-17 19:00:00    4433405
#>  3 401856914   2026           2 2026-05-17 2026-05-17 19:00:00    2529137
#>  4 401856914   2026           2 2026-05-17 2026-05-17 19:00:00    4432865
#>  5 401856914   2026           2 2026-05-17 2026-05-17 19:00:00    4858656
#>  6 401856914   2026           2 2026-05-17 2026-05-17 19:00:00    2566081
#>  7 401856914   2026           2 2026-05-17 2026-05-17 19:00:00    2566186
#>  8 401856914   2026           2 2026-05-17 2026-05-17 19:00:00    4433433
#>  9 401856914   2026           2 2026-05-17 2026-05-17 19:00:00    4594786
#> 10 401856914   2026           2 2026-05-17 2026-05-17 19:00:00    3142010
#> # ℹ 645 more rows
#> # ℹ 51 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
# }
```

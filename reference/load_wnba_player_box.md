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
#> # A tibble: 1,321 × 57
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401856944   2026           2 2026-05-28 2026-05-28 22:00:00    3142255
#>  2 401856944   2026           2 2026-05-28 2026-05-28 22:00:00    4432831
#>  3 401856944   2026           2 2026-05-28 2026-05-28 22:00:00    3142191
#>  4 401856944   2026           2 2026-05-28 2026-05-28 22:00:00    4398829
#>  5 401856944   2026           2 2026-05-28 2026-05-28 22:00:00    4433403
#>  6 401856944   2026           2 2026-05-28 2026-05-28 22:00:00    3142055
#>  7 401856944   2026           2 2026-05-28 2026-05-28 22:00:00    4433546
#>  8 401856944   2026           2 2026-05-28 2026-05-28 22:00:00    3907781
#>  9 401856944   2026           2 2026-05-28 2026-05-28 22:00:00    4433797
#> 10 401856944   2026           2 2026-05-28 2026-05-28 22:00:00    5105731
#> # ℹ 1,311 more rows
#> # ℹ 51 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
# }
```

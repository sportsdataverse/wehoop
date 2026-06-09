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
#> # A tibble: 1,978 × 57
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401856971   2026           2 2026-06-07 2026-06-07 19:00:00    3906972
#>  2 401856971   2026           2 2026-06-07 2026-06-07 19:00:00    4398729
#>  3 401856971   2026           2 2026-06-07 2026-06-07 19:00:00    3934218
#>  4 401856971   2026           2 2026-06-07 2026-06-07 19:00:00    4703794
#>  5 401856971   2026           2 2026-06-07 2026-06-07 19:00:00    5208982
#>  6 401856971   2026           2 2026-06-07 2026-06-07 19:00:00    5105406
#>  7 401856971   2026           2 2026-06-07 2026-06-07 19:00:00    5209202
#>  8 401856971   2026           2 2026-06-07 2026-06-07 19:00:00    4682797
#>  9 401856971   2026           2 2026-06-07 2026-06-07 19:00:00    3056730
#> 10 401856971   2026           2 2026-06-07 2026-06-07 19:00:00    5346554
#> # ℹ 1,968 more rows
#> # ℹ 51 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
# }
```

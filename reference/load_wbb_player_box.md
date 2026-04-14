# **Load wehoop women's college basketball player box scores**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

## Usage

``` r
load_wbb_player_box(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given women's college
  basketball seasons. (Min: 2006)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database (used by
  [`update_wbb_db()`](https://wehoop.sportsdataverse.org/reference/update_wbb_db.md)).

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the play by play data table within the database

## Value

Returns a tibble

## Examples

``` r
# \donttest{
  try(load_wbb_player_box())
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 168,228 × 55
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5239100
#>  2 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5108587
#>  3 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5174284
#>  4 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    4609797
#>  5 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    4433797
#>  6 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5329673
#>  7 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    4434019
#>  8 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5311577
#>  9 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5311576
#> 10 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    5239099
#> # ℹ 168,218 more rows
#> # ℹ 49 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
# }
```

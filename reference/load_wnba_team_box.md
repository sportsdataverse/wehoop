# **Load wehoop WNBA team box scores**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

## Usage

``` r
load_wnba_team_box(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2003)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database (used by
  [`update_wnba_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_db.md)).

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the team box data table within the database

## Value

Returns a tibble

## Examples

``` r
# \donttest{
  try(load_wnba_team_box())
#> ──────────────────────────────────────────────────────────────── wehoop 2.1.0 ──
#> # A tibble: 624 × 57
#>      game_id season season_type game_date  game_date_time      team_id team_uid 
#>        <int>  <int>       <int> <date>     <dttm>                <int> <chr>    
#>  1 401820329   2025           3 2025-10-10 2025-10-10 20:00:00      17 s:40~l:5…
#>  2 401820329   2025           3 2025-10-10 2025-10-10 20:00:00      11 s:40~l:5…
#>  3 401820326   2025           3 2025-10-08 2025-10-08 20:00:00      17 s:40~l:5…
#>  4 401820326   2025           3 2025-10-08 2025-10-08 20:00:00      11 s:40~l:5…
#>  5 401820325   2025           3 2025-10-05 2025-10-05 15:00:00      11 s:40~l:5…
#>  6 401820325   2025           3 2025-10-05 2025-10-05 15:00:00      17 s:40~l:5…
#>  7 401820322   2025           3 2025-10-03 2025-10-03 20:00:00      11 s:40~l:5…
#>  8 401820322   2025           3 2025-10-03 2025-10-03 20:00:00      17 s:40~l:5…
#>  9 401820340   2025           3 2025-09-30 2025-09-30 21:30:00       5 s:40~l:5…
#> 10 401820340   2025           3 2025-09-30 2025-09-30 21:30:00      17 s:40~l:5…
#> # ℹ 614 more rows
#> # ℹ 50 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>, …
# }
```

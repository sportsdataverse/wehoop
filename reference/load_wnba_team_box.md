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
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 170 × 59
#>      game_id season season_type game_date  game_date_time      team_id team_uid 
#>        <int>  <int>       <int> <date>     <dttm>                <int> <chr>    
#>  1 401856974   2026           2 2026-06-08 2026-06-08 22:00:00      14 s:40~l:5…
#>  2 401856974   2026           2 2026-06-08 2026-06-08 22:00:00      17 s:40~l:5…
#>  3 401856972   2026           2 2026-06-08 2026-06-08 19:00:00       9 s:40~l:5…
#>  4 401856972   2026           2 2026-06-08 2026-06-08 19:00:00      18 s:40~l:5…
#>  5 401856973   2026           2 2026-06-08 2026-06-08 19:00:00       5 s:40~l:5…
#>  6 401856973   2026           2 2026-06-08 2026-06-08 19:00:00      16 s:40~l:5…
#>  7 401856971   2026           2 2026-06-07 2026-06-07 19:00:00  132052 s:40~l:5…
#>  8 401856971   2026           2 2026-06-07 2026-06-07 19:00:00       6 s:40~l:5…
#>  9 401856970   2026           2 2026-06-07 2026-06-07 15:00:00      19 s:40~l:5…
#> 10 401856970   2026           2 2026-06-07 2026-06-07 15:00:00  131935 s:40~l:5…
#> # ℹ 160 more rows
#> # ℹ 52 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>, …
# }
```

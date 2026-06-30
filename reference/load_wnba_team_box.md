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
#> # A tibble: 288 × 59
#>      game_id season season_type game_date  game_date_time      team_id team_uid 
#>        <int>  <int>       <int> <date>     <dttm>                <int> <chr>    
#>  1 401857033   2026           2 2026-06-28 2026-06-28 19:00:00       9 s:40~l:5…
#>  2 401857033   2026           2 2026-06-28 2026-06-28 19:00:00  129689 s:40~l:5…
#>  3 401857032   2026           2 2026-06-28 2026-06-28 16:00:00      17 s:40~l:5…
#>  4 401857032   2026           2 2026-06-28 2026-06-28 16:00:00      19 s:40~l:5…
#>  5 401857031   2026           2 2026-06-28 2026-06-28 15:00:00  132052 s:40~l:5…
#>  6 401857031   2026           2 2026-06-28 2026-06-28 15:00:00      16 s:40~l:5…
#>  7 401857030   2026           2 2026-06-28 2026-06-28 14:00:00       8 s:40~l:5…
#>  8 401857030   2026           2 2026-06-28 2026-06-28 14:00:00       3 s:40~l:5…
#>  9 401857029   2026           2 2026-06-27 2026-06-27 21:00:00      20 s:40~l:5…
#> 10 401857029   2026           2 2026-06-27 2026-06-27 21:00:00      14 s:40~l:5…
#> # ℹ 278 more rows
#> # ℹ 52 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>, …
# }
```

# **Load wehoop women's college basketball team box scores**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

## Usage

``` r
load_wbb_team_box(
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
  try(load_wbb_team_box())
#> ──────────────────────────────────────────────────────────────── wehoop 2.1.0 ──
#> # A tibble: 12,058 × 58
#>      game_id season season_type game_date  game_date_time      team_id team_uid 
#>        <int>  <int>       <int> <date>     <dttm>                <int> <chr>    
#>  1 401856590   2026           3 2026-04-05 2026-04-05 15:30:00    2579 s:40~l:5…
#>  2 401856590   2026           3 2026-04-05 2026-04-05 15:30:00      26 s:40~l:5…
#>  3 401865139   2026           3 2026-04-04 2026-04-04 15:00:00    2287 s:40~l:5…
#>  4 401865139   2026           3 2026-04-04 2026-04-04 15:00:00     276 s:40~l:5…
#>  5 401856589   2026           3 2026-04-03 2026-04-03 21:40:00     251 s:40~l:5…
#>  6 401856589   2026           3 2026-04-03 2026-04-03 21:40:00      26 s:40~l:5…
#>  7 401856588   2026           3 2026-04-03 2026-04-03 19:00:00    2579 s:40~l:5…
#>  8 401856588   2026           3 2026-04-03 2026-04-03 19:00:00      41 s:40~l:5…
#>  9 401865138   2026           3 2026-04-01 2026-04-01 20:00:00     276 s:40~l:5…
#> 10 401865138   2026           3 2026-04-01 2026-04-01 20:00:00    2032 s:40~l:5…
#> # ℹ 12,048 more rows
#> # ℹ 51 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>, …
# }
```

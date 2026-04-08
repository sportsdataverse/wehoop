# **Load wehoop WNBA schedules**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

## Usage

``` r
load_wnba_schedule(
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

  The name of the schedule data table within the database

## Value

Returns a tibble

## Examples

``` r
# \donttest{
  try(load_wnba_schedule())
#> ──────────────────────────────────────────────────────────────── wehoop 2.1.0 ──
#> # A tibble: 312 × 77
#>         id uid   date  attendance time_valid neutral_site conference_competition
#>      <int> <chr> <chr>      <dbl> <lgl>      <lgl>        <lgl>                 
#>  1  4.02e8 s:40… 2025…      17071 TRUE       FALSE        FALSE                 
#>  2  4.02e8 s:40… 2025…      17071 TRUE       FALSE        FALSE                 
#>  3  4.02e8 s:40… 2025…      10404 TRUE       FALSE        FALSE                 
#>  4  4.02e8 s:40… 2025…      10266 TRUE       FALSE        FALSE                 
#>  5  4.02e8 s:40… 2025…      10529 TRUE       FALSE        FALSE                 
#>  6  4.02e8 s:40… 2025…      16919 TRUE       FALSE        FALSE                 
#>  7  4.02e8 s:40… 2025…      16022 TRUE       FALSE        FALSE                 
#>  8  4.02e8 s:40… 2025…      15941 TRUE       FALSE        FALSE                 
#>  9  4.02e8 s:40… 2025…      16507 TRUE       FALSE        FALSE                 
#> 10  4.02e8 s:40… 2025…      10516 TRUE       FALSE        FALSE                 
#> # ℹ 302 more rows
#> # ℹ 70 more variables: play_by_play_available <lgl>, recent <lgl>,
#> #   start_date <chr>, broadcast <chr>, highlights <chr>, notes_type <chr>,
#> #   notes_headline <chr>, broadcast_market <chr>, broadcast_name <chr>,
#> #   type_id <int>, type_abbreviation <chr>, venue_id <int>,
#> #   venue_full_name <chr>, venue_address_city <chr>, venue_address_state <chr>,
#> #   venue_indoor <lgl>, status_clock <dbl>, status_display_clock <chr>, …
# }
```

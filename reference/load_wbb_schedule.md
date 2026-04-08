# **Load wehoop women's college basketball schedule**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

## Usage

``` r
load_wbb_schedule(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given women's college
  basketball seasons. (Min: 2002)

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
  try(load_wbb_schedule())
#> ──────────────────────────────────────────────────────────────── wehoop 2.1.0 ──
#> # A tibble: 6,054 × 86
#>         id uid   date  attendance time_valid neutral_site conference_competition
#>      <int> <chr> <chr>      <dbl> <lgl>      <lgl>        <lgl>                 
#>  1  4.02e8 s:40… 2026…      15856 TRUE       TRUE         FALSE                 
#>  2  4.02e8 s:40… 2026…       5475 TRUE       FALSE        FALSE                 
#>  3  4.02e8 s:40… 2026…      15856 TRUE       TRUE         FALSE                 
#>  4  4.02e8 s:40… 2026…      15856 TRUE       TRUE         FALSE                 
#>  5  4.02e8 s:40… 2026…       2683 TRUE       FALSE        FALSE                 
#>  6  4.02e8 s:40… 2026…       3002 TRUE       FALSE        FALSE                 
#>  7  4.02e8 s:40… 2026…       1871 TRUE       TRUE         FALSE                 
#>  8  4.02e8 s:40… 2026…       8558 TRUE       TRUE         FALSE                 
#>  9  4.02e8 s:40… 2026…       2258 TRUE       FALSE        FALSE                 
#> 10  4.02e8 s:40… 2026…       1706 TRUE       FALSE        FALSE                 
#> # ℹ 6,044 more rows
#> # ℹ 79 more variables: play_by_play_available <lgl>, recent <lgl>,
#> #   start_date <chr>, broadcast <chr>, highlights <chr>, notes_type <chr>,
#> #   notes_headline <chr>, broadcast_market <chr>, broadcast_name <chr>,
#> #   type_id <int>, type_abbreviation <chr>, venue_id <int>,
#> #   venue_full_name <chr>, venue_address_city <chr>, venue_address_state <chr>,
#> #   venue_indoor <lgl>, status_clock <dbl>, status_display_clock <chr>, …
# }
```

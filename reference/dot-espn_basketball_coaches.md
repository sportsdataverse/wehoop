# Internal: ESPN basketball coaches catalog

Fetches
`sports.core.api.espn.com/v2/sports/basketball/leagues/{league}/seasons/{year}/coaches`
with standard core-v2 pagination and returns a flat tibble with one row
per coach.

## Usage

``` r
.espn_basketball_coaches(league, season, ...)
```

## Arguments

- league:

  character. `"wnba"` or `"womens-college-basketball"`.

- season:

  numeric. Season year.

- ...:

  Unused; reserved for forward compatibility.

## Value

A `wehoop_data` tibble, or `NULL` on error.

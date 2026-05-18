# Internal: ESPN basketball franchises index

Fetches the paginated franchise index
`sports.core.api.espn.com/v2/sports/basketball/leagues/{league}/franchises?limit=200`
and returns a tibble of franchise IDs and the `$ref` URL for each.

## Usage

``` r
.espn_basketball_franchises(league, ...)
```

## Arguments

- league:

  character.

- ...:

  Unused.

## Value

A `wehoop_data` tibble with one row per franchise, or `NULL` on error.

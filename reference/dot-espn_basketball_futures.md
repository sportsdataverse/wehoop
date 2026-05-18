# Internal: ESPN basketball season futures (long format)

Fetches the per-season futures-market index:
`sports.core.api.espn.com/v2/sports/basketball/leagues/{league}/seasons/{season}/futures`.
Each item is a futures market with a single provider and a list of
`books` (one entry per team). Returns one row per (market x team).

## Usage

``` r
.espn_basketball_futures(league, season, ...)
```

## Arguments

- league:

  character.

- season:

  numeric.

- ...:

  Unused.

## Value

A `wehoop_data` tibble in long format, or `NULL` on error.

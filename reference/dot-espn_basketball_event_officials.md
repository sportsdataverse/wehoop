# Internal: ESPN basketball event officials

Fetches
`sports.core.api.espn.com/v2/sports/basketball/leagues/{league}/events/{event_id}/competitions/{event_id}/officials`
and returns a tidy tibble (one row per official).

## Usage

``` r
.espn_basketball_event_officials(league, event_id, ...)
```

## Arguments

- league:

  character. `"wnba"` or `"womens-college-basketball"`.

- event_id:

  character or numeric. ESPN event/game identifier.

- ...:

  Unused; absorbed for forward compatibility.

## Value

A `wehoop_data` tibble or `NULL` on error.

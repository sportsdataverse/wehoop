# Internal: ESPN basketball athlete info

Fetches
`site.api.espn.com/apis/site/v2/sports/basketball/{league}/athletes/{athlete_id}`
and returns a named list of tibbles: `Bio`, `Team`, `Position`,
`Status`, `College`, `Draft`.

## Usage

``` r
.espn_basketball_athlete_info(league, athlete_id, ...)
```

## Arguments

- league:

  character. `"wnba"` or `"womens-college-basketball"`.

- athlete_id:

  character or numeric. ESPN athlete identifier.

- ...:

  Unused; absorbed for forward compatibility.

## Value

Named list of data frames.

# **Get ESPN WNBA Draft Rounds Summary**

Returns one row per round of the WNBA draft (typically 2 rounds: 1st
with 30 picks, 2nd with ~28 picks).

Returns one row per drafted athlete in a given WNBA draft year.

Returns the current status of one WNBA draft year (round, state,
description). Live during the draft; static afterward.

Returns a single-row tibble with top-level draft-year metadata: year,
number of rounds, display name, plus `$ref`s for the deeper
sub-resources (status, athletes, rounds) already wrapped by
`espn_wnba_draft_status()`, `espn_wnba_draft_athletes()`, and
`espn_wnba_draft_rounds()`.

## Usage

``` r
espn_wnba_draft_rounds(season = most_recent_wnba_season(), ...)

espn_wnba_draft_athletes(season = most_recent_wnba_season(), ...)

espn_wnba_draft_status(season = most_recent_wnba_season(), ...)

espn_wnba_season_draft(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per round.

A tibble of athlete IDs + `$ref` URLs.

A single-row tibble.

A single-row tibble.

## Details

**Get ESPN WNBA Draft Rounds Summary**

**Get ESPN WNBA Draft Athletes Index**

**Get ESPN WNBA Draft Status**

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_draft_rounds(season = 2024)
#> ── ESPN WNBA Draft Rounds ────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:26 UTC
#> # A tibble: 3 × 7
#>   league season round display_name short_display_name n_picks status   
#>   <chr>   <int> <int> <chr>        <chr>                <int> <chr>    
#> 1 wnba     2024     1 1st Round    1st                     12 COMPLETED
#> 2 wnba     2024     2 2nd Round    2nd                     12 COMPLETED
#> 3 wnba     2024     3 3rd Round    3rd                     12 COMPLETED
# }
# \donttest{
  espn_wnba_draft_athletes(season = 2024)
#> ── ESPN WNBA Draft Athletes ──────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:26 UTC
#> # A tibble: 112 × 4
#>    league season athlete_id ref                                                 
#>    <chr>   <int> <chr>      <chr>                                               
#>  1 wnba     2024 108565     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  2 wnba     2024 108566     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  3 wnba     2024 108567     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  4 wnba     2024 108569     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  5 wnba     2024 108568     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  6 wnba     2024 108570     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  7 wnba     2024 108572     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  8 wnba     2024 108582     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  9 wnba     2024 108577     http://sports.core.api.espn.com/v2/sports/basketbal…
#> 10 wnba     2024 108612     http://sports.core.api.espn.com/v2/sports/basketbal…
#> # ℹ 102 more rows
# }
# \donttest{
  espn_wnba_draft_status(season = 2024)
#> ── ESPN WNBA Draft Status ────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:26 UTC
#> # A tibble: 1 × 7
#>   league season round type_id type_name type_state description
#>   <chr>   <int> <int> <chr>   <chr>     <chr>      <chr>      
#> 1 wnba     2024     3 3       COMPLETED post       Completed  
# }
# \donttest{
  espn_wnba_season_draft(season = 2024)
#> ── ESPN WNBA Season Draft (top-level) ────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:26 UTC
#> # A tibble: 1 × 10
#>   league season  year uid       number_of_rounds display_name short_display_name
#>   <chr>   <int> <int> <chr>                <int> <chr>        <chr>             
#> 1 wnba     2024  2024 s:40~l:5…                3 2024 Women'… 2024 WNBA Draft   
#> # ℹ 3 more variables: status_ref <chr>, athletes_ref <chr>, rounds_ref <chr>
# }
```

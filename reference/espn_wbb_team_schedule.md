# **Get ESPN Women's College Basketball Team Schedule**

**Get ESPN Women's College Basketball Team Schedule**

**Get ESPN Women's College Basketball Team Schedule**

## Usage

``` r
espn_wbb_team_schedule(
  team_id,
  season = most_recent_wbb_season(),
  season_type = 2,
  ...
)
```

## Arguments

- team_id:

  ESPN team identifier (character or numeric).

- season:

  Season year (numeric). Defaults to the most recent WBB season.

- season_type:

  Integer season type: 1 = preseason, 2 = regular (default), 3 =
  postseason.

- ...:

  Additional arguments; currently unused.

## Value

A single tibble with one row per event.

Columns as documented in the shared
[espn_basketball_team_schedule_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_team_schedule_schema.md)
table.

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_team_schedule(team_id = "2509", season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Schedule from ESPN.com ── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:10:00 UTC
#> # A tibble: 29 × 21
#>    event_id  season season_type  week date          name  short_name opponent_id
#>    <chr>      <int>       <int> <int> <chr>         <chr> <chr>      <chr>      
#>  1 401713616   2025          NA     1 2024-11-07T0… Purd… PFW @ PUR  NA         
#>  2 401703046   2025          NA     1 2024-11-11T0… Notr… ND @ PUR   NA         
#>  3 401713617   2025          NA     2 2024-11-15T0… IU I… IUIN @ PUR NA         
#>  4 401713618   2025          NA     3 2024-11-19T0… Bell… BELL @ PUR NA         
#>  5 401713619   2025          NA     3 2024-11-24T1… UT A… UTA @ PUR  NA         
#>  6 401703047   2025          NA     4 2024-11-28T2… Purd… PUR VS MT… NA         
#>  7 401703048   2025          NA     4 2024-11-30T1… Purd… PUR VS SC  NA         
#>  8 401713620   2025          NA     5 2024-12-05T0… Main… ME @ PUR   NA         
#>  9 401721485   2025          NA     5 2024-12-07T1… Mary… MD @ PUR   NA         
#> 10 401703049   2025          NA     6 2024-12-14T2… Kent… UK @ PUR   NA         
#> # ℹ 19 more rows
#> # ℹ 13 more variables: opponent_abbrev <chr>, home_away <chr>,
#> #   neutral_site <lgl>, conference_competition <lgl>, venue_id <chr>,
#> #   venue_name <chr>, venue_city <chr>, venue_state <chr>, broadcast <chr>,
#> #   result <chr>, team_score <chr>, opponent_score <chr>, winner <lgl>
# }
```

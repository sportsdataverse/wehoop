# **Get ESPN WNBA Team Schedule**

**Get ESPN WNBA Team Schedule**

**Get ESPN WNBA Team Schedule**

## Usage

``` r
espn_wnba_team_schedule(
  team_id,
  season = most_recent_wnba_season(),
  season_type = 2,
  ...
)
```

## Arguments

- team_id:

  ESPN team identifier (character or numeric).

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

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

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_team_schedule(team_id = "17", season = 2025)
#> ── ESPN WNBA Team Schedule from ESPN.com ─────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:09:43 UTC
#> # A tibble: 44 × 21
#>    event_id  season season_type  week date          name  short_name opponent_id
#>    <chr>      <int>       <int> <int> <chr>         <chr> <chr>      <chr>      
#>  1 401736116   2025          NA    NA 2025-05-17T1… Las … LV @ NY    NA         
#>  2 401736121   2025          NA    NA 2025-05-20T2… Las … LV @ CON   NA         
#>  3 401736129   2025          NA    NA 2025-05-24T0… Wash… WSH @ LV   NA         
#>  4 401736137   2025          NA    NA 2025-05-25T2… Las … LV @ SEA   NA         
#>  5 401736148   2025          NA    NA 2025-05-31T0… Los … LA @ LV    NA         
#>  6 401736154   2025          NA    NA 2025-06-01T2… Las … LV @ SEA   NA         
#>  7 401736163   2025          NA    NA 2025-06-07T1… Las … LV @ GS    NA         
#>  8 401736171   2025          NA    NA 2025-06-12T0… Los … LA @ LV    NA         
#>  9 401736175   2025          NA    NA 2025-06-14T0… Dall… DAL @ LV   NA         
#> 10 401736181   2025          NA    NA 2025-06-15T2… Phoe… PHX @ LV   NA         
#> # ℹ 34 more rows
#> # ℹ 13 more variables: opponent_abbrev <chr>, home_away <chr>,
#> #   neutral_site <lgl>, conference_competition <lgl>, venue_id <chr>,
#> #   venue_name <chr>, venue_city <chr>, venue_state <chr>, broadcast <chr>,
#> #   result <chr>, team_score <chr>, opponent_score <chr>, winner <lgl>
# }
```

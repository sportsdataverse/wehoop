# **Get ESPN WNBA Team Roster (Per-Season, core-v2)**

Returns the per-season team roster as a tibble of athlete IDs from
`seasons/{y}/teams/{id}/athletes`. Distinct from
[`espn_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
which targets a site-v2 endpoint optimized for the current season; this
core-v2 variant is era-correct and available back to ESPN's earliest
season for each league.

## Usage

``` r
espn_wnba_team_season_roster(team_id, season = most_recent_wnba_season(), ...)
```

## Arguments

- team_id:

  ESPN team identifier.

- season:

  Season year. Defaults to most recent WNBA season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per athlete on the season roster.

|            |           |                                         |
|------------|-----------|-----------------------------------------|
| col_name   | types     | description                             |
| league     | character | League slug.                            |
| team_id    | character | ESPN team id.                           |
| season     | integer   | Season year.                            |
| athlete_id | character | ESPN athlete id.                        |
| ref        | character | `$ref` URL to athlete-in-season detail. |

## Details

**Get ESPN WNBA Team Roster (Per-Season, core-v2)**

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_team_season_roster(team_id = 17, season = 2025)
#> ── ESPN WNBA Team Season Roster ──────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 11:37:26 UTC
#> # A tibble: 14 × 5
#>    league team_id season athlete_id ref                                         
#>    <chr>  <chr>    <int> <chr>      <chr>                                       
#>  1 wnba   17        2025 2529122    http://sports.core.api.espn.com/v2/sports/b…
#>  2 wnba   17        2025 2529458    http://sports.core.api.espn.com/v2/sports/b…
#>  3 wnba   17        2025 2987869    http://sports.core.api.espn.com/v2/sports/b…
#>  4 wnba   17        2025 3099736    http://sports.core.api.espn.com/v2/sports/b…
#>  5 wnba   17        2025 3142086    http://sports.core.api.espn.com/v2/sports/b…
#>  6 wnba   17        2025 3149391    http://sports.core.api.espn.com/v2/sports/b…
#>  7 wnba   17        2025 3916514    http://sports.core.api.espn.com/v2/sports/b…
#>  8 wnba   17        2025 4065870    http://sports.core.api.espn.com/v2/sports/b…
#>  9 wnba   17        2025 4281190    http://sports.core.api.espn.com/v2/sports/b…
#> 10 wnba   17        2025 4398776    http://sports.core.api.espn.com/v2/sports/b…
#> 11 wnba   17        2025 4433633    http://sports.core.api.espn.com/v2/sports/b…
#> 12 wnba   17        2025 4609797    http://sports.core.api.espn.com/v2/sports/b…
#> 13 wnba   17        2025 4682855    http://sports.core.api.espn.com/v2/sports/b…
#> 14 wnba   17        2025 5220104    http://sports.core.api.espn.com/v2/sports/b…
# }
```

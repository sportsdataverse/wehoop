# **Get ESPN WBB Team Roster (Per-Season, core-v2)**

Returns the per-season team roster as a tibble of athlete IDs from
`seasons/{y}/teams/{id}/athletes`. Distinct from
[`espn_wbb_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md)
which targets a site-v2 endpoint optimized for the current season; this
core-v2 variant is era-correct and available back to ESPN's earliest
season for each league.

## Usage

``` r
espn_wbb_team_season_roster(team_id, season = most_recent_wbb_season(), ...)
```

## Arguments

- team_id:

  ESPN team identifier.

- season:

  Season year. Defaults to most recent WBB season.

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

**Get ESPN WBB Team Roster (Per-Season, core-v2)**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_team_season_roster(team_id = 2509, season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team Season Roster ─────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:19 UTC
#> # A tibble: 21 × 5
#>    league                    team_id season athlete_id ref                      
#>    <chr>                     <chr>    <int> <chr>      <chr>                    
#>  1 womens-college-basketball 2509      2025 4899611    http://sports.core.api.e…
#>  2 womens-college-basketball 2509      2025 5240039    http://sports.core.api.e…
#>  3 womens-college-basketball 2509      2025 4595183    http://sports.core.api.e…
#>  4 womens-college-basketball 2509      2025 19747      http://sports.core.api.e…
#>  5 womens-college-basketball 2509      2025 5107952    http://sports.core.api.e…
#>  6 womens-college-basketball 2509      2025 4419354    http://sports.core.api.e…
#>  7 womens-college-basketball 2509      2025 5175721    http://sports.core.api.e…
#>  8 womens-college-basketball 2509      2025 5175722    http://sports.core.api.e…
#>  9 womens-college-basketball 2509      2025 4433438    http://sports.core.api.e…
#> 10 womens-college-basketball 2509      2025 4597501    http://sports.core.api.e…
#> # ℹ 11 more rows
# }
```

# **Get the WNBA cross-source team crosswalk**

Build a wide, one-row-per-team-per-season crosswalk linking ESPN, the
WNBA Stats API, and Fox Sports team identities, keyed on `espn_team_id`.
Yahoo columns are placeholders (NA) until that source is implemented.

## Usage

``` r
wnba_team_crosswalk(season = most_recent_wnba_season(), .schedule = NULL)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- .schedule:

  Internal. An already-fetched
  [`wnba_schedule()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule.md)
  frame, supplied by
  [`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md)
  to avoid a duplicate CDN request. Leave `NULL`.

## Value

A `wehoop_data` tibble, one row per team:

|                         |           |                                         |
|-------------------------|-----------|-----------------------------------------|
| col_name                | types     | description                             |
| season                  | integer   | Season year.                            |
| espn_team_id            | integer   | ESPN team id (canonical key).           |
| espn_abbreviation       | character | ESPN abbreviation.                      |
| espn_display_name       | character | ESPN display name.                      |
| espn_short_name         | character | ESPN short name.                        |
| espn_location           | character | ESPN team location.                     |
| espn_mascot             | character | ESPN team mascot/nickname.              |
| wnba_team_id            | character | WNBA Stats team id.                     |
| wnba_team_tricode       | character | WNBA Stats tricode.                     |
| wnba_team_name          | character | WNBA Stats team name.                   |
| wnba_team_city          | character | WNBA Stats team city.                   |
| wnba_team_slug          | character | WNBA Stats team slug.                   |
| fox_team_id             | character | Fox Bifrost team id.                    |
| fox_team_name           | character | Fox team name.                          |
| yahoo_team_id           | character | Yahoo team id (NA placeholder).         |
| yahoo_team_abbreviation | character | Yahoo abbreviation (NA placeholder).    |
| yahoo_team_name         | character | Yahoo team name (NA placeholder).       |
| match_method            | character | How the row was matched.                |
| match_confidence        | numeric   | Match confidence (1 for deterministic). |

## See also

Other WNBA Crosswalk Functions:
[`load_wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_crosswalk.md),
[`load_wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule_crosswalk.md),
[`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_crosswalk.md),
[`wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_player_crosswalk.md),
[`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md)

## Examples

``` r
# \donttest{
  try(wnba_team_crosswalk(season = 2024))
#> ℹ WNBA CDN schedule is for season 2026, not 2024. For historical seasons use `load_wnba_schedule(seasons = 2024)`.
#> ── WNBA team crosswalk (ESPN / WNBA Stats / Fox) ─────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-13 04:37:58 UTC
#> # A tibble: 15 × 19
#>    season espn_team_id espn_abbreviation espn_display_name      espn_short_name
#>     <int>        <int> <chr>             <chr>                  <chr>          
#>  1   2024           20 ATL               Atlanta Dream          Dream          
#>  2   2024           19 CHI               Chicago Sky            Sky            
#>  3   2024           18 CON               Connecticut Sun        Sun            
#>  4   2024            3 DAL               Dallas Wings           Wings          
#>  5   2024       129689 GS                Golden State Valkyries Valkyries      
#>  6   2024            5 IND               Indiana Fever          Fever          
#>  7   2024           17 LV                Las Vegas Aces         Aces           
#>  8   2024            6 LA                Los Angeles Sparks     Sparks         
#>  9   2024            8 MIN               Minnesota Lynx         Lynx           
#> 10   2024            9 NY                New York Liberty       Liberty        
#> 11   2024           11 PHX               Phoenix Mercury        Mercury        
#> 12   2024       132052 POR               Portland Fire          Fire           
#> 13   2024           14 SEA               Seattle Storm          Storm          
#> 14   2024       131935 TOR               Toronto Tempo          Tempo          
#> 15   2024           16 WSH               Washington Mystics     Mystics        
#> # ℹ 14 more variables: espn_location <chr>, espn_mascot <chr>,
#> #   wnba_team_id <chr>, wnba_team_tricode <chr>, wnba_team_name <chr>,
#> #   wnba_team_city <chr>, wnba_team_slug <chr>, fox_team_id <chr>,
#> #   fox_team_name <chr>, yahoo_team_id <chr>, yahoo_team_abbreviation <chr>,
#> #   yahoo_team_name <chr>, match_method <chr>, match_confidence <dbl>
# }
```

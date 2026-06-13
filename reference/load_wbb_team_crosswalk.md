# **Load cached WBB team crosswalk**

Loads cached team-crosswalk snapshots that map ESPN team identifiers to
Fox Sports and Bart Torvik team identifiers for Women's College
Basketball. One row per team-season. Backed by the `wbb_crosswalk`
release tag in `sportsdataverse-data`.

## Usage

``` r
load_wbb_team_crosswalk(seasons = most_recent_wbb_season())
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WBB seasons. (Min:
  2014)

## Value

A `wehoop_data` tibble of cached WBB team-crosswalk rows.

## See also

Other WBB Crosswalk Functions:
[`load_wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md),
[`load_wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_schedule_crosswalk.md),
[`wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_player_crosswalk.md),
[`wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_schedule_crosswalk.md),
[`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(load_wbb_team_crosswalk(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 361 × 18
#>    season espn_team_id espn_abbreviation espn_display_name       espn_short_name
#>     <int>        <int> <chr>             <chr>                   <chr>          
#>  1   2026         2000 ACU               Abilene Christian Wild… Abilene Chrstn 
#>  2   2026         2005 AF                Air Force Falcons       Air Force      
#>  3   2026         2006 AKR               Akron Zips              Akron          
#>  4   2026         2010 AAMU              Alabama A&M Bulldogs    Alabama A&M    
#>  5   2026          333 ALA               Alabama Crimson Tide    Alabama        
#>  6   2026         2011 ALST              Alabama State Lady Hor… Alabama St     
#>  7   2026         2016 ALCN              Alcorn State Lady Brav… Alcorn St      
#>  8   2026           44 AMER              American University Ea… American       
#>  9   2026         2026 APP               App State Mountaineers  App State      
#> 10   2026            9 ASU               Arizona State Sun Devi… Arizona St     
#> # ℹ 351 more rows
#> # ℹ 13 more variables: espn_location <chr>, espn_mascot <chr>,
#> #   espn_conference <chr>, fox_team_id <chr>, fox_team_name <chr>,
#> #   fox_section <chr>, bart_team <chr>, bart_conf <chr>, yahoo_team_id <chr>,
#> #   yahoo_team_name <chr>, fox_match_confidence <dbl>,
#> #   bart_match_confidence <dbl>, match_method <chr>
# }
```

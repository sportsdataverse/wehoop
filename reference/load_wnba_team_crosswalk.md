# **Load cached WNBA team crosswalk**

Loads cached team-crosswalk snapshots that map ESPN team identifiers to
WNBA Stats API team identifiers. One row per team-season. Backed by the
`wnba_crosswalk` release tag in `sportsdataverse-data`.

## Usage

``` r
load_wnba_team_crosswalk(seasons = most_recent_wnba_season())
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2002)

## Value

A `wehoop_data` tibble of cached team-crosswalk rows.

## See also

Other WNBA Crosswalk Functions:
[`load_wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_crosswalk.md),
[`load_wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule_crosswalk.md),
[`wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_player_crosswalk.md),
[`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md),
[`wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(load_wnba_team_crosswalk(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 15 × 19
#>    season espn_team_id espn_abbreviation espn_display_name      espn_short_name
#>     <int>        <int> <chr>             <chr>                  <chr>          
#>  1   2026           20 ATL               Atlanta Dream          Dream          
#>  2   2026           19 CHI               Chicago Sky            Sky            
#>  3   2026           18 CON               Connecticut Sun        Sun            
#>  4   2026            3 DAL               Dallas Wings           Wings          
#>  5   2026       129689 GS                Golden State Valkyries Valkyries      
#>  6   2026            5 IND               Indiana Fever          Fever          
#>  7   2026           17 LV                Las Vegas Aces         Aces           
#>  8   2026            6 LA                Los Angeles Sparks     Sparks         
#>  9   2026            8 MIN               Minnesota Lynx         Lynx           
#> 10   2026            9 NY                New York Liberty       Liberty        
#> 11   2026           11 PHX               Phoenix Mercury        Mercury        
#> 12   2026       132052 POR               Portland Fire          Fire           
#> 13   2026           14 SEA               Seattle Storm          Storm          
#> 14   2026       131935 TOR               Toronto Tempo          Tempo          
#> 15   2026           16 WSH               Washington Mystics     Mystics        
#> # ℹ 14 more variables: espn_location <chr>, espn_mascot <chr>,
#> #   wnba_team_id <chr>, wnba_team_tricode <chr>, wnba_team_name <chr>,
#> #   wnba_team_city <chr>, wnba_team_slug <chr>, fox_team_id <chr>,
#> #   fox_team_name <chr>, yahoo_team_id <chr>, yahoo_team_abbreviation <chr>,
#> #   yahoo_team_name <chr>, match_method <chr>, match_confidence <dbl>
# }
```

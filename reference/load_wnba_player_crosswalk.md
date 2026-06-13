# **Load cached WNBA player crosswalk**

Loads cached player-crosswalk snapshots that map ESPN athlete
identifiers to WNBA Stats API player identifiers. One row per
athlete-season. Backed by the `wnba_crosswalk` release tag in
`sportsdataverse-data`.

## Usage

``` r
load_wnba_player_crosswalk(seasons = most_recent_wnba_season())
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2002)

## Value

A `wehoop_data` tibble of cached player-crosswalk rows.

## See also

Other WNBA Crosswalk Functions:
[`load_wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule_crosswalk.md),
[`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_crosswalk.md),
[`wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_player_crosswalk.md),
[`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md),
[`wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(load_wnba_player_crosswalk(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 203 × 21
#>    season espn_team_id team_abbreviation player_name    espn_athlete_id
#>     <int>        <int> <chr>             <chr>          <chr>          
#>  1   2026           20 ATL               isobel borlase 5208983        
#>  2   2026           20 ATL               jordin canada  3142250        
#>  3   2026           20 ATL               allisha gray   3058901        
#>  4   2026           20 ATL               naz hillmon    4398915        
#>  5   2026           20 ATL               rhyne howard   4398674        
#>  6   2026           20 ATL               brionna jones  3058895        
#>  7   2026           20 ATL               sika kone      5017721        
#>  8   2026           20 ATL               indya nivar    5105740        
#>  9   2026           20 ATL               aaliyah nye    4597509        
#> 10   2026           20 ATL               amy okonkwo    3142242        
#> # ℹ 193 more rows
#> # ℹ 16 more variables: espn_full_name <chr>, espn_jersey <chr>,
#> #   espn_position <chr>, wnba_player_id <chr>, wnba_player_name <chr>,
#> #   wnba_jersey_num <chr>, wnba_position <chr>, fox_athlete_id <chr>,
#> #   fox_player <chr>, fox_jersey <chr>, fox_position_group <chr>,
#> #   yahoo_player_id <chr>, yahoo_player_name <chr>, match_method <chr>,
#> #   match_confidence <dbl>, match_keys <chr>
# }
```

# **Load cached WBB player crosswalk**

Loads cached player-crosswalk snapshots that map ESPN athlete
identifiers to Fox Sports player identifiers for Women's College
Basketball. One row per athlete-season. Backed by the `wbb_crosswalk`
release tag in `sportsdataverse-data`.

## Usage

``` r
load_wbb_player_crosswalk(seasons = most_recent_wbb_season())
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WBB seasons. (Min:
  2014)

## Value

A `wehoop_data` tibble of cached WBB player-crosswalk rows.

## See also

Other WBB Crosswalk Functions:
[`load_wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_schedule_crosswalk.md),
[`load_wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_crosswalk.md),
[`wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_player_crosswalk.md),
[`wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_schedule_crosswalk.md),
[`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(load_wbb_player_crosswalk(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 5,018 × 17
#>    season espn_team_id team_abbreviation player_name     espn_athlete_id
#>     <int>        <int> <chr>             <chr>           <chr>          
#>  1   2026         2000 ACU               natalia chavez  5109756        
#>  2   2026         2000 ACU               jordyn coleman  5315743        
#>  3   2026         2000 ACU               emma daugherty  5315740        
#>  4   2026         2000 ACU               molly daugherty 5315739        
#>  5   2026         2000 ACU               breanna davis   5108299        
#>  6   2026         2000 ACU               aimee flippen   5241475        
#>  7   2026         2000 ACU               riley grohman   5315742        
#>  8   2026         2000 ACU               payton hull     5175545        
#>  9   2026         2000 ACU               meredith mayes  5175546        
#> 10   2026         2000 ACU               bree riley      5315741        
#> # ℹ 5,008 more rows
#> # ℹ 12 more variables: espn_full_name <chr>, espn_jersey <chr>,
#> #   espn_position <chr>, fox_athlete_id <chr>, fox_player <chr>,
#> #   fox_jersey <chr>, fox_position_group <chr>, yahoo_player_id <chr>,
#> #   yahoo_player_name <chr>, match_method <chr>, match_confidence <dbl>,
#> #   match_keys <chr>
# }
```

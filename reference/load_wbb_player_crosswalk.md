# **Load cached WNBA team crosswalk from the data repo**

Loads cached team-crosswalk snapshots that map ESPN team identifiers to
WNBA Stats API team identifiers. One row per team-season. Backed by the
`wnba_crosswalk` release tag in `sportsdataverse-data`.

Loads cached schedule-crosswalk snapshots that map ESPN game identifiers
to WNBA Stats API game identifiers. One row per game-season. Backed by
the `wnba_crosswalk` release tag in `sportsdataverse-data`.

Loads cached player-crosswalk snapshots that map ESPN athlete
identifiers to WNBA Stats API player identifiers. One row per
athlete-season. Backed by the `wnba_crosswalk` release tag in
`sportsdataverse-data`.

Loads cached team-crosswalk snapshots that map ESPN team identifiers to
Fox Sports and Bart Torvik team identifiers for Women's College
Basketball. One row per team-season. Backed by the `wbb_crosswalk`
release tag in `sportsdataverse-data`.

Loads cached schedule-crosswalk snapshots that map ESPN game identifiers
to Bart Torvik game identifiers for Women's College Basketball. One row
per game-season. Backed by the `wbb_crosswalk` release tag in
`sportsdataverse-data`.

Loads cached player-crosswalk snapshots that map ESPN athlete
identifiers to Fox Sports player identifiers for Women's College
Basketball. One row per athlete-season. Backed by the `wbb_crosswalk`
release tag in `sportsdataverse-data`.

## Usage

``` r
load_wnba_team_crosswalk(seasons = most_recent_wnba_season())

load_wnba_schedule_crosswalk(seasons = most_recent_wnba_season())

load_wnba_player_crosswalk(seasons = most_recent_wnba_season())

load_wbb_team_crosswalk(seasons = most_recent_wbb_season())

load_wbb_schedule_crosswalk(seasons = most_recent_wbb_season())

load_wbb_player_crosswalk(seasons = most_recent_wbb_season())
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WBB seasons. (Min:
  2014)

## Value

A `wehoop_data` tibble of cached team-crosswalk rows.

A `wehoop_data` tibble of cached schedule-crosswalk rows.

A `wehoop_data` tibble of cached player-crosswalk rows.

A `wehoop_data` tibble of cached WBB team-crosswalk rows.

A `wehoop_data` tibble of cached WBB schedule-crosswalk rows.

A `wehoop_data` tibble of cached WBB player-crosswalk rows.

## See also

Other WNBA Crosswalk Functions:
[`wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_player_crosswalk.md),
[`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md),
[`wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_team_crosswalk.md)

Other WBB Crosswalk Functions:
[`wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_player_crosswalk.md),
[`wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_schedule_crosswalk.md),
[`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)

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
# \donttest{
  try(load_wnba_schedule_crosswalk(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 357 × 16
#>    season season_type game_date  home_espn_team_id away_espn_team_id
#>     <int> <chr>       <date>                 <int>             <int>
#>  1   2026 Pre-Season  2026-04-25                 9                 5
#>  2   2026 NA          2026-04-25                 6             17476
#>  3   2026 Pre-Season  2026-04-25                11                19
#>  4   2026 Pre-Season  2026-04-25                16                 8
#>  5   2026 Pre-Season  2026-04-25            129689                14
#>  6   2026 NA          2026-04-26                17             17475
#>  7   2026 NA          2026-04-27                 8             17476
#>  8   2026 Pre-Season  2026-04-29            131935                18
#>  9   2026 Pre-Season  2026-04-29                19                20
#> 10   2026 Pre-Season  2026-04-29                14            132052
#> # ℹ 347 more rows
#> # ℹ 11 more variables: espn_game_id <chr>, wnba_game_id <chr>,
#> #   wnba_game_code <chr>, wnba_home_team_id <chr>, wnba_away_team_id <chr>,
#> #   fox_game_id <chr>, fox_home_team_id <chr>, fox_away_team_id <chr>,
#> #   yahoo_game_id <chr>, match_method <chr>, match_confidence <dbl>
# }
# \donttest{
  try(load_wnba_player_crosswalk(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 211 × 21
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
#> 10   2026           20 ATL               madina okot    5108587        
#> # ℹ 201 more rows
#> # ℹ 16 more variables: espn_full_name <chr>, espn_jersey <chr>,
#> #   espn_position <chr>, wnba_player_id <chr>, wnba_player_name <chr>,
#> #   wnba_jersey_num <chr>, wnba_position <chr>, fox_athlete_id <chr>,
#> #   fox_player <chr>, fox_jersey <chr>, fox_position_group <chr>,
#> #   yahoo_player_id <chr>, yahoo_player_name <chr>, match_method <chr>,
#> #   match_confidence <dbl>, match_keys <chr>
# }
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
# \donttest{
  try(load_wbb_schedule_crosswalk(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 6,521 × 13
#>    season game_date  home_espn_team_id away_espn_team_id espn_game_id bart_muid 
#>     <int> <date>                 <int>             <int> <chr>        <chr>     
#>  1   2026 2025-11-03              2579              2253 401811123    Grand Can…
#>  2   2026 2025-11-03                21                26 401822217    San Diego…
#>  3   2026 2025-11-03               251              2916 401809048    Incarnate…
#>  4   2026 2025-11-03               201              2057 401827851    BelmontOk…
#>  5   2026 2025-11-03               239               150 401817556    BaylorDuk…
#>  6   2026 2025-11-03               120              2352 401818636    Loyola MD…
#>  7   2026 2025-11-03               153              2428 401807516    North Car…
#>  8   2026 2025-11-03               145              2450 401827820    Norfolk S…
#>  9   2026 2025-11-03                66              2900 401819923    St. Thoma…
#> 10   2026 2025-11-03               238                25 401817548    Californi…
#> # ℹ 6,511 more rows
#> # ℹ 7 more variables: bart_team1 <chr>, bart_team2 <chr>, bart_winner <chr>,
#> #   fox_game_id <chr>, yahoo_game_id <chr>, match_method <chr>,
#> #   match_confidence <dbl>
# }
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

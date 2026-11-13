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

## Source

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_crosswalk>

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wbb_crosswalk>

## Arguments

- seasons:

  A vector of 4-digit seasons, or `TRUE` for every published season.
  Each loader accepts the seasons its release publishes: 2002 onward for
  the three WNBA crosswalks; for WBB, `load_wbb_team_crosswalk()` 2002
  onward, `load_wbb_schedule_crosswalk()` 2021 onward and
  `load_wbb_player_crosswalk()` 2007 onward. The upper bound is
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md)
  /
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).
  When `seasons` is left at its default and that season is not published
  yet, the loader reads the newest published season instead, with a
  message; an explicit request for it warns and returns an empty frame.
  The WNBA Stats ids (`wnba_player_id`, `wnba_team_id`,
  `wnba_home_team_id`, `wnba_away_team_id`) and the ESPN ids
  (`espn_game_id`, `espn_athlete_id`, `espn_team_id`) and the WBB
  stats.ncaa.org ids (`ncaa_contest_id`, `ncaa_player_id`) are returned
  as integer, matching the `wnba_*()` WNBA Stats tables, the ESPN
  loaders and the `load_ncaa_wbb_*()` loaders; `wnba_game_id` and the
  Fox, Yahoo and Torvik ids stay character.

## Value

A `wehoop_data` tibble of cached team-crosswalk rows.

A `wehoop_data` tibble of cached schedule-crosswalk rows.

A `wehoop_data` tibble of cached player-crosswalk rows.

A `wehoop_data` tibble of cached WBB team-crosswalk rows.

A `wehoop_data` tibble of cached WBB schedule-crosswalk rows.

A `wehoop_data` tibble of cached WBB player-crosswalk rows.

## WBB schedule crosswalk columns

`load_wbb_schedule_crosswalk()` returns one row per game:

|                   |           |                                                |
|-------------------|-----------|------------------------------------------------|
| col_name          | types     | description                                    |
| season            | integer   | Season year (ending year).                     |
| game_date         | Date      | ET game date.                                  |
| home_espn_team_id | integer   | ESPN home team id (NA for bart-only rows).     |
| away_espn_team_id | integer   | ESPN away team id (NA for bart-only rows).     |
| espn_game_id      | integer   | ESPN game id (NA for bart-only rows).          |
| bart_muid         | character | Torvik muid (NA for espn-only rows).           |
| bart_team1        | character | Torvik team1 name.                             |
| bart_team2        | character | Torvik team2 name.                             |
| bart_winner       | character | Torvik winner name.                            |
| fox_game_id       | character | Fox game id (NA when unmatched).               |
| yahoo_game_id     | character | Yahoo game id (e.g. `ncaaw.g.202511030525`).   |
| ncaa_contest_id   | integer   | stats.ncaa.org contest id (NA when unmatched). |
| match_method      | character | "both"/"espn_only"/"bart_only".                |
| match_confidence  | numeric   | 1 for matched, NA for unmatched.               |

`ncaa_contest_id` is integer, so it joins the `contest_id` of the
`load_ncaa_wbb_*()` tables directly.

## WBB player crosswalk columns

`load_wbb_player_crosswalk()` returns one row per player per team:

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season year (ending year). |
| espn_team_id | integer | ESPN team id. |
| team_abbreviation | character | ESPN team abbreviation. |
| player_name | character | Normalized player name (matching key). |
| espn_athlete_id | integer | ESPN athlete id. |
| espn_full_name | character | ESPN full name. |
| espn_jersey | character | ESPN jersey number. |
| espn_position | character | ESPN position abbreviation. |
| fox_athlete_id | character | Fox athlete id (NA if unmatched). |
| fox_player | character | Fox player name. |
| fox_jersey | character | Fox jersey number. |
| fox_position_group | character | Fox position group label. |
| yahoo_player_id | character | Yahoo player id (e.g. `ncaaw.p.70879`). |
| yahoo_player_name | character | Yahoo player name. |
| ncaa_player_id | integer | stats.ncaa.org player id (NA before 2010 and when unmatched). |
| match_method | character | How the player was matched. |
| match_confidence | numeric | Match score (1 for exact). |
| match_keys | character | Keys the match used. |

The 2007-2009 seasons carry ESPN columns only: Fox, Yahoo and
stats.ncaa.org ids start later. `ncaa_player_id` is integer, so it joins
the `player_id` of the `load_ncaa_wbb_*()` tables directly.

## See also

Other WNBA Crosswalk Functions:
[`wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_player_crosswalk.md),
[`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md),
[`wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_team_crosswalk.md)

Other WBB Crosswalk Functions:
[`load_wbb_ncaa_espn_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_ncaa_espn_team_crosswalk.md),
[`wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_player_crosswalk.md),
[`wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_schedule_crosswalk.md),
[`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(load_wnba_team_crosswalk(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 15 × 19
#>    season espn_team_id espn_abbreviation espn_display_name      espn_short_name
#>     <int>        <int> <chr>             <chr>                  <chr>          
#>  1   2026            3 DAL               Dallas Wings           Wings          
#>  2   2026            5 IND               Indiana Fever          Fever          
#>  3   2026            6 LA                Los Angeles Sparks     Sparks         
#>  4   2026            8 MIN               Minnesota Lynx         Lynx           
#>  5   2026            9 NY                New York Liberty       Liberty        
#>  6   2026           11 PHX               Phoenix Mercury        Mercury        
#>  7   2026           14 SEA               Seattle Storm          Storm          
#>  8   2026           16 WSH               Washington Mystics     Mystics        
#>  9   2026           17 LV                Las Vegas Aces         Aces           
#> 10   2026           18 CON               Connecticut Sun        Sun            
#> 11   2026           19 CHI               Chicago Sky            Sky            
#> 12   2026           20 ATL               Atlanta Dream          Dream          
#> 13   2026       129689 GS                Golden State Valkyries Valkyries      
#> 14   2026       131935 TOR               Toronto Tempo          Tempo          
#> 15   2026       132052 POR               Portland Fire          Fire           
#> # ℹ 14 more variables: espn_location <chr>, espn_mascot <chr>,
#> #   wnba_team_id <int>, wnba_team_tricode <chr>, wnba_team_name <chr>,
#> #   wnba_team_city <chr>, wnba_team_slug <chr>, fox_team_id <chr>,
#> #   fox_team_name <chr>, yahoo_team_id <chr>, yahoo_team_abbreviation <chr>,
#> #   yahoo_team_name <chr>, match_method <chr>, match_confidence <dbl>
# }
# \donttest{
  try(load_wnba_schedule_crosswalk(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 356 × 16
#>    season season_type game_date  home_espn_team_id away_espn_team_id
#>     <int> <chr>       <date>                 <int>             <int>
#>  1   2026 NA          2026-10-31            129689                20
#>  2   2026 Playoffs    2026-10-29                20            129689
#>  3   2026 Playoffs    2026-10-26            129689                20
#>  4   2026 Playoffs    2026-10-24                20            129689
#>  5   2026 Playoffs    2026-10-21                20            129689
#>  6   2026 Playoffs    2026-10-19            129689                20
#>  7   2026 Playoffs    2026-10-17            129689                20
#>  8   2026 Playoffs    2026-10-09                17            129689
#>  9   2026 Playoffs    2026-10-09                 9                20
#> 10   2026 Playoffs    2026-10-07            129689                17
#> # ℹ 346 more rows
#> # ℹ 11 more variables: espn_game_id <int>, wnba_game_id <chr>,
#> #   wnba_game_code <chr>, wnba_home_team_id <int>, wnba_away_team_id <int>,
#> #   fox_game_id <chr>, fox_home_team_id <chr>, fox_away_team_id <chr>,
#> #   yahoo_game_id <chr>, match_method <chr>, match_confidence <dbl>
# }
# \donttest{
  try(load_wnba_player_crosswalk(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 269 × 21
#>    season espn_team_id team_abbreviation player_name             espn_athlete_id
#>     <int>        <int> <chr>             <chr>                             <int>
#>  1   2026            3 DAL               alanna smith                    3913881
#>  2   2026            3 DAL               alysha clark                        924
#>  3   2026            3 DAL               arike ogunbowale                3904577
#>  4   2026            3 DAL               awak kuier                      4790266
#>  5   2026            3 DAL               aziaha james                    4433807
#>  6   2026            3 DAL               azzi fudd                       4433790
#>  7   2026            3 DAL               christyn williams               4398965
#>  8   2026            3 DAL               costanza verona                 5345473
#>  9   2026            3 DAL               deja kelly                      4433410
#> 10   2026            3 DAL               dulcy fankam mendjiadeu         4594527
#> # ℹ 259 more rows
#> # ℹ 16 more variables: espn_full_name <chr>, espn_jersey <chr>,
#> #   espn_position <chr>, wnba_player_id <int>, wnba_player_name <chr>,
#> #   wnba_jersey_num <chr>, wnba_position <chr>, fox_athlete_id <chr>,
#> #   fox_player <chr>, fox_jersey <chr>, fox_position_group <chr>,
#> #   yahoo_player_id <chr>, yahoo_player_name <chr>, match_method <chr>,
#> #   match_confidence <dbl>, match_keys <chr>
# }
# \donttest{
  try(load_wbb_team_crosswalk(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 363 × 18
#>    season espn_team_id espn_abbreviation espn_display_name       espn_short_name
#>     <int>        <int> <chr>             <chr>                   <chr>          
#>  1   2027         2000 ACU               Abilene Christian Wild… Abilene Chrstn 
#>  2   2027         2005 AF                Air Force Falcons       Air Force      
#>  3   2027         2006 AKR               Akron Zips              Akron          
#>  4   2027         2010 AAMU              Alabama A&M Bulldogs    Alabama A&M    
#>  5   2027          333 ALA               Alabama Crimson Tide    Alabama        
#>  6   2027         2011 ALST              Alabama State Lady Hor… Alabama St     
#>  7   2027         2016 ALCN              Alcorn State Lady Brav… Alcorn St      
#>  8   2027           44 AMER              American University Ea… American       
#>  9   2027         2026 APP               App State Mountaineers  App State      
#> 10   2027            9 ASU               Arizona State Sun Devi… Arizona St     
#> # ℹ 353 more rows
#> # ℹ 13 more variables: espn_location <chr>, espn_mascot <chr>,
#> #   espn_conference <chr>, fox_team_id <chr>, fox_team_name <chr>,
#> #   fox_section <chr>, bart_team <chr>, bart_conf <chr>, yahoo_team_id <chr>,
#> #   yahoo_team_name <chr>, fox_match_confidence <dbl>,
#> #   bart_match_confidence <dbl>, match_method <chr>
# }
# \donttest{
  try(load_wbb_schedule_crosswalk(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 6,346 × 14
#>    season game_date  home_espn_team_id away_espn_team_id espn_game_id bart_muid 
#>     <int> <date>                 <int>             <int>        <int> <chr>     
#>  1   2027 2026-11-01               222                87    401920983 Notre Dam…
#>  2   2027 2026-11-02              2579               120    401918849 MarylandS…
#>  3   2027 2026-11-02                41               172    401911736 CornellCo…
#>  4   2027 2026-11-02              2439                30    401920491 UNLVUSC11…
#>  5   2027 2026-11-02                97                91    401906074 Bellarmin…
#>  6   2027 2026-11-02               238               288    401916067 LipscombV…
#>  7   2027 2026-11-02                99              2545    401912964 Southeast…
#>  8   2027 2026-11-02              2294               119    401921404 TowsonIow…
#>  9   2027 2026-11-02                26              2329    401918896 LehighUCL…
#> 10   2027 2026-11-02               153               201    401906088 North Car…
#> # ℹ 6,336 more rows
#> # ℹ 8 more variables: bart_team1 <chr>, bart_team2 <chr>, bart_winner <chr>,
#> #   fox_game_id <chr>, yahoo_game_id <chr>, ncaa_contest_id <int>,
#> #   match_method <chr>, match_confidence <dbl>
# }
# \donttest{
  try(load_wbb_player_crosswalk(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 4,968 × 18
#>    season espn_team_id team_abbreviation player_name     espn_athlete_id
#>     <int>        <int> <chr>             <chr>                     <int>
#>  1   2027         2000 ACU               salena carrasco         5458291
#>  2   2027         2000 ACU               natalia chavez          5109756
#>  3   2027         2000 ACU               emma daugherty          5315740
#>  4   2027         2000 ACU               molly daugherty         5315739
#>  5   2027         2000 ACU               aimee flippen           5241475
#>  6   2027         2000 ACU               riley grohman           5315742
#>  7   2027         2000 ACU               payton hull             5175545
#>  8   2027         2000 ACU               meredith mayes          5175546
#>  9   2027         2000 ACU               raimi mccrary           5177964
#> 10   2027         2000 ACU               samara morrow           5458292
#> # ℹ 4,958 more rows
#> # ℹ 13 more variables: espn_full_name <chr>, espn_jersey <chr>,
#> #   espn_position <chr>, fox_athlete_id <chr>, fox_player <chr>,
#> #   fox_jersey <chr>, fox_position_group <chr>, yahoo_player_id <chr>,
#> #   yahoo_player_name <chr>, ncaa_player_id <int>, match_method <chr>,
#> #   match_confidence <dbl>, match_keys <chr>
# }
```

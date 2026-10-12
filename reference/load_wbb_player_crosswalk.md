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
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
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
#> #   wnba_team_id <chr>, wnba_team_tricode <chr>, wnba_team_name <chr>,
#> #   wnba_team_city <chr>, wnba_team_slug <chr>, fox_team_id <chr>,
#> #   fox_team_name <chr>, yahoo_team_id <chr>, yahoo_team_abbreviation <chr>,
#> #   yahoo_team_name <chr>, match_method <chr>, match_confidence <dbl>
# }
# \donttest{
  try(load_wnba_schedule_crosswalk(seasons = most_recent_wnba_season()))
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 356 × 16
#>    season season_type game_date  home_espn_team_id away_espn_team_id
#>     <int> <chr>       <date>                 <int>             <int>
#>  1   2026 NA          2026-10-31            129689                20
#>  2   2026 NA          2026-10-29                20            129689
#>  3   2026 NA          2026-10-26            129689                20
#>  4   2026 NA          2026-10-24                20            129689
#>  5   2026 NA          2026-10-22                20            129689
#>  6   2026 NA          2026-10-19            129689                20
#>  7   2026 NA          2026-10-17            129689                20
#>  8   2026 Playoffs    2026-10-09                17            129689
#>  9   2026 Playoffs    2026-10-09                 9                20
#> 10   2026 Playoffs    2026-10-07            129689                17
#> # ℹ 346 more rows
#> # ℹ 11 more variables: espn_game_id <chr>, wnba_game_id <chr>,
#> #   wnba_game_code <chr>, wnba_home_team_id <chr>, wnba_away_team_id <chr>,
#> #   fox_game_id <chr>, fox_home_team_id <chr>, fox_away_team_id <chr>,
#> #   yahoo_game_id <chr>, match_method <chr>, match_confidence <dbl>
# }
# \donttest{
  try(load_wnba_player_crosswalk(seasons = most_recent_wnba_season()))
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 269 × 21
#>    season espn_team_id team_abbreviation player_name             espn_athlete_id
#>     <int>        <int> <chr>             <chr>                   <chr>          
#>  1   2026            3 DAL               alanna smith            3913881        
#>  2   2026            3 DAL               alysha clark            924            
#>  3   2026            3 DAL               arike ogunbowale        3904577        
#>  4   2026            3 DAL               awak kuier              4790266        
#>  5   2026            3 DAL               aziaha james            4433807        
#>  6   2026            3 DAL               azzi fudd               4433790        
#>  7   2026            3 DAL               christyn williams       4398965        
#>  8   2026            3 DAL               costanza verona         5345473        
#>  9   2026            3 DAL               deja kelly              4433410        
#> 10   2026            3 DAL               dulcy fankam mendjiadeu 4594527        
#> # ℹ 259 more rows
#> # ℹ 16 more variables: espn_full_name <chr>, espn_jersey <chr>,
#> #   espn_position <chr>, wnba_player_id <chr>, wnba_player_name <chr>,
#> #   wnba_jersey_num <chr>, wnba_position <chr>, fox_athlete_id <chr>,
#> #   fox_player <chr>, fox_jersey <chr>, fox_position_group <chr>,
#> #   yahoo_player_id <chr>, yahoo_player_name <chr>, match_method <chr>,
#> #   match_confidence <dbl>, match_keys <chr>
# }
# \donttest{
  try(load_wbb_team_crosswalk(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wbb_crosswalk/wbb_team_crosswalk_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wbb_crosswalk/wbb_team_crosswalk_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_schedule_crosswalk(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wbb_crosswalk/wbb_schedule_crosswalk_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wbb_crosswalk/wbb_schedule_crosswalk_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_player_crosswalk(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wbb_crosswalk/wbb_player_crosswalk_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/wbb_crosswalk/wbb_player_crosswalk_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
```

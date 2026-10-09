# **Get the WNBA cross-source player crosswalk**

Build a wide, one-row-per-player-per-team crosswalk linking ESPN, WNBA
Stats, and Fox player identities for a season. Matching is
deterministic: normalized exact name within a team block, then
Jaro-Winkler fuzzy with jersey/DOB tiebreakers. Yahoo columns are NA
placeholders.

## Usage

``` r
wnba_player_crosswalk(
  season = most_recent_wnba_season(),
  min_confidence = 0.92
)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- min_confidence:

  Jaro-Winkler similarity floor for fuzzy matches (default 0.92).

## Value

A `wehoop_data` tibble, one row per player per team (ESPN-anchored).

## See also

Other WNBA Crosswalk Functions:
[`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md),
[`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md),
[`wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(wnba_player_crosswalk(season = 2024))
#> ℹ WNBA CDN schedule is for season 2026, not 2024. For historical seasons use `load_wnba_schedule(seasons = 2024)`.
#> ✖ 2026-10-09 03:21:35.600661: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661330"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:22:35.859526: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661329"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:23:36.092262: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661323"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:24:36.309426: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661321"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:25:36.516047: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661331"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:26:37.068098: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661325"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:27:37.297563: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661319"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:28:37.551199: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661320"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:29:37.810031: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661324"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:30:38.050633: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661313"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:31:38.317147: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661317"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:32:38.54745: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661327"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:33:38.815441: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661328"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:34:39.012727: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661332"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-10-09 03:35:39.233165: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661322"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ── WNBA player crosswalk (ESPN / WNBA Stats / Fox) ──────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-10-09 03:35:39 UTC
#> # A tibble: 221 × 21
#>    season espn_team_id team_abbreviation player_name    espn_athlete_id
#>     <int>        <int> <chr>             <chr>          <chr>          
#>  1   2024           20 ATL               dewanna bonner 869            
#>  2   2024           20 ATL               isobel borlase 5208983        
#>  3   2024           20 ATL               jordin canada  3142250        
#>  4   2024           20 ATL               allisha gray   3058901        
#>  5   2024           20 ATL               naz hillmon    4398915        
#>  6   2024           20 ATL               rhyne howard   4398674        
#>  7   2024           20 ATL               brionna jones  3058895        
#>  8   2024           20 ATL               sika kone      5017721        
#>  9   2024           20 ATL               indya nivar    5105740        
#> 10   2024           20 ATL               madina okot    5108587        
#> # ℹ 211 more rows
#> # ℹ 16 more variables: espn_full_name <chr>, espn_jersey <chr>,
#> #   espn_position <chr>, wnba_player_id <chr>, wnba_player_name <chr>,
#> #   wnba_jersey_num <chr>, wnba_position <chr>, fox_athlete_id <chr>,
#> #   fox_player <chr>, fox_jersey <chr>, fox_position_group <chr>,
#> #   yahoo_player_id <chr>, yahoo_player_name <chr>, match_method <chr>,
#> #   match_confidence <dbl>, match_keys <chr>
# }
```

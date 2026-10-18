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
#> ✖ 2026-10-18 14:09:42.736503: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661330"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-10-18 14:10:42.872859: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661329"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-10-18 14:11:42.986401: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661323"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-10-18 14:12:43.097655: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661321"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-18 14:13:43.261854: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661325"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-18 14:14:44.666185: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661319"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-18 14:15:44.831286: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661320"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-10-18 14:16:45.001341: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661324"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60000 milliseconds with 0 bytes received
#> ✖ 2026-10-18 14:17:45.105291: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661313"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-18 14:18:45.300572: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661317"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60002 milliseconds with 0 bytes received
#> ✖ 2026-10-18 14:19:45.461786: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661328"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-10-18 14:20:45.772998: Invalid arguments or common team roster data for 2024 available!
#> ✖ Args: league_id = "10", season = 2024, team_id = "1611661322"
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60000 milliseconds with 0 bytes received
#> ── WNBA player crosswalk (ESPN / WNBA Stats / Fox) ──────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-10-18 14:20:45 UTC
#> # A tibble: 171 × 21
#>    season espn_team_id team_abbreviation player_name          espn_athlete_id
#>     <int>        <int> <chr>             <chr>                <chr>          
#>  1   2024           20 ATL               tina charles         918            
#>  2   2024           20 ATL               cheyenne parker tyus 2529458        
#>  3   2024           20 ATL               ezinne kalu          2531437        
#>  4   2024           20 ATL               aerial powers        2999035        
#>  5   2024           20 ATL               nia coffey           3054590        
#>  6   2024           20 ATL               allisha gray         3058901        
#>  7   2024           20 ATL               jordin canada        3142250        
#>  8   2024           20 ATL               crystal dangerfield  4066585        
#>  9   2024           20 ATL               maya caldwell        4280850        
#> 10   2024           20 ATL               lorela cubaj         4281183        
#> # ℹ 161 more rows
#> # ℹ 16 more variables: espn_full_name <chr>, espn_jersey <chr>,
#> #   espn_position <chr>, wnba_player_id <chr>, wnba_player_name <chr>,
#> #   wnba_jersey_num <chr>, wnba_position <chr>, fox_athlete_id <chr>,
#> #   fox_player <chr>, fox_jersey <chr>, fox_position_group <chr>,
#> #   yahoo_player_id <chr>, yahoo_player_name <chr>, match_method <chr>,
#> #   match_confidence <dbl>, match_keys <chr>
# }
```

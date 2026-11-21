# **Get the WBB cross-source player crosswalk**

Build a wide, one-row-per-player-per-team crosswalk linking ESPN and Fox
Sports (Bifrost) WBB player identities for a season. ESPN is the anchor
source; Fox is matched by normalized name (exact first, then
Jaro-Winkler fuzzy with jersey tiebreaker) within each team block. Yahoo
columns are NA placeholders. Torvik and the WNBA Stats API have no
per-player tables for WBB, so neither source is joined.

## Usage

``` r
wbb_player_crosswalk(season = most_recent_wbb_season(), min_confidence = 0.92)
```

## Arguments

- season:

  Season year (4-digit, e.g. `2025`). Defaults to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

- min_confidence:

  Jaro-Winkler similarity floor for fuzzy matches (default 0.92).

## Value

A `wehoop_data` tibble, one row per player per team (ESPN-anchored):

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season year. |
| espn_team_id | integer | ESPN team id (canonical key). |
| team_abbreviation | character | ESPN team abbreviation. |
| player_name | character | Normalized player name (matching key). |
| espn_athlete_id | character | ESPN athlete id. |
| espn_full_name | character | ESPN full name. |
| espn_jersey | character | ESPN jersey number. |
| espn_position | character | ESPN position abbreviation. |
| fox_athlete_id | character | Fox athlete id (NA if unmatched). |
| fox_player | character | Fox player name (NA if unmatched). |
| fox_jersey | character | Fox jersey number (NA if unmatched). |
| fox_position_group | character | Fox position group label (NA if unmatched). |
| yahoo_player_id | character | Yahoo player id (NA placeholder). |
| yahoo_player_name | character | Yahoo player name (NA placeholder). |
| match_method | character | "exact_name"/"fuzzy_jw"/"unmatched". |
| match_confidence | numeric | Jaro-Winkler score or 1 for exact (NA if none). |
| match_keys | character | NA (reserved for future use). |

## See also

Other WBB Crosswalk Functions:
[`load_wbb_ncaa_espn_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_ncaa_espn_team_crosswalk.md),
[`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md),
[`wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_schedule_crosswalk.md),
[`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)

## Examples

``` r
# \donttest{
  # Reads every team roster from ESPN and Fox, so it runs interactively only.
  try(wbb_player_crosswalk(season = 2025))
#> ── WBB player crosswalk (ESPN / Fox) ─────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-21 11:31:44 UTC
#> # A tibble: 5,224 × 17
#>    season espn_team_id team_abbreviation player_name    espn_athlete_id
#>     <int>        <int> <chr>             <chr>          <chr>          
#>  1   2025         2000 ACU               zoe jackson    4899004        
#>  2   2025         2000 ACU               bella earle    4899858        
#>  3   2025         2000 ACU               mia rivers     4901645        
#>  4   2025         2000 ACU               breanna davis  5108299        
#>  5   2025         2000 ACU               natalia chavez 5109756        
#>  6   2025         2000 ACU               payton hull    5175545        
#>  7   2025         2000 ACU               meredith mayes 5175546        
#>  8   2025         2000 ACU               emma troxell   5175548        
#>  9   2025         2000 ACU               erin woodson   5178096        
#> 10   2025         2000 ACU               carlota gomez  5241473        
#> # ℹ 5,214 more rows
#> # ℹ 12 more variables: espn_full_name <chr>, espn_jersey <chr>,
#> #   espn_position <chr>, fox_athlete_id <chr>, fox_player <chr>,
#> #   fox_jersey <chr>, fox_position_group <chr>, yahoo_player_id <chr>,
#> #   yahoo_player_name <chr>, match_method <chr>, match_confidence <dbl>,
#> #   match_keys <chr>
# }
```

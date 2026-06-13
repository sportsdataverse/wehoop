# **Get the WBB cross-source schedule crosswalk**

Build a wide, one-row-per-game crosswalk linking ESPN and Bart Torvik
(barttorvik.com/ncaaw) game identifiers for a WBB season. Fox Sports and
Yahoo game IDs are NA placeholders. Dates are reduced to Eastern-Time
game dates before joining; Torvik `team1`/`team2` are unordered (the
join uses a sorted team-pair key, so home/away from the Torvik side is
not preserved). Games where either Torvik team name cannot be resolved
to an ESPN id via
[`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)
are kept as `bart_only` rows.

## Usage

``` r
wbb_schedule_crosswalk(season = most_recent_wbb_season())
```

## Arguments

- season:

  Season year (4-digit, e.g. `2025`). Defaults to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

## Value

A `wehoop_data` tibble, one row per game:

|                   |           |                                             |
|-------------------|-----------|---------------------------------------------|
| col_name          | types     | description                                 |
| season            | integer   | Season year.                                |
| game_date         | Date      | ET game date.                               |
| home_espn_team_id | integer   | ESPN home team id (NA for bart-only rows).  |
| away_espn_team_id | integer   | ESPN away team id (NA for bart-only rows).  |
| espn_game_id      | character | ESPN game id (NA for bart-only rows).       |
| bart_muid         | character | Torvik muid (NA for espn-only rows).        |
| bart_team1        | character | Torvik team1 name (NA for espn-only rows).  |
| bart_team2        | character | Torvik team2 name (NA for espn-only rows).  |
| bart_winner       | character | Torvik winner name (NA for espn-only rows). |
| fox_game_id       | character | Fox game id (NA placeholder).               |
| yahoo_game_id     | character | Yahoo game id (NA placeholder).             |
| match_method      | character | "both"/"espn_only"/"bart_only".             |
| match_confidence  | numeric   | 1 for matched, NA for unmatched.            |

## See also

Other WBB Crosswalk Functions:
[`load_wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md),
[`load_wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_schedule_crosswalk.md),
[`load_wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_crosswalk.md),
[`wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_player_crosswalk.md),
[`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(wbb_schedule_crosswalk(season = 2025))
#> ✖ 2026-06-13 03:28:53.711514: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241114"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:15.919172: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241208"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:15.999368: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241208"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:19.199631: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241213"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:19.296462: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241213"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:19.748688: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241214"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:19.827691: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241214"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:19.959992: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241214"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:20.043094: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241214"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:20.052428: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:29:22.424574: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241215"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:22.520074: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241215"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:22.664174: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241215"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:22.753055: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241215"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:22.762609: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:29:27.784532: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241216"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:27.878752: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241216"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:27.973255: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241216"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:28.077357: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241216"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:28.086738: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:29:33.128941: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241217"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:33.358756: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241217"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:33.458167: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241217"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:33.556432: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241217"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:33.566113: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:29:39.332561: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241219"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:39.427779: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241219"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:39.512821: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241219"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:39.607118: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241219"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:39.616851: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:29:44.708418: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241220"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:44.785748: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241220"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:44.861975: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241220"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:44.97435: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241220"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:44.983902: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:29:50.032368: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241221"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:50.108933: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241221"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:50.183738: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241221"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:50.276045: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241221"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:50.285832: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:29:55.304373: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241222"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:55.45544: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241222"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:55.572827: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241222"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:55.652086: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241222"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:29:55.661587: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:30:02.138125: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241229"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:02.372842: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241229"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:02.652941: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241229"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:02.74081: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241229"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:02.750048: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:30:07.464152: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241230"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:07.558427: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241230"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:07.640977: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241230"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:07.720964: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20241230"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:07.730964: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:30:15.339688: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250102"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:15.423755: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250102"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:15.564069: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250102"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:15.658139: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250102"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:15.66735: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:30:21.329012: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250104"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:21.415798: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250104"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:21.50631: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250104"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:21.594629: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250104"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:21.604897: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:30:26.726508: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250105"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:26.816515: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250105"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:26.912722: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250105"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:26.997841: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250105"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:27.059747: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:30:33.201645: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250108"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:33.279041: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250108"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:33.361756: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250108"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:33.439744: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250108"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:33.449203: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:30:38.496812: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250109"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:38.598847: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250109"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:38.70055: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250109"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:38.789283: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250109"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:38.79861: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:30:43.886818: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250110"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:43.983168: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250110"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:44.098502: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250110"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:44.183071: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250110"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:44.193454: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:30:49.222618: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250111"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:49.309041: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250111"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:49.388778: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250111"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:49.470231: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250111"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:49.479791: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:30:54.491539: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250112"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:54.629205: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250112"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:54.705421: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250112"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:54.805216: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250112"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:30:54.815085: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:31:00.618448: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250114"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:00.698916: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250114"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:00.780796: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250114"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:00.868491: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250114"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:00.878034: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:31:06.972418: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250116"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:07.069108: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250116"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:07.161506: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250116"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:07.249585: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250116"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:07.259113: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:31:12.278919: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250117"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:12.408621: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250117"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:12.487255: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250117"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:12.573823: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250117"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:12.583361: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:31:17.725627: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250118"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:17.832232: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250118"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:17.923701: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250118"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:18.019588: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250118"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:18.028885: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:31:25.41102: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250122"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:25.485137: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250122"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:25.558762: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250122"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:25.658036: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250122"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:25.667406: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:31:32.823466: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250125"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:32.908791: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250125"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:32.999009: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250125"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:33.079336: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250125"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:33.088598: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:31:40.390666: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250129"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:40.47659: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250129"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:40.587565: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250129"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:40.673187: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250129"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:40.682453: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:31:45.78272: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250130"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:45.912107: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250130"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:46.064147: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250130"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:46.248848: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250130"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:46.258501: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:31:51.929487: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250201"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:52.091212: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250201"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:52.180474: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250201"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:52.278127: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250201"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:52.287142: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:31:57.211329: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250202"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:57.375098: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250202"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:57.459264: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250202"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:57.589323: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250202"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:31:57.62834: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:32:02.473547: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250203"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:02.569762: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250203"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:02.66269: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250203"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:02.750314: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250203"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:02.759732: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:32:08.366897: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250205"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:08.450901: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250205"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:08.537574: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250205"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:08.620798: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250205"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:08.630224: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:32:15.386324: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250206"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:15.524086: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250206"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:15.604078: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250206"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:15.689122: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250206"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:15.698704: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:32:21.365268: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250208"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:21.44855: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250208"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:21.572911: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250208"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:21.652732: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250208"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:21.662075: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:32:29.219476: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250212"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:29.295023: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250212"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:29.413204: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250212"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:29.496173: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250212"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:29.505663: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:32:34.67001: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250213"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:34.879369: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250213"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:35.151001: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250213"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:35.346976: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250213"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:35.35713: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:32:40.578912: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250215"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:40.703225: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250215"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:40.82695: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250215"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:40.907003: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250215"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:40.916611: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:32:45.885551: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250216"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:45.974473: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250216"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:46.076827: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250216"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:46.161602: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250216"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:46.171059: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:32:52.668831: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250219"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:52.747107: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250219"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:52.832047: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250219"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:52.920866: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250219"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:52.93068: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:32:58.011813: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250220"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:58.129311: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250220"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:58.234913: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250220"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:58.335519: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250220"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:32:58.345474: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:33:05.890721: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250223"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:05.987866: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250223"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:06.117266: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250223"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:06.215913: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250223"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:06.225766: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:33:12.520461: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250226"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:12.651047: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250226"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:12.780012: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250226"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:12.884902: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250226"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:12.894813: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:33:17.816366: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250227"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:17.929609: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250227"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:18.034829: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250227"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:18.123983: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250227"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:18.133703: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:33:25.800345: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250302"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:25.891211: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250302"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:25.976745: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250302"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:26.0617: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250302"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:26.071412: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:33:33.624623: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250306"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:33.710384: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250306"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:33.796264: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250306"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:33.881384: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250306"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:33.891062: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:33:41.161783: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250309"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:41.248941: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250309"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:41.354765: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250309"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:41.508886: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250309"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:41.518417: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:33:46.566205: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250310"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:46.642249: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250310"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:46.718958: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250310"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:46.812958: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250310"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:46.822417: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:33:52.662623: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250312"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:52.7587: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250312"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:52.842139: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250312"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:52.930193: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250312"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:52.939895: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:33:57.930628: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250313"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:58.015415: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250313"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:58.097417: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250313"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:58.181947: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250313"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:33:58.191672: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:34:04.000867: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250315"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:04.085701: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250315"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:04.178028: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250315"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:04.33015: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250315"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:04.33963: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:34:11.601082: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250321"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:11.679136: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250321"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:11.756872: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250321"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:11.83983: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250321"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:11.849535: Invalid arguments or no scoreboard data available!
#> ✖ 2026-06-13 03:34:18.616828: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250324"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:18.719316: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250324"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:18.828291: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250324"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:18.918491: Error: Error: The API returned an error 
#> ✖ Args: group = "50", season_dates = "20250324"
#> ✖ Error: The API returned an error
#> ✖ 2026-06-13 03:34:18.928025: Invalid arguments or no scoreboard data available!
#> ── WBB schedule crosswalk (ESPN / Torvik) ────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-13 03:34:26 UTC
#> # A tibble: 15,004 × 13
#>    season game_date  home_espn_team_id away_espn_team_id espn_game_id bart_muid 
#>     <int> <date>                 <int>             <int> <chr>        <chr>     
#>  1   2025 2024-11-04              2579               130 401713576    MichiganS…
#>  2   2025 2024-11-04                30               145 401720643    Mississip…
#>  3   2025 2024-11-04                26                97 401720402    Louisvill…
#>  4   2025 2024-11-04                87              2385 401711562    NA        
#>  5   2025 2024-11-04                99              2198 401713679    Eastern K…
#>  6   2025 2024-11-04                66              2130 401703035    Chicago S…
#>  7   2025 2024-11-04               201              2582 401725988    SouthernO…
#>  8   2025 2024-11-04               150              2515 401702871    RadfordDu…
#>  9   2025 2024-11-04              2306              2739 401714674    Green Bay…
#> 10   2025 2024-11-04               153              2127 401711554    Charlesto…
#> # ℹ 14,994 more rows
#> # ℹ 7 more variables: bart_team1 <chr>, bart_team2 <chr>, bart_winner <chr>,
#> #   fox_game_id <chr>, yahoo_game_id <chr>, match_method <chr>,
#> #   match_confidence <dbl>
# }
```

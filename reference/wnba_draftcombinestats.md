# **Get WNBA Stats API Draft Combine Stats**

**Get WNBA Stats API Draft Combine Stats**

**Get WNBA Stats API Draft Combine Stats**

**Get WNBA Stats API Draft Combine Drill Results**

**Get WNBA Stats API Draft Combine Non-Stationary Shooting**

**Get WNBA Stats API Draft Combine Player Anthropological Measurements**

**Get WNBA Stats API Draft Combine - Spot Shooting**

## Usage

``` r
wnba_draftcombinestats(
  league_id = "10",
  season_year = most_recent_wnba_season() - 1,
  ...
)

wnba_draftcombinedrillresults(
  league_id = "10",
  season_year = most_recent_wnba_season() - 1,
  ...
)

wnba_draftcombinenonstationaryshooting(
  league_id = "10",
  season_year = most_recent_wnba_season() - 1,
  ...
)

wnba_draftcombineplayeranthro(
  league_id = "10",
  season_year = most_recent_wnba_season() - 1,
  ...
)

wnba_draftcombinespotshooting(
  league_id = "10",
  season_year = most_recent_wnba_season() - 1,
  ...
)
```

## Arguments

- league_id:

  league_id

- season_year:

  season_year

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: DraftCombineStats

**DraftCombineStats**

|  |  |  |
|----|----|----|
| col_name | types | description |
| SEASON | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| PLAYER_ID | character | Unique player identifier. |
| FIRST_NAME | character | Player's first name. |
| LAST_NAME | character | Player's last name. |
| PLAYER_NAME | character | Player name. |
| POSITION | character | Listed roster position (G, F, C, etc.). |
| HEIGHT_WO_SHOES | character |  |
| HEIGHT_WO_SHOES_FT_IN | character |  |
| HEIGHT_W_SHOES | character |  |
| HEIGHT_W_SHOES_FT_IN | character |  |
| WEIGHT | character | Player weight in pounds. |
| WINGSPAN | character |  |
| WINGSPAN_FT_IN | character |  |
| STANDING_REACH | character |  |
| STANDING_REACH_FT_IN | character |  |
| BODY_FAT_PCT | character |  |
| HAND_LENGTH | character |  |
| HAND_WIDTH | character |  |
| STANDING_VERTICAL_LEAP | character |  |
| MAX_VERTICAL_LEAP | character |  |
| LANE_AGILITY_TIME | character |  |
| MODIFIED_LANE_AGILITY_TIME | character |  |
| THREE_QUARTER_SPRINT | character |  |
| BENCH_PRESS | character |  |
| SPOT_FIFTEEN_CORNER_LEFT | character |  |
| SPOT_FIFTEEN_BREAK_LEFT | character |  |
| SPOT_FIFTEEN_TOP_KEY | character |  |
| SPOT_FIFTEEN_BREAK_RIGHT | character |  |
| SPOT_FIFTEEN_CORNER_RIGHT | character |  |
| SPOT_COLLEGE_CORNER_LEFT | character |  |
| SPOT_COLLEGE_BREAK_LEFT | character |  |
| SPOT_COLLEGE_TOP_KEY | character |  |
| SPOT_COLLEGE_BREAK_RIGHT | character |  |
| SPOT_COLLEGE_CORNER_RIGHT | character |  |
| SPOT_NBA_CORNER_LEFT | character |  |
| SPOT_NBA_BREAK_LEFT | character |  |
| SPOT_NBA_TOP_KEY | character |  |
| SPOT_NBA_BREAK_RIGHT | character |  |
| SPOT_NBA_CORNER_RIGHT | character |  |
| OFF_DRIB_FIFTEEN_BREAK_LEFT | character |  |
| OFF_DRIB_FIFTEEN_TOP_KEY | character |  |
| OFF_DRIB_FIFTEEN_BREAK_RIGHT | character |  |
| OFF_DRIB_COLLEGE_BREAK_LEFT | character |  |
| OFF_DRIB_COLLEGE_TOP_KEY | character |  |
| OFF_DRIB_COLLEGE_BREAK_RIGHT | character |  |
| ON_MOVE_FIFTEEN | character |  |
| ON_MOVE_COLLEGE | character |  |

Returns a named list of data frames: Results

Returns a named list of data frames: Results

Returns a named list of data frames: Results

Returns a named list of data frames: Results

## Details

      wnba_draftcombinestats(season_year = most_recent_wnba_season() - 1)

(Possibly Defunct)

      wnba_draftcombinedrillresults(season_year = most_recent_wnba_season() - 2)

(Possibly Defunct)

      wnba_draftcombinenonstationaryshooting(season_year = most_recent_wnba_season() - 2)

(Possibly Defunct)

      wnba_draftcombineplayeranthro(season_year = most_recent_wnba_season() - 2)

(Possibly Defunct)

      wnba_draftcombinespotshooting(season_year = most_recent_wnba_season() - 2)

## See also

Other WNBA Draft Functions:
[`wnba_draftboard()`](https://wehoop.sportsdataverse.org/reference/wnba_draftboard.md),
[`wnba_drafthistory()`](https://wehoop.sportsdataverse.org/reference/wnba_drafthistory.md)

## Author

Saiem Gilani

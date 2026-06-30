# WNBA Possession-Engine Test Fixtures

## Purpose

Offline test inputs for `wnba_possession_lineups()` and `wnba_rapm()` (Task 1,
feature branch `feat/wnba-possessions-engine`). Captured once; tests run
without network access via `readRDS()`.

## Captured files

| File | Game | Source function | Shape |
|---|---|---|---|
| `pbp_1022400001.rds` | 1022400001 (NYL @ WAS, 2024) | `wnba_pbp(on_court=TRUE, version="v3")` | 405 rows × 73 cols |
| `box_1022400001.rds` | 1022400001 | `wnba_boxscoretraditionalv3()` | list of 8 data frames |
| `pbp_1022400003.rds` | 1022400003 (PHO @ LVA, 2024) | `wnba_pbp(on_court=TRUE, version="v3")` | 405 rows × 73 cols |
| `box_1022400003.rds` | 1022400003 | `wnba_boxscoretraditionalv3()` | list of 8 data frames |

## Capture details

- **Capture date:** 2026-06-30
- **Source:** `stats.wnba.com` (LeagueID = 10)
- **R package:** wehoop 3.0.0, R 4.5.3
- **API version:** V3 PBP (v3 endpoint, converted to V2 format via `.v3_to_v2_format_wnba`)

## Oracle targets (boxscore team totals)

| Game | Home team | Home pts | Away team | Away pts |
|---|---|---|---|---|
| 1022400001 | WAS (1611661322) | 80 | NYL (1611661313) | 85 |
| 1022400003 | LVA (1611661319) | 89 | PHO (1611661317) | 80 |

These totals come from `box_*$home_team_totals_traditional$points` and
`$away_team_totals_traditional$points`. The possession-engine's summed
`pts` per team across all possession stints must equal these values.

## Known limitation: Game 1022400001 on-court reconstruction

`wnba_gamerotation(game_id="1022400001")` returns an empty body (the
`stats.wnba.com` rotation endpoint has no data for this game). As a
result `away_player1..5` / `home_player1..5` are all `NA` in
`pbp_1022400001.rds`. Game `1022400003` is fully populated (405/405
rows have on-court data). Use game 2 as the primary possession-engine
smoke test; game 1 is retained for PBP schema and oracle-points testing.

## Schema notes

`wnba_pbp(version="v3")` output (73 cols) is byte-identical in column
names and meanings to `hoopR::nba_pbp()`:

- `event_type`: V2 EVENTMSGTYPE numeric code as character
  ("1"=MadeShot, "2"=MissedShot, "3"=FreeThrow, "4"=Rebound,
   "5"=Turnover, "6"=Foul, "8"=Sub, "9"=Timeout, "10"=JumpBall,
   "12"=StartPeriod/EndPeriod, "13"=EndPeriod)
- `sub_type`: for FTs, carries "Free Throw N of N" string (same format
  as hoopR — `.is_last_ft()` applies without modification)
- `location`: "h" (home team possession) / "v" (visitor possession) / ""
- `team_id`: numeric integer (home=1611661322-range, away similar)
- `away_player1..5` / `home_player1..5`: numeric athlete IDs (NA when
  rotation endpoint unavailable; populated for game 2)
- `home_score` / `away_score`: integer running totals (forward-filled)
- `shot_result`: "Made" / "Missed" / NA

The engine port (Task 1) is a clean mirror — no column mapping needed.

# Running-score repair fixtures

Real ESPN summary payloads for `tests/testthat/test-espn_score_repair.R`, and sportsdataverse-py's
output on the same bytes (`expected/<name>.csv`: `row` = 1-based array position, `sequence_number`,
`home_score`, `away_score`, `score_source`). Never hand-edit either: regenerate with the maintainer
script `ClaudeCowork/scripts/score-repair-r/write_expected.py` (private repo; it runs sportsdataverse-py's
`espn_<lg>_pbp` -> `helper_<lg>_play_by_play` on each payload and writes the five columns) from a
sportsdataverse-py checkout. Expected files written from sportsdataverse-py @ 78a0fb8130b5acd8180e8784b67e26481c4c44a8.

| File | Source | What it pins |
|---|---|---|
| `wnba_240618004.json.gz` | wehoop-wnba-raw `wnba/json/raw/240618004.json` @ 9bc2a03e0 (2023-04-08), via sportsdataverse-py's fixture | 2004-06-18, two halves: ESPN's score falls once and ends 61-69 vs official 63-69; 245 rows re-based |
| `summary_wnba.json.gz` | gzip of sportsdataverse-py `tests/fixtures/espn/summary_wnba.json` (`summary?event=401726992`) | 2024 WNBA Finals G5 MIN @ NY, quarters + OT, clean feed |
| `wbb_400550784.json.gz` | wehoop-wbb-raw `wbb/json/raw/400550784.json` @ f6e7d5dc342 (2023-04-09) | 2013-14, two halves: the last two rows were never re-based, ESPN ends 52-54 vs official 54-56 |
| `summary_wbb.json.gz` | gzip of sportsdataverse-py `tests/fixtures/espn/summary_wbb.json` (`summary?event=401637613`) | 2024 national final IOWA vs SC, neutral site, quarters, clean feed |

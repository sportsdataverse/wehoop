# W League fixtures (`api.wjbl.01core.app/api`)

Copied byte for byte from sdv-py `tests/fixtures/wjbl/` at sdv-py `origin/main` `e3d232ebc9` (provenance of the bodies
themselves: that directory's README), under shorter names without `@`, and only the files the tests read. `full/` are
untruncated bodies fetched 2026-10-13; `captures/` are the sdv-internal-refs samples (refs `18ee8c3`, captured
2026-10-12) with arrays cut to 3 rows. Contact data and blood type are already `[redacted]` in every body.

| wehoop file | sdv-py `tests/fixtures/wjbl/` file |
|:---|:---|
| `leagues.json` | `full/leagues.json` (all 37 editions) |
| `months_45.json` | `captures/play-schedule-months.json` (league 45 = 2025-26; 3 of its months) |
| `schedules_45_2026-04.json` | `full/play-schedules@45_2026-04.json` (the four playoff games of April 2026) |
| `detail_7987.json`, `info_7987.json`, `box_7987.json`, `team_stats_7987.json`, `player_stats_7987.json` | `full/play-schedule__detail@7987.json`, `full/play-schedule@7987.json`, `full/boxscore@7987.json`, `full/pbp__team-stats@7987.json`, `full/pbp__player-stats@7987.json` (game 7987, 2025-26 playoff final game 1) |
| `pbp_7987.json.gz` | `full/pbp__play-by-play@7987.json`, gzipped (`gzip -9 -n`; 439 plays) |
| `detail_7360.json` | `captures/play-schedule__detail@7360.json` (2023-24, one overtime) |
| `detail_4243.json` | `captures/play-schedule__detail@4243.json` (2013-14 final: box score only, no play-by-play) |
| `standing_seasons.json` | `full/seasons__standings.json` (every season phase) |
| `team_standings_169.json` | `captures/team-standings.json` (phase 169, 3 of its teams) |
| `team_ranking_169_170.json` | `captures/team-ranking.json` (phases 169 and 170, 3 teams each) |
| `teams.json` | `full/teams__base.json` (69 franchises) |
| `roster_13_169.json` | `captures/team__roster.json` (team 13, phase 169; 3 players, 3 staff) |
| `player_9799.json` | `captures/player.json` |

The capture files are trimmed (3 rows per array) by the refs capture rule, not here; the runtime checks pass on them
because none of those routes checks a count.

`parity/` is sdv-py's own output on these files: each `<case>.csv` (`.csv.gz` when over 100 rows) is the frame of the
sdv-py wrapper `sportsdataverse.basketball.wjbl.<wrapper>` called with the arguments in `WJBL_CASES` of
`test-wjbl.R`, its transport (`requests.Session.request`) faked to answer these files, so the season mapping and the
runtime checks run too. Nulls are written as `\N` (distinct from an empty string); a carriage return inside a value is
written as the two characters `\r` (`read.csv()` drops a bare one). Floats are Python `repr`. `dtypes.json` is each
frame's polars schema and `requests.json` the routes and query sdv-py sent, in order. A `__7360` suffix is the same
wrapper on game 7360. Generated with `/mnt/sdv_repos/sdv-py/.venv/bin/python` on a detached worktree of sdv-py
`e3d232ebc9` (the generator script is not shipped).

# TBF fixtures: provenance

Copied unchanged from sdv-py `tests/fixtures/tbf/` at sdv-py `e3d232ebc9` (origin/main, 2026-10-18), which copied
them from sdv-internal-refs `tbf/` (captured live 2026-10-12; `full/` fetched live 2026-10-13). See that README
for the capture details. The bodies carry no e-mail address or phone number.

* `full/` -- the nine FULL, untruncated bodies of sdv-py `tests/fixtures/tbf/full/` (same names): game 346279
  (BSL 2026-27 week 1, Tofas 90-89 Pizzabulls Bordo Bandirma), the BSL 2026-27 standings, the Tofas team-season
  statistics (team_process_id 265995) and the BSL 2026-27 points leaders.
* `cap/` -- refs capture samples, every array cut to 3 rows (so `count` / `totalCount` disagree with the rows; the
  runtime tests patch them). Renamed by wrapper to keep paths under 100 characters:

| here | sdv-py `tests/fixtures/tbf/` |
|---|---|
| `cap/daily_matches.json` | `captures/Match__get-daily-matches.json` |
| `cap/leaders_assists.json` | `captures/Player__get-asist-leaders.json` |
| `cap/leaders_blocks.json` | `captures/Player__get-blok-leaders.json` |
| `cap/leaders_efficiency.json` | `captures/Player__get-mvp-leaders.json` |
| `cap/leaders_minutes.json` | `captures/Player__get-duration-leaders.json` |
| `cap/leaders_rebounds.json` | `captures/Player__get-ribound-leaders.json` |
| `cap/leaders_steals.json` | `captures/Player__get-top-calma-leaders.json` |
| `cap/leaders_threes.json` | `captures/Player__get-3Point-leaders.json` |
| `cap/leaders_turnovers.json` | `captures/Player__get-top-kaybi-leaders.json` |
| `cap/league_seasons.json` | `captures/League__get-leagues-and-seasons-by-prefix.json` |
| `cap/league_seasons_kbsl.json` | `captures/League__get-leagues-and-seasons-by-prefix@kbsl.json` (whole; wehoop's KBSL default) |
| `cap/leagues.json` | `captures/League__get-leagues-for-filter.json` |
| `cap/player_career.json` | `captures/Player__get-player-detail-profile-and-career-info.json` |
| `cap/players.json` | `captures/Player__get-player-list.json` |
| `cap/schedule.json` | `captures/Match__get-all-matches-for-filter.json` |
| `cap/seasons.json` | `captures/Season__get-seasons.json` |
| `cap/team_games.json` | `captures/Team__get-team-detail-matches-by-season-and-league.json` |
| `cap/team_roster.json` | `captures/Team__get-team-active-player-list-by-season-and-league.json` |
| `cap/team_staff.json` | `captures/Team__get-team-detail-team-staff-by-season-and-league.json` |
| `cap/teams.json` | `captures/Team__get-teams-by-leauge.json` |
| `cap/weeks.json` | `captures/League__get-league-weeks.json` |

* `parity/<short>.csv` -- the sdv-py frame of each of the 32 wrappers, written by sdv-py's own parser
  (`tbf_parsers.parse`) over the SAME fixture stamped with the SAME `_request` as sdv-py's
  `tools/codegen/gen_tbf.py` `ENDPOINTS` (recorded in `parity/manifest.json`), run with sdv-py e3d232ebc9.
  `parity/dtypes.json` is sdv-py's polars dtype per column of each parity frame, from the same fixtures:
  sdv-py e3d232ebc9 (`PYTHONPATH` set to a detached worktree of it) run with `/mnt/sdv_repos/sdv-py/.venv/bin/python`
  by a generator kept outside the repo (the same `tbf_parsers.parse` on the manifest bodies). The test asserts each R column's class against it.
  Datetimes are written `%Y-%m-%d %H:%M:%S` (Turkey local time), dates ISO, nulls empty, booleans `true`/`false`.
  `test-tbf.R` compares every cell; NA-vs-value counts as a mismatch.

* wehoop's KBSL default (`competition = "kbsl"`): `cap/schedule_kbsl.json` <- `captures/Match__get-all-matches-for-filter@a22209_w1.json`
  (KBSL 2026-27 week 1, cut to 3 rows; `count` patched to 3 by both sides). `parity/default_league_seasons.csv` and
  `parity/default_schedule.csv` are the frames of sdv-py `tbf_league_seasons(competition="kbsl")` and
  `tbf_schedule(season=2027, week=1, competition="kbsl")` run END TO END on `cap/league_seasons_kbsl.json` and
  `cap/schedule_kbsl.json` (`tbf_runtime._rt._download_json` faked to serve them), with sdv-py `38a22f936d`
  (2026-10-18) and the same CSV conventions; `parity/defaults.json` holds per case the wrapper, its arguments, the row
  count, every request sdv-py sent and the polars dtypes. `test-tbf.R` checks that wehoop's default calls
  (`tbf_league_seasons()`, `tbf_schedule(2027, week = 1)`) give the same frames and requests.

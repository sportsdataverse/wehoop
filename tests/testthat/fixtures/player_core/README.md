# player_core parity fixtures

Golden-master oracle for `espn_basketball_player_core()`, captured from the
Python implementation that currently produces the released `player_core`
dataset. The R function is a port; these files are what it must reproduce.

## Provenance

| | |
|---|---|
| Oracle functions | `sportsdataverse.wnba.helper_wnba_player_core`, `sportsdataverse.wbb.helper_wbb_player_core` |
| sdv-py version | `0.0.75` |
| Captured | 2026-08-03 |
| Payload source | `wehoop-wnba-raw/wnba/player_core/json/{id}.json`, `wehoop-wbb-raw/wbb/player_core/json/{id}.json` (committed raw trees) |
| Capture command | per-league helper on each payload, `pl.concat`, `write_csv` |

Both sdv-py helpers are thin re-exports of one implementation — the core-v2
athlete resource is the same payload shape across nba/wnba/mbb/wbb, so the
projection is league-agnostic. That is why one R function serves both leagues
here, and why `hoopR::espn_basketball_player_core()` is byte-identical to this
one. **A change to either must land in both in the same session, verified.**

## Files

- `wnba_1002.json`, `wnba_1007.json`, `wbb_13905.json`, `wbb_10000.json` —
  ESPN core-v2 athlete payloads, copied **unmodified** from the raw trees (git
  may normalise line endings; the parsed JSON is identical). Never
  hand-written.
- `expected_player_core.csv` — the oracle. 4 rows x 35 columns.

## Why these four athletes

Both leagues are represented deliberately: a divergence that only shows on
college payloads must fail here, not in production.

| athlete | league | covers |
|---|---|---|
| `1002` Jessica Breland | wnba | college **and** draft — the fully-populated pro path |
| `1007` Ta'Shia Phillips | wnba | **no college**, no draft, and the literal `"NA"` position abbreviation (see below) |
| `13905` Natasha Cloud | wbb | college + draft on the college side |
| `10000` Rebecca Tobin | wbb | **no college node yet a resolved `birth_country`** — college payloads carry `birthCountry` at the TOP LEVEL rather than nested under `birthPlace`. The men's fixtures cannot reach this branch. |

## `"NA"` is a value, not a missing marker

ESPN's "Not Available" position has `abbreviation: "NA"` — the two characters
N,A. `readr`'s default `na = c("", "NA")` turns that into a missing value even
under `col_character()`, which silently corrupts the oracle and makes a correct
port look wrong. The test therefore reads with `na = ""` only. Empty cells,
which is what genuine nulls serialise to, still read as `NA`.

## Column contract

35 columns: `athlete_id` **integer** (the join key into `player_box` /
`player_season_stats`, never a float-origin `"123.0"`); `age`, `position_id`,
`college_id`, `current_team_id`, `experience_years`, `status_id`, `draft_year`,
`draft_round`, `draft_selection` integer; `height`, `weight` double; `active`
logical; the rest character.

## Semantics worth not re-deriving

`current_team_id` is the athlete's team **today**, not their team in any past
season, and height/weight/jersey are a current snapshot — ESPN overwrites them
in place. The season a released row is filed under is *participation* (who
appeared that year, from `player_box`), not the vintage of the bio.

College and team ids come from parsing the `$ref` URL (`/colleges/{id}`,
`/teams/{id}`) — the port must **never fetch** the ref.

## Refreshing

Re-capture only when the Python oracle changes deliberately, and re-copy the
payloads in the same pass — a refreshed oracle against stale payloads is worse
than no oracle.

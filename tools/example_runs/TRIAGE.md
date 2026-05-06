# ESPN example triage — 2026-05-06

## Batch result

80 examples run, 14 classified EMPTY + 3 silently-failing (NULL return), all
others OK.

## Failures grouped by root cause

### A. Wrong wrapper URL (true bugs, fix in source)

| Function(s) | Current URL | Fix |
|---|---|---|
| `espn_{wbb,wnba}_athlete_info` | `site.api.../athletes/{id}` (404 for all) | `sports.core.api.../athletes/{id}` |
| `espn_{wbb,wnba}_team_news` | `/teams/{id}/news?limit=N` (returns `{}`) | `/news?team={id}&limit=N` |
| `espn_{wbb,wnba}_athlete_statisticslog` | `core/athletes/{id}/statisticslog?season=N` (404) | drop `?season=` query (just `/statisticslog`) |

### B. Wrapper extraction key drifted (true bug)

| Function(s) | Issue | Fix |
|---|---|---|
| `espn_{wbb,wnba}_athlete_splits` | Looks for `splits`/`categories`/`data` keys; ESPN now uses `splitCategories` | Prepend `splitCategories` to lookup chain |

### C. Wrapper logic mismatched to endpoint shape (true bug)

| Function | Issue | Fix |
|---|---|---|
| `espn_wnba_draft` | Calls `/draft` which returns `{rounds, athletes, ...}` (no `items`); needs `/draft/rounds` then walk `items[].picks[]` (picks are inline) | Rewrite parser to fetch `/draft/rounds`, walk inline picks, parse IDs from `$ref` URLs |

### D. Stale example athlete_id (example bug, not wrapper bug)

WBB examples use `athlete_id = "4432755"` which is Caitlin Clark — she went
pro after 2024 and ESPN now 404s for her under WBB. This breaks 8 example
runs (info / overview / stats / eventlog / gamelog / statisticslog / splits,
indirectly awards which silently returned 0-row).

| Fix | Replace `4432755` → `4433985` (Kylie Feuerbach, Iowa Senior, verified across all endpoints) |

### E. Endpoint removed by ESPN (no fix possible from our side)

| Function | Status |
|---|---|
| `espn_wnba_freeagents` | Both `core/...freeagents` (500) and other variants 4xx. Endpoint appears removed. Document as currently unavailable. |

### F. Off-season empty (NOT bugs — ESPN really has no data right now)

Today is 2026-05-06; WNBA season just starting, WBB in off-season:

- `espn_wbb_injuries`            → ESPN returns `injuries:[]`
- `espn_wbb_team_injuries`       → ESPN returns `{}`
- `espn_wbb_team_leaders`        → ESPN returns `{}`
- `espn_wnba_team_injuries`      → ESPN returns `{}`
- `espn_wnba_team_leaders`       → quiet team early in season

Wrappers handle these correctly. No code change needed; example output is just empty.

### G. ESPN data limitation (NOT a wrapper bug)

- `espn_wbb_athlete_eventlog`: ESPN returns `events: null` for every WBB
  athlete I sampled (4 athletes × 2 seasons). The endpoint exists but is
  unpopulated for college basketball. WNBA equivalent works (25 events).

## Fixes applied

| File | Change |
|---|---|
| `R/espn_basketball_athlete_helpers.R` | `.espn_basketball_athlete_info` URL → core API; rewrote nested-field parser to handle list shape |
| `R/espn_basketball_athlete_helpers.R` | `.espn_basketball_athlete_splits` adds `splitCategories` to lookup |
| `R/espn_basketball_athlete_helpers.R` | `.espn_basketball_athlete_statisticslog` URL drops `?season=` |
| `R/espn_basketball_athlete_helpers.R` | `.espn_basketball_athlete_eventlog` URL → `/seasons/{y}/.../eventlog`; parser drills into `events$items` and handles char-vector $ref columns |
| `R/espn_basketball_athlete_helpers.R` | `.espn_basketball_athlete_gamelog` parser captures all per-event scalar fields + nested team/opponent metadata (was only emitting `event_id`) |
| `R/espn_basketball_news_helpers.R` | `.espn_basketball_team_news` URL → `/news?team={id}` (was `/teams/{id}/news`) |
| `R/espn_wnba_transactions.R` | `espn_wnba_draft` rewritten to walk `/draft/rounds → items[].picks[]`; new return schema with traded/status/refs |
| `R/espn_wnba_transactions.R` | `espn_wnba_freeagents` documented as currently unavailable (ESPN 500) |
| `R/espn_wbb_athletes.R` | All WBB athlete examples: `4432755` (Caitlin Clark, now WNBA) → `4433985` (Kylie Feuerbach, current Iowa senior) |

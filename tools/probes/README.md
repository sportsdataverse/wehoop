# `tools/probes/` — WNBA Stats API regression-check toolkit

Manual probe scripts for diagnosing upstream API health when a wrapper
starts misbehaving. Each script targets a specific failure mode that has
historically surfaced in the wehoop / hoopR issue trackers — endpoint
retirement, payload shape changes, query-string sensitivity, client
fingerprinting, or data-collection gaps.

These are **diagnostic tools, not tests**. They print to stdout, use real
network, and aren't run by `devtools::check()` (the whole `tools/` tree is
in `.Rbuildignore`).

## When to reach for which probe

| If users report... | Run |
| --- | --- |
| `wnba_<fn>()` errors with `Connection was reset` or returns HTML | [`probe_schedule_endpoints.R`](probe_schedule_endpoints.R) for schedule-class endpoints; [`probe_cdn_payload.R`](probe_cdn_payload.R) to verify a CDN replacement is parser-compatible |
| `wnba_<fn>()` returns the wrong league's data | [`probe_known_broken.R`](probe_known_broken.R) — confirm against the live endpoint with explicit `league_id="10"` |
| `wnba_<fn>()` returns 200 + HTML instead of JSON | [`probe_param_order_sensitivity.R`](probe_param_order_sensitivity.R) — same param values in alphabetical vs `LeagueID`-first order |
| Mac/Linux user reports a wrapper "doesn't work" but it works on Windows | [`probe_known_broken.R`](probe_known_broken.R) from the reporter's environment — disentangle endpoint-dead from client-fingerprinting |
| hoopR adds a new `lifecycle::deprecate_stop(with = "nba_X")` redirect | [`probe_hoopr_redirect_targets.R`](probe_hoopr_redirect_targets.R) — verify `wnba_X` exists *and* returns data |
| Considering deprecating a hustle wrapper | [`probe_hustle_deprecated.R`](probe_hustle_deprecated.R) — sweep all 6 hustle endpoints; [`probe_hustle_boxscore_deep.R`](probe_hustle_boxscore_deep.R) for the boxscore-style one specifically |
| Considering adopting an NBA-only endpoint for WNBA use | [`probe_nba_endpoints_with_wnba_params.R`](probe_nba_endpoints_with_wnba_params.R) — most tracking endpoints return empty for WNBA, but a few populate |
| Quick smoke test after editing a wrapper | [`verify_wrapper_changes.R`](verify_wrapper_changes.R) — update the call list, run, eyeball the shape summary |

## Common conventions

All probes follow the same shape:

```r
options(warn = 1)
suppressPackageStartupMessages(devtools::load_all(quiet = TRUE))

# Update for current season before running.
game_id <- "1022600021"  # 2026-05-15 CON vs LVA
season  <- "2025-26"
```

Prefer the package's own `wehoop:::request_with_proxy()` +
`wehoop:::wnba_stats_map_result_sets()` over bare `httr2` calls when
hitting `stats.wnba.com` — the package helper sends the WNBA-specific
headers (`Origin`, `Referer`, `x-nba-stats-origin`, `x-nba-stats-token`)
that the upstream Cloudflare gate looks for. Bare `httr2` calls
frequently get `Connection was reset` from the same machine where the
package-helper version succeeds.

For CDN endpoints (`cdn.wnba.com`, `cdn.nba.com`) use bare `httr2` with
browser-ish headers — no `x-nba-stats-*` tokens needed.

## Updating probes between seasons

Each probe declares `game_id` and `season` constants at the top. After
the WNBA season changes, update these once per file:

- `game_id` — any recently-finalized game id from the current season
  (e.g. via `wnba_scoreboardv3(game_date = format(Sys.Date()-1, "%Y-%m-%d"), league_id = "10")`)
- `season` — `"YYYY-YY"` for WNBA Stats API (`"2025-26"` for the 2026 season)

## Adding a new probe

Mirror the existing files: header doc-block with the *what* and *why*,
followed by a self-contained R script that prints to stdout. Add an entry
to the table above. Keep them runnable in isolation (`Rscript`-friendly,
no shared state).

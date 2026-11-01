# wehoop test suite

Tests live in this directory and are organized by data source. Each
external-data domain is gated behind a source-specific env var so routine
local runs don't hit upstream APIs or download large release assets unless
the contributor opts in. Every helper also calls `skip_on_cran()` and
`skip_on_ci()` (see `helper-skip.R`), so live tests never run on CRAN or in
GitHub Actions, whatever the toggles are set to.

| Variable             | Helper                    | What it gates                                  |
|----------------------|---------------------------|------------------------------------------------|
| `WNBA_STATS_TESTS=1` | `skip_wnba_stats_test()`  | `test-wnba_*.R` (WNBA Stats API endpoints)     |
| `ESPN_TESTS=1`       | `skip_espn_test()`        | `test-espn_wbb_*.R`, `test-espn_wnba_*.R`      |
| `NCAA_WBB_TESTS=1`   | `skip_ncaa_wbb_test()`    | `test-ncaa_wbb_*.R`                            |
| `WEHOOP_LOAD_TESTS=1`| `skip_load_test()`        | `test-load_*.R` (data-repo release downloads)  |
| `FOX_TESTS=1`        | `skip_fox_test()`         | `test-fox_*.R`                                 |
| `OFFICIAL_NBA_TESTS=1`| `skip_official_nba_test()`| `test-wnba_referee_assignments.R`             |
| `BREF_TESTS=1`       | `skip_bref_test()`        | `test-bref_wnba.R` (Basketball-Reference)      |
| `WEHOOP_INTL_LIVE_TESTS=1` | `skip_intl_live()`  | international families (`helper-intl.R`)       |
| `TORVIK_TESTS=1`     | inline `Sys.getenv()` check | `test-bart_wbb.R` (Bart Torvik T-Rank)    |

## Load tests

`test-load_*.R` files exercise the `load_*()` functions, which pull season
files from
`https://github.com/sportsdataverse/sportsdataverse-data/releases/...`. Each
season asset is multiple megabytes, and a full multi-season run can be
hundreds of megabytes plus several minutes of network I/O.

These are kept separate from `WNBA_STATS_TESTS` / `ESPN_TESTS` on purpose:
the API tests issue small JSON requests, whereas the load tests download
large release assets. Bundling them under the same env var would force every
contributor running API tests to also pull down the full data repo, which is
undesirable for routine local checks.

To run only the load tests locally:

```sh
WEHOOP_LOAD_TESTS=1 Rscript -e 'devtools::test(filter = "load_")'
```

Even with `WEHOOP_LOAD_TESTS=1` set, `skip_load_test()` calls `skip_on_ci()`,
so the suite stays a no-op under GitHub Actions. Many load-test files also
call `skip_on_ci()` directly. To run a load test in CI you would have to
remove the `skip_on_ci()` call from `skip_live_test()` in `helper-skip.R` and
the direct call in that test file; weigh the bandwidth and flakiness cost on
the runners first.

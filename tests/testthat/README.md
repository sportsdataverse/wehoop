# wehoop test suite

Tests live in this directory and are organized by data source. Each
external-data domain is gated behind a source-specific env var so routine
local runs (and CI) don't hit upstream APIs or download large release assets
unless the contributor opts in.

| Variable             | Helper                    | What it gates                                  |
|----------------------|---------------------------|------------------------------------------------|
| `WNBA_STATS_TESTS=1` | `skip_wnba_stats_test()`  | `test-wnba_*.R` (WNBA Stats API endpoints)     |
| `ESPN_TESTS=1`       | `skip_espn_test()`        | `test-espn_wbb_*.R`, `test-espn_wnba_*.R`      |
| `NCAA_WBB_TESTS=1`   | `skip_ncaa_wbb_test()`    | `test-ncaa_wbb_*.R`                            |
| `WEHOOP_LOAD_TESTS=1`| `skip_load_test()`        | `test-load_*.R` (data-repo release downloads)  |

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

Even with `WEHOOP_LOAD_TESTS=1` set, every load test also calls
`skip_on_ci()`, so the suite stays a no-op under GitHub Actions by default.
This matches the pattern called out in `CLAUDE.md`:

> Note: in CI, many live API tests still include `skip_on_ci()` guards. Env
> vars alone do not override those guards unless tests are intentionally
> changed.

If you want a specific load test to run in CI as well, remove the
`skip_on_ci()` line from that individual test file (and weigh the bandwidth
cost on the runner before doing so).

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [wehoop Copilot Instructions](#wehoop-copilot-instructions)
  - [Project Context](#project-context)
  - [Repository Workflow](#repository-workflow)
  - [Code Style](#code-style)
  - [HTTP Layer](#http-layer)
  - [Messaging Layer](#messaging-layer)
  - [Function Naming](#function-naming)
  - [Roxygen Documentation](#roxygen-documentation)
  - [Testing](#testing)
    - [Environment Variables](#environment-variables)
  - [Conventional Commits](#conventional-commits)
  - [V3 API Notes](#v3-api-notes)
  - [WNBA-Specific Details](#wnba-specific-details)
  - [Common Pitfalls](#common-pitfalls)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# wehoop Copilot Instructions

## Project Context

wehoop is an R package (v3.0.0) that wraps the WNBA Stats API, ESPN API (WNBA & WBB), and NCAA women's basketball endpoints. It exports 200+ functions and uses roxygen2 for documentation, testthat for testing, and pkgdown for the documentation site.

When there is any conflict between this file and repository contributor docs, follow `CONTRIBUTING.md` and the current test implementations under `tests/testthat/` as the source of truth.

## Repository Workflow

- Use feature branches for changes.
- `main` is the default branch and release branch.
- For any change to exported functions, update tests and documentation in the same PR.

## Code Style

- Follow tidyverse style: snake_case for variables/functions, 2-space indentation.
- All WNBA Stats API functions use `request_with_proxy()` for HTTP calls with required WNBA headers.
- Use `%||%` (rlang) for null-safe defaults when parsing API responses.
- All returned data frames must pass through `janitor::clean_names()` then `make_wehoop_data()`.
- Use `pad_id()` for game IDs before passing to the API.
- Internal/non-exported helpers are prefixed with `.` (e.g., `.players_on_court_v3_wnba()`).
- Keep imports minimal and explicit; remove unused imports.

## HTTP Layer

WNBA Stats HTTP requests use `request_with_proxy()` in `utils_wnba_stats.R` which handles required WNBA headers:
- `Origin: https://stats.wnba.com`
- `Referer: https://www.wnba.com/`

Shared internal helpers in `utils.R`:
- `check_status()` for HTTP response validation
- `make_wehoop_data()` for standardizing data frame output
- `pad_id()` for zero-padding game IDs

ESPN and live endpoints use `rvest::session()` with `httr::timeout()`.

## Messaging Layer

User-facing messages use `cli`:
- `cli::cli_alert_danger()` for errors
- `cli::cli_alert_warning()` for warnings
- `cli::cli_alert_success()` for completion messages

## Function Naming

| Data Source      | Prefix                      | Example                                             |
| ---------------- | --------------------------- | --------------------------------------------------- |
| WNBA Stats API   | `wnba_`                     | `wnba_leagueleaders()`, `wnba_boxscoretraditionalv3()` |
| ESPN WNBA        | `espn_wnba_`                | `espn_wnba_pbp()`, `espn_wnba_teams()`              |
| ESPN WBB         | `espn_wbb_`                 | `espn_wbb_pbp()`, `espn_wbb_teams()`                |
| NCAA WBB         | `ncaa_wbb_`                 | `ncaa_wbb_teams()`                                   |
| Data loaders     | `load_wnba_` / `load_wbb_`  | `load_wnba_pbp()`, `load_wbb_team_box()`            |

## Roxygen Documentation

Every exported function needs:

- `@name` and `@rdname` tags with `NULL` object
- `@title` with bold markdown description
- `@author` tag
- `@param` for every parameter with descriptive text
- `@return` with markdown tables documenting column names and types for each data frame returned
- `@importFrom` for specific function imports
- `@export`
- `@family` for grouping in pkgdown (e.g., "WNBA PBP Functions", "WNBA Boxscore V3 Functions")
- `@details` with runnable example code block

## Testing

- Use `skip_on_cran()` and `skip_on_ci()` guards for all live API tests.
- **Column assertions must always use the subset direction** — expected ⊆ actual:
  `expect_in(sort(expected_cols), sort(colnames(x)))`. WNBA and ESPN APIs add columns without removing old ones, so strict `expect_equal(sort(colnames(x)), sort(cols))` will flag on any new column. The subset direction is the only pattern that survives upstream drift.
- **Always add a skip-if-empty guard immediately after the API call**, before any assertion that touches `x[[1]]`:
  ```r
  x <- wnba_func(...)
  if (length(x) == 0 || is.null(x[[1]]) || !is.data.frame(x[[1]]) ||
      nrow(x[[1]]) == 0) {
    skip("No rows returned from endpoint at test time")
  }
  ```
  This handles transient 500s, HTTP/2 stream errors, and empty responses without polluting the failure report.
- For tests that assert against multiple result sets (`x[[1]]..x[[N]]`) where the API sometimes returns fewer elements, wrap each assertion in a per-index null/empty-column helper:
  ```r
  check_cols <- function(i, cols) {
    if (length(x) < i || is.null(x[[i]]) || !is.data.frame(x[[i]]) ||
        ncol(x[[i]]) == 0) return(invisible(NULL))
    expect_in(sort(cols), sort(colnames(x[[i]])))
    expect_s3_class(x[[i]], "data.frame")
  }
  ```
  See `test-wnba_teamvsplayer.R` and `test-wnba_playerdashboardbyclutch.R`.
- For dynamic columns, `expect_true(all(core_cols %in% colnames(x)))` is equivalent to the subset-direction `expect_in()`.
- Add `Sys.sleep(3)` at the end of WNBA Stats API tests for rate limiting.
- Test game ID: `"1022200034"` for known completed WNBA games.

### Environment Variables

| Variable           | Description                  |
| ------------------ | ---------------------------- |
| `KP_USER` / `KP_PW` | KenPom credentials (if used) |

## Conventional Commits

Use the format: `type: description`

Types: `feat`, `fix`, `docs`, `test`, `refactor`, `chore`, `style`, `perf`, `ci`

- Optional scope is encouraged for clarity (e.g., `docs(instructions): ...`, `feat(pbp): ...`).
- Use `type!:` or a `BREAKING CHANGE:` footer for breaking changes.
- Keep commits logically grouped so each commit is easy to review and revert.

**Important**: Never include AI agents or assistants (e.g., Claude, Copilot) as co-authors on commits. Omit all `Co-Authored-By` trailers referencing AI tools.

## V3 API Notes

- V3 endpoints return nested JSON -- use `purrr::pluck()` for extraction.
- V3 PBP clock format is `"PT10M30.00S"` not `"MM:SS"`. Parsed with base R `regexec()`/`regmatches()`.
- V3 PBP substitutions: `personId` = outgoing player, incoming parsed from "SUB: IncomingPlayer FOR OutgoingPlayer" in description.
- V3-to-V2 conversion pipeline (`wnba_pbp()` V3 path): `wnba_playbyplayv3()` -> `.build_player_roster_wnba()` -> `.v3_to_v2_format_wnba()` -> `.players_on_court_v3_wnba()`.
- `.players_on_court_v3_wnba()` uses `wnba_gamerotation()` stint data with interval mapping (not substitution-event parsing like V2).
- V3 boxscore endpoints namespace: `boxscoretraditionalv3`, `boxscoreadvancedv3`, `boxscoreusagev3`, `boxscoresummaryv3`, etc.

## WNBA-Specific Details

- **Quarter length**: 10 minutes (not 12 like NBA)
- **Regulation time**: 40 minutes total (not 48)
- **Overtime**: 5 minutes (same as NBA)
- **Game ID format**: Start with "10" (e.g., `"1022200034"`)
- **LeagueID**: "10" for WNBA endpoints
- **Base URL**: `https://stats.wnba.com/stats/{endpoint}`
- **Time calculations**: Use 600 seconds per quarter (not 720), 2400 seconds for regulation (not 2880)

## Common Pitfalls

- **Return-value initialization is mandatory**: every wrapper that `return(X)` where `X` is assigned only inside `tryCatch(expr = {...})` must initialize `X` *before* the `tryCatch`. Otherwise, when the API errors, `return(X)` throws `object 'X' not found` instead of the intended empty-list fallback. Applies to `df_list`, `plays_df`, `pbp`, `teams`, `standings`, `conferences`, `resp`, `games`, `data`, etc. — any return variable.
- When dropping a known-transient column inside a function, use `dplyr::select(-dplyr::any_of("colname"))` instead of `dplyr::select(-"colname")`. The bare form errors the moment upstream drops the column.
- When renaming columns after `janitor::clean_names()`, use `dplyr::rename(dplyr::any_of(c(new = "old")))` so the function survives upstream rename/drops without breaking.
- ESPN API columns change over time — **column assertions in tests must use the subset direction** (`expect_in(expected, actual)`).
- V3 endpoints return different structures per endpoint — verify response structure.
- `pad_id()` must be called on game IDs before passing to the API.
- Local editor/worktree artifacts (e.g., `.vscode`, `.claude`, `tools/`, temp logs) can cause `R CMD check` notes — add them to `.Rbuildignore`.
- Never edit `NAMESPACE` or `man/` files by hand; regenerate with `devtools::document()`.
- WNBA time calculations use 10-minute quarters (600 seconds/quarter, 2400 seconds regulation) — **not** the NBA 12-minute / 720-second / 2880-second constants. The old `.players_on_court()` helper in `wnba_stats_pbp.R` had this bug and was corrected in 3.0.0.

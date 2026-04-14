# Contributing to wehoop

**Table of Contents** *generated with
[DocToc](https://github.com/thlorenz/doctoc)*

- [Contributing to wehoop](#contributing-to-wehoop)
  - [Development Setup](#development-setup)
  - [Workflow](#workflow)
    - [Making Changes](#making-changes)
    - [Adding a New WNBA Stats API
      Endpoint](#adding-a-new-wnba-stats-api-endpoint)
  - [Naming Conventions](#naming-conventions)
    - [Function Names](#function-names)
    - [General Naming Rules](#general-naming-rules)
    - [V2 vs V3 API Patterns](#v2-vs-v3-api-patterns)
    - [Data Processing Pipeline](#data-processing-pipeline)
    - [Roxygen Documentation](#roxygen-documentation)
    - [Code Style](#code-style)
  - [Commit Messages](#commit-messages)
  - [Pull Requests](#pull-requests)
  - [Testing](#testing)
    - [Test Pattern](#test-pattern)
    - [Rate Limiting](#rate-limiting)
  - [CI / GitHub Actions](#ci--github-actions)
  - [Reporting Issues](#reporting-issues)
  - [License](#license)

Thank you for your interest in contributing to wehoop! This guide will
help you get started.

## Development Setup

1.  **Fork and clone** the repository
2.  **Install dependencies**: Open the project in RStudio and run
    `devtools::install_deps(dependencies = TRUE)`
3.  **Create a feature branch** from `main`:
    `git checkout -b feat/your-feature main`

## Workflow

### Making Changes

1.  Edit source code in `R/`
2.  Regenerate docs: `devtools::document()`
3.  Run tests: `devtools::test()`
4.  Check the package: `devtools::check()`

### Adding a New WNBA Stats API Endpoint

1.  **Create the function** in the appropriate `R/wnba_stats_*.R` file
    following the existing pattern:
    - Use `wnba_endpoint()` +
      [`request_with_proxy()`](https://wehoop.sportsdataverse.org/reference/request_with_proxy.md)
      for HTTP
    - Parse response with
      [`purrr::pluck()`](https://purrr.tidyverse.org/reference/pluck.html)
      -\> [`data.frame()`](https://rdrr.io/r/base/data.frame.html) -\>
      [`janitor::clean_names()`](https://sfirke.github.io/janitor/reference/clean_names.html)
      -\> `make_wehoop_data()`
    - Use `%||%` (rlang) for null safety on every extracted field
2.  **Add roxygen docs** with `@export`, `@family`, `@return` (including
    column markdown tables), and `@details` example
3.  **Create a test** in `tests/testthat/` with `skip_on_cran()` and
    `skip_on_ci()` guards
4.  **Update NEWS.md** with a description of the new function
5.  Run `devtools::document()` to update NAMESPACE

## Naming Conventions

### Function Names

| Data Source    | Prefix                     | Example                                                                                                                                                                                                    |
|----------------|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| WNBA Stats API | `wnba_`                    | [`wnba_leagueleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueleaders.md), [`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md) |
| ESPN WNBA      | `espn_wnba_`               | [`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md), [`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md)                                 |
| ESPN WBB       | `espn_wbb_`                | [`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md), [`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)                                     |
| NCAA WBB       | `ncaa_wbb_`                | [`ncaa_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_teams.md)                                                                                                                       |
| Data loaders   | `load_wnba_` / `load_wbb_` | [`load_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_pbp.md), [`load_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_box.md)                             |

### General Naming Rules

- **snake_case** for all function names, variables, and parameters
- **Internal helpers** (not exported) are prefixed with `.` (e.g.,
  [`.players_on_court_v3_wnba()`](https://wehoop.sportsdataverse.org/reference/dot-players_on_court_v3_wnba.md))
- **Parameter names** use `snake_case` in R, mapped to `PascalCase` for
  the WNBA Stats API (e.g., `game_id` -\> `GameID`)
- **Game IDs** must always be passed through `pad_id()` before API calls
  (zero-pads to 10 digits)
- **File names** follow the pattern `R/wnba_stats_*.R`, `R/espn_*.R`,
  `R/ncaa_wbb_*.R`

### V2 vs V3 API Patterns

- **V2 endpoints** (e.g., `boxscoretraditionalv2`): Return
  `resultSets[].headers[] + rowSet[][]`. Parsed via
  `wnba_stats_map_result_sets()`.
- **V3 endpoints** (e.g., `boxscoretraditionalv3`): Return nested JSON.
  Parsed via
  [`purrr::pluck()`](https://purrr.tidyverse.org/reference/pluck.html)
  -\> [`data.frame()`](https://rdrr.io/r/base/data.frame.html) -\>
  pipeline.

### Data Processing Pipeline

All returned data frames must pass through:

``` r
raw_data %>%
  data.frame(stringsAsFactors = FALSE) %>%
  dplyr::as_tibble() %>%
  janitor::clean_names() %>%
  make_wehoop_data("Description from WNBA.com", Sys.time())
```

### Roxygen Documentation

Every exported function needs:

- `@name` and `@rdname` tags with `NULL` object preceding the function
- `@title` with bold markdown description
- `@author` tag
- `@param` for every parameter (including `...`)
- `@return` with markdown tables documenting column names and types
- `@importFrom` for specific function imports
- `@export`
- `@family` for grouping in pkgdown (e.g., `"WNBA PBP Functions"`,
  `"WNBA Boxscore V3 Functions"`)
- `@details` with a runnable example code block

### Code Style

- Follow [tidyverse style](https://style.tidyverse.org/): `snake_case`,
  2-space indentation
- Internal helpers start with `.` (e.g.,
  [`.players_on_court_v3_wnba()`](https://wehoop.sportsdataverse.org/reference/dot-players_on_court_v3_wnba.md))
- Game IDs must be passed through `pad_id()` before API calls
- Use `%||%` (rlang) for null-safe defaults when parsing API responses

## Commit Messages

Use [Conventional Commits](https://www.conventionalcommits.org/):

    feat: add wnba_playbyplayv3() endpoint wrapper
    fix: correct WNBA time calculations for 10-min quarters
    docs: update roxygen for wnba_pbp() version param
    test: add column validation for V3 boxscore endpoints
    refactor: extract clock parsing into helper
    chore: update .Rbuildignore
    ci: update GitHub Actions workflow versions

Optional scope is encouraged for clarity (e.g., `feat(pbp): ...`,
`docs(instructions): ...`). Use `type!:` or a `BREAKING CHANGE:` footer
for breaking changes. Split unrelated work into separate commits for
reviewability.

**Important**: Never include AI agents or assistants (e.g., Claude,
Copilot) as co-authors on commits. Omit all `Co-Authored-By` trailers
referencing AI tools.

## Pull Requests

- Target the `main` branch
- Include a clear description of what changed and why
- Ensure `devtools::check()` passes with no errors or warnings
- Add tests for new functions
- Update NEWS.md for user-facing changes

## Testing

### Test Pattern

When writing tests for WNBA Stats API endpoints, follow this pattern:

``` r
test_that("WNBA Endpoint Name", {
  skip_on_cran()
  skip_on_ci()

  x <- wnba_function(game_id = "1022200034")

  cols_x1 <- c("col1", "col2", ...)
  expect_in(sort(cols_x1), sort(colnames(x[[1]])))
  expect_s3_class(x[[1]], "data.frame")

  Sys.sleep(3)  # Rate limiting
})
```

For intermittent or empty responses:

``` r
if (length(x) == 0 || is.null(x[[1]]) || nrow(x[[1]]) == 0) {
  skip("No rows returned from endpoint at test time")
}
```

**Note**: All API tests are skipped on CRAN (`skip_on_cran()`) and CI
(`skip_on_ci()`) by default. They require network access and valid API
responses.

### Rate Limiting

The WNBA Stats API has rate limits similar to the NBA Stats API. Always
add `Sys.sleep(3)` at the end of each test to avoid hitting rate limits
during test runs.

## CI / GitHub Actions

The repository uses GitHub Actions for R CMD check and pkgdown site
deployment. The following secrets should be configured:

| Secret         | Used By       | Description             |
|----------------|---------------|-------------------------|
| `GITHUB_TOKEN` | All workflows | Auto-provided by GitHub |

## Reporting Issues

When filing a bug report, please include:

1.  A minimal **reprex** (reproducible example) using `reprex::reprex()`
2.  The **game ID** or parameters used
3.  Your [`sessionInfo()`](https://rdrr.io/r/utils/sessionInfo.html)
    output
4.  The specific **error message** or unexpected output

Use the [bug report
template](https://wehoop.sportsdataverse.org/ISSUE_TEMPLATE/bug_report.md)
when opening a new issue.

## License

By contributing, you agree that your contributions will be licensed
under the [MIT License](https://wehoop.sportsdataverse.org/LICENSE).

# Contributing to wehoop

**Table of Contents** *generated with
[DocToc](https://github.com/thlorenz/doctoc)*

- [Contributing to wehoop](#contributing-to-wehoop)
- [Development Setup](#development-setup)
- [Workflow](#workflow)
- [Naming Conventions](#naming-conventions)
- [Documentation Maintenance](#documentation-maintenance)
- [Commit Messages](#commit-messages)
- [Pull Requests](#pull-requests)
- [Testing](#testing)
- [CI / GitHub Actions](#ci-github-actions)
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

| Data Source | Prefix | Example |
|----|----|----|
| WNBA Stats API | `wnba_` | [`wnba_leagueleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueleaders.md), [`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md) |
| ESPN WNBA | `espn_wnba_` | [`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md), [`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md) |
| ESPN WBB | `espn_wbb_` | [`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md), [`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md) |
| NCAA WBB | `ncaa_wbb_` | [`ncaa_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_teams.md) |
| Data loaders | `load_wnba_` / `load_wbb_` | [`load_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md), [`load_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md) |

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

## Documentation Maintenance

Two regeneration steps are part of the commit workflow whenever the
relevant sources change. Both are mechanical — never edit the generated
regions by hand.

### Markdown TOCs (doctoc)

`NEWS.md`, `CLAUDE.md`, `CONTRIBUTING.md`,
`.github/copilot-instructions.md`, and
`.github/pull_request_template.md` carry a doctoc-generated table of
contents inside the standard marker comments. After editing any of those
files, regenerate the TOC before committing:

``` sh
Rscript tools/run_doctoc.R --maxlevel 2 \
  NEWS.md CLAUDE.md CONTRIBUTING.md \
  .github/copilot-instructions.md .github/pull_request_template.md
```

`cran-comments.md` is intentionally excluded — it is a short
release-notes file submitted to CRAN and does not need a TOC.

`tools/run_doctoc.R` is a no-deps R replacement for the npm `doctoc` CLI
— it produces output indistinguishable from the upstream tool, is
idempotent (a no-op if no headings changed), and runs without Node.js.
Use `--maxlevel 2` so the TOC only lists `#` and `##` headings; level-3
sub-entries crowd the nav.

### README.md (rmarkdown)

`README.md` is rendered from `README.Rmd`. The Rmd carries
`output: github_document: { toc: true, toc_depth: 2 }`, so the README
has its own auto-generated TOC. After editing `README.Rmd`, re-render
before committing:

``` r

devtools::build_readme()
```

Commit `README.Rmd` and the regenerated `README.md` together. Never
hand-edit `README.md`.

### DESCRIPTION (usethis)

After editing `DESCRIPTION` (adding/removing packages, bumping versions,
updating `Authors@R`, etc.), normalize formatting before committing:

``` r

usethis::use_tidy_description()
```

This re-orders fields, alphabetizes `Imports`/`Suggests`, and reflows
long lines so subsequent diffs stay minimal. Run it even for one-line
edits.

### Release notes triad: NEWS.md / cran-comments.md / \_pkgdown.yml

Three files describe the same release at different audiences. Whenever
you add a `NEWS.md` bullet, **think through all three before
committing**:

- **`NEWS.md`** — authoritative changelog for downstream users; rendered
  into the pkgdown changelog. **All new bullets go under the most recent
  unreleased version heading** (currently `# **wehoop 3.0.0**`). Do NOT
  create a new version section ahead of release. Add to or extend an
  existing subsection (`### Bug fixes`, `### Deprecations`,
  `### Test infrastructure`, etc.) instead of starting a new one when
  the change is incremental. Once `3.0.0` ships to CRAN, the development
  version gets its own heading and the rule rolls forward.

- **`cran-comments.md`** — what gets submitted to CRAN. Every behavioral
  or user-visible change you add to `NEWS.md` should also be reflected
  in `cran-comments.md` before submission. The two files are not
  duplicates: `NEWS.md` is the long-form changelog, `cran-comments.md`
  is the short-form release summary. If a `NEWS.md` bullet is purely
  internal (refactor, test infrastructure, dev tooling) it can be
  omitted from `cran-comments.md`.

- **`_pkgdown.yml`** — the pkgdown reference index. New exported
  functions need to land in the right `reference:` section. The existing
  wehoop config uses `starts_with("wnba_")` / `starts_with("espn_")` /
  `starts_with("ncaa_")` selectors so new functions matching those
  prefixes are picked up automatically; explicitly-listed functions need
  a manual entry. Functions deprecated via
  [`lifecycle::deprecate_stop()`](https://lifecycle.r-lib.org/reference/deprecate_soft.html) +
  `@keywords internal` are excluded from the rendered index by default —
  preview with
  [`pkgdown::build_site()`](https://pkgdown.r-lib.org/reference/build_site.html)
  when in doubt.

When the change touches the API surface (new export, deprecation,
removal), include a one-line note in your commit message confirming
you’ve checked all three files.

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

# Changelog

## **wehoop 3.0.0**

#### **New data loaders**

- feat: add `load_*` functions for season-level rosters and player
  stats, backed by new `sportsdataverse-data` release tags published by
  the `wehoop-wbb-data`, `wehoop-wnba-data`, and
  `wehoop-wnba-stats-data` pipelines. Each function follows the existing
  [`load_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_pbp.md)
  shape — `(seasons, ..., dbConnection = NULL, tablename = NULL)`,
  [`progressively()`](https://wehoop.sportsdataverse.org/reference/progressively.md)
  decorator, `data.table::rbindlist(use.names = TRUE, fill = TRUE)`,
  optional DB write, and a final `wehoop_data` class set on the
  in-memory result.
  - ESPN-backed loaders:
    [`load_wbb_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wbb_rosters.md),
    [`load_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_stats.md),
    [`load_wnba_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_rosters.md),
    [`load_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_stats.md)
    reading from the `espn_womens_college_basketball_rosters`,
    `espn_womens_college_basketball_player_season_stats`,
    `espn_wnba_rosters`, and `espn_wnba_player_season_stats` release
    tags respectively.
  - WNBA Stats API-backed loaders:
    [`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
    [`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
    [`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
    [`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md)
    reading from the `wnba_stats_rosters`, `wnba_stats_coaches`,
    `wnba_stats_player_season_stats`, and `wnba_stats_lineups` release
    tags respectively. New file `R/load_wnba_stats.R` houses the four
    `wnba_stats_*` loaders.
  - Adds
    [`most_recent_wnba_stats_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_stats_season.md)
    helper in `R/utils.R` (a thin wrapper around
    [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md)
    for naming symmetry with the `wnba_stats_*` family).
  - Tests gated by the existing `WEHOOP_LOAD_TESTS=1` env var via
    `skip_load_test()` (`tests/testthat/helper-skip.R`).
- feat: add additional `load_*` season-summary loaders backed by new
  `sportsdataverse-data` release tags. Each follows the same
  `(seasons, ..., dbConnection = NULL, tablename = NULL)` shape, single
  `.rds` per season,
  [`progressively()`](https://wehoop.sportsdataverse.org/reference/progressively.md)
  decorator, and final `wehoop_data` class set on the in-memory result.
  - ESPN-backed loaders:
    [`load_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_stats.md),
    [`load_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/load_wbb_standings.md),
    [`load_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_stats.md),
    [`load_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_standings.md),
    [`load_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
    reading from the `espn_womens_college_basketball_team_season_stats`,
    `espn_womens_college_basketball_standings`,
    `espn_wnba_team_season_stats`, `espn_wnba_standings`, and
    `espn_wnba_draft` release tags respectively.
  - WNBA Stats API-backed loaders:
    [`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md),
    [`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
    [`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md)
    reading from the `wnba_stats_team_season_stats`,
    `wnba_stats_standings`, and `wnba_stats_draft` release tags
    respectively.
  - Tests gated by the existing `WEHOOP_LOAD_TESTS=1` env var via
    `skip_load_test()`.
- feat: add `load_*` loaders for shot events, per-game rosters, and game
  officials backed by new `sportsdataverse-data` release tags. Each
  follows the same
  `(seasons, ..., dbConnection = NULL, tablename = NULL)` shape, single
  `.rds` per season,
  [`progressively()`](https://wehoop.sportsdataverse.org/reference/progressively.md)
  decorator, and final `wehoop_data` class set on the in-memory result.
  - ESPN-backed loaders:
    [`load_wbb_shots()`](https://wehoop.sportsdataverse.org/reference/load_wbb_shots.md),
    [`load_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md),
    [`load_wbb_officials()`](https://wehoop.sportsdataverse.org/reference/load_wbb_officials.md),
    [`load_wnba_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_shots.md),
    [`load_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_game_rosters.md),
    [`load_wnba_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_officials.md)
    reading from the `espn_womens_college_basketball_shots`,
    `espn_womens_college_basketball_game_rosters`,
    `espn_womens_college_basketball_officials`, `espn_wnba_shots`,
    `espn_wnba_game_rosters`, and `espn_wnba_officials` release tags
    respectively.
  - WNBA Stats API-backed loaders:
    [`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
    [`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
    [`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md)
    reading from the `wnba_stats_shots`, `wnba_stats_game_rosters`, and
    `wnba_stats_officials` release tags respectively.
  - Tests gated by the existing `WEHOOP_LOAD_TESTS=1` env var via
    `skip_load_test()`.
- feat: add 25 `load_*_manifest()` helpers (one per non-PBP/non-schedule
  dataset across the three release-tag families) plus a `datasets=`
  argument on
  [`update_wnba_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_db.md)
  /
  [`update_wbb_db()`](https://wehoop.sportsdataverse.org/reference/update_wbb_db.md)
  and a new
  [`update_wnba_stats_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_stats_db.md)
  for selective DB population. Manifest helpers return the per-season
  `season` / `row_count` / `generated_at_utc` / `source_endpoint` CSV
  attached to each release tag, so users can discover available seasons
  without triggering a heavy `load_*()` call. The `datasets=` arg lets
  callers populate specific tables (e.g.
  `update_wbb_db(datasets = c("rosters", "player_stats"))`); when `NULL`
  the historical play-by-play behavior is preserved.
- feat: add
  [`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
  [`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md)
  and
  [`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md)
  plus the matching
  [`load_wnba_stats_schedule_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md)
  /
  [`load_wnba_stats_player_game_logs_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md)
  /
  [`load_wnba_stats_pbp_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md)
  helpers. These read from the `wnba_stats_schedules`,
  `wnba_stats_player_game_logs` (new tag) and `wnba_stats_pbp` release
  tags now populated by the rewritten
  `wehoop-wnba-stats-data/R/wnba_stats_01_pbp.R` pipeline (V3 PBP with
  on-court lineups supplied directly by
  [`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md),
  plus possession assignment, FT-to-foul attribution, garbage-time flag,
  and a per-season + master schedule build). All three new datasets are
  also wired into
  [`update_wnba_stats_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_stats_db.md)
  (`datasets = c("schedule", "player_game_logs", "pbp", ...)`).

#### **ESPN endpoint expansion**

- feat: add ESPN news + calendar endpoint wrappers —
  [`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md),
  [`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md),
  [`espn_wbb_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_news.md),
  [`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md),
  [`espn_wbb_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_calendar.md),
  [`espn_wnba_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_calendar.md).
  League-level and team-level news feeds (site-v2 `/news`) plus
  scoreboard calendar blocks (site-v2 `/scoreboard?dates={season}`)
  parsed into tidy tibbles. Shared internal helpers
  ([`.espn_basketball_news()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_news.md),
  [`.espn_basketball_team_news()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_team_news.md),
  [`.espn_basketball_calendar()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_calendar.md))
  keep WBB and WNBA DRY.
- feat: add ESPN injury endpoint wrappers —
  [`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md),
  [`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md),
  [`espn_wbb_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_injuries.md),
  [`espn_wnba_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_injuries.md).
  League-wide and team-scoped injury feeds (site-v2 `/injuries` and
  `/teams/{id}/injuries`) parsed into flat tidy tibbles. Note: WBB
  injury data is typically sparse on ESPN; both league and team variants
  return an empty tibble (rather than erroring) when no injuries are
  reported. The `season` parameter on the league-wide functions is
  attached as a constant output column for downstream joins (ESPN’s
  injury endpoint does not accept a server-side season filter). Shared
  internal helpers
  ([`.espn_basketball_league_injuries()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_league_injuries.md),
  [`.espn_basketball_team_injuries()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_team_injuries.md))
  keep WBB and WNBA DRY.
- feat: add ESPN team-detail endpoint wrappers —
  [`espn_wbb_team()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md),
  [`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md),
  [`espn_wbb_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_roster.md),
  [`espn_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_roster.md),
  [`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md),
  [`espn_wnba_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_schedule.md),
  [`espn_wbb_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_leaders.md),
  [`espn_wnba_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_leaders.md).
  Single-team info (named list: `Info`, `Record`, `NextEvent`,
  `StandingSummary`, `Coaches`), roster (one row per athlete with
  position, height, weight, headshot), schedule (one row per event with
  opponent, venue, broadcast, result), and statistical leaders (long
  format per category-rank-athlete) via site-v2 `/teams/{id}`,
  `/teams/{id}/roster`, `/teams/{id}/schedule`, and
  `/teams/{id}/leaders`. Shared internal helpers
  ([`.espn_basketball_team()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_team.md),
  [`.espn_basketball_team_roster()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_team_roster.md),
  [`.espn_basketball_team_schedule()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_team_schedule.md),
  [`.espn_basketball_team_leaders()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_team_leaders.md)
  in `R/espn_basketball_team_helpers.R`) keep WBB and WNBA DRY.
- feat: add ESPN athlete coverage endpoint wrappers –
  [`espn_wbb_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_info.md),
  [`espn_wnba_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_info.md),
  [`espn_wbb_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_overview.md),
  [`espn_wnba_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_overview.md),
  [`espn_wbb_athlete_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_stats.md),
  [`espn_wnba_athlete_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_stats.md),
  [`espn_wbb_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_gamelog.md),
  [`espn_wnba_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_gamelog.md),
  [`espn_wbb_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_splits.md),
  [`espn_wnba_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_splits.md),
  [`espn_wbb_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_eventlog.md),
  [`espn_wnba_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_eventlog.md),
  [`espn_wbb_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_awards.md),
  [`espn_wnba_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_awards.md),
  [`espn_wbb_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_statisticslog.md),
  [`espn_wnba_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_statisticslog.md).
  Athlete bio/team/position/status/college/draft info (site-v2), season
  overview and last-5-games (web-common-v3), per-category stats as named
  list (web-common-v3), game-by-game log (web-common-v3), long-format
  splits (web-common-v3), per-event log with ref URLs as character
  columns (core-v2), awards (core-v2, sparse/often empty), and
  statistics log (core-v2). The awards endpoint returns an empty tibble
  with canonical columns when no data exist. The eventlog
  `statistics.$ref` URLs are returned as a `statistics_ref` character
  column and are not auto-resolved. Shared internal helpers
  ([`.espn_basketball_athlete_info()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_athlete_info.md),
  [`.espn_basketball_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_athlete_overview.md),
  [`.espn_basketball_athlete_stats()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_athlete_stats.md),
  [`.espn_basketball_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_athlete_gamelog.md),
  [`.espn_basketball_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_athlete_splits.md),
  [`.espn_basketball_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_athlete_eventlog.md),
  [`.espn_basketball_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_athlete_awards.md),
  [`.espn_basketball_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_athlete_statisticslog.md)
  in `R/espn_basketball_athlete_helpers.R`) keep WBB and WNBA DRY.
- feat: add WNBA-only ESPN endpoint wrappers –
  [`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md),
  [`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md),
  [`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md),
  [`espn_wnba_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_conferences.md).
  [`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md)
  paginates the core-v2 `/seasons/{year}/draft` endpoint (up to 20
  pages) and returns a flat tibble of picks (round, pick, overall, team,
  athlete, position, college).
  [`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md)
  wraps core-v2 `/seasons/{year}/freeagents` and returns an empty tibble
  outside the free-agent window.
  [`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md)
  wraps site-v2 `/transactions?season={year}&limit={limit}` with
  null-safe `to_team_id` for release transactions.
  [`espn_wnba_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_conferences.md)
  mirrors
  [`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md)
  using the WNBA scoreboard-conferences endpoint (site-v2
  `/scoreboard/conferences?seasontype=2`) with the same column shape and
  `dplyr::select(-dplyr::any_of("subGroups"))` drift guard.
- feat: add ESPN event-detail endpoint wrappers –
  [`espn_wbb_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_odds.md),
  [`espn_wnba_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_odds.md),
  [`espn_wbb_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_probabilities.md),
  [`espn_wnba_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_probabilities.md),
  [`espn_wbb_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_officials.md),
  [`espn_wnba_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_officials.md),
  [`espn_wbb_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_broadcasts.md),
  [`espn_wnba_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_broadcasts.md).
  Game-level odds (one row per provider; WBB typically empty), paginated
  play-level win probabilities (core-v2 `/probabilities` with internal
  page loop capped at 50 pages, respects `limit` parameter), per-game
  officials, and broadcast outlets. All via core-v2
  `/events/{id}/competitions/{id}/`. Shared internal helpers
  ([`.espn_basketball_event_odds()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_event_odds.md),
  [`.espn_basketball_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_event_probabilities.md),
  [`.espn_basketball_event_officials()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_event_officials.md),
  [`.espn_basketball_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_event_broadcasts.md)
  in `R/espn_basketball_event_helpers.R`) keep WBB and WNBA DRY.
- feat: add ESPN league-wide catalog endpoint wrappers –
  [`espn_wbb_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_leaders.md),
  [`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md),
  [`espn_wbb_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_venues.md),
  [`espn_wnba_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_venues.md),
  [`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md),
  [`espn_wnba_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coaches.md),
  [`espn_wbb_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athletes_index.md),
  [`espn_wnba_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athletes_index.md),
  [`espn_wbb_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_seasons.md),
  [`espn_wnba_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_seasons.md),
  [`espn_wbb_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_info.md),
  [`espn_wnba_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_info.md).
  League leaders (web-common-v3 statistics/byathlete), venue catalog,
  coach roster, athlete index (paginated with progress messages; WBB
  default limit 25000, WNBA 5000), season list, and single-season info
  parsed into tidy tibbles. `$ref` components in season info are
  returned as character columns and not auto-resolved. Shared internal
  helpers
  ([`.espn_basketball_leaders()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_leaders.md),
  [`.espn_basketball_venues()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_venues.md),
  [`.espn_basketball_coaches()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_coaches.md),
  [`.espn_basketball_athletes_index()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_athletes_index.md),
  [`.espn_basketball_seasons()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_seasons.md),
  [`.espn_basketball_season_info()`](https://wehoop.sportsdataverse.org/reference/dot-espn_basketball_season_info.md)
  in `R/espn_basketball_league_helpers.R`) keep WBB and WNBA DRY.
- docs: add `vignettes/espn-endpoints.Rmd` covering all 80 ESPN
  basketball wrappers (existing 22 + 58 new). Reorganize the pkgdown
  reference index into 14 per-domain ESPN subsections so the rendered
  nav scales for the new surface.

#### **CRAN preparation**

- Add `cph` (copyright holder) role to `Saiem Gilani` in `Authors@R`
  (CRAN strict requirement).
- Bump `LICENSE` and `LICENSE.md` copyright year from 2020 to 2026.
- Add full roxygen blocks (description, `@return`, `@examples`) to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md)
  and
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md),
  which had been title/`@export`-only.
- Add `@examples \donttest{}` blocks to all 58 new ESPN endpoint
  wrappers. Live-API examples are wrapped in `\donttest{}` so they do
  not run during routine `R CMD check` but are still exercised under
  `--run-donttest`. The redundant `@details` code-block samples were
  removed from these 58 functions; the legacy `@details`-with-code-block
  convention is retained for the WNBA Stats API (`wnba_*`) and NCAA
  (`ncaa_wbb_*`) wrappers per the project’s documentation conventions in
  `CLAUDE.md`.
- Modernize `inst/CITATION`: replace deprecated
  [`citEntry()`](https://rdrr.io/r/utils/citEntry.html) /
  [`personList()`](https://rdrr.io/r/utils/personList.html) with
  [`bibentry()`](https://rdrr.io/r/utils/bibentry.html) /
  `c(person(), ...)` (R 4.x deprecation cleanup).
- Add `parameter_descriptions` (dataset) and `year_to_season` (utility)
  to `_pkgdown.yml` reference index so
  [`pkgdown::check_pkgdown()`](https://pkgdown.r-lib.org/reference/check_pkgdown.html)
  passes (resolves the gh-pages deploy failure).

#### **WNBA Stats API V3 Endpoints Added**

- [`wnba_playbyplayv3()`](https://wehoop.sportsdataverse.org/reference/wnba_playbyplayv3.md)
  function added. V3 play-by-play endpoint wrapper, plus a V3-to-V2
  compatibility pipeline used by
  [`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md)
  (via
  [`.v3_to_v2_format_wnba()`](https://wehoop.sportsdataverse.org/reference/dot-v3_to_v2_format_wnba.md),
  [`.build_player_roster_wnba()`](https://wehoop.sportsdataverse.org/reference/dot-build_player_roster_wnba.md),
  [`.players_on_court_v3_wnba()`](https://wehoop.sportsdataverse.org/reference/dot-players_on_court_v3_wnba.md))
  that retains V2-compatible columns while adding V3-only columns
  (`x_legacy`, `y_legacy`, `shot_distance`, `shot_result`,
  `is_field_goal`, `points_total`, `shot_value`).
- [`wnba_boxscoresummaryv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv3.md)
  function added.
- [`wnba_boxscoreusagev3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev3.md)
  function added.

#### **WNBA Time Calculation Fix**

- [`.players_on_court()`](https://wehoop.sportsdataverse.org/reference/dot-players_on_court.md)
  — corrected quarter-length math to use 10-minute WNBA quarters (600
  seconds/quarter, 2400 seconds of regulation) rather than the NBA
  12-minute quarter constants.

#### **Data Loaders**

- [`update_wnba_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_db.md)
  function updated to use `sportsdataverse-data` releases url instead of
  `wehoop-data` repository URL
- [`update_wbb_db()`](https://wehoop.sportsdataverse.org/reference/update_wbb_db.md)
  function updated to use `sportsdataverse-data` releases url instead of
  `wehoop-data` repository URL

#### **Restored Functionality**

- [`wnba_draftboard()`](https://wehoop.sportsdataverse.org/reference/wnba_draftboard.md)
  — rewritten against the new upstream endpoint
  `https://content-api-prod.nba.com/public/1/leagues/wnba/draft/{season}/board`.
  The old `wnba.com/wp-json/api/v1/get_draft_board` endpoint stopped
  serving data; the replacement returns a tidied named list of two
  tibbles — `board` (draft metadata) and `picks` (one row per pick with
  team, prospect, career stats, and headshot URL). See
  [`?wnba_draftboard`](https://wehoop.sportsdataverse.org/reference/wnba_draftboard.md)
  for the column schema.
- **Un-deprecations** — the following wrappers were deprecated in 2.1.0
  or earlier in 3.0.0 dev when the underlying endpoints were returning
  empty result sets. Re-probing in mid-season 2026 (verified 2026-05-16
  against `LeagueID=10`, current 2025-26 season) shows the endpoints
  have resumed publishing populated data, so the
  [`lifecycle::deprecate_stop()`](https://lifecycle.r-lib.org/reference/deprecate_soft.html)
  shim has been removed and the original body restored on each:
  - [`wnba_playerprofilev2()`](https://wehoop.sportsdataverse.org/reference/wnba_playerprofilev2.md)
    — returns `SeasonTotalsRegularSeason` (9 seasons),
    `SeasonTotalsPostSeason` (7), `SeasonTotalsAllStarSeason` (6),
    `SeasonTotalsPreseason` (7), the matching `CareerTotals*` rollups,
    `SeasonRankingsRegularSeason`/`PostSeason`, `SeasonHighs` (17),
    `CareerHighs` (22), and `NextGame` for A’ja Wilson
    (`PLAYER_ID = 1628932`). Default `league_id` is now `'10'`.
  - [`wnba_teaminfocommon()`](https://wehoop.sportsdataverse.org/reference/wnba_teaminfocommon.md)
    — returns `TeamInfoCommon` (current-season W/L +
    conference/division + slug/code), `TeamSeasonRanks` (PTS/REB/AST +
    opponent PTS rank), and the 76-season `AvailableSeasons` list for
    Las Vegas Aces (`TEAM_ID = 1611661319`). Function body un-commented;
    error handling migrated from raw
    [`cli::cli_alert_danger()`](https://cli.r-lib.org/reference/cli_alert.html)
    to
    [`.report_api_error()`](https://wehoop.sportsdataverse.org/reference/dot-report_api_error.md)
    /
    [`.report_api_warning()`](https://wehoop.sportsdataverse.org/reference/dot-report_api_warning.md)
    for consistency.
  - [`wnba_teamyearbyyearstats()`](https://wehoop.sportsdataverse.org/reference/wnba_teamyearbyyearstats.md)
    — returns `TeamStats` with 30 seasons × 34 columns of full
    franchise-level year-by-year ledger (GP, W, L, win%, conference
    rank, division rank, ratings) for the Aces.
  - [`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md)
    — returns `LeagueLineupViz` with 458–4,169 5-player lineup
    combinations × 25 columns (off/def/net rating, pace, TS%, eFG%)
    depending on filters, current 2025-26 WNBA season.

#### **Bug Fixes**

- [`wnba_schedule()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule.md)
  — migrated off the retired `stats.wnba.com/stats/scheduleleaguev2`
  endpoint (returns Connection Reset since March 2026; issue
  [\#53](https://github.com/sportsdataverse/wehoop/issues/53)) to the
  public CDN at
  `cdn.wnba.com/static/json/staticData/scheduleLeagueV2.json`. The CDN
  serves the same `leagueSchedule.gameDates[].games[]` payload as the
  dead stats endpoint, requires no authentication or special headers,
  and stays current with the live WNBA season. For historical seasons
  (CDN only serves the current season) the function now emits a
  [`cli::cli_alert_info`](https://cli.r-lib.org/reference/cli_alert.html)
  pointing users at `load_wnba_schedule(seasons = ...)`, which reads
  cached ESPN snapshots from the `sportsdataverse-data` releases.
- [`wnba_leaguegamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamelog.md)
  — default `league_id` was `'00'` (NBA), causing every call without an
  explicit `league_id` argument to return ~2,500 rows of NBA data
  instead of WNBA (issue
  [\#48](https://github.com/sportsdataverse/wehoop/issues/48)). Default
  is now `'10'` (WNBA), matching the rest of the package. Additionally,
  **the parameter order in the outgoing query string was reordered to
  put `LeagueID` first**, because the WNBA Stats API as of 2026 returns
  a Cloudflare HTML error page for the alphabetical ordering
  (`Counter, DateFrom, DateTo, Direction, LeagueID, ...`) but a
  populated `LeagueGameLog` for `LeagueID`-first. Verified 2026-05-16:
  same param values, alphabetical-first returns HTML, `LeagueID`-first
  returns 572 WNBA rows.
- [`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md)
  — ESPN dropped the `subGroups` column from its scoreboard-conferences
  response; the function now uses
  `dplyr::select(-dplyr::any_of("subGroups"))` so new column drops no
  longer break the call. Also initializes `conferences <- NULL` before
  the `tryCatch` so a transient error surfaces a `cli_alert_danger`
  instead of `object 'conferences' not found`.
- [`ncaa_wbb_NET_rankings()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_NET_rankings.md)
  — the NCAA.com rankings table now exposes `Conf`/`Prev`/`Quad 1..4`
  headers; after
  [`janitor::clean_names()`](https://sfirke.github.io/janitor/reference/clean_names.html)
  these land as `conf`/`prev`/`quad_1..4`, breaking the documented
  schema. The function now renames `conf → conference` and
  `prev → previous` via `dplyr::rename(dplyr::any_of(...))` so existing
  consumers keep working while the new `quad_*` columns ride along
  untouched.
- **Return-value initialization pattern** — swept ~124 WNBA and ESPN
  wrappers that `return(df_list)` (or returned other vars assigned only
  inside `tryCatch(expr = ...)`) without initializing the return value
  first. When the API errored, callers saw `object 'df_list' not found`
  instead of the intended
  [`cli::cli_alert_danger`](https://cli.r-lib.org/reference/cli_alert.html) +
  empty-list fallback. Each wrapper now initializes its return variable
  before `tryCatch`, so errors degrade gracefully to an empty list /
  NULL. Affected files: `R/wnba_stats_boxscore.R`,
  `R/wnba_stats_boxscore_v3.R`, `R/wnba_stats_cume.R`,
  `R/wnba_stats_draft.R`, `R/wnba_stats_franchise.R`,
  `R/wnba_stats_leaders.R`, `R/wnba_stats_league.R`,
  `R/wnba_stats_league_dash.R`, `R/wnba_stats_lineups.R`,
  `R/wnba_stats_pbp.R`, `R/wnba_stats_player.R`,
  `R/wnba_stats_player_dash.R`, `R/wnba_stats_roster.R`,
  `R/wnba_stats_scoreboard.R`, `R/wnba_stats_shotchart.R`,
  `R/wnba_stats_team.R`, `R/wnba_stats_team_dash.R`,
  `R/wnba_stats_video.R`, `R/espn_wbb_data.R`, `R/espn_wnba_data.R`,
  `R/wnba_data_pbp.R`.
- [`wnba_data_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_data_pbp.md)
  — added `plays_df <- data.frame()` init so HTTP/2 stream errors from
  `data.wnba.com` return an empty data frame with a `cli_alert_danger`
  rather than `object 'plays_df' not found`.

#### **Test Suite Hardening**

- Flipped **394** column assertions from strict
  `expect_equal(sort(colnames(x)), sort(cols))` to subset checks
  `expect_in(sort(cols), sort(colnames(x)))` across **115** test files —
  per the CLAUDE.md guidance, WNBA / ESPN APIs add columns without
  removing old ones, and the strict checks were brittle.
- Injected `skip("No rows returned from endpoint at test time")` guards
  into **114** test files so tests which access `x[[1]]` degrade
  gracefully to a skip (rather than a subscript-out-of-bounds error)
  when the upstream endpoint errors or returns empty.
- Cleaned stale column names out of expected `cols` lists where ESPN
  renamed/removed columns (`jersey`, `active`, `team_x_ref_2`,
  `team_is_all_star`, `Team_ID` → `TEAM_ID`).
- Added per-element null/empty-column check helpers to
  `test-wnba_teamvsplayer.R` and `test-wnba_playerdashboardbyclutch.R`
  so tests tolerate the WNBA Stats API returning fewer result-set
  elements than the test expects.
- Added `tools/` directory (excluded from the package build via
  `.Rbuildignore`) containing the one-off R scripts used to apply the
  above sweeps: `patch_df_list_init.R`, `patch_return_var_init.R`,
  `flip_expect_equal_cols.R`, `inject_skip_guard.R`.

#### **Deprecations (lifecycle, slated for 3.1.0 removal)**

Adds `lifecycle` to `Imports` and migrates every existing
[`cli::cli_alert_danger()`](https://cli.r-lib.org/reference/cli_alert.html)
deprecation stub to
[`lifecycle::deprecate_stop()`](https://lifecycle.r-lib.org/reference/deprecate_soft.html),
matching the style used in `hoopR`. Calling any of these functions now
errors with a structured `lifecycleDeprecatedError` that names a
replacement (or, where none exists, an explanation). Their tests skip
with a `"Deprecated: <fn>() now errors by design; use <replacement>."`
message before the function call.

Newly deprecated in 3.0.0 — endpoints returned `<!DOCTYPE html>` (HTTP
404 / maintenance page) at test time:

- [`wnba_boxscoreplayertrackv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md)
  →
  [`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md)
- [`wnba_data_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_data_pbp.md)
  →
  [`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md)
  (the `data.wnba.com` mobile_teams feed is unstable; HTTP/2 stream
  errors are routine)
- [`wnba_playercareerbycollege()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollege.md)
  → details only; consider
  [`wnba_playercareerbycollegerollup()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollegerollup.md)
  or
  [`wnba_leaguedashplayerbiostats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerbiostats.md)
- [`wnba_teamgamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamestreakfinder.md)
  →
  [`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md)
- [`wnba_teamhistoricalleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_teamhistoricalleaders.md)
  →
  [`wnba_franchiseleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaders.md)

Already deprecated, re-stated under the lifecycle pattern:

- [`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md)
  (3.0.0) — endpoint dead, no replacement
- [`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_hustlestatsboxscore.md)
  (3.0.0) — endpoint dead, no replacement
- [`wnba_leaguehustlestatsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsplayer.md)
  (3.0.0) — endpoint dead, no replacement
- [`wnba_leaguehustlestatsplayerleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsplayerleaders.md)
  (3.0.0) — endpoint dead, no replacement
- [`wnba_leaguehustlestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsteam.md)
  (3.0.0) — endpoint dead, no replacement
- [`wnba_leaguehustlestatsteamleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsteamleaders.md)
  (3.0.0) — endpoint dead, no replacement
- [`wnba_homepageleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_homepageleaders.md)
  (2.1.0) →
  [`wnba_homepagewidget()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagewidget.md)
- [`wnba_homepagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagev2.md)
  (2.1.0) →
  [`wnba_homepagewidget()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagewidget.md)
- [`wnba_leaderstiles()`](https://wehoop.sportsdataverse.org/reference/wnba_leaderstiles.md)
  (2.1.0) →
  [`wnba_homepagewidget()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagewidget.md)
- [`wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboard.md)
  (2.1.0) →
  [`wnba_scoreboardv3()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboardv3.md)
- [`wnba_videodetails()`](https://wehoop.sportsdataverse.org/reference/wnba_videodetails.md)
  (3.0.0) →
  [`wnba_videoevents()`](https://wehoop.sportsdataverse.org/reference/wnba_videoevents.md)
- [`wnba_videodetailsasset()`](https://wehoop.sportsdataverse.org/reference/wnba_videodetailsasset.md)
  (3.0.0) →
  [`wnba_videoevents()`](https://wehoop.sportsdataverse.org/reference/wnba_videoevents.md)

Soft warning (lifecycle::deprecate_warn) — function still runs but
recommends a replacement; will escalate to `deprecate_stop` if the
upstream endpoint isn’t restored:

- [`wnba_boxscoresummaryv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv3.md)
  →
  [`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2.md).
  The V3 endpoint still answers 200 OK with the full schema, but the
  core result sets (`game_summary`, `line_score`, `inactive_players`,
  `other_stats`, `available_video`, `game_info`, `arena_info`) come back
  zero-row in 2025; only `officials` and `last_five_meetings` populate.
  The V2 variant still returns full data.

#### **HTTP layer**

- **Jittered exponential backoff in
  [`.retry_request()`](https://wehoop.sportsdataverse.org/reference/dot-retry_request.md).**
  Replaced the default fixed 2-second retry cadence with
  `runif(1, 0.5, 1.5) * 2^i` so retries from concurrent users hitting
  the same rate-limited endpoint don’t synchronize into a
  thundering-herd burst that Cloudflare scores as an attack. Same 3 max
  tries; same backoff envelope (~0.5–6s); just spread.

- **Restored proxy support.** When wehoop migrated from `httr` to
  `httr2` in the V3 work, the legacy
  [`httr::use_proxy()`](https://httr.r-lib.org/reference/use_proxy.html)
  plumbing was dropped and
  [`request_with_proxy()`](https://wehoop.sportsdataverse.org/reference/request_with_proxy.md)
  quietly stopped honoring proxies (its `...` was preserved purely for
  source compatibility — see the prior comment “currently unused
  (preserved for backwards compatibility with callers that previously
  passed
  [`httr::use_proxy()`](https://httr.r-lib.org/reference/use_proxy.html)
  etc.)”). Both
  [`request_with_proxy()`](https://wehoop.sportsdataverse.org/reference/request_with_proxy.md)
  and the lower-level
  [`.retry_request()`](https://wehoop.sportsdataverse.org/reference/dot-retry_request.md)
  now accept a `proxy =` argument:

  - `proxy = NULL` (default) — libcurl reads `http_proxy` /
    `https_proxy` / `no_proxy` env vars automatically.
  - `proxy = "http://host:port"` — string form, forwarded to
    `httr2::req_proxy(url = ...)`.
  - `proxy = list(url=, port=, username=, password=, auth=)` — named
    list spread into
    [`httr2::req_proxy()`](https://httr2.r-lib.org/reference/req_proxy.html)
    for authenticated proxies. Resolution order in
    [`.retry_request()`](https://wehoop.sportsdataverse.org/reference/dot-retry_request.md):
    explicit `proxy =` arg → `getOption("wehoop.proxy")` → libcurl env
    vars. The `...` thread works for WNBA Stats wrappers (which forward
    into
    [`request_with_proxy()`](https://wehoop.sportsdataverse.org/reference/request_with_proxy.md));
    ESPN / NCAA wrappers call
    [`.retry_request()`](https://wehoop.sportsdataverse.org/reference/dot-retry_request.md)
    directly without `...`, so use `options(wehoop.proxy = ...)` at the
    top of the session to cover those without per-function plumbing.
    Validated end-to-end:
    [`ncaa_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_teams.md)
    and
    [`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md)
    both routed through an authenticated test proxy via the option
    fallback.

#### **Test infrastructure**

- **Empty / NULL responses now FAIL the test instead of silently
  SKIPping.** The earlier
  `skip("No rows returned from endpoint at test time")` guard was hiding
  regressions: when an upstream endpoint starts returning HTML (404 /
  maintenance) or breaks in some other silent way, the test should flag
  it. Converted all 117 such guards across `tests/testthat/test-*.R`
  from `skip(...)` to `fail(...) + return(invisible(NULL))` so the test
  surfaces a FAIL count for follow-up. Deprecation skips and the
  env-gated `skip_*_test()` / `skip_on_cran()` / `skip_on_ci()` helpers
  are unchanged.
- Pinned 16 `wnba_team*` test files from
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md)
  to `most_recent_wnba_season() - 1` so the team-stats endpoints have a
  known-completed season to query and don’t degenerate to “no rows” in
  the WNBA off-season window.
  [`wnba_teams()`](https://wehoop.sportsdataverse.org/reference/wnba_teams.md)
  and standings tests still track the live season because that’s what
  they’re meant to verify.
- Bumped `.ncaa_headers()` user-agent to Chrome 130 and added the
  `Sec-Fetch-*` / `sec-ch-ua-*` headers a real browser sends.
- [`ncaa_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_teams.md)
  keeps its legacy `stats.ncaa.org/team/inst_team_list` scrape
  (per-season per-division team list with `season_id` populated), and
  now threads the `proxy =` argument from `...` through to
  [`.retry_request()`](https://wehoop.sportsdataverse.org/reference/dot-retry_request.md)
  at the top level. `stats.ncaa.org` is fronted by Akamai and returns
  HTTP 403
  (`Reference `[`#18`](https://github.com/sportsdataverse/wehoop/issues/18)`.<...>`)
  to many residential and cloud IP ranges; pass a proxy that egresses
  from a non-blocked address — either per-call
  (`ncaa_wbb_teams(year, division, proxy = list(url=, port=, username=, password=))`)
  or session-wide (`options(wehoop.proxy = list(...))`). See the
  `Network access` section of
  [`?ncaa_wbb_teams`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_teams.md)
  for the full resolution order.

#### **@return documentation: descriptions added to every roxygen table**

- Every `@return` markdown table across the 42 R source files was
  upgraded from two columns (`col_name | types`) to three columns
  (`col_name | types | description`). 580+ tables touched and 4,341
  total table rows; every result set on every function now ships a
  per-column description in `?<function>` help, the pkgdown reference,
  and the rendered man pages. Existing prose `\describe{}` blocks
  (notably on
  [`load_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wbb_pbp.md),
  [`load_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_pbp.md),
  and `parameter_descriptions`) are unchanged.
- Description content comes from four sources in precedence order:
  1.  `tools/docs/column_descriptions_curated.csv` — 619 hand-authored
      entries focused on the highest-traffic columns and basketball /
      ESPN domain conventions (team identity, advanced shooting metrics,
      hustle stats, V2 vs V3 column pairs, ESPN athlete / event / news
      fields);
  2.  `tools/docs/column_descriptions_api.csv` — 181 ESPN-authored
      descriptions mined live from 14 endpoints per league across both
      `wnba` and `womens-college-basketball`, covering 9 endpoint
      families: core-v2 athlete statistics (per-season, post-season,
      career), core-v2 team statistics, core-v2 statisticslog, core-v2
      leaders, web-v3 athlete stats / splits / gamelog / overview, and
      web-v3 statistics/byathlete leaderboards. Three response shapes
      are recognized: nested categories with stats objects, parallel
      arrays under categories, and top-level parallel-array shapes
      (splits / gamelog). This covers the ESPN stat-section column
      families (`general_*`, `offensive_*`, `defensive_*`,
      `rebounding_*`, `shooting_*`, `misc_*`) with full prose
      definitions straight from ESPN — e.g. `defensive_blocks` → “Short
      for blocked shot, number of times when a defensive player legally
      deflects a field goal attempt from an offensive player.” Re-mine
      at any time with `Rscript tools/docs/mine_api_descriptions.R`;
  3.  mined `\item{...}{...}` lines from existing `\describe{}` blocks;
  4.  heuristic patterns driven by column-name suffixes (`*_id`,
      `*_pct`, `*_made`, `*_attempted`, `*_per_36`, etc.) with
      basketball-friendly noun substitution (`fg → field goals`,
      `tov → turnovers`, `oreb → offensive rebounds`).
- Frequency-weighted coverage — what `?fn` readers actually see —
  **74.7% of the 4,341 [@return](https://github.com/return) table rows
  now carry a hand-quality description** (curated + ESPN-API + mined).
  The remaining 25.3% are heuristic-fallback rows; the heuristic
  generator’s snake_case expansion + suffix rules cover most of those
  acceptably (e.g. `defended_at_rim_field_goals_attempted` → “Number of
  defended at rim field goals attempted.”), and the long tail is
  dominated by single-occurrence columns from low-traffic endpoints.
- New tooling under `tools/docs/` (`.Rbuildignore`’d, sibling of the
  existing `tools/probes/` diagnostic toolkit):
  - `build_column_descriptions.R` — one-shot builder that combines the
    curated CSV + ESPN-API CSV + mined describe-block entries
    - heuristic fallbacks into `column_descriptions.csv`.
  - `column_descriptions_curated.csv` — the hand-edit surface; new
    entries here override API / mined / heuristic outputs on the next
    build.
  - `column_descriptions_api.csv` — ESPN-API-mined descriptions,
    regenerated by `tools/docs/mine_api_descriptions.R`.
  - `column_descriptions.csv` — generated dictionary (1,381 rows; 619
    curated, 161 ESPN-API, 8 mined, 3 parameter-overlap, 590 heuristic).
  - `espn_endpoints_catalog.md` — copy of the
    [sejaldua/espn-api](https://github.com/sejaldua/espn-api) endpoint
    catalog used to scope the miner.
  - `mine_api_descriptions.R` — driver that probes the ESPN endpoints
    which self-document their stat columns and writes
    `column_descriptions_api.csv`.
  - `audit_column_descriptions.R` — diagnostic that reports coverage
    stats and the highest-leverage heuristic columns still to curate.
  - `markdown_man_table_helper.R` — gained programmatic helpers
    (`load_column_descriptions()`, `make_return_table_md()`,
    `roxygenize_return()`, `augment_return_tables_in_file()`,
    `augment_all_r_files()`, plus the public
    `mine_espn_api_descriptions(url)` API miner); the legacy
    paste-snippet hand-tools at the top of the file are preserved inside
    `if (FALSE) {}` so the file is now safely
    [`source()`](https://rdrr.io/r/base/source.html)-able.
- The sweep is idempotent: re-running `augment_all_r_files()` after
  updating the dictionary refreshes existing 3-column tables in place
  rather than appending a fourth column.

## **wehoop 2.1.0**

CRAN release: 2024-07-21

- [`wnba_homepagewidget()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagewidget.md)
  function added to replace the following homepage functions being
  deprecated.
- [`wnba_homepageleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_homepageleaders.md)
  function deprecated due to WNBA Stats API deprecation.
- [`wnba_homepagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagev2.md)
  function deprecated due to WNBA Stats API deprecation.
- [`wnba_leaderstiles()`](https://wehoop.sportsdataverse.org/reference/wnba_leaderstiles.md)
  function deprecated due to WNBA Stats API deprecation.
- [`wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboard.md)
  function deprecated due to WNBA Stats API deprecation (use
  [`wnba_scoreboardv3()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboardv3.md)).
- [`wnba_teaminfocommon()`](https://wehoop.sportsdataverse.org/reference/wnba_teaminfocommon.md)
  function deprecated due to WNBA Stats API deprecation (use
  [`wnba_teamdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdetails.md)).

## **wehoop 2.0.0**

CRAN release: 2023-11-25

- `load_wnba_*()` functions now use `sportsdataverse-data` releases url
  instead of `wehoop-data` repository URL
- `load_wbb_*()` functions now use `sportsdataverse-data` releases url
  instead of `wehoop-data` repository URL
- [`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md)
  function and new
  [`wnba_pbps()`](https://wehoop.sportsdataverse.org/reference/wnba_pbps.md)
  function added with `on_court` (default `TRUE`) parameter to return on
  court players for each play event

## **wehoop 1.9.0**

#### **WNBA Stats API Live Endpoints**

- [`wnba_live_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_live_pbp.md)
  function added.
- [`wnba_live_boxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_live_boxscore.md)
  function added.
- [`wnba_todays_scoreboard()`](https://wehoop.sportsdataverse.org/reference/wnba_todays_scoreboard.md)
  function added.

#### **WNBA Boxscore V3 (and V3-styled) Endpoints Added**

- [`wnba_scoreboardv3()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboardv3.md)
  function added.
- [`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)
  function added.
- [`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv3.md)
  function added.
- [`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv3.md)
  function added.
- [`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv3.md)
  function added.
- [`wnba_boxscoreusagev3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev3.md)
  function added.
- [`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv3.md)
  function added.
- [`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv3.md)
  function added.
- [`wnba_boxscorehustlev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorehustlev2.md)
  function added.

#### **Other WNBA Stats API functions added**

- [`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md)
  function added.
- [`wnba_franchiseleaderswrank()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaderswrank.md)
  function added.
- [`wnba_leaderstiles()`](https://wehoop.sportsdataverse.org/reference/wnba_leaderstiles.md)
  function added.
- [`wnba_leagueleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueleaders.md)
  function added.
- [`wnba_videodetailsasset()`](https://wehoop.sportsdataverse.org/reference/wnba_videodetailsasset.md)
  function added.
- [`wnba_infographicfanduelplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_infographicfanduelplayer.md)
  function added.

#### **Other Functions Added**

- [`ncaa_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_teams.md)
  function added.

#### **Proxy Capability Added and Other Notes**

- Add rlang dots option for passing
  [`httr::use_proxy()`](https://httr.r-lib.org/reference/use_proxy.html)
  option to `wnba_*()` functions
- Returns documentation added for all working WNBA Stats API endpoints
  and ESPN functions
- Tests added for all working WNBA Stats API endpoints and ESPN
  functions, over 750 tests when run locally

## **wehoop 1.8.0**

- Add proxy rlang dots option for passing httr::use_proxy() option to
  wnba_stats\_\*() functions
- Improved output for
  [`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
  [`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
  [`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md),
  [`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md)

## **wehoop 1.7.0**

- [`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md)
  function added.
- [`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md)
  function added.
- [`wnba_teams()`](https://wehoop.sportsdataverse.org/reference/wnba_teams.md)
  function added. Useful for cross-walking between ESPN and WNBA Stats
  API

## **wehoop 1.6.0**

- Updates tidyr and dplyr statements to use quotations on columns
  instead of data masking per tidyselect deprecation notice.

## **wehoop 1.5.0**

CRAN release: 2022-06-17

### ~106 WNBA Stats API functions added

| name | file |
|:---|:---|
| [`wnba_alltimeleadersgrids()`](https://wehoop.sportsdataverse.org/reference/wnba_alltimeleadersgrids.md) | R/wnba_stats_leaders.R |
| [`wnba_assistleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_assistleaders.md) | R/wnba_stats_leaders.R |
| [`wnba_assisttracker()`](https://wehoop.sportsdataverse.org/reference/wnba_assisttracker.md) | R/wnba_stats_leaders.R |
| [`wnba_boxscoreadvancedv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreadvancedv2.md) | R/wnba_stats_boxscore.R |
| [`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorefourfactorsv2.md) | R/wnba_stats_boxscore.R |
| [`wnba_boxscoremiscv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoremiscv2.md) | R/wnba_stats_boxscore.R |
| [`wnba_boxscoreplayertrackv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md) | R/wnba_stats_boxscore.R |
| [`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscorescoringv2.md) | R/wnba_stats_boxscore.R |
| [`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv2.md) | R/wnba_stats_boxscore.R |
| [`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md) | R/wnba_stats_boxscore.R |
| [`wnba_boxscoreusagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreusagev2.md) | R/wnba_stats_boxscore.R |
| [`wnba_commonallplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_commonallplayers.md) | R/wnba_stats_roster.R |
| [`wnba_commonplayerinfo()`](https://wehoop.sportsdataverse.org/reference/wnba_commonplayerinfo.md) | R/wnba_stats_roster.R |
| [`wnba_commonplayoffseries()`](https://wehoop.sportsdataverse.org/reference/wnba_commonplayoffseries.md) | R/wnba_stats_roster.R |
| [`wnba_commonteamroster()`](https://wehoop.sportsdataverse.org/reference/wnba_commonteamroster.md) | R/wnba_stats_roster.R |
| [`wnba_cumestatsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayer.md) | R/wnba_stats_cume.R |
| [`wnba_cumestatsplayergames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayergames.md) | R/wnba_stats_cume.R |
| [`wnba_cumestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteam.md) | R/wnba_stats_cume.R |
| [`wnba_cumestatsteamgames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteamgames.md) | R/wnba_stats_cume.R |
| [`wnba_data_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_data_pbp.md) | R/wnba_data_pbp.R |
| [`wnba_draftboard()`](https://wehoop.sportsdataverse.org/reference/wnba_draftboard.md) | R/wnba_stats_draft.R |
| [`wnba_draftcombinedrillresults()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinedrillresults.md) | R/wnba_stats_draft.R |
| [`wnba_draftcombinenonstationaryshooting()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinenonstationaryshooting.md) | R/wnba_stats_draft.R |
| [`wnba_draftcombineplayeranthro()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombineplayeranthro.md) | R/wnba_stats_draft.R |
| [`wnba_draftcombinespotshooting()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinespotshooting.md) | R/wnba_stats_draft.R |
| [`wnba_draftcombinestats()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinestats.md) | R/wnba_stats_draft.R |
| [`wnba_drafthistory()`](https://wehoop.sportsdataverse.org/reference/wnba_drafthistory.md) | R/wnba_stats_draft.R |
| [`wnba_fantasywidget()`](https://wehoop.sportsdataverse.org/reference/wnba_fantasywidget.md) | R/wnba_stats_lineups.R |
| [`wnba_franchisehistory()`](https://wehoop.sportsdataverse.org/reference/wnba_franchisehistory.md) | R/wnba_stats_franchise.R |
| [`wnba_franchiseleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaders.md) | R/wnba_stats_franchise.R |
| [`wnba_franchiseplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseplayers.md) | R/wnba_stats_franchise.R |
| [`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md) | R/wnba_stats_boxscore.R |
| [`wnba_homepageleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_homepageleaders.md) | R/wnba_stats_leaders.R |
| [`wnba_homepagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagev2.md) | R/wnba_stats_leaders.R |
| [`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_hustlestatsboxscore.md) | R/wnba_stats_boxscore.R |
| [`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md) | R/wnba_stats_lineups.R |
| [`wnba_leaguedashplayerbiostats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerbiostats.md) | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashplayerclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerclutch.md) | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md) | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashplayerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerstats.md) | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashteamclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamclutch.md) | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md) | R/wnba_stats_league_dash.R |
| [`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md) | R/wnba_stats_league_dash.R |
| [`wnba_leaguegamefinder()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamefinder.md) | R/wnba_stats_league.R |
| [`wnba_leaguegamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamelog.md) | R/wnba_stats_league.R |
| [`wnba_leaguehustlestatsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsplayer.md) | R/wnba_stats_hustle.R |
| [`wnba_leaguehustlestatsplayerleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsplayerleaders.md) | R/wnba_stats_hustle.R |
| [`wnba_leaguehustlestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsteam.md) | R/wnba_stats_hustle.R |
| [`wnba_leaguehustlestatsteamleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguehustlestatsteamleaders.md) | R/wnba_stats_hustle.R |
| [`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md) | R/wnba_stats_lineups.R |
| [`wnba_leagueplayerondetails()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueplayerondetails.md) | R/wnba_stats_lineups.R |
| [`wnba_leagueseasonmatchups()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueseasonmatchups.md) | R/wnba_stats_lineups.R |
| [`wnba_leaguestandingsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguestandingsv3.md) | R/wnba_stats_league.R |
| [`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md) | R/wnba_stats_pbp.R |
| [`wnba_playerawards()`](https://wehoop.sportsdataverse.org/reference/wnba_playerawards.md) | R/wnba_stats_player.R |
| [`wnba_playercareerbycollege()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollege.md) | R/wnba_stats_player.R |
| [`wnba_playercareerbycollegerollup()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollegerollup.md) | R/wnba_stats_player.R |
| [`wnba_playercareerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats.md) | R/wnba_stats_player.R |
| [`wnba_playercompare()`](https://wehoop.sportsdataverse.org/reference/wnba_playercompare.md) | R/wnba_stats_player.R |
| [`wnba_playerdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md) | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbygamesplits.md) | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbygeneralsplits.md) | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbylastngames.md) | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyopponent.md) | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyshootingsplits.md) | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyteamperformance.md) | R/wnba_stats_player_dash.R |
| [`wnba_playerdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyyearoveryear.md) | R/wnba_stats_player_dash.R |
| [`wnba_playerestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_playerestimatedmetrics.md) | R/wnba_stats_player.R |
| [`wnba_playerfantasyprofile()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofile.md) | R/wnba_stats_player.R |
| [`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md) | R/wnba_stats_player.R |
| [`wnba_playergamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelog.md) | R/wnba_stats_player.R |
| [`wnba_playergamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelogs.md) | R/wnba_stats_player.R |
| [`wnba_playergamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamestreakfinder.md) | R/wnba_stats_player.R |
| [`wnba_playerheadshot()`](https://wehoop.sportsdataverse.org/reference/wnba_playerheadshot.md) | R/wnba_stats_player.R |
| [`wnba_playerindex()`](https://wehoop.sportsdataverse.org/reference/wnba_playerindex.md) | R/wnba_stats_player.R |
| [`wnba_playernextngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playernextngames.md) | R/wnba_stats_player.R |
| [`wnba_playerprofilev2()`](https://wehoop.sportsdataverse.org/reference/wnba_playerprofilev2.md) | R/wnba_stats_player.R |
| [`wnba_playervsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_playervsplayer.md) | R/wnba_stats_player.R |
| [`wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboard.md) | R/wnba_stats_scoreboard.R |
| [`wnba_scoreboardv2()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboardv2.md) | R/wnba_stats_scoreboard.R |
| [`wnba_shotchartdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartdetail.md) | R/wnba_stats_shotchart.R |
| [`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md) | R/wnba_stats_shotchart.R |
| [`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md) | R/wnba_stats_team_dash.R |
| [`wnba_teamdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbygamesplits.md) | R/wnba_stats_team_dash.R |
| [`wnba_teamdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbygeneralsplits.md) | R/wnba_stats_team_dash.R |
| [`wnba_teamdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbylastngames.md) | R/wnba_stats_team_dash.R |
| [`wnba_teamdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyopponent.md) | R/wnba_stats_team_dash.R |
| [`wnba_teamdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyshootingsplits.md) | R/wnba_stats_team_dash.R |
| [`wnba_teamdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyteamperformance.md) | R/wnba_stats_team_dash.R |
| [`wnba_teamdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyyearoveryear.md) | R/wnba_stats_team_dash.R |
| [`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md) | R/wnba_stats_team_dash.R |
| [`wnba_teamdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdetails.md) | R/wnba_stats_team.R |
| [`wnba_teamestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_teamestimatedmetrics.md) | R/wnba_stats_team.R |
| [`wnba_teamgamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelog.md) | R/wnba_stats_team.R |
| [`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md) | R/wnba_stats_team.R |
| [`wnba_teamgamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamestreakfinder.md) | R/wnba_stats_team.R |
| [`wnba_teamhistoricalleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_teamhistoricalleaders.md) | R/wnba_stats_team.R |
| [`wnba_teaminfocommon()`](https://wehoop.sportsdataverse.org/reference/wnba_teaminfocommon.md) | R/wnba_stats_team.R |
| [`wnba_teamplayerdashboard()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md) | R/wnba_stats_team.R |
| [`wnba_teamplayeronoffdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffdetails.md) | R/wnba_stats_team.R |
| [`wnba_teamplayeronoffsummary()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayeronoffsummary.md) | R/wnba_stats_team.R |
| [`wnba_teamvsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_teamvsplayer.md) | R/wnba_stats_team.R |
| [`wnba_teamyearbyyearstats()`](https://wehoop.sportsdataverse.org/reference/wnba_teamyearbyyearstats.md) | R/wnba_stats_team.R |
| [`wnba_videodetails()`](https://wehoop.sportsdataverse.org/reference/wnba_videodetails.md) | R/wnba_stats_video.R |
| [`wnba_videoevents()`](https://wehoop.sportsdataverse.org/reference/wnba_videoevents.md) | R/wnba_stats_video.R |
| [`wnba_videostatus()`](https://wehoop.sportsdataverse.org/reference/wnba_videostatus.md) | R/wnba_stats_video.R |

### Adds 4 ESPN WBB and WNBA functions

- [`wehoop::espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md)
  function added.

- [`wehoop::espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md)
  function added.

- [`wehoop::espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md)
  function added.

- [`wehoop::espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md)
  function added.

- Removes `furrr` and `future` dependencies and replaces with
  `purrr (>= 0.3.0)`

## **wehoop 1.2.1**

CRAN release: 2021-11-09

- Minor release to stay ahead of `tidyr` release revdepchecks

## **wehoop 1.2.0**

CRAN release: 2021-11-03

- Add returns for all the functions
- Update a handful of field names from the scoreboard functions and to
  also include neutral_site and conference_competition columns for the
  women’s college basketball scoreboard function.

## **wehoop 1.1.1**

- Change functions from `furrr::future_map_dfr()` functions to
  [`data.table::rbindlist()`](https://rdrr.io/pkg/data.table/man/rbindlist.html)
  functions for loaders.

## **wehoop 1.1.0**

#### **Add schedule loaders**

- [`wehoop::load_wbb_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wbb_schedule.html)
  function added
- [`wehoop::load_wnba_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule.html)
  function added

## **wehoop 1.0.0**

#### **Add team box score loaders**

- [`wehoop::load_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_box.html)
  function added
- [`wehoop::load_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_box.html)
  function added

#### **Add player box score loaders**

- [`wehoop::load_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_box.html)
  function added
- [`wehoop::load_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_box.html)
  function added

#### **Standings functions**

- [`wehoop::espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.html)
- [`wehoop::espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.html)

#### **Getting Started vignette**

- [Getting started with wehoop
  data](https://wehoop.sportsdataverse.org/articles/getting-started-wehoop.html)

## **wehoop 0.9.2**

#### **Quick fix for update db functions**

#### **Dependency pruning**

This update is a non-user facing change to package dependencies to
shrink the list of dependencies.

## **wehoop 0.9.1**

#### **Clean names and team returns**

- All functions have now been given the
  [`janitor::clean_names()`](https://rdrr.io/cran/janitor/man/clean_names.html)
  treatment
- [`wehoop::espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.html)
  has updated the returns to be more identity information related only
- [`wehoop::espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.html)
  to be more identity information related only
- All tests were updated

## **wehoop 0.9.0**

#### **Loading capabilities added to the package**

- [`wehoop::load_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wbb_pbp.html)
  and
  [`wehoop::update_wbb_db()`](https://wehoop.sportsdataverse.org/reference/update_wbb_db.html)
  functions added
- [`wehoop::load_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_pbp.html)
  and
  [`wehoop::update_wnba_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_db.html)
  functions added

## **wehoop 0.3.0**

#### **Dependencies**

- `R` version 3.5.0 or greater dependency added
- `purrr` version 0.3.0 or greater dependency added
- `rvest` version 1.0.0 or greater dependency added
- `progressr` version 0.6.0 or greater dependency added
- `usethis` version 1.6.0 or greater dependency added
- `xgboost` version 1.1.0 or greater dependency added
- `tidyr` version 1.0.0 or greater dependency added
- `stringr` version 1.3.0 or greater dependency added
- `tibble` version 3.0.0 or greater dependency added
- `furrr` dependency added
- `future` dependency added

#### **Test coverage**

- Added tests for all ESPN functions

##### **Function Naming Convention Change**

- Similarly, data and metrics sourced from ESPN will begin with `espn_`
  as opposed to `wbb_` or `wnba_`.
- Data sourced directly from the NCAA website will start the function
  with `ncaa_`

## **wehoop 0.2.0**

- Added support for ESPN’s play-by-play endpoints with the addition of
  the following functions:
- [`wehoop::espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md) -
  a convenience wrapper function around the following three functions
  (returns the results as a list of three data frames)
- [`wehoop::espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md)
- [`wehoop::espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md)
- [`wehoop::espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md)
- [`wehoop::espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md)
- [`wehoop::espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md)

## **wehoop 0.1.0**

- Added support for ESPN’s play-by-play endpoints with the addition of
  the following functions:
- [`wehoop::espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md) -
  a convenience wrapper function around the following three functions
  (returns the results as a list of three data frames)
- [`wehoop::espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md)
- [`wehoop::espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md)
- [`wehoop::espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md)
- [`wehoop::espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)
- [`wehoop::espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md)
- [`wehoop::espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md)
- [`wehoop::ncaa_wbb_NET_rankings()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_NET_rankings.md)
- [`wehoop::espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md)

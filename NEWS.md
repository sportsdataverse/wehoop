<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [**wehoop 3.0.0**](#wehoop-300)
- [**wehoop 2.1.0**](#wehoop-210)
- [**wehoop 2.0.0**](#wehoop-200)
- [**wehoop 1.9.0**](#wehoop-190)
- [**wehoop 1.8.0**](#wehoop-180)
- [**wehoop 1.7.0**](#wehoop-170)
- [**wehoop 1.6.0**](#wehoop-160)
- [**wehoop 1.5.0**](#wehoop-150)
- [**wehoop 1.2.1**](#wehoop-121)
- [**wehoop 1.2.0**](#wehoop-120)
- [**wehoop 1.1.1**](#wehoop-111)
- [**wehoop 1.1.0**](#wehoop-110)
- [**wehoop 1.0.0**](#wehoop-100)
- [**wehoop 0.9.2**](#wehoop-092)
- [**wehoop 0.9.1**](#wehoop-091)
- [**wehoop 0.9.0**](#wehoop-090)
- [**wehoop 0.3.0**](#wehoop-030)
- [**wehoop 0.2.0**](#wehoop-020)
- [**wehoop 0.1.0**](#wehoop-010)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# **wehoop 3.0.0**

### **New exported functions**

#### *New WNBA Stats API V3 endpoints*

| Function | Description |
|---|---|
| `wnba_playbyplayv3()` | V3 play-by-play endpoint wrapper. Used internally by `wnba_pbp()` via a V3→V2 compatibility pipeline (`.v3_to_v2_format_wnba()`, `.build_player_roster_wnba()`, `.players_on_court_v3_wnba()`) that retains V2-compatible columns while adding V3-only columns (`x_legacy`, `y_legacy`, `shot_distance`, `shot_result`, `is_field_goal`, `points_total`, `shot_value`). |
| `wnba_boxscoresummaryv3()` | V3 boxscore summary endpoint wrapper. |
| `wnba_boxscoreusagev3()` | V3 boxscore usage endpoint wrapper. |

#### *58 new ESPN endpoint wrappers (across 7 domains)*

Built on shared internal helpers in `R/espn_basketball_*_helpers.R` so each WBB/WNBA pair stays DRY (one bugfix to the helper propagates to both). The pkgdown reference index was reorganized into 14 per-domain ESPN subsections to scale the rendered nav.

*News & calendar*

| Function | Description |
|---|---|
| `espn_wbb_news()` / `espn_wnba_news()` | League-level news feed (site-v2 `/news`). |
| `espn_wbb_team_news()` / `espn_wnba_team_news()` | Team-level news feed (site-v2 `/teams/{id}/news`). |
| `espn_wbb_calendar()` / `espn_wnba_calendar()` | Scoreboard calendar blocks (site-v2 `/scoreboard?dates={season}`). |

*Injuries*

| Function | Description |
|---|---|
| `espn_wbb_injuries()` / `espn_wnba_injuries()` | League-wide injury feed (site-v2 `/injuries`). The `season` parameter is attached as a constant output column for downstream joins (ESPN's injury endpoint has no server-side season filter). |
| `espn_wbb_team_injuries()` / `espn_wnba_team_injuries()` | Team-scoped injury feed (site-v2 `/teams/{id}/injuries`). |

WBB injury data is typically sparse on ESPN; both variants return an empty tibble (rather than erroring) when no injuries are reported.

*Team detail*

| Function | Description |
|---|---|
| `espn_wbb_team()` / `espn_wnba_team()` | Single-team info as a named list (`Info`, `Record`, `NextEvent`, `StandingSummary`, `Coaches`) via site-v2 `/teams/{id}`. |
| `espn_wbb_team_roster()` / `espn_wnba_team_roster()` | Roster (one row per athlete with position, height, weight, headshot) via site-v2 `/teams/{id}/roster`. |
| `espn_wbb_team_schedule()` / `espn_wnba_team_schedule()` | Schedule (one row per event with opponent, venue, broadcast, result) via site-v2 `/teams/{id}/schedule`. |
| `espn_wbb_team_leaders()` / `espn_wnba_team_leaders()` | Statistical leaders (long format per category-rank-athlete) via site-v2 `/teams/{id}/leaders`. |

*Athlete coverage* (8 endpoints × 2 leagues = 16 functions)

| Function | Endpoint family | Description |
|---|---|---|
| `espn_wbb_athlete_info()` / `espn_wnba_athlete_info()` | site-v2 | Athlete bio/team/position/status/college/draft info. |
| `espn_wbb_athlete_overview()` / `espn_wnba_athlete_overview()` | web-common-v3 | Season overview and last-5-games. |
| `espn_wbb_athlete_stats()` / `espn_wnba_athlete_stats()` | web-common-v3 | Per-category stats as a named list. |
| `espn_wbb_athlete_gamelog()` / `espn_wnba_athlete_gamelog()` | web-common-v3 | Game-by-game log. |
| `espn_wbb_athlete_splits()` / `espn_wnba_athlete_splits()` | web-common-v3 | Long-format home/away/opponent splits. |
| `espn_wbb_athlete_eventlog()` / `espn_wnba_athlete_eventlog()` | core-v2 | Per-event log; `statistics.$ref` URLs returned as a `statistics_ref` character column (not auto-resolved). |
| `espn_wbb_athlete_awards()` / `espn_wnba_athlete_awards()` | core-v2 | Awards (sparse / often empty). Empty payload returns a canonical-shape empty tibble. |
| `espn_wbb_athlete_statisticslog()` / `espn_wnba_athlete_statisticslog()` | core-v2 | Statistics log. |

*WNBA-only ESPN endpoints*

| Function | Description |
|---|---|
| `espn_wnba_draft()` | Paginates core-v2 `/seasons/{year}/draft` (up to 20 pages); flat tibble of picks (round, pick, overall, team, athlete, position, college). |
| `espn_wnba_freeagents()` | Wraps core-v2 `/seasons/{year}/freeagents`; returns an empty tibble outside the free-agent window. |
| `espn_wnba_transactions()` | Wraps site-v2 `/transactions?season={year}&limit={limit}` with null-safe `to_team_id` for release transactions. |
| `espn_wnba_conferences()` | Mirrors `espn_wbb_conferences()` against the WNBA scoreboard-conferences endpoint; uses the same `dplyr::select(-dplyr::any_of("subGroups"))` drift guard. |

*Event detail* — all under core-v2 `/events/{id}/competitions/{id}/`

| Function | Description |
|---|---|
| `espn_wbb_event_odds()` / `espn_wnba_event_odds()` | Game-level odds (one row per provider; WBB typically empty). |
| `espn_wbb_event_probabilities()` / `espn_wnba_event_probabilities()` | Paginated play-level win probabilities (`/probabilities`); internal page loop capped at 50 pages, respects `limit` parameter. |
| `espn_wbb_event_officials()` / `espn_wnba_event_officials()` | Per-game officials. |
| `espn_wbb_event_broadcasts()` / `espn_wnba_event_broadcasts()` | Broadcast outlets. |

*League-wide catalog* (6 endpoints × 2 leagues = 12 functions)

| Function | Description |
|---|---|
| `espn_wbb_leaders()` / `espn_wnba_leaders()` | League leaders (web-common-v3 `statistics/byathlete`). |
| `espn_wbb_venues()` / `espn_wnba_venues()` | Venue catalog. |
| `espn_wbb_coaches()` / `espn_wnba_coaches()` | Coach roster. |
| `espn_wbb_athletes_index()` / `espn_wnba_athletes_index()` | Athlete index, paginated with progress messages (WBB default limit 25000, WNBA 5000). |
| `espn_wbb_seasons()` / `espn_wnba_seasons()` | Season list. |
| `espn_wbb_season_info()` / `espn_wnba_season_info()` | Single-season info; `$ref` components returned as character columns (not auto-resolved). |

#### *New data loaders (50+ functions)*

All loaders follow the existing `load_wnba_pbp()` shape — `(seasons, ..., dbConnection = NULL, tablename = NULL)`, `progressively()` decorator, `data.table::rbindlist(use.names = TRUE, fill = TRUE)`, optional DB write, and a final `wehoop_data` class set on the in-memory result. Tests gated by `WEHOOP_LOAD_TESTS=1` via `skip_load_test()` in `tests/testthat/helper-skip.R`. All datasets read from new `sportsdataverse-data` release tags published by the `wehoop-wbb-data`, `wehoop-wnba-data`, and `wehoop-wnba-stats-data` pipelines.

*Season-level rosters and player stats*

| Function | Release tag |
|---|---|
| `load_wbb_rosters()` | `espn_womens_college_basketball_rosters` |
| `load_wbb_player_stats()` | `espn_womens_college_basketball_player_season_stats` |
| `load_wnba_rosters()` | `espn_wnba_rosters` |
| `load_wnba_player_stats()` | `espn_wnba_player_season_stats` |
| `load_wnba_stats_rosters()` | `wnba_stats_rosters` |
| `load_wnba_stats_coaches()` | `wnba_stats_coaches` |
| `load_wnba_stats_player_stats()` | `wnba_stats_player_season_stats` |
| `load_wnba_stats_lineups()` | `wnba_stats_lineups` |

New file `R/load_wnba_stats.R` houses the four `wnba_stats_*` loaders. Adds `most_recent_wnba_stats_season()` helper in `R/utils.R` (thin wrapper around `most_recent_wnba_season()` for naming symmetry with the `wnba_stats_*` family).

*Season-summary loaders*

| Function | Release tag |
|---|---|
| `load_wbb_team_stats()` | `espn_womens_college_basketball_team_season_stats` |
| `load_wbb_standings()` | `espn_womens_college_basketball_standings` |
| `load_wnba_team_stats()` | `espn_wnba_team_season_stats` |
| `load_wnba_standings()` | `espn_wnba_standings` |
| `load_wnba_draft()` | `espn_wnba_draft` |
| `load_wnba_stats_team_stats()` | `wnba_stats_team_season_stats` |
| `load_wnba_stats_standings()` | `wnba_stats_standings` |
| `load_wnba_stats_draft()` | `wnba_stats_draft` |

*Shot events, per-game rosters, game officials*

| Function | Release tag |
|---|---|
| `load_wbb_shots()` | `espn_womens_college_basketball_shots` |
| `load_wbb_game_rosters()` | `espn_womens_college_basketball_game_rosters` |
| `load_wbb_officials()` | `espn_womens_college_basketball_officials` |
| `load_wnba_shots()` | `espn_wnba_shots` |
| `load_wnba_game_rosters()` | `espn_wnba_game_rosters` |
| `load_wnba_officials()` | `espn_wnba_officials` |
| `load_wnba_stats_shots()` | `wnba_stats_shots` |
| `load_wnba_stats_game_rosters()` | `wnba_stats_game_rosters` |
| `load_wnba_stats_officials()` | `wnba_stats_officials` |

*WNBA Stats API schedule + game logs + PBP*

| Function | Release tag |
|---|---|
| `load_wnba_stats_schedule()` + `_manifest()` | `wnba_stats_schedules` |
| `load_wnba_stats_player_game_logs()` + `_manifest()` | `wnba_stats_player_game_logs` (new tag) |
| `load_wnba_stats_pbp()` + `_manifest()` | `wnba_stats_pbp` |

Populated by the rewritten `wehoop-wnba-stats-data/R/wnba_stats_01_pbp.R` pipeline (V3 PBP with on-court lineups supplied directly by `wnba_pbp()`, plus possession assignment, FT-to-foul attribution, garbage-time flag, and a per-season + master schedule build). All three datasets are wired into `update_wnba_stats_db()` (`datasets = c("schedule", "player_game_logs", "pbp", ...)`).

*Manifest helpers + selective DB updates*

* Adds **25 `load_*_manifest()` helpers** (one per non-PBP/non-schedule dataset across the three release-tag families). Each manifest returns the per-season `season` / `row_count` / `generated_at_utc` / `source_endpoint` CSV attached to its release tag, so users can discover available seasons without triggering a heavy `load_*()` call.
* Adds a `datasets=` argument on `update_wnba_db()` / `update_wbb_db()` and a new `update_wnba_stats_db()` for selective DB population. Example: `update_wbb_db(datasets = c("rosters", "player_stats"))`. When `datasets=NULL`, the historical play-by-play behavior is preserved.

#### *Vignettes & reference reorganization*

* Adds `vignettes/espn-endpoints.Rmd` covering all 80 ESPN basketball wrappers (existing 22 + 58 new).
* Reorganizes the pkgdown reference index into 14 per-domain ESPN subsections so the rendered nav scales for the new surface.

#### *Tier 1 core-v2 expansion (crawler-driven)*

20 new wrappers across 9 resource families, paired with the matching hoopR additions. Surfaced by an internal `$ref`-following crawler that mapped the entire reachable basketball API surface (21,962 fetches, 1,570 unique templates across all 4 basketball leagues). Each wrapper is a thin shim over a shared `.espn_basketball_*()` helper.

| Function | Description |
|---|---|
| `espn_wnba_team_season_profile()` / `espn_wbb_team_season_profile()` | Era-correct team identity in a specific season plus `$ref` URLs for deeper resources (record, statistics, leaders, athletes, coaches, etc.). Historical depth back to **1997** (WNBA) / **1982** (WBB). |
| `espn_wnba_franchise()` / `espn_wbb_franchise()` | Franchise-level metadata. IDs are stable across relocations and rebrands. |
| `espn_wnba_franchises()` / `espn_wbb_franchises()` | Index of franchise IDs in the league. |
| `espn_wnba_season_awards()` / `espn_wbb_season_awards()` | Index of award IDs given out in a season. |
| `espn_wnba_award()` / `espn_wbb_award()` | Award detail with winners (one row per winner; multi-recipient awards return one row each). |
| `espn_wnba_futures()` | WNBA per-season futures betting board, long format (one row per market × team × sportsbook). ESPN does not expose a futures endpoint for WBB. |
| `espn_wbb_tournaments()` | Index of WBB tournaments (NCAA Tournament, WNIT, conference tournaments). ESPN does not expose a tournaments endpoint for the WNBA. |
| `espn_wbb_tournament()` | Single tournament metadata + seasons-list `$ref`. |
| `espn_wbb_tournament_seasons()` | Seasons in which a given WBB tournament was held. |
| `espn_wnba_team_record()` | WNBA team record breakdown for one (team × season × season-type). |
| `espn_wbb_coach()` | Single WBB head coach biography, current team / college refs, and counts of career-record + per-season coaching entries. |
| `espn_wnba_powerindex()` / `espn_wbb_powerindex()` | Per-season Basketball Power Index and related metrics, long format (one row per team × stat). |

#### *Tier 2A core-v2 expansion — season metadata*

10 new wrappers across 5 resource families covering season-level metadata: season types, the per-(season × season-type) leaderboards, and (mostly college-only) season rankings. Backed by a shared `R/espn_basketball_season_meta_helpers.R`. NBA + MBB siblings ship in hoopR's matching release.

| Function | Description |
|---|---|
| `espn_wnba_season_types()` / `espn_wbb_season_types()` | Index of season-type IDs that exist for one season (1 = preseason, 2 = regular, 3 = postseason, 4 = off-season). |
| `espn_wnba_season_type()` / `espn_wbb_season_type()` | Single season-type detail (start / end dates, has-groups / has-standings / has-legs flags, `$ref` URLs to deeper resources). |
| `espn_wnba_season_leaders()` / `espn_wbb_season_leaders()` | Per-(season × season-type) leaderboards in long format. 14–15 categories × 25 leaders ≈ 350 rows. |
| `espn_wnba_season_rankings()` / `espn_wbb_season_rankings()` | Index of season-level rankings (WNBA returns zero; WBB returns AP Top 25 + Coaches Poll). |
| `espn_wnba_season_ranking()` / `espn_wbb_season_ranking()` | Per-week snapshot index for one ranking source — each row resolves to a per-week ranked-teams endpoint. |

#### *Tier 2A core-v2 expansion — weeks + per-week rankings*

8 new wrappers across 4 resource families covering the week structure of a season. Backed by a shared `R/espn_basketball_week_helpers.R`. NBA + MBB siblings ship in hoopR's matching release.

| Function | Description |
|---|---|
| `espn_wnba_season_weeks()` / `espn_wbb_season_weeks()` | Index of weeks within one (season × season-type). WNBA returns 0 rows (no week structure exposed); WBB returns ~20 weeks per regular season. |
| `espn_wnba_season_week()` / `espn_wbb_season_week()` | Single-week metadata (number, start / end dates, text label, `$ref` to the per-week rankings endpoint). |
| `espn_wnba_week_rankings()` / `espn_wbb_week_rankings()` | Index of ranking sources for one week (WNBA returns zero; WBB returns AP + Coaches). |
| `espn_wnba_week_ranking()` / `espn_wbb_week_ranking()` | The ranked teams (typically 25 rows for WBB) for one (season-type × week × source). Includes current / previous rank, points, first-place votes, trend, record summary, team `$ref`. |

#### *Tier 2A core-v2 expansion — groups (conferences and divisions)*

8 new wrappers across 4 resource families covering the per-season group hierarchy. Backed by a shared `R/espn_basketball_group_helpers.R`. NBA + MBB siblings ship in hoopR's matching release.

| Function | Description |
|---|---|
| `espn_wnba_season_groups()` / `espn_wbb_season_groups()` | Index of group IDs (conferences / divisions) for one (season × season-type). |
| `espn_wnba_season_group()` / `espn_wbb_season_group()` | Single-group metadata + `$ref` URLs to parent, children, member teams, and standings. |
| `espn_wnba_season_group_children()` / `espn_wbb_season_group_children()` | Index of child groups (e.g. divisions inside a conference, or conferences inside the NCAA Division I umbrella group). |
| `espn_wnba_season_group_teams()` / `espn_wbb_season_group_teams()` | Index of team IDs that belong to the group for that (season × season-type). |

#### *Tier 2A core-v2 expansion — team deep + coach-in-season*

4 new wrappers paired with hoopR's Tier 2A team-deep release. Backed by `R/espn_basketball_team_deep_helpers.R`. (The odds-records and depth-chart endpoints are NBA / MBB only at ESPN — those siblings live in hoopR.)

| Function | Description |
|---|---|
| `espn_wnba_team_season_roster()` / `espn_wbb_team_season_roster()` | Per-season roster (core-v2 `seasons/{y}/teams/{id}/athletes`). Era-correct alternative to the existing site-v2 `espn_*_team_roster()`. |
| `espn_wnba_coach_season()` / `espn_wbb_coach_season()` | Single-coach metadata for one (coach × season). Sparse coverage — many combinations 404. |

#### *Tier 2A core-v2 expansion — athlete career + draft pick*

5 new wrappers paired with hoopR's matching release.

| Function | Description |
|---|---|
| `espn_wnba_athlete_seasons()` / `espn_wbb_athlete_seasons()` | List of seasons an athlete appeared in. |
| `espn_wnba_athlete_career_stats()` / `espn_wbb_athlete_career_stats()` | Long-format career stats. Default `stat_type = 0L` fetches the standard "All Splits" / regular-season view; pass a vector like `c(0L, 1L, 2L)` to bind multiple types via a `stat_type_id` column. Coverage of types 1 and 2 is sparse. |
| `espn_wnba_draft_pick()` | Single WNBA draft-pick detail. WBB has no draft endpoint, so this wrapper is WNBA-only on the wehoop side. |

#### *Tier 2B core-v2 expansion — athlete event log + draft completion*

5 new wrappers paired with hoopR's matching release.

| Function | Description |
|---|---|
| `espn_wnba_athlete_eventlog_v2()` / `espn_wbb_athlete_eventlog_v2()` | Per-season event log from core-v2. One row per (event × team) with `played` flag + refs. Distinct from `espn_*_athlete_eventlog()` (web-common-v3 with stats per game). |
| `espn_wnba_draft_rounds()` | Round-level summary for one WNBA draft year. |
| `espn_wnba_draft_athletes()` | Index of every athlete in a given WNBA draft year. |
| `espn_wnba_draft_status()` | Single-row snapshot of one draft year's current state. |

#### *Tier 2B core-v2 expansion — event meta endpoints*

8 new wrappers per league (16 across both packages) wrapping `events/{eid}/competitions/{cid}/...`. Paired with hoopR's matching release.

| Function | Description |
|---|---|
| `espn_wnba_event_situation()` / `espn_wbb_event_situation()` | Live game situation: timeouts, fouls, bonus state. |
| `espn_wnba_event_predictor()` / `espn_wbb_event_predictor()` | Pre-game predictor stats in long format (per team × stat). |
| `espn_wnba_event_powerindex()` / `espn_wbb_event_powerindex()` | Per-event power-index `$ref` index (sparse coverage). |
| `espn_wnba_event_propbets()` / `espn_wbb_event_propbets()` | Per-(event × provider) prop-bet markets in long format. |

#### *Tier 2B core-v2 expansion — event competitor sub-resources*

5 new resource families under `events/{eid}/competitions/{cid}/competitors/{team_id}/`, each shimmed for WNBA and WBB (10 new public functions). Paired with hoopR's matching release.

| Function | Description |
|---|---|
| `espn_wnba_event_competitor_linescores()` / `espn_wbb_event_competitor_linescores()` | Per-quarter scoring for one team in one event. One row per period (regulation + OT). |
| `espn_wnba_event_competitor_leaders()` / `espn_wbb_event_competitor_leaders()` | Per-team top performers in long format (one row per category × athlete rank). |
| `espn_wnba_event_competitor_roster()` / `espn_wbb_event_competitor_roster()` | Game-day roster index — athlete ids + core-v2 `$ref` URLs for deferred dereferencing. |
| `espn_wnba_event_competitor_statistics()` / `espn_wbb_event_competitor_statistics()` | Full team-game statistics in long format (one row per category × stat) with raw values and display strings. |
| `espn_wnba_event_competitor_records()` / `espn_wbb_event_competitor_records()` | Team records as of the event: overall / home / away / conference / division breakdowns. |

#### *Tier 2D core-v2 expansion — position dictionary*

2 new resource families for the league-specific position dictionary (4 new public functions). Position ids are **not** shared across the basketball family — id `1` resolves to `Point Guard` in WNBA and `Center` in WBB. These wrappers make the dictionary explicit so users can disambiguate position `$ref` URLs in athlete records.

| Function | Description |
|---|---|
| `espn_wnba_positions()` / `espn_wbb_positions()` | League position dictionary index. One row per position with id + canonical `$ref`. |
| `espn_wnba_position()` / `espn_wbb_position()` | Single-position detail: id, name, displayName, abbreviation, leaf flag, parent `$ref`. |

Both `_pkgdown.yml` league-catalog subsections updated to surface the new entries.

#### *pkgdown index*

The wehoop pkgdown reference index now lists every Tier 1 + Tier 2A wrapper (the 3.0.0 pkgdown build was failing with "topics missing from index" for the Tier 1 additions — fixed by adding a "Core-v2 expansion" subsection per league).

### **Behavior changes to existing functions**

#### *Restored functionality (un-deprecations)*

`wnba_draftboard()` is rewritten against the new upstream endpoint `https://content-api-prod.nba.com/public/1/leagues/wnba/draft/{season}/board` (the old `wnba.com/wp-json/api/v1/get_draft_board` endpoint stopped serving data). It now returns a tidied named list of two tibbles — `board` (draft metadata) and `picks` (one row per pick with team, prospect, career stats, and headshot URL). See `?wnba_draftboard` for the column schema.

The following wrappers were deprecated in 2.1.0 or earlier in 3.0.0 dev when their underlying endpoints returned empty result sets. Re-probing in mid-season 2026 (verified 2026-05-16 against `LeagueID=10`, current 2025-26 season) shows the endpoints have resumed publishing populated data, so the `lifecycle::deprecate_stop()` shim has been removed and the original body restored on each:

| Restored function | Verified return |
|---|---|
| `wnba_playerprofilev2()` | `SeasonTotalsRegularSeason` (9 seasons), `SeasonTotalsPostSeason` (7), `SeasonTotalsAllStarSeason` (6), `SeasonTotalsPreseason` (7), matching `CareerTotals*` rollups, `SeasonRankings*`, `SeasonHighs` (17), `CareerHighs` (22), and `NextGame` for A'ja Wilson (`PLAYER_ID = 1628932`). Default `league_id` is now `'10'`. |
| `wnba_teaminfocommon()` | `TeamInfoCommon` (current-season W/L + conference/division + slug/code), `TeamSeasonRanks` (PTS/REB/AST + opponent PTS rank), and 76-season `AvailableSeasons` list for the Aces. Body un-commented; error handling migrated from raw `cli::cli_alert_danger()` to `.report_api_error()` / `.report_api_warning()`. |
| `wnba_teamyearbyyearstats()` | `TeamStats` with 30 seasons × 34 columns of full franchise-level year-by-year ledger (GP, W, L, win%, conference rank, division rank, ratings) for the Aces. |
| `wnba_leaguelineupviz()` | `LeagueLineupViz` with 458–4,169 5-player lineup combinations × 25 columns (off/def/net rating, pace, TS%, eFG%) depending on filters, current 2025-26 WNBA season. |

#### *Bug fixes*

| Function | Fix |
|---|---|
| `wnba_schedule()` | Migrated off the retired `stats.wnba.com/stats/scheduleleaguev2` endpoint (returns Connection Reset since March 2026; issue #53) to the public CDN at `cdn.wnba.com/static/json/staticData/scheduleLeagueV2.json`. Same `leagueSchedule.gameDates[].games[]` payload, no authentication or special headers, stays current with the live season. For historical seasons (CDN only serves the current season) the function now emits a `cli::cli_alert_info` pointing users at `load_wnba_schedule(seasons = ...)`. |
| `wnba_leaguegamelog()` | Two fixes for issue #48: (1) default `league_id` was `'00'` (NBA), causing every parameterless call to return ~2,500 rows of NBA data; default is now `'10'` (WNBA), matching the rest of the package. (2) The outgoing query-string parameter order was reordered to put `LeagueID` first — the WNBA Stats API as of 2026 returns a Cloudflare HTML page for the alphabetical ordering but a populated `LeagueGameLog` for `LeagueID`-first. Verified 2026-05-16: alphabetical-first returns HTML, `LeagueID`-first returns 572 WNBA rows. |
| `.players_on_court()` | Corrected quarter-length math to use 10-minute WNBA quarters (600 seconds/quarter, 2400 seconds of regulation) rather than the NBA 12-minute quarter constants. |
| `espn_wbb_conferences()` | ESPN dropped the `subGroups` column from its scoreboard-conferences response; the function now uses `dplyr::select(-dplyr::any_of("subGroups"))` so further column drops no longer break the call. Also initializes `conferences <- NULL` before `tryCatch` so a transient error surfaces a `cli_alert_danger` instead of `object 'conferences' not found`. |
| `ncaa_wbb_NET_rankings()` | NCAA.com renamed table headers — after `janitor::clean_names()` these land as `conf`/`prev`/`quad_1..4`, breaking the documented schema. The function now renames `conf → conference` and `prev → previous` via `dplyr::rename(dplyr::any_of(...))` so existing consumers keep working while the new `quad_*` columns ride along untouched. |
| `wnba_data_pbp()` | Added `plays_df <- data.frame()` init so HTTP/2 stream errors from `data.wnba.com` return an empty data frame with a `cli_alert_danger` rather than `object 'plays_df' not found`. |

**Return-value initialization sweep.** Swept ~124 WNBA and ESPN wrappers that `return(df_list)` (or returned other vars assigned only inside `tryCatch(expr = ...)`) without initializing the return value first. When the API errored, callers saw `object 'df_list' not found` instead of the intended `cli::cli_alert_danger` + empty-list fallback. Each wrapper now initializes its return variable before `tryCatch`, so errors degrade gracefully to an empty list / NULL. Affected files: `R/wnba_stats_boxscore.R`, `R/wnba_stats_boxscore_v3.R`, `R/wnba_stats_cume.R`, `R/wnba_stats_draft.R`, `R/wnba_stats_franchise.R`, `R/wnba_stats_leaders.R`, `R/wnba_stats_league.R`, `R/wnba_stats_league_dash.R`, `R/wnba_stats_lineups.R`, `R/wnba_stats_pbp.R`, `R/wnba_stats_player.R`, `R/wnba_stats_player_dash.R`, `R/wnba_stats_roster.R`, `R/wnba_stats_scoreboard.R`, `R/wnba_stats_shotchart.R`, `R/wnba_stats_team.R`, `R/wnba_stats_team_dash.R`, `R/wnba_stats_video.R`, `R/espn_wbb_data.R`, `R/espn_wnba_data.R`, `R/wnba_data_pbp.R`.

#### *Data-loader URL migration*

| Function | Change |
|---|---|
| `update_wnba_db()` | Now uses the `sportsdataverse-data` releases URL instead of the legacy `wehoop-data` repository URL. |
| `update_wbb_db()` | Same migration. |

### **Deprecations (lifecycle, slated for 3.1.0 removal)**

Adds `lifecycle` to `Imports` and migrates every existing `cli::cli_alert_danger()` deprecation stub to `lifecycle::deprecate_stop()`, matching the style used in `hoopR`. Calling any of these functions now errors with a structured `lifecycleDeprecatedError` that names a replacement (or, where none exists, an explanation). Their tests skip with a `"Deprecated: <fn>() now errors by design; use <replacement>."` message before the function call.

*Newly deprecated in 3.0.0* — endpoints returned `<!DOCTYPE html>` (HTTP 404 / maintenance page) at test time:

| Deprecated function | Replacement | Reason |
|---|---|---|
| `wnba_boxscoreplayertrackv2()` | `wnba_boxscoreplayertrackv3()` | V2 returns 404 HTML |
| `wnba_data_pbp()` | `wnba_pbp()` | `data.wnba.com` mobile_teams feed unstable; HTTP/2 stream errors routine |
| `wnba_playercareerbycollege()` | `wnba_playercareerbycollegerollup()` / `wnba_leaguedashplayerbiostats()` | details endpoint returns empty |
| `wnba_teamgamestreakfinder()` | `wnba_teamgamelogs()` | endpoint returns 404 HTML |
| `wnba_teamhistoricalleaders()` | `wnba_franchiseleaders()` | endpoint returns 404 HTML |

*Already deprecated, re-stated under the lifecycle pattern:*

| Deprecated function | Replacement | Deprecated in |
|---|---|---|
| `wnba_boxscorehustlev2()` | (endpoint dead, no replacement) | 3.0.0 |
| `wnba_hustlestatsboxscore()` | (endpoint dead, no replacement) | 3.0.0 |
| `wnba_leaguehustlestatsplayer()` | (endpoint dead, no replacement) | 3.0.0 |
| `wnba_leaguehustlestatsplayerleaders()` | (endpoint dead, no replacement) | 3.0.0 |
| `wnba_leaguehustlestatsteam()` | (endpoint dead, no replacement) | 3.0.0 |
| `wnba_leaguehustlestatsteamleaders()` | (endpoint dead, no replacement) | 3.0.0 |
| `wnba_homepageleaders()` | `wnba_homepagewidget()` | 2.1.0 |
| `wnba_homepagev2()` | `wnba_homepagewidget()` | 2.1.0 |
| `wnba_leaderstiles()` | `wnba_homepagewidget()` | 2.1.0 |
| `wnba_scoreboard()` | `wnba_scoreboardv3()` | 2.1.0 |
| `wnba_videodetails()` | `wnba_videoevents()` | 3.0.0 |
| `wnba_videodetailsasset()` | `wnba_videoevents()` | 3.0.0 |

*Soft warning (`lifecycle::deprecate_warn`)* — function still runs but recommends a replacement; will escalate to `deprecate_stop` if the upstream endpoint isn't restored:

* `wnba_boxscoresummaryv3()` → `wnba_boxscoresummaryv2()`. The V3 endpoint still answers 200 OK with the full schema, but the core result sets (`game_summary`, `line_score`, `inactive_players`, `other_stats`, `available_video`, `game_info`, `arena_info`) come back zero-row in 2025; only `officials` and `last_five_meetings` populate. The V2 variant still returns full data.

### **Documentation improvements**

#### *@return column descriptions on every exported function*

Every `@return` markdown table across the 42 R source files is upgraded from two columns (`col_name | types`) to three columns (`col_name | types | description`). 580+ tables touched and 4,341 total table rows; every result set on every function now ships a per-column description in `?<function>` help, the pkgdown reference, and the rendered man pages. Existing prose `\describe{}` blocks (notably on `load_wbb_pbp()`, `load_wnba_pbp()`, and `parameter_descriptions`) are unchanged.

**Coverage** — frequency-weighted, what `?fn` readers actually see — **74.7% of the 4,341 @return table rows now carry a hand-quality description** (curated + ESPN-API + mined). The remaining 25.3% are heuristic-fallback rows; the heuristic generator's snake_case expansion + suffix rules cover most of those acceptably (e.g. `defended_at_rim_field_goals_attempted` → "Number of defended at rim field goals attempted."), and the long tail is dominated by single-occurrence columns from low-traffic endpoints.

**Description sources** (precedence order, first match wins):

1. `tools/docs/column_descriptions_curated.csv` — 619 hand-authored entries focused on the highest-traffic columns and basketball / ESPN domain conventions (team identity, advanced shooting metrics, hustle stats, V2 vs V3 column pairs, ESPN athlete / event / news fields).
2. `tools/docs/column_descriptions_api.csv` — 181 ESPN-authored descriptions mined live from 14 endpoints per league across both `wnba` and `womens-college-basketball`, covering 9 endpoint families: core-v2 athlete statistics (per-season, post-season, career), core-v2 team statistics, core-v2 statisticslog, core-v2 leaders, web-v3 athlete stats / splits / gamelog / overview, and web-v3 statistics/byathlete leaderboards. Three response shapes are recognized: nested categories with stats objects, parallel arrays under categories, and top-level parallel-array shapes (splits / gamelog). This covers the ESPN stat-section column families (`general_*`, `offensive_*`, `defensive_*`, `rebounding_*`, `shooting_*`, `misc_*`) with full prose definitions straight from ESPN — e.g. `defensive_blocks` → "Short for blocked shot, number of times when a defensive player legally deflects a field goal attempt from an offensive player." Re-mine at any time with `Rscript tools/docs/mine_api_descriptions.R`.
3. Mined `\item{...}{...}` lines from existing `\describe{}` blocks.
4. Heuristic patterns driven by column-name suffixes (`*_id`, `*_pct`, `*_made`, `*_attempted`, `*_per_36`, etc.) with basketball-friendly noun substitution (`fg → field goals`, `tov → turnovers`, `oreb → offensive rebounds`).

**New tooling under `tools/docs/`** (`.Rbuildignore`'d, sibling of the existing `tools/probes/` diagnostic toolkit):

| File | Purpose |
|---|---|
| `build_column_descriptions.R` | One-shot builder that combines the curated CSV + ESPN-API CSV + mined describe-block entries + heuristic fallbacks into `column_descriptions.csv`. |
| `column_descriptions_curated.csv` | Hand-edit surface; new entries here override API / mined / heuristic outputs on the next build. |
| `column_descriptions_api.csv` | ESPN-API-mined descriptions, regenerated by `mine_api_descriptions.R`. |
| `column_descriptions.csv` | Generated dictionary (1,381 rows; 619 curated, 161 ESPN-API, 8 mined, 3 parameter-overlap, 590 heuristic). |
| `mine_api_descriptions.R` | Driver that probes the ESPN endpoints which self-document their stat columns. |
| `audit_column_descriptions.R` | Diagnostic that reports coverage stats and the highest-leverage heuristic columns still to curate. |
| `markdown_man_table_helper.R` | Programmatic helpers (`load_column_descriptions()`, `make_return_table_md()`, `roxygenize_return()`, `augment_return_tables_in_file()`, `augment_all_r_files()`, plus the public `mine_espn_api_descriptions(url)` API miner). Legacy paste-snippet hand-tools preserved inside `if (FALSE) {}` so the file is `source()`-able. |
| `espn_endpoints_catalog.md` | Basketball-scoped ESPN endpoint reference used to scope the miner. |

The sweep is idempotent: re-running `augment_all_r_files()` after updating the dictionary refreshes existing 3-column tables in place rather than appending a fourth column.

### **Internals**

#### *HTTP layer*

* **Jittered exponential backoff in `.retry_request()`.** Replaced the default fixed 2-second retry cadence with `runif(1, 0.5, 1.5) * 2^i` so retries from concurrent users hitting the same rate-limited endpoint don't synchronize into a thundering-herd burst that Cloudflare scores as an attack. Same 3 max tries; same backoff envelope (~0.5–6s); just spread.

* **Restored proxy support.** When wehoop migrated from `httr` to `httr2` in the V3 work, the legacy `httr::use_proxy()` plumbing was dropped and `request_with_proxy()` quietly stopped honoring proxies (its `...` was preserved purely for source compatibility). Both `request_with_proxy()` and the lower-level `.retry_request()` now accept a `proxy =` argument:
    - `proxy = NULL` (default) — libcurl reads `http_proxy` / `https_proxy` / `no_proxy` env vars automatically.
    - `proxy = "http://host:port"` — string form, forwarded to `httr2::req_proxy(url = ...)`.
    - `proxy = list(url=, port=, username=, password=, auth=)` — named list spread into `httr2::req_proxy()` for authenticated proxies.

  Resolution order in `.retry_request()`: explicit `proxy =` arg → `getOption("wehoop.proxy")` → libcurl env vars. The `...` thread works for WNBA Stats wrappers (which forward into `request_with_proxy()`); ESPN / NCAA wrappers call `.retry_request()` directly without `...`, so use `options(wehoop.proxy = ...)` at the top of the session to cover those without per-function plumbing. Validated end-to-end: `ncaa_wbb_teams()` and `espn_wnba_game_all()` both routed through an authenticated test proxy via the option fallback.

#### *Test infrastructure*

* **Empty / NULL responses now FAIL the test instead of silently SKIPping.** The earlier `skip("No rows returned from endpoint at test time")` guard was hiding regressions: when an upstream endpoint starts returning HTML (404 / maintenance) or breaks in some other silent way, the test should flag it. Converted all 117 such guards across `tests/testthat/test-*.R` from `skip(...)` to `fail(...) + return(invisible(NULL))` so the test surfaces a FAIL count for follow-up. Deprecation skips and the env-gated `skip_*_test()` / `skip_on_cran()` / `skip_on_ci()` helpers are unchanged.
* Pinned 16 `wnba_team*` test files from `most_recent_wnba_season()` to `most_recent_wnba_season() - 1` so the team-stats endpoints have a known-completed season to query and don't degenerate to "no rows" in the WNBA off-season window. `wnba_teams()` and standings tests still track the live season because that's what they're meant to verify.
* Bumped `.ncaa_headers()` user-agent to Chrome 130 and added the `Sec-Fetch-*` / `sec-ch-ua-*` headers a real browser sends.
* `ncaa_wbb_teams()` keeps its legacy `stats.ncaa.org/team/inst_team_list` scrape (per-season per-division team list with `season_id` populated), and now threads the `proxy =` argument from `...` through to `.retry_request()` at the top level. `stats.ncaa.org` is fronted by Akamai and returns HTTP 403 (`Reference #18.<...>`) to many residential and cloud IP ranges; pass a proxy that egresses from a non-blocked address — either per-call (`ncaa_wbb_teams(year, division, proxy = list(url=, port=, username=, password=))`) or session-wide (`options(wehoop.proxy = list(...))`). See the `Network access` section of `?ncaa_wbb_teams` for the full resolution order.

#### *Test suite hardening (column-drift resilience)*

* Flipped **394** column assertions from strict `expect_equal(sort(colnames(x)), sort(cols))` to subset checks `expect_in(sort(cols), sort(colnames(x)))` across **115** test files — per the CLAUDE.md guidance, WNBA / ESPN APIs add columns without removing old ones, and the strict checks were brittle.
* Injected `skip("No rows returned from endpoint at test time")` guards into **114** test files so tests which access `x[[1]]` degrade gracefully to a skip (rather than a subscript-out-of-bounds error) when the upstream endpoint errors or returns empty. *(Later converted to `fail()` — see "Test infrastructure" above.)*
* Cleaned stale column names out of expected `cols` lists where ESPN renamed/removed columns (`jersey`, `active`, `team_x_ref_2`, `team_is_all_star`, `Team_ID` → `TEAM_ID`).
* Added per-element null/empty-column check helpers to `test-wnba_teamvsplayer.R` and `test-wnba_playerdashboardbyclutch.R` so tests tolerate the WNBA Stats API returning fewer result-set elements than the test expects.
* Added `tools/` directory (excluded from the package build via `.Rbuildignore`) containing the one-off R scripts used to apply the above sweeps: `patch_df_list_init.R`, `patch_return_var_init.R`, `flip_expect_equal_cols.R`, `inject_skip_guard.R`.

### **Release / CRAN preparation**

* Add `cph` (copyright holder) role to `Saiem Gilani` in `Authors@R` (CRAN strict requirement).
* Bump `LICENSE` and `LICENSE.md` copyright year from 2020 to 2026.
* Add full roxygen blocks (description, `@return`, `@examples`) to `most_recent_wbb_season()` and `most_recent_wnba_season()`, which had been title/`@export`-only.
* Add `@examples \donttest{}` blocks to all 58 new ESPN endpoint wrappers. Live-API examples are wrapped in `\donttest{}` so they do not run during routine `R CMD check` but are still exercised under `--run-donttest`. The redundant `@details` code-block samples were removed from these 58 functions; the legacy `@details`-with-code-block convention is retained for the WNBA Stats API (`wnba_*`) and NCAA (`ncaa_wbb_*`) wrappers per the project's documentation conventions in `CLAUDE.md`.
* Modernize `inst/CITATION`: replace deprecated `citEntry()` / `personList()` with `bibentry()` / `c(person(), ...)` (R 4.x deprecation cleanup).
* Add `parameter_descriptions` (dataset) and `year_to_season` (utility) to `_pkgdown.yml` reference index so `pkgdown::check_pkgdown()` passes (resolves the gh-pages deploy failure).

# **wehoop 2.1.0**

* ```wnba_homepagewidget()``` function added to replace the following homepage functions being deprecated.
* ```wnba_homepageleaders()``` function deprecated due to WNBA Stats API deprecation.
* ```wnba_homepagev2()``` function deprecated due to WNBA Stats API deprecation.
* ```wnba_leaderstiles()``` function deprecated due to WNBA Stats API deprecation.
* ```wnba_scoreboard()``` function deprecated due to WNBA Stats API deprecation (use ```wnba_scoreboardv3()```).
* ```wnba_teaminfocommon()``` function deprecated due to WNBA Stats API deprecation (use ```wnba_teamdetails()```).

# **wehoop 2.0.0**

* ```load_wnba_*()``` functions now use `sportsdataverse-data` releases url instead of `wehoop-data` repository URL
* ```load_wbb_*()``` functions now use `sportsdataverse-data` releases url instead of `wehoop-data` repository URL
* ```wnba_pbp()``` function and new ```wnba_pbps()``` function added with `on_court` (default `TRUE`) parameter to return on court players for each play event

# **wehoop 1.9.0**

### **WNBA Stats API Live Endpoints**

* ```wnba_live_pbp()``` function added.
* ```wnba_live_boxscore()``` function added.
* ```wnba_todays_scoreboard()``` function added.

### **WNBA Boxscore V3 (and V3-styled) Endpoints Added**

* ```wnba_scoreboardv3()``` function added.
* ```wnba_boxscoretraditionalv3()``` function added.
* ```wnba_boxscoreadvancedv3()``` function added.
* ```wnba_boxscoremiscv3()``` function added.
* ```wnba_boxscorescoringv3()``` function added.
* ```wnba_boxscoreusagev3()``` function added.
* ```wnba_boxscorefourfactorsv3()``` function added.
* ```wnba_boxscoreplayertrackv3()``` function added.
* ```wnba_boxscorehustlev2()``` function added.

### **Other WNBA Stats API functions added**

* ```wnba_shotchartlineupdetail()``` function added.
* ```wnba_franchiseleaderswrank()``` function added.
* ```wnba_leaderstiles()``` function added.
* ```wnba_leagueleaders()``` function added.
* ```wnba_videodetailsasset()``` function added.
* ```wnba_infographicfanduelplayer()``` function added.

### **Other Functions Added**

- ```ncaa_wbb_teams()``` function added.

### **Proxy Capability Added and Other Notes**

- Add rlang dots option for passing ```httr::use_proxy()``` option to `wnba_*()` functions
- Returns documentation added for all working WNBA Stats API endpoints and ESPN functions
- Tests added for all working WNBA Stats API endpoints and ESPN functions, over 750 tests when
  run locally

# **wehoop 1.8.0**

* Add proxy rlang dots option for passing httr::use_proxy() option to wnba_stats_*() functions
* Improved output for ```espn_wbb_team_box()```, ```espn_wbb_player_box()```, ```espn_wnba_team_box()```, ```espn_wnba_player_box()```

# **wehoop 1.7.0**

* ```espn_wbb_game_rosters()``` function added.
* ```espn_wnba_game_rosters()``` function added.
* ```wnba_teams()``` function added. Useful for cross-walking between ESPN and WNBA Stats API

# **wehoop 1.6.0**

* Updates tidyr and dplyr statements to use quotations on columns instead of data masking per tidyselect deprecation notice.

# **wehoop 1.5.0**

## ~106 WNBA Stats API functions added

|name                                           |file                       |
|:----------------------------------------------|:--------------------------|
|```wnba_alltimeleadersgrids()```               |R/wnba_stats_leaders.R     |
|```wnba_assistleaders()```                     |R/wnba_stats_leaders.R     |
|```wnba_assisttracker()```                     |R/wnba_stats_leaders.R     |
|```wnba_boxscoreadvancedv2()```                |R/wnba_stats_boxscore.R    |
|```wnba_boxscorefourfactorsv2()```             |R/wnba_stats_boxscore.R    |
|```wnba_boxscoremiscv2()```                    |R/wnba_stats_boxscore.R    |
|```wnba_boxscoreplayertrackv2()```             |R/wnba_stats_boxscore.R    |
|```wnba_boxscorescoringv2()```                 |R/wnba_stats_boxscore.R    |
|```wnba_boxscoresummaryv2()```                 |R/wnba_stats_boxscore.R    |
|```wnba_boxscoretraditionalv2()```             |R/wnba_stats_boxscore.R    |
|```wnba_boxscoreusagev2()```                   |R/wnba_stats_boxscore.R    |
|```wnba_commonallplayers()```                  |R/wnba_stats_roster.R      |
|```wnba_commonplayerinfo()```                  |R/wnba_stats_roster.R      |
|```wnba_commonplayoffseries()```               |R/wnba_stats_roster.R      |
|```wnba_commonteamroster()```                  |R/wnba_stats_roster.R      |
|```wnba_cumestatsplayer()```                   |R/wnba_stats_cume.R        |
|```wnba_cumestatsplayergames()```              |R/wnba_stats_cume.R        |
|```wnba_cumestatsteam()```                     |R/wnba_stats_cume.R        |
|```wnba_cumestatsteamgames()```                |R/wnba_stats_cume.R        |
|```wnba_data_pbp()```                          |R/wnba_data_pbp.R          |
|```wnba_draftboard()```                        |R/wnba_stats_draft.R       |
|```wnba_draftcombinedrillresults()```          |R/wnba_stats_draft.R       |
|```wnba_draftcombinenonstationaryshooting()``` |R/wnba_stats_draft.R       |
|```wnba_draftcombineplayeranthro()```          |R/wnba_stats_draft.R       |
|```wnba_draftcombinespotshooting()```          |R/wnba_stats_draft.R       |
|```wnba_draftcombinestats()```                 |R/wnba_stats_draft.R       |
|```wnba_drafthistory()```                      |R/wnba_stats_draft.R       |
|```wnba_fantasywidget()```                     |R/wnba_stats_lineups.R     |
|```wnba_franchisehistory()```                  |R/wnba_stats_franchise.R   |
|```wnba_franchiseleaders()```                  |R/wnba_stats_franchise.R   |
|```wnba_franchiseplayers()```                  |R/wnba_stats_franchise.R   |
|```wnba_gamerotation()```                      |R/wnba_stats_boxscore.R    |
|```wnba_homepageleaders()```                   |R/wnba_stats_leaders.R     |
|```wnba_homepagev2()```                        |R/wnba_stats_leaders.R     |
|```wnba_hustlestatsboxscore()```               |R/wnba_stats_boxscore.R    |
|```wnba_leaguedashlineups()```                 |R/wnba_stats_lineups.R     |
|```wnba_leaguedashplayerbiostats()```          |R/wnba_stats_league_dash.R |
|```wnba_leaguedashplayerclutch()```            |R/wnba_stats_league_dash.R |
|```wnba_leaguedashplayershotlocations()```     |R/wnba_stats_league_dash.R |
|```wnba_leaguedashplayerstats()```             |R/wnba_stats_league_dash.R |
|```wnba_leaguedashteamclutch()```              |R/wnba_stats_league_dash.R |
|```wnba_leaguedashteamshotlocations()```       |R/wnba_stats_league_dash.R |
|```wnba_leaguedashteamstats()```               |R/wnba_stats_league_dash.R |
|```wnba_leaguegamefinder()```                  |R/wnba_stats_league.R      |
|```wnba_leaguegamelog()```                     |R/wnba_stats_league.R      |
|```wnba_leaguehustlestatsplayer()```           |R/wnba_stats_hustle.R      |
|```wnba_leaguehustlestatsplayerleaders()```    |R/wnba_stats_hustle.R      |
|```wnba_leaguehustlestatsteam()```             |R/wnba_stats_hustle.R      |
|```wnba_leaguehustlestatsteamleaders()```      |R/wnba_stats_hustle.R      |
|```wnba_leaguelineupviz()```                   |R/wnba_stats_lineups.R     |
|```wnba_leagueplayerondetails()```             |R/wnba_stats_lineups.R     |
|```wnba_leagueseasonmatchups()```              |R/wnba_stats_lineups.R     |
|```wnba_leaguestandingsv3()```                 |R/wnba_stats_league.R      |
|```wnba_pbp()```                               |R/wnba_stats_pbp.R         |
|```wnba_playerawards()```                      |R/wnba_stats_player.R      |
|```wnba_playercareerbycollege()```             |R/wnba_stats_player.R      |
|```wnba_playercareerbycollegerollup()```       |R/wnba_stats_player.R      |
|```wnba_playercareerstats()```                 |R/wnba_stats_player.R      |
|```wnba_playercompare()```                     |R/wnba_stats_player.R      |
|```wnba_playerdashboardbyclutch()```           |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbygamesplits()```       |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbygeneralsplits()```    |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbylastngames()```       |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbyopponent()```         |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbyshootingsplits()```   |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbyteamperformance()```  |R/wnba_stats_player_dash.R |
|```wnba_playerdashboardbyyearoveryear()```     |R/wnba_stats_player_dash.R |
|```wnba_playerestimatedmetrics()```            |R/wnba_stats_player.R      |
|```wnba_playerfantasyprofile()```              |R/wnba_stats_player.R      |
|```wnba_playerfantasyprofilebargraph()```      |R/wnba_stats_player.R      |
|```wnba_playergamelog()```                     |R/wnba_stats_player.R      |
|```wnba_playergamelogs()```                    |R/wnba_stats_player.R      |
|```wnba_playergamestreakfinder()```            |R/wnba_stats_player.R      |
|```wnba_playerheadshot()```                    |R/wnba_stats_player.R      |
|```wnba_playerindex()```                       |R/wnba_stats_player.R      |
|```wnba_playernextngames()```                  |R/wnba_stats_player.R      |
|```wnba_playerprofilev2()```                   |R/wnba_stats_player.R      |
|```wnba_playervsplayer()```                    |R/wnba_stats_player.R      |
|```wnba_scoreboard()```                        |R/wnba_stats_scoreboard.R  |
|```wnba_scoreboardv2()```                      |R/wnba_stats_scoreboard.R  |
|```wnba_shotchartdetail()```                   |R/wnba_stats_shotchart.R   |
|```wnba_shotchartleaguewide()```               |R/wnba_stats_shotchart.R   |
|```wnba_teamdashboardbyclutch()```             |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbygamesplits()```         |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbygeneralsplits()```      |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbylastngames()```         |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbyopponent()```           |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbyshootingsplits()```     |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbyteamperformance()```    |R/wnba_stats_team_dash.R   |
|```wnba_teamdashboardbyyearoveryear()```       |R/wnba_stats_team_dash.R   |
|```wnba_teamdashlineups()```                   |R/wnba_stats_team_dash.R   |
|```wnba_teamdetails()```                       |R/wnba_stats_team.R        |
|```wnba_teamestimatedmetrics()```              |R/wnba_stats_team.R        |
|```wnba_teamgamelog()```                       |R/wnba_stats_team.R        |
|```wnba_teamgamelogs()```                      |R/wnba_stats_team.R        |
|```wnba_teamgamestreakfinder()```              |R/wnba_stats_team.R        |
|```wnba_teamhistoricalleaders()```             |R/wnba_stats_team.R        |
|```wnba_teaminfocommon()```                    |R/wnba_stats_team.R        |
|```wnba_teamplayerdashboard()```               |R/wnba_stats_team.R        |
|```wnba_teamplayeronoffdetails()```            |R/wnba_stats_team.R        |
|```wnba_teamplayeronoffsummary()```            |R/wnba_stats_team.R        |
|```wnba_teamvsplayer()```                      |R/wnba_stats_team.R        |
|```wnba_teamyearbyyearstats()```               |R/wnba_stats_team.R        |
|```wnba_videodetails()```                      |R/wnba_stats_video.R       |
|```wnba_videoevents()```                       |R/wnba_stats_video.R       |
|```wnba_videostatus()```                       |R/wnba_stats_video.R       |

## Adds 4 ESPN WBB and WNBA functions
- ```wehoop::espn_wbb_player_stats()``` function added.
- ```wehoop::espn_wbb_team_stats()``` function added.
- ```wehoop::espn_wnba_player_stats()``` function added.
- ```wehoop::espn_wnba_team_stats()``` function added.

* Removes ```furrr``` and ```future``` dependencies and replaces with ```purrr (>= 0.3.0)```

# **wehoop 1.2.1**
- Minor release to stay ahead of `tidyr` release revdepchecks

# **wehoop 1.2.0**
- Add returns for all the functions
- Update a handful of field names from the scoreboard functions and to also include neutral_site and conference_competition columns for the women's college basketball scoreboard function.

# **wehoop 1.1.1**
- Change functions from ```furrr::future_map_dfr()``` functions to ```data.table::rbindlist()``` functions for loaders.

# **wehoop 1.1.0**
### **Add schedule loaders**
- [```wehoop::load_wbb_schedule()```](https://wehoop.sportsdataverse.org/reference/load_wbb_schedule.html) function added
- [```wehoop::load_wnba_schedule()```](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule.html) function added

# **wehoop 1.0.0**
### **Add team box score loaders**
- [```wehoop::load_wbb_team_box()```](https://wehoop.sportsdataverse.org/reference/load_wbb_team_box.html) function added
- [```wehoop::load_wnba_team_box()```](https://wehoop.sportsdataverse.org/reference/load_wnba_team_box.html) function added

### **Add player box score loaders**
- [```wehoop::load_wbb_player_box()```](https://wehoop.sportsdataverse.org/reference/load_wbb_player_box.html) function added
- [```wehoop::load_wnba_player_box()```](https://wehoop.sportsdataverse.org/reference/load_wnba_player_box.html) function added

### **Standings functions**
- [```wehoop::espn_wnba_standings()```](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.html)
- [```wehoop::espn_wbb_standings()```](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.html)

### **Getting Started vignette**
- [Getting started with wehoop data](https://wehoop.sportsdataverse.org/articles/getting-started-wehoop.html)

# **wehoop 0.9.2**
### **Quick fix for update db functions**

### **Dependency pruning**
This update is a non-user facing change to package dependencies to shrink the list of dependencies.

# **wehoop 0.9.1**
### **Clean names and team returns**
- All functions have now been given the [```janitor::clean_names()```](https://rdrr.io/cran/janitor/man/clean_names.html) treatment
- [```wehoop::espn_wbb_teams()```](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.html) has updated the returns to be more identity information related only
- [```wehoop::espn_wnba_teams()```](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.html) to be more identity information related only
- All tests were updated

# **wehoop 0.9.0**
### **Loading capabilities added to the package**
- [```wehoop::load_wbb_pbp()```](https://wehoop.sportsdataverse.org/reference/load_wbb_pbp.html) and [```wehoop::update_wbb_db()```](https://wehoop.sportsdataverse.org/reference/update_wbb_db.html) functions added
- [```wehoop::load_wnba_pbp()```](https://wehoop.sportsdataverse.org/reference/load_wnba_pbp.html) and [```wehoop::update_wnba_db()```](https://wehoop.sportsdataverse.org/reference/update_wnba_db.html) functions added

# **wehoop 0.3.0**
###  **Dependencies**
- ```R``` version 3.5.0 or greater dependency added
- ```purrr``` version 0.3.0 or greater dependency added
- ```rvest``` version 1.0.0 or greater dependency added
- ```progressr``` version 0.6.0 or greater dependency added
- ```usethis``` version 1.6.0 or greater dependency added
- ```xgboost``` version 1.1.0 or greater dependency added
- ```tidyr``` version 1.0.0 or greater dependency added
- ```stringr``` version 1.3.0 or greater dependency added
- ```tibble``` version 3.0.0 or greater dependency added
- ```furrr``` dependency added
- ```future``` dependency added

### **Test coverage**
* Added tests for all ESPN functions

#### **Function Naming Convention Change**
* Similarly, data and metrics sourced from ESPN will begin with `espn_` as opposed to `wbb_` or `wnba_`.
* Data sourced directly from the NCAA website will start the function with `ncaa_`

# **wehoop 0.2.0**
- Added support for ESPN's play-by-play endpoints with the addition of the following functions:
- ```wehoop::espn_wnba_game_all()``` - a convenience wrapper function around the following three functions (returns the results as a list of three data frames)
- ```wehoop::espn_wnba_team_box()```
- ```wehoop::espn_wnba_player_box()```
- ```wehoop::espn_wnba_pbp()```
- ```wehoop::espn_wnba_teams()```
- ```wehoop::espn_wbb_scoreboard()```

# **wehoop 0.1.0**
- Added support for ESPN's play-by-play endpoints with the addition of the following functions:
- ```wehoop::espn_wbb_game_all()``` - a convenience wrapper function around the following three functions (returns the results as a list of three data frames)
- ```wehoop::espn_wbb_team_box()```
- ```wehoop::espn_wbb_player_box()```
- ```wehoop::espn_wbb_pbp()```
- ```wehoop::espn_wbb_teams()```
- ```wehoop::espn_wbb_conferences()```
- ```wehoop::espn_wbb_scoreboard()```
- ```wehoop::ncaa_wbb_NET_rankings()```
- ```wehoop::espn_wbb_rankings()```

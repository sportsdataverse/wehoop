# **ESPN Basketball Endpoint Overview (WNBA + WBB)**

Wrappers around ESPN's basketball endpoints. Two parallel families share
a common set of internal helpers in `R/espn_basketball_*.R`:

- `espn_wnba_*()` — ESPN WNBA wrappers

- `espn_wbb_*()` — ESPN women's college basketball wrappers

Each public wrapper is a thin shim over an internal helper that takes a
`league` argument (`"wnba"` or `"womens-college-basketball"`); the
helper does the actual HTTP call + parsing. Error reporting flows
through ESPN-side reporters
[`.report_api_error()`](https://wehoop.sportsdataverse.org/reference/dot-report_api_error.md)
/
[`.report_api_warning()`](https://wehoop.sportsdataverse.org/reference/dot-report_api_warning.md)
in `R/utils.R` (do **not** use raw
[`cli::cli_alert_danger()`](https://cli.r-lib.org/reference/cli_alert.html)
here — that is the WNBA Stats convention).

## Details

### **Play-by-play, scoreboard, schedule**

|  |  |
|----|----|
| WNBA function | WBB function |
| [`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md) | [`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md) |
| [`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md) | [`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md) |
| [`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md) | [`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md) |
| [`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md) | [`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md) |
| [`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md) | [`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md) |
| [`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md) | [`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md) |

### **Reference data**

|  |  |
|----|----|
| WNBA function | WBB function |
| [`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md) | [`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md) |
| [`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md) | [`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md) |
| [`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md) | [`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md) |
| [`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md) | [`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md) |
|  | [`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md) |
|  | [`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md) |

### **HTTP layer**

ESPN wrappers call
[`.retry_request()`](https://wehoop.sportsdataverse.org/reference/dot-retry_request.md)
directly without `...`, so per-call proxy overrides aren't supported.
Use `options(wehoop.proxy = ...)` or the `http_proxy` / `https_proxy`
env vars for proxy routing.

## See also

Other ESPN Basketball:
[`espn_basketball_player_core()`](https://wehoop.sportsdataverse.org/reference/espn_basketball_player_core.md)

# **WNBA Stats API Endpoint Overview**

Wrappers around the WNBA Stats backend at `stats.wnba.com/stats/...`.
All requests go through
[`request_with_proxy()`](https://wehoop.sportsdataverse.org/reference/request_with_proxy.md)
in `utils_wnba_stats.R` which sets the required WNBA-side headers
(`Origin: https://stats.wnba.com`, `Referer: https://www.wnba.com/`) and
threads a proxy via `getOption("wehoop.proxy")` / env vars / explicit
`proxy =` arg.

WNBA-specific differences vs the NBA Stats API: quarters are 10 minutes
(not 12), regulation is 40 minutes (not 48), game IDs start with `"10"`,
`LeagueID = "10"`.

## Details

### **Boxscores (V2)**

Tabular `resultSets[]` responses parsed via
`wnba_stats_map_result_sets()`. See
[`wnba_boxscoreadvancedv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_boxscoremiscv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_boxscoreplayertrackv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md),
[`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_boxscoresummaryv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md),
[`wnba_boxscoreusagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md),
[`wnba_hustlestatsboxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoreplayertrackv2.md).

### **Boxscores (V3)**

Nested JSON parsed via
[`purrr::pluck()`](https://purrr.tidyverse.org/reference/pluck.html).
See
[`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md),
[`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md),
[`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md),
[`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md),
[`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md),
[`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md),
[`wnba_boxscoreusagev3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md).

### **Play-by-play**

|  |  |
|----|----|
| Function | Purpose |
| [`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md) | V2 + V3 PBP (with V3-to-V2 conversion pipeline) |
| [`wnba_pbps()`](https://wehoop.sportsdataverse.org/reference/wnba_pbps.md) | Multi-game PBP loader |
| [`wnba_playbyplayv3()`](https://wehoop.sportsdataverse.org/reference/wnba_playbyplayv3.md) | V3-only PBP |

### **Leaders, standings, league**

[`wnba_leagueleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueleaders.md),
[`wnba_leaguestandingsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguestandingsv3.md),
[`wnba_homepageleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_homepageleaders.md),
[`wnba_leaderstiles()`](https://wehoop.sportsdataverse.org/reference/wnba_leaderstiles.md).

### **Player + team season + game stats**

Full per-mode / per-split families. Search the reference index for
`wnba_playerdashboard*`, `wnba_teamdashboard*`,
[`wnba_leaguedashplayerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerstats.md),
[`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md),
[`wnba_playergamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelogs.md),
[`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md),
`wnba_playerprofile*`.

### **Schedule + scoreboard**

[`wnba_schedule()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule.md),
[`wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboard.md),
[`wnba_scoreboardv2()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboardv2.md),
[`wnba_scoreboardv3()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboardv3.md),
[`wnba_todays_scoreboard()`](https://wehoop.sportsdataverse.org/reference/wnba_todays_scoreboard.md).

### **Draft + franchise + reference**

[`wnba_draftboard()`](https://wehoop.sportsdataverse.org/reference/wnba_draftboard.md),
[`wnba_drafthistory()`](https://wehoop.sportsdataverse.org/reference/wnba_drafthistory.md),
[`wnba_draftcombinestats()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinestats.md),
[`wnba_franchisehistory()`](https://wehoop.sportsdataverse.org/reference/wnba_franchisehistory.md),
[`wnba_franchiseleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaders.md).

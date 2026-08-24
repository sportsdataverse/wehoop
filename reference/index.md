# Package index

## wehoop Data

### Loaders Family Overview

wehoop loader family overview (WNBA + WBB release loaders)

- [`wehoop_loaders`](https://wehoop.sportsdataverse.org/reference/wehoop_loaders.md)
  [`load_wnba`](https://wehoop.sportsdataverse.org/reference/wehoop_loaders.md)
  [`load_wbb`](https://wehoop.sportsdataverse.org/reference/wehoop_loaders.md)
  :

  **wehoop Data Loaders Overview**

### Fox Sports Data Functions

Read-only Fox Sports (Bifrost) WNBA + WBB wrappers (play-by-play,
boxscore, odds, roster, stats, game log, standings, teams, leaders)

- [`fox_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md)
  [`fox_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md)
  [`fox_wnba_boxscore()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md)
  [`fox_wbb_boxscore()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md)
  [`fox_wnba_odds()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md)
  [`fox_wbb_odds()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md)
  :

  **Get Fox Sports basketball play-by-play**

- [`fox_wnba_league_leaders()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md)
  [`fox_wbb_league_leaders()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md)
  :

  **Get Fox Sports basketball statistical leaders**

- [`fox_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
  [`fox_wbb_team_roster()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
  [`fox_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
  [`fox_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
  [`fox_wnba_team_gamelog()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
  [`fox_wbb_team_gamelog()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
  [`fox_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
  [`fox_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
  [`fox_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
  [`fox_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md)
  :

  **Get Fox Sports basketball team roster**

- [`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md)
  :

  **Get the full Fox Sports women's college basketball team directory**

### WNBA Crosswalk Functions

Live builders and cached loaders that link ESPN, WNBA Stats API, and Fox
team/game/player identities. Team and player crosswalks are keyed on
`espn_team_id`; schedule crosswalk is keyed on `espn_game_id`.

- [`wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_team_crosswalk.md)
  :

  **Get the WNBA cross-source team crosswalk**

- [`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md)
  :

  **Get the WNBA cross-source schedule crosswalk**

- [`wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_player_crosswalk.md)
  :

  **Get the WNBA cross-source player crosswalk**

- [`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  [`load_wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  [`load_wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  [`load_wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  [`load_wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  [`load_wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  :

  **Load cached WNBA team crosswalk from the data repo**

### WBB Crosswalk Functions

Live builders and cached loaders that link ESPN, Fox Sports (Bifrost),
and Bart Torvik (barttorvik.com/ncaaw) WBB team/game/player identities.
Keyed on `espn_team_id`. Also includes women’s Torvik ratings/schedule
scrapers and the Fox full-directory enumerator.

- [`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)
  :

  **Get the WBB cross-source team crosswalk**

- [`wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_schedule_crosswalk.md)
  :

  **Get the WBB cross-source schedule crosswalk**

- [`wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_player_crosswalk.md)
  :

  **Get the WBB cross-source player crosswalk**

- [`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  [`load_wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  [`load_wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  [`load_wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  [`load_wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  [`load_wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md)
  :

  **Load cached WNBA team crosswalk from the data repo**

- [`bart_wbb_ratings()`](https://wehoop.sportsdataverse.org/reference/bart_wbb_ratings.md)
  :

  **Bart Torvik Women's T-Rank Ratings**

- [`bart_wbb_game_schedule()`](https://wehoop.sportsdataverse.org/reference/bart_wbb_game_schedule.md)
  :

  **Bart Torvik Women's Season Schedule & Results**

- [`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md)
  :

  **Get the full Fox Sports women's college basketball team directory**

### WNBA Data Functions

Functions exported by wehoop to access the wehoop-data repository’s WNBA
Data

- [`load_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_draft_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  [`load_wnba_player_core()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
  :

  **Load cleaned WNBA play-by-play from the data repo**

- [`update_wnba_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_db.md)
  :

  **Build/update wehoop WNBA play-by-play database**

### Women’s College Basketball Data Functions

Functions exported by wehoop to access the wehoop-data repository’s
Women’s College Basketball Data

- [`load_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_shots()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_officials()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  [`load_wbb_player_core()`](https://wehoop.sportsdataverse.org/reference/load_wbb_game_rosters.md)
  :

  **Load cleaned women's college basketball play-by-play from the data
  repo**

- [`update_wbb_db()`](https://wehoop.sportsdataverse.org/reference/update_wbb_db.md)
  :

  **Build/update wehoop WBB play-by-play database**

### WNBA Stats API Data Loaders

Functions exported by wehoop to access wehoop-wnba-stats-data WNBA Stats
API artifacts

- [`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_coaches_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_lineups_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_draft_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_player_game_logs_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_schedule_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_pbp_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  [`load_wnba_stats_possessions()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)
  **\[deprecated\]** :

  **Load cleaned WNBA Stats API season rosters from the data repo**

- [`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md)
  :

  **Load wehoop WNBA Stats League Dashboard cube**

- [`update_wnba_stats_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_stats_db.md)
  :

  **Build/update wehoop WNBA Stats database**

### NCAA Women’s College Basketball Play-by-Play Engine Data Loaders

Functions exported by wehoop to access sdv-py ncaa_wbb engine artifacts
published to sportsdataverse-data

- [`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_shots()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_rapm_within_team()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_rapm()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_team_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_schedule()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  [`load_ncaa_wbb_team_ids()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md)
  :

  **Load cleaned NCAA women's college basketball play-by-play from the
  data repo**

### Model Dataset Loaders

Functions exported by wehoop to access published WNBA / NCAA WBB
model-output datasets

- [`load_wnba_player_impact()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_value.md)
  [`load_wbb_player_value()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_value.md)
  [`load_wbb_ratings()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_value.md)
  :

  **Load WNBA player-impact ratings (RAPM / SPM / BPM / DARKO) from the
  data repo**

## ESPN Data

### ESPN Family Overview

ESPN basketball endpoint family overview (WNBA + WBB)

- [`espn_basketball`](https://wehoop.sportsdataverse.org/reference/espn_basketball.md)
  [`espn_wnba`](https://wehoop.sportsdataverse.org/reference/espn_basketball.md)
  [`espn_wbb`](https://wehoop.sportsdataverse.org/reference/espn_basketball.md)
  :

  **ESPN Basketball Endpoint Overview (WNBA + WBB)**

- [`espn_basketball_player_core()`](https://wehoop.sportsdataverse.org/reference/espn_basketball_player_core.md)
  :

  **Project an ESPN core-v2 athlete record into a `player_core` row**

### WBB – Game data

Per-game endpoints for women’s college basketball (play-by-play, box
scores, rosters)

- [`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md)
  [`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md)
  [`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md)
  [`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md)
  [`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md)
  : Get ESPN women's college basketball game data (play-by-play, team
  and player box)

### WBB – Reference & catalog

League-level reference data for women’s college basketball

- [`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md)
  :

  **Get ESPN WBB News**

- [`espn_wbb_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_news.md)
  :

  **Get ESPN WBB Team News**

- [`espn_wbb_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_calendar.md)
  :

  **Get ESPN WBB Calendar**

- [`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md)
  : Get women's college basketball conferences

- [`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)
  : Get ESPN women's college basketball team names and ids

- [`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md)
  :

  **Get ESPN women's college basketball schedule for a specific year**

- [`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md)
  : Get women's college basketball AP and Coaches poll rankings

- [`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md)
  : Get ESPN women's college basketball standings

- [`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md)
  :

  **Get ESPN Women's College Basketball Injuries**

### WBB – Team detail

Single-team endpoints for women’s college basketball

- [`espn_wbb_team()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md)
  [`espn_wbb_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md)
  [`espn_wbb_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md)
  [`espn_wbb_team_season_profile()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md)
  :

  **Get ESPN Women's College Basketball Team Detail**

- [`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md)
  :

  **Get ESPN Women's College Basketball Team Schedule**

- [`espn_wbb_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_injuries.md)
  :

  **Get ESPN Women's College Basketball Team Injuries**

- [`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md)
  :

  **Get ESPN women's college basketball team stats data**

### WBB – Athlete coverage

Per-athlete endpoints for women’s college basketball

- [`espn_wbb_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_info.md)
  :

  **Get ESPN Women's College Basketball Athlete Info**

- [`espn_wbb_player_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog.md)
  [`espn_wbb_player_stats_v3()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog.md)
  [`espn_wbb_player_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog.md)
  [`espn_wbb_player_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog.md)
  [`espn_wbb_player_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog.md)
  [`espn_wbb_player_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog.md)
  :

  **Get ESPN Women's College Basketball Athlete Overview**

- [`espn_wbb_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_awards.md)
  :

  **Get ESPN Women's College Basketball Athlete Awards**

- [`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md)
  :

  **Get ESPN women's college basketball player stats data**

### WBB – Event detail

Per-event enrichments (odds, win probability, officials, broadcasts)

- [`espn_wbb_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md)
  [`espn_wbb_game_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md)
  [`espn_wbb_game_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md)
  [`espn_wbb_game_situation()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md)
  [`espn_wbb_game_predictor()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md)
  [`espn_wbb_game_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md)
  :

  **Get ESPN Women's College Basketball Event Odds**

- [`espn_wbb_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_probabilities.md)
  :

  **Get ESPN Women's College Basketball Event Win Probabilities**

- [`espn_wbb_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_propbets.md)
  :

  **Get ESPN WBB Event Prop Bets (Long Format)**

- [`espn_wbb_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md)
  [`espn_wbb_game_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md)
  [`espn_wbb_game_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md)
  [`espn_wbb_game_team_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md)
  [`espn_wbb_game_team_records()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md)
  [`espn_wbb_game_team_score()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md)
  :

  **Get ESPN WBB Event Competitor Linescores (Per-Quarter)**

- [`espn_wbb_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_player_box.md)
  :

  **Get ESPN WBB Event Player Box Score (Long Format)**

- [`espn_wbb_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_roster_entry.md)
  :

  **Get ESPN WBB Event Competitor Roster Entry (Per-Athlete Game-Day
  Row)**

- [`espn_wbb_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play.md)
  :

  **Get ESPN WBB Event Play Detail (Single Play)**

- [`espn_wbb_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play_personnel.md)
  :

  **Get ESPN WBB Event Play Personnel (On-Court Lineup at Play)**

- [`espn_wbb_team_season_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_statistics.md)
  :

  **Get ESPN WBB Team Season Statistics (Long Format with Rank)**

- [`espn_wbb_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_official_detail.md)
  :

  **Get ESPN WBB Event Official Detail (Single Official)**

- [`espn_wbb_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_record_detail.md)
  :

  **Get ESPN WBB Team Record Detail (Long Format)**

- [`espn_wbb_coach_record()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach_record.md)
  :

  **Get ESPN WBB Coach Career Record (Long Format)**

- [`espn_wbb_tournament_season()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament_season.md)
  :

  **Get ESPN WBB Tournament Season Detail**

### WBB – League catalogs

League-wide catalogs and indexes for women’s college basketball

- [`espn_wbb_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_leaders.md)
  :

  **Get ESPN Women's College Basketball League Leaders**

- [`espn_wbb_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_venues.md)
  :

  **Get ESPN Women's College Basketball Venues**

- [`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md)
  :

  **Get ESPN Women's College Basketball Coaches**

- [`espn_wbb_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athletes_index.md)
  :

  **Get ESPN Women's College Basketball Athletes Index**

- [`espn_wbb_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_seasons.md)
  :

  **Get ESPN Women's College Basketball Seasons**

- [`espn_wbb_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_info.md)
  :

  **Get ESPN Women's College Basketball Season Info**

- [`espn_wbb_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_positions.md)
  :

  **Get ESPN WBB Positions Index**

- [`espn_wbb_position()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_position.md)
  :

  **Get ESPN WBB Position Detail**

### WBB – Helpers

Internal parsers exported for advanced use

- [`helper_espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/helper_espn_wbb_pbp.md)
  [`helper_espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/helper_espn_wbb_pbp.md)
  [`helper_espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/helper_espn_wbb_pbp.md)
  :

  **Parse ESPN WBB PBP, helper function**

### WBB – Core-v2 expansion (Tier 1+)

Crawler-discovered core-v2 endpoints (franchises, awards, tournaments,
BPI, season metadata)

- [`espn_wbb_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_franchises.md)
  :

  **Get ESPN WBB Franchises Index**

- [`espn_wbb_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_franchise.md)
  :

  **Get ESPN WBB Franchise Detail**

- [`espn_wbb_team()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md)
  [`espn_wbb_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md)
  [`espn_wbb_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md)
  [`espn_wbb_team_season_profile()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md)
  :

  **Get ESPN Women's College Basketball Team Detail**

- [`espn_wbb_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_awards.md)
  :

  **Get ESPN WBB Season Awards Index**

- [`espn_wbb_award()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_award.md)
  :

  **Get ESPN WBB Season Award Detail**

- [`espn_wbb_tournaments()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournaments.md)
  :

  **Get ESPN WBB Tournaments Index**

- [`espn_wbb_tournament()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament.md)
  :

  **Get ESPN WBB Tournament Detail**

- [`espn_wbb_tournament_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament_seasons.md)
  :

  **Get ESPN WBB Tournament Seasons List**

- [`espn_wbb_coach()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach.md)
  :

  **Get ESPN WBB Single-Coach Detail**

- [`espn_wbb_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_powerindex.md)
  :

  **Get ESPN WBB Season Power Index (Long Format)**

- [`espn_wbb_season_types()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_types.md)
  :

  **Get ESPN WBB Season Types Index**

- [`espn_wbb_season_type()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_type.md)
  :

  **Get ESPN WBB Season-Type Detail**

- [`espn_wbb_season_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_leaders.md)
  :

  **Get ESPN WBB Season Leaders (Long Format)**

- [`espn_wbb_season_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_rankings.md)
  :

  **Get ESPN WBB Season Rankings Index**

- [`espn_wbb_season_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_ranking.md)
  :

  **Get ESPN WBB Season Ranking Detail**

- [`espn_wbb_season_weeks()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_weeks.md)
  :

  **Get ESPN WBB Season Weeks Index**

- [`espn_wbb_season_week()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_week.md)
  :

  **Get ESPN WBB Season-Week Detail**

- [`espn_wbb_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_rankings.md)
  :

  **Get ESPN WBB Per-Week Rankings Index**

- [`espn_wbb_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_ranking.md)
  :

  **Get ESPN WBB Per-Week Ranking Detail**

- [`espn_wbb_season_groups()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_groups.md)
  :

  **Get ESPN WBB Season Groups Index**

- [`espn_wbb_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group.md)
  [`espn_wbb_season_group_children()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group.md)
  [`espn_wbb_season_group_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group.md)
  :

  **Get ESPN WBB Season Group Detail**

- [`espn_wbb_team_season_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_roster.md)
  :

  **Get ESPN WBB Team Roster (Per-Season, core-v2)**

- [`espn_wbb_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach_season.md)
  :

  **Get ESPN WBB Coach-in-Season Detail**

- [`espn_wbb_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_seasons.md)
  :

  **Get ESPN WBB Athlete Career Seasons**

- [`espn_wbb_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_career_stats.md)
  :

  **Get ESPN WBB Athlete Career Stats (Long Format)**

- [`espn_wbb_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog_v2.md)
  :

  **Get ESPN WBB Athlete Per-Season Event Log (core-v2)**

### WNBA – Game data

Per-game endpoints for the WNBA (play-by-play, box scores, rosters)

- [`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md)
  [`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md)
  [`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md)
  [`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md)
  [`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md)
  : Get ESPN's WNBA game data (play-by-play, team and player box)

### WNBA – Reference & catalog

League-level reference data for the WNBA

- [`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md)
  :

  **Get ESPN WNBA News**

- [`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md)
  :

  **Get ESPN WNBA Team News**

- [`espn_wnba_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_calendar.md)
  :

  **Get ESPN WNBA Calendar**

- [`espn_wnba_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_conferences.md)
  :

  **Get ESPN WNBA Conferences**

- [`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md)
  : Get ESPN's WNBA team names and ids

- [`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md)
  :

  **Get WNBA schedule for a specific year/date from ESPN's API**

- [`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md)
  :

  **Get ESPN WNBA Standings**

- [`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md)
  :

  **Get ESPN WNBA Injuries**

### WNBA – Team detail

Single-team endpoints for the WNBA

- [`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
  [`espn_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
  [`espn_wnba_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
  [`espn_wnba_team_season_profile()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
  :

  **Get ESPN WNBA Team Detail**

- [`espn_wnba_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_schedule.md)
  :

  **Get ESPN WNBA Team Schedule**

- [`espn_wnba_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_injuries.md)
  :

  **Get ESPN WNBA Team Injuries**

- [`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md)
  :

  **Get ESPN WNBA team stats data**

### WNBA – Athlete coverage

Per-athlete endpoints for the WNBA

- [`espn_wnba_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_info.md)
  :

  **Get ESPN WNBA Athlete Info**

- [`espn_wnba_player_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md)
  [`espn_wnba_player_stats_v3()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md)
  [`espn_wnba_player_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md)
  [`espn_wnba_player_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md)
  [`espn_wnba_player_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md)
  [`espn_wnba_player_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md)
  :

  **Get ESPN WNBA Athlete Overview**

- [`espn_wnba_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_awards.md)
  :

  **Get ESPN WNBA Athlete Awards**

- [`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md)
  :

  **Get ESPN WNBA player stats data**

### WNBA – Event detail

Per-event enrichments (odds, win probability, officials, broadcasts)

- [`espn_wnba_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md)
  [`espn_wnba_game_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md)
  [`espn_wnba_game_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md)
  [`espn_wnba_game_situation()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md)
  [`espn_wnba_game_predictor()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md)
  [`espn_wnba_game_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md)
  :

  **Get ESPN WNBA Event Odds**

- [`espn_wnba_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_probabilities.md)
  :

  **Get ESPN WNBA Event Win Probabilities**

- [`espn_wnba_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_propbets.md)
  :

  **Get ESPN WNBA Event Prop Bets (Long Format)**

- [`espn_wnba_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md)
  [`espn_wnba_game_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md)
  [`espn_wnba_game_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md)
  [`espn_wnba_game_team_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md)
  [`espn_wnba_game_team_records()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md)
  [`espn_wnba_game_team_score()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md)
  :

  **Get ESPN WNBA Event Competitor Linescores (Per-Quarter)**

- [`espn_wnba_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_player_box.md)
  :

  **Get ESPN WNBA Event Player Box Score (Long Format)**

- [`espn_wnba_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_roster_entry.md)
  :

  **Get ESPN WNBA Event Competitor Roster Entry (Per-Athlete Game-Day
  Row)**

- [`espn_wnba_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play.md)
  :

  **Get ESPN WNBA Event Play Detail (Single Play)**

- [`espn_wnba_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play_personnel.md)
  :

  **Get ESPN WNBA Event Play Personnel (On-Court Lineup at Play)**

- [`espn_wnba_team_season_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_statistics.md)
  :

  **Get ESPN WNBA Team Season Statistics (Long Format with Rank)**

- [`espn_wnba_draft_rounds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md)
  [`espn_wnba_draft_athletes()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md)
  [`espn_wnba_draft_status()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md)
  [`espn_wnba_season_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md)
  :

  **Get ESPN WNBA Draft Rounds Summary**

- [`espn_wnba_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_official_detail.md)
  :

  **Get ESPN WNBA Event Official Detail (Single Official)**

- [`espn_wnba_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record_detail.md)
  :

  **Get ESPN WNBA Team Record Detail (Long Format)**

- [`espn_wnba_draft_athlete_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athlete_detail.md)
  :

  **Get ESPN WNBA Draft Athlete Detail (Single Drafted Player)**

### WNBA – League catalogs

League-wide catalogs and indexes for the WNBA

- [`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md)
  :

  **Get ESPN WNBA League Leaders**

- [`espn_wnba_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_venues.md)
  :

  **Get ESPN WNBA Venues**

- [`espn_wnba_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coaches.md)
  :

  **Get ESPN WNBA Coaches**

- [`espn_wnba_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athletes_index.md)
  :

  **Get ESPN WNBA Athletes Index**

- [`espn_wnba_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_seasons.md)
  :

  **Get ESPN WNBA Seasons**

- [`espn_wnba_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_info.md)
  :

  **Get ESPN WNBA Season Info**

- [`espn_wnba_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_positions.md)
  :

  **Get ESPN WNBA Positions Index**

- [`espn_wnba_position()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_position.md)
  :

  **Get ESPN WNBA Position Detail**

### WNBA – Transactions, draft, free agency

WNBA-only player movement endpoints

- [`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md)
  :

  **Get ESPN WNBA Draft Picks**

- [`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md)
  :

  **Get ESPN WNBA Free Agents**

- [`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md)
  :

  **Get ESPN WNBA Transactions**

### WNBA – Helpers

Internal parsers exported for advanced use

- [`helper_espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/helper_espn_wnba_pbp.md)
  [`helper_espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/helper_espn_wnba_pbp.md)
  [`helper_espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/helper_espn_wnba_pbp.md)
  :

  **Parse ESPN WNBA PBP, helper function**

### WNBA – Core-v2 expansion (Tier 1+)

Crawler-discovered core-v2 endpoints (franchises, awards, futures, BPI,
season metadata)

- [`espn_wnba_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchises.md)
  :

  **Get ESPN WNBA Franchises Index**

- [`espn_wnba_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchise.md)
  :

  **Get ESPN WNBA Franchise Detail**

- [`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
  [`espn_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
  [`espn_wnba_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
  [`espn_wnba_team_season_profile()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
  :

  **Get ESPN WNBA Team Detail**

- [`espn_wnba_team_record()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record.md)
  :

  **Get ESPN WNBA Team Record (Per Season Type)**

- [`espn_wnba_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_awards.md)
  :

  **Get ESPN WNBA Season Awards Index**

- [`espn_wnba_award()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_award.md)
  :

  **Get ESPN WNBA Season Award Detail**

- [`espn_wnba_futures()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_futures.md)
  :

  **Get ESPN WNBA Season Futures (Long Format)**

- [`espn_wnba_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_powerindex.md)
  :

  **Get ESPN WNBA Season Power Index (Long Format)**

- [`espn_wnba_season_types()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_types.md)
  :

  **Get ESPN WNBA Season Types Index**

- [`espn_wnba_season_type()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_type.md)
  :

  **Get ESPN WNBA Season-Type Detail**

- [`espn_wnba_season_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_leaders.md)
  :

  **Get ESPN WNBA Season Leaders (Long Format)**

- [`espn_wnba_season_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_rankings.md)
  :

  **Get ESPN WNBA Season Rankings Index**

- [`espn_wnba_season_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_ranking.md)
  :

  **Get ESPN WNBA Season Ranking Detail**

- [`espn_wnba_season_weeks()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_weeks.md)
  :

  **Get ESPN WNBA Season Weeks Index**

- [`espn_wnba_season_week()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_week.md)
  :

  **Get ESPN WNBA Season-Week Detail**

- [`espn_wnba_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_rankings.md)
  :

  **Get ESPN WNBA Per-Week Rankings Index**

- [`espn_wnba_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_ranking.md)
  :

  **Get ESPN WNBA Per-Week Ranking Detail**

- [`espn_wnba_season_groups()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_groups.md)
  :

  **Get ESPN WNBA Season Groups Index**

- [`espn_wnba_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group.md)
  [`espn_wnba_season_group_children()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group.md)
  [`espn_wnba_season_group_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group.md)
  :

  **Get ESPN WNBA Season Group Detail**

- [`espn_wnba_team_season_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_roster.md)
  :

  **Get ESPN WNBA Team Roster (Per-Season, core-v2)**

- [`espn_wnba_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coach_season.md)
  :

  **Get ESPN WNBA Coach-in-Season Detail**

- [`espn_wnba_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_seasons.md)
  :

  **Get ESPN WNBA Athlete Career Seasons**

- [`espn_wnba_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_career_stats.md)
  :

  **Get ESPN WNBA Athlete Career Stats (Long Format)**

- [`espn_wnba_draft_pick()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_pick.md)
  :

  **Get ESPN WNBA Draft Pick Detail**

- [`espn_wnba_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog_v2.md)
  :

  **Get ESPN WNBA Athlete Per-Season Event Log (core-v2)**

- [`espn_wnba_draft_rounds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md)
  [`espn_wnba_draft_athletes()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md)
  [`espn_wnba_draft_status()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md)
  [`espn_wnba_season_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md)
  :

  **Get ESPN WNBA Draft Rounds Summary**

## NCAA Data

### NCAA Family Overview

NCAA women’s basketball endpoint family overview

- [`ncaa_wbb`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb.md)
  [`ncaa_womens`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb.md)
  [`ncaa`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb.md) :

  **NCAA Women's Basketball Endpoint Overview**

### NCAA Data Functions

Functions exported by wehoop to access NCAA Women’s College Basketball
Data

- [`ncaa_wbb`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb.md)
  [`ncaa_womens`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb.md)
  [`ncaa`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb.md) :

  **NCAA Women's Basketball Endpoint Overview**

- [`ncaa_wbb_NET_rankings()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_NET_rankings.md)
  : Get Women's college basketball NET rankings for the current date
  from the NCAA website

- [`ncaa_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_teams.md)
  :

  **Scrape NCAA Women's Basketball Teams (Division I, II, and III)**

## WNBA Stats Data

### WNBA Stats Family Overview

WNBA Stats API endpoint family overview

- [`wnba_stats`](https://wehoop.sportsdataverse.org/reference/wnba_stats.md)
  [`wehoop_wnba_stats`](https://wehoop.sportsdataverse.org/reference/wnba_stats.md)
  :

  **WNBA Stats API Endpoint Overview**

### WNBA Stats Data Functions

Functions exported by wehoop to access WNBA Stats API Data

- [`wnba_alltimeleadersgrids()`](https://wehoop.sportsdataverse.org/reference/wnba_alltimeleadersgrids.md)
  :

  **Get WNBA Stats API All-time Leaders Grid**

- [`wnba_assistleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_assistleaders.md)
  :

  **Get WNBA Stats API Assist Leaders**

- [`wnba_assisttracker()`](https://wehoop.sportsdataverse.org/reference/wnba_assisttracker.md)
  :

  **Get WNBA Stats API Assist Tracker**

- [`wnba_boxscoresummaryv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoresummaryv3.md)
  :

  **Get WNBA Stats API Boxscore Summary V3**

- [`wnba_boxscoretraditionalv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md)
  [`wnba_boxscoreadvancedv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md)
  [`wnba_boxscorefourfactorsv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md)
  [`wnba_boxscoremiscv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md)
  [`wnba_boxscorescoringv2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md)
  [`wnba_boxscoreusagev2()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv2.md)
  :

  **Get WNBA Stats API Boxscore Traditional V2**

- [`wnba_boxscoretraditionalv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)
  [`wnba_boxscoreadvancedv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)
  [`wnba_boxscoremiscv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)
  [`wnba_boxscorescoringv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)
  [`wnba_boxscorefourfactorsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)
  [`wnba_boxscoreplayertrackv3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)
  [`wnba_boxscoreusagev3()`](https://wehoop.sportsdataverse.org/reference/wnba_boxscoretraditionalv3.md)
  :

  **Get WNBA Stats API Boxscore Traditional V3**

- [`wnba_commonallplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_commonallplayers.md)
  :

  **Get WNBA Stats API All Players**

- [`wnba_commonplayerinfo()`](https://wehoop.sportsdataverse.org/reference/wnba_commonplayerinfo.md)
  :

  **Get WNBA Stats API Player Info**

- [`wnba_commonplayoffseries()`](https://wehoop.sportsdataverse.org/reference/wnba_commonplayoffseries.md)
  :

  **Get WNBA Stats API Playoff Series**

- [`wnba_commonteamroster()`](https://wehoop.sportsdataverse.org/reference/wnba_commonteamroster.md)
  :

  **Get WNBA Stats API Team Roster**

- [`wnba_cumestatsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayer.md)
  :

  **Get WNBA Stats API Cumulative Player Stats**

- [`wnba_cumestatsplayergames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayergames.md)
  :

  **Get WNBA Stats API Cumulative Player Game Stats**

- [`wnba_cumestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteam.md)
  :

  **Get WNBA Stats API Cumulative Team Stats**

- [`wnba_cumestatsteamgames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteamgames.md)
  :

  **Get WNBA Stats API Cumulative Team Game Stats**

- [`wnba_data_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_data_pbp.md)
  :

  **Get WNBA Data API Play-by-Play**

- [`wnba_draftboard()`](https://wehoop.sportsdataverse.org/reference/wnba_draftboard.md)
  :

  **Get WNBA Stats API Draft Board**

- [`wnba_draftcombinestats()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinestats.md)
  [`wnba_draftcombinedrillresults()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinestats.md)
  [`wnba_draftcombinenonstationaryshooting()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinestats.md)
  [`wnba_draftcombineplayeranthro()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinestats.md)
  [`wnba_draftcombinespotshooting()`](https://wehoop.sportsdataverse.org/reference/wnba_draftcombinestats.md)
  :

  **Get WNBA Stats API Draft Combine Stats**

- [`wnba_drafthistory()`](https://wehoop.sportsdataverse.org/reference/wnba_drafthistory.md)
  :

  **Get WNBA Stats API Draft History**

- [`wnba_fantasywidget()`](https://wehoop.sportsdataverse.org/reference/wnba_fantasywidget.md)
  :

  **Get WNBA Stats API Fantasy Widget**

- [`wnba_franchisehistory()`](https://wehoop.sportsdataverse.org/reference/wnba_franchisehistory.md)
  :

  **Get WNBA Stats API Franchise History**

- [`wnba_franchiseleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaders.md)
  :

  **Get WNBA Stats API Franchise Leaders**

- [`wnba_franchiseleaderswrank()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseleaderswrank.md)
  :

  **Get WNBA Stats API Franchise Leaders with Rank**

- [`wnba_franchiseplayers()`](https://wehoop.sportsdataverse.org/reference/wnba_franchiseplayers.md)
  :

  **Get WNBA Stats API Franchise Players**

- [`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md)
  :

  **Get WNBA Stats API Game Rotation**

- [`wnba_homepagewidget()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagewidget.md)
  :

  **Get WNBA Stats API Homepage Widget Leaders**

- [`wnba_infographicfanduelplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_infographicfanduelplayer.md)
  :

  **Get WNBA Stats API FanDuel Player Infographic**

- [`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md)
  :

  **Get WNBA Stats API League Dashboard Lineups**

- [`wnba_leaguedashplayerbiostats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerbiostats.md)
  :

  **Get WNBA Stats API League Dashboard Player Biographical Stats**

- [`wnba_leaguedashplayerclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerclutch.md)
  :

  **Get WNBA Stats API League Dashboard by Player Clutch Splits**

- [`wnba_leaguedashplayershotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayershotlocations.md)
  :

  **Get WNBA Stats API League Dashboard Player Shot Locations**

- [`wnba_leaguedashplayerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashplayerstats.md)
  :

  **Get WNBA Stats API League Dashboard Player Stats**

- [`wnba_leaguedashteamclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamclutch.md)
  :

  **Get WNBA Stats API League Dashboard by Team Clutch Splits**

- [`wnba_leaguedashteamshotlocations()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamshotlocations.md)
  :

  **Get WNBA Stats API League Dashboard Team Shot Locations**

- [`wnba_leaguedashteamstats()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashteamstats.md)
  :

  **Get WNBA Stats API League Dashboard Team Stats**

- [`wnba_leaguegamefinder()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamefinder.md)
  :

  **Get WNBA Stats API League Game Streak Finder**

- [`wnba_leaguegamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguegamelog.md)
  :

  **Get WNBA Stats API League Game Log**

- [`wnba_leagueleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueleaders.md)
  :

  **Get WNBA Stats API League Leaders**

- [`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md)
  :

  **Get WNBA Stats API League Lineup Visual Data**

- [`wnba_leagueplayerondetails()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueplayerondetails.md)
  :

  **Get WNBA Stats API League Player On/Off Details**

- [`wnba_leagueseasonmatchups()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueseasonmatchups.md)
  :

  **Get WNBA Stats API League Season Matchups**

- [`wnba_leaguestandingsv3()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguestandingsv3.md)
  :

  **Get WNBA Stats API League Standings V3**

- [`wnba_live_boxscore()`](https://wehoop.sportsdataverse.org/reference/wnba_live_boxscore.md)
  :

  **Get WNBA Stats API Live Boxscore**

- [`wnba_live_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_live_pbp.md)
  :

  **Get WNBA Stats API Live play-by-play**

- [`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md)
  :

  **Get WNBA Stats API play-by-play**

- [`wnba_pbps()`](https://wehoop.sportsdataverse.org/reference/wnba_pbps.md)
  :

  **Get WNBA Stats API play-by-play (Multiple Games)**

- [`wnba_playbyplayv3()`](https://wehoop.sportsdataverse.org/reference/wnba_playbyplayv3.md)
  :

  **Get WNBA Stats API Play-by-Play V3**

- [`wnba_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_player_crosswalk.md)
  :

  **Get the WNBA cross-source player crosswalk**

- [`wnba_playerawards()`](https://wehoop.sportsdataverse.org/reference/wnba_playerawards.md)
  :

  **Get WNBA Stats API Player Awards**

- [`wnba_playercareerbycollege()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollege.md)
  :

  **Get WNBA Stats API Player Career By College**

- [`wnba_playercareerbycollegerollup()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerbycollegerollup.md)
  :

  **Get WNBA Stats API Player Career By College Rollup**

- [`wnba_playercareerstats()`](https://wehoop.sportsdataverse.org/reference/wnba_playercareerstats.md)
  :

  **Get WNBA Stats API Player Career Stats**

- [`wnba_playercompare()`](https://wehoop.sportsdataverse.org/reference/wnba_playercompare.md)
  :

  **Get WNBA Stats API Player Compare**

- [`wnba_playerdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md)
  [`wnba_playerdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md)
  [`wnba_playerdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md)
  [`wnba_playerdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md)
  [`wnba_playerdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md)
  [`wnba_playerdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md)
  [`wnba_playerdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md)
  [`wnba_playerdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_playerdashboardbyclutch.md)
  :

  **Get WNBA Stats API Player Dashboard by Clutch Splits**

- [`wnba_playerestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_playerestimatedmetrics.md)
  :

  **Get WNBA Stats API Player Estimated Metrics**

- [`wnba_playerfantasyprofile()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofile.md)
  :

  **Get WNBA Stats API Player Fantasy Profile**

- [`wnba_playerfantasyprofilebargraph()`](https://wehoop.sportsdataverse.org/reference/wnba_playerfantasyprofilebargraph.md)
  :

  **Get WNBA Stats API Player Fantasy Profile Bar Graph**

- [`wnba_playergamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelog.md)
  :

  **Get WNBA Stats API Player Game Log**

- [`wnba_playergamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamelogs.md)
  :

  **Get WNBA Stats API Player Game Logs**

- [`wnba_playergamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_playergamestreakfinder.md)
  :

  **Get WNBA Stats API Player Game Streak Finder**

- [`wnba_playerheadshot()`](https://wehoop.sportsdataverse.org/reference/wnba_playerheadshot.md)
  :

  **Get WNBA Stats API Player Head-shot**

- [`wnba_playerindex()`](https://wehoop.sportsdataverse.org/reference/wnba_playerindex.md)
  :

  **Get WNBA Stats API Player Index**

- [`wnba_playernextngames()`](https://wehoop.sportsdataverse.org/reference/wnba_playernextngames.md)
  :

  **Get WNBA Stats API Player Next N Games**

- [`wnba_playerprofilev2()`](https://wehoop.sportsdataverse.org/reference/wnba_playerprofilev2.md)
  :

  **Get WNBA Stats API Player Profile V2**

- [`wnba_playervsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_playervsplayer.md)
  :

  **Get WNBA Stats API Player vs Player**

- [`wnba_possession_lineups()`](https://wehoop.sportsdataverse.org/reference/wnba_possession_lineups.md)
  :

  **Get WNBA Possession-Level Stint Matrix**

- [`wnba_rapm()`](https://wehoop.sportsdataverse.org/reference/wnba_rapm.md)
  :

  **Fit a Ridge-Regression RAPM Model from WNBA Possession Data**

- [`wnba_schedule()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule.md)
  :

  **Get WNBA Stats API Season Schedule**

- [`wnba_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_schedule_crosswalk.md)
  :

  **Get the WNBA cross-source schedule crosswalk**

- [`wnba_scoreboardv2()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboardv2.md)
  :

  **Get WNBA Stats API Scoreboard V2**

- [`wnba_scoreboardv3()`](https://wehoop.sportsdataverse.org/reference/wnba_scoreboardv3.md)
  :

  **Get WNBA Stats API Scoreboard V3**

- [`wnba_shot_zones()`](https://wehoop.sportsdataverse.org/reference/wnba_shot_zones.md)
  :

  **Fetch WNBA Play-by-Play and Classify Field-Goal Attempts by Shot
  Zone**

- [`wnba_shotchartdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartdetail.md)
  :

  **Get WNBA Stats API Shot Chart Detail**

- [`wnba_shotchartleaguewide()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartleaguewide.md)
  :

  **Get WNBA Stats API Shot Chart League-Wide**

- [`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md)
  :

  **Get WNBA Stats API Shot Chart for Lineups**

- [`wnba_stats`](https://wehoop.sportsdataverse.org/reference/wnba_stats.md)
  [`wehoop_wnba_stats`](https://wehoop.sportsdataverse.org/reference/wnba_stats.md)
  :

  **WNBA Stats API Endpoint Overview**

- [`wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wnba_team_crosswalk.md)
  :

  **Get the WNBA cross-source team crosswalk**

- [`wnba_teamdashboardbyclutch()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)
  [`wnba_teamdashboardbygamesplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)
  [`wnba_teamdashboardbygeneralsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)
  [`wnba_teamdashboardbylastngames()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)
  [`wnba_teamdashboardbyopponent()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)
  [`wnba_teamdashboardbyshootingsplits()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)
  [`wnba_teamdashboardbyteamperformance()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)
  [`wnba_teamdashboardbyyearoveryear()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashboardbyclutch.md)
  :

  **Get WNBA Stats API Team Dashboard by Clutch Splits**

- [`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md)
  :

  **Get WNBA Stats API Team Dashboard - Lineups**

- [`wnba_teamdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdetails.md)
  :

  **Get WNBA Stats API Team Details**

- [`wnba_teamestimatedmetrics()`](https://wehoop.sportsdataverse.org/reference/wnba_teamestimatedmetrics.md)
  :

  **Get WNBA Stats API Team Estimated Metrics**

- [`wnba_teamgamelog()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelog.md)
  :

  **Get WNBA Stats API Team Game Log**

- [`wnba_teamgamelogs()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamelogs.md)
  :

  **Get WNBA Stats API Team Game Logs**

- [`wnba_teamgamestreakfinder()`](https://wehoop.sportsdataverse.org/reference/wnba_teamgamestreakfinder.md)
  :

  **Get WNBA Stats API Team Game Streak Finder**

- [`wnba_teamhistoricalleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_teamhistoricalleaders.md)
  :

  **Get WNBA Stats API Team Historical Leaders**

- [`wnba_teaminfocommon()`](https://wehoop.sportsdataverse.org/reference/wnba_teaminfocommon.md)
  :

  **Get WNBA Stats API Team Common Info**

- [`wnba_teamplayeronoffdetails()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md)
  [`wnba_teamplayeronoffsummary()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md)
  [`wnba_teamplayerdashboard()`](https://wehoop.sportsdataverse.org/reference/wnba_teamplayerdashboard.md)
  :

  **Get WNBA Stats API Team Player On/Off Details**

- [`wnba_teams()`](https://wehoop.sportsdataverse.org/reference/wnba_teams.md)
  :

  **Get WNBA Stats API Teams**

- [`wnba_teamvsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_teamvsplayer.md)
  :

  **Get WNBA Stats API Team vs Player**

- [`wnba_teamyearbyyearstats()`](https://wehoop.sportsdataverse.org/reference/wnba_teamyearbyyearstats.md)
  :

  **Get WNBA Stats API Team Year by Year Stats**

- [`wnba_todays_scoreboard()`](https://wehoop.sportsdataverse.org/reference/wnba_todays_scoreboard.md)
  :

  **Get WNBA Stats API Today's Scoreboard**

- [`wnba_videoevents()`](https://wehoop.sportsdataverse.org/reference/wnba_videoevents.md)
  :

  **Get WNBA Stats API Video Events**

- [`wnba_videostatus()`](https://wehoop.sportsdataverse.org/reference/wnba_videostatus.md)
  :

  **Get WNBA Stats API Video Status**

### WNBA Basketball-Reference Functions

Functions exported by wehoop to scrape WNBA data from
basketball-reference.com/wnba

- [`bref_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_player_stats.md)
  :

  **Basketball-Reference WNBA Player Season Stats**

- [`bref_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_standings.md)
  :

  **Basketball-Reference WNBA Standings**

- [`bref_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/bref_wnba_team_stats.md)
  :

  **Basketball-Reference WNBA Team Season Stats**

### Her Hoop Stats Functions

Functions exported by wehoop to access Her Hoop Stats
(herhoopstats.com). Her Hoop Stats is a subscription service; these
require your own login.

- [`hhs_team_roster()`](https://wehoop.sportsdataverse.org/reference/hhs_team_roster.md)
  :

  **Her Hoop Stats Team Roster**

- [`hhs_team_stats()`](https://wehoop.sportsdataverse.org/reference/hhs_team_stats.md)
  :

  **Her Hoop Stats Team Statistics**

- [`hhs_teams()`](https://wehoop.sportsdataverse.org/reference/hhs_teams.md)
  :

  **Her Hoop Stats NCAA Team Single-Season Index**

### wehoop Helper Functions

Internal functions used by wehoop

- [`check_status()`](https://wehoop.sportsdataverse.org/reference/check_status.md)
  : Check Status function

- [`csv_from_url()`](https://wehoop.sportsdataverse.org/reference/csv_from_url.md)
  :

  **Load .csv / .csv.gz file from a remote connection**

- [`rds_from_url()`](https://wehoop.sportsdataverse.org/reference/rds_from_url.md)
  :

  **Load .rds file from a remote connection**

- [`parquet_from_url()`](https://wehoop.sportsdataverse.org/reference/parquet_from_url.md)
  :

  **Load .parquet file from a remote connection**

- [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md)
  : Most Recent Women's College Basketball Season

- [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md)
  : Most Recent WNBA Season

- [`most_recent_wnba_stats_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_stats_season.md)
  : Most Recent WNBA Stats API Season

- [`progressively()`](https://wehoop.sportsdataverse.org/reference/progressively.md)
  : Progressively

- [`request_with_proxy()`](https://wehoop.sportsdataverse.org/reference/request_with_proxy.md)
  :

  **Retry http request with optional proxy**

- [`year_to_season()`](https://wehoop.sportsdataverse.org/reference/year_to_season.md)
  :

  **Convert a calendar year to a WNBA / NBA season string**

- [`.players_on_court`](https://wehoop.sportsdataverse.org/reference/dot-players_on_court.md)
  :

  **Add players on court in WNBA Stats API play-by-play**

## Datasets

### Bundled reference data

Reference datasets shipped with the package

- [`parameter_descriptions`](https://wehoop.sportsdataverse.org/reference/parameter_descriptions.md)
  :

  **WNBA Stats API Parameter Descriptions** Reference table for
  parameters used across `wnba_*()` functions.

# **Get ESPN WBB Per-Week Ranking Detail**

Returns the long-format ranked teams for one (season x season-type x
week x ranking-source). Typically 25 rows for WBB (AP Top 25).

## Usage

``` r
espn_wbb_week_ranking(
  ranking_id,
  week,
  season = most_recent_wbb_season(),
  season_type = 2L,
  ...
)
```

## Arguments

- ranking_id:

  Ranking source id (1 = AP, 2 = Coaches, etc.).

- week:

  Week number.

- season:

  Season year. Defaults to most recent WBB season.

- season_type:

  Season-type id (2 = regular (default)).

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per ranked team (typically 25).

|                   |           |                                              |
|-------------------|-----------|----------------------------------------------|
| col_name          | types     | description                                  |
| league            | character | League slug.                                 |
| season            | integer   | Season year.                                 |
| season_type       | integer   | Season-type id.                              |
| week              | integer   | Week number.                                 |
| ranking_id        | character | ESPN ranking id.                             |
| name              | character | Ranking name (e.g. "AP Top 25").             |
| short_name        | character | Short name.                                  |
| type              | character | Ranking type code.                           |
| headline          | character | Full headline.                               |
| date              | character | Date of the ranking.                         |
| current           | integer   | Current rank.                                |
| previous          | integer   | Previous-week rank.                          |
| points            | numeric   | Voting points.                               |
| first_place_votes | integer   | First-place vote count.                      |
| trend             | character | Trend indicator (e.g. "+3", "-2", "-").      |
| record_summary    | character | Team's record at time of poll (e.g. "20-2"). |
| team_id           | character | ESPN team id.                                |
| team_ref          | character | `$ref` to the team-in-season resource.       |
| last_updated      | character | Last-updated timestamp.                      |

## Details

**Get ESPN WBB Per-Week Ranking Detail**

## See also

Other ESPN WBB Functions:
[`espn_wbb_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athletes_index.md),
[`espn_wbb_award()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_award.md),
[`espn_wbb_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_calendar.md),
[`espn_wbb_coach()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach.md),
[`espn_wbb_coach_record()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach_record.md),
[`espn_wbb_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach_season.md),
[`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md),
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_franchise.md),
[`espn_wbb_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_franchises.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md),
[`espn_wbb_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_odds.md),
[`espn_wbb_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_official_detail.md),
[`espn_wbb_game_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_officials.md),
[`espn_wbb_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play.md),
[`espn_wbb_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play_personnel.md),
[`espn_wbb_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_player_box.md),
[`espn_wbb_game_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_powerindex.md),
[`espn_wbb_game_predictor()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_predictor.md),
[`espn_wbb_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_probabilities.md),
[`espn_wbb_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_propbets.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
[`espn_wbb_game_situation()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_situation.md),
[`espn_wbb_game_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md),
[`espn_wbb_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_linescores.md),
[`espn_wbb_game_team_records()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_records.md),
[`espn_wbb_game_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_roster.md),
[`espn_wbb_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_roster_entry.md),
[`espn_wbb_game_team_score()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_score.md),
[`espn_wbb_game_team_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_statistics.md),
[`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md),
[`espn_wbb_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_leaders.md),
[`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_awards.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_career_stats.md),
[`espn_wbb_player_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog.md),
[`espn_wbb_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog_v2.md),
[`espn_wbb_player_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_gamelog.md),
[`espn_wbb_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_info.md),
[`espn_wbb_player_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_overview.md),
[`espn_wbb_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_seasons.md),
[`espn_wbb_player_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_splits.md),
[`espn_wbb_player_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_statisticslog.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_player_stats_v3()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats_v3.md),
[`espn_wbb_position()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_position.md),
[`espn_wbb_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_positions.md),
[`espn_wbb_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_powerindex.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_awards.md),
[`espn_wbb_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group.md),
[`espn_wbb_season_group_children()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group_children.md),
[`espn_wbb_season_group_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group_teams.md),
[`espn_wbb_season_groups()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_groups.md),
[`espn_wbb_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_info.md),
[`espn_wbb_season_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_leaders.md),
[`espn_wbb_season_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_ranking.md),
[`espn_wbb_season_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_rankings.md),
[`espn_wbb_season_type()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_type.md),
[`espn_wbb_season_types()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_types.md),
[`espn_wbb_season_week()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_week.md),
[`espn_wbb_season_weeks()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_weeks.md),
[`espn_wbb_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_seasons.md),
[`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md),
[`espn_wbb_team()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md),
[`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
[`espn_wbb_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_injuries.md),
[`espn_wbb_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_leaders.md),
[`espn_wbb_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_news.md),
[`espn_wbb_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_record_detail.md),
[`espn_wbb_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_roster.md),
[`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md),
[`espn_wbb_team_season_profile()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_profile.md),
[`espn_wbb_team_season_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_roster.md),
[`espn_wbb_team_season_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_statistics.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md),
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md),
[`espn_wbb_tournament()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament.md),
[`espn_wbb_tournament_season()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament_season.md),
[`espn_wbb_tournament_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament_seasons.md),
[`espn_wbb_tournaments()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournaments.md),
[`espn_wbb_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_venues.md),
[`espn_wbb_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_rankings.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_week_ranking(ranking_id = 1, week = 5, season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Week Ranking Detail ────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-30 19:32:55 UTC
#> # A tibble: 25 × 19
#>    league    season season_type  week ranking_id name  short_name type  headline
#>    <chr>      <int>       <int> <int> <chr>      <chr> <chr>      <chr> <chr>   
#>  1 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  2 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  3 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  4 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  5 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  6 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  7 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  8 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#>  9 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#> 10 womens-c…   2025           2     5 1          AP T… AP Poll    ap    2025 NC…
#> # ℹ 15 more rows
#> # ℹ 10 more variables: date <chr>, current <int>, previous <int>, points <dbl>,
#> #   first_place_votes <int>, trend <chr>, record_summary <chr>, team_id <chr>,
#> #   team_ref <chr>, last_updated <chr>
# }
```

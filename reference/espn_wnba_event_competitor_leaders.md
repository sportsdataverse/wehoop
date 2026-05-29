# **Get ESPN WNBA Event Competitor Leaders (Top Performers)**

Returns the per-team statistical leaders for one WNBA event in long
format: one row per (category x athlete rank). Categories typically
include points, rebounds, assists, and rating.

## Usage

``` r
espn_wnba_event_competitor_leaders(event_id, team_id, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- team_id:

  ESPN team identifier.

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per (category x rank).

## See also

Other ESPN WNBA Functions:
[`espn_wnba_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_awards.md),
[`espn_wnba_athlete_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_career_stats.md),
[`espn_wnba_athlete_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_eventlog_v2.md),
[`espn_wnba_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_eventlog.md),
[`espn_wnba_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_gamelog.md),
[`espn_wnba_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_info.md),
[`espn_wnba_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_overview.md),
[`espn_wnba_athlete_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_seasons.md),
[`espn_wnba_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_splits.md),
[`espn_wnba_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_statisticslog.md),
[`espn_wnba_athlete_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_stats.md),
[`espn_wnba_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athletes_index.md),
[`espn_wnba_award()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_award.md),
[`espn_wnba_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_calendar.md),
[`espn_wnba_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coach_season.md),
[`espn_wnba_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coaches.md),
[`espn_wnba_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_conferences.md),
[`espn_wnba_draft_athlete_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athlete_detail.md),
[`espn_wnba_draft_athletes()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md),
[`espn_wnba_draft_pick()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_pick.md),
[`espn_wnba_draft_rounds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_rounds.md),
[`espn_wnba_draft_status()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_status.md),
[`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md),
[`espn_wnba_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_broadcasts.md),
[`espn_wnba_event_competitor_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_linescores.md),
[`espn_wnba_event_competitor_records()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_records.md),
[`espn_wnba_event_competitor_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_roster_entry.md),
[`espn_wnba_event_competitor_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_roster.md),
[`espn_wnba_event_competitor_score()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_score.md),
[`espn_wnba_event_competitor_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_statistics.md),
[`espn_wnba_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_odds.md),
[`espn_wnba_event_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_official_detail.md),
[`espn_wnba_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_officials.md),
[`espn_wnba_event_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_play_personnel.md),
[`espn_wnba_event_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_player_box.md),
[`espn_wnba_event_play()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_play.md),
[`espn_wnba_event_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_powerindex.md),
[`espn_wnba_event_predictor()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_predictor.md),
[`espn_wnba_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_probabilities.md),
[`espn_wnba_event_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_propbets.md),
[`espn_wnba_event_situation()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_situation.md),
[`espn_wnba_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchises.md),
[`espn_wnba_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchise.md),
[`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md),
[`espn_wnba_futures()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_futures.md),
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md),
[`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md),
[`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md),
[`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
[`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_positions.md),
[`espn_wnba_position()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_position.md),
[`espn_wnba_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_powerindex.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_awards.md),
[`espn_wnba_season_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_draft.md),
[`espn_wnba_season_group_children()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group_children.md),
[`espn_wnba_season_group_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group_teams.md),
[`espn_wnba_season_groups()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_groups.md),
[`espn_wnba_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group.md),
[`espn_wnba_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_info.md),
[`espn_wnba_season_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_leaders.md),
[`espn_wnba_season_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_rankings.md),
[`espn_wnba_season_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_ranking.md),
[`espn_wnba_season_types()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_types.md),
[`espn_wnba_season_type()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_type.md),
[`espn_wnba_season_weeks()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_weeks.md),
[`espn_wnba_season_week()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_week.md),
[`espn_wnba_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_seasons.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md),
[`espn_wnba_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_injuries.md),
[`espn_wnba_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_leaders.md),
[`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md),
[`espn_wnba_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record_detail.md),
[`espn_wnba_team_record()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record.md),
[`espn_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_roster.md),
[`espn_wnba_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_schedule.md),
[`espn_wnba_team_season_profile()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_profile.md),
[`espn_wnba_team_season_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_roster.md),
[`espn_wnba_team_season_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_statistics.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md),
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md),
[`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md),
[`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md),
[`espn_wnba_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_venues.md),
[`espn_wnba_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_rankings.md),
[`espn_wnba_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_ranking.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_event_competitor_leaders(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Competitor Leaders ──────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-29 17:50:57 UTC
#> # A tibble: 28 × 11
#>    league event_id  team_id category_name category_display category_abbrev  rank
#>    <chr>  <chr>     <chr>   <chr>         <chr>            <chr>           <int>
#>  1 wnba   401736171 17      points        Points           Pts                 1
#>  2 wnba   401736171 17      points        Points           Pts                 2
#>  3 wnba   401736171 17      points        Points           Pts                 3
#>  4 wnba   401736171 17      points        Points           Pts                 4
#>  5 wnba   401736171 17      points        Points           Pts                 5
#>  6 wnba   401736171 17      points        Points           Pts                 6
#>  7 wnba   401736171 17      assists       Assists          Ast                 1
#>  8 wnba   401736171 17      assists       Assists          Ast                 2
#>  9 wnba   401736171 17      assists       Assists          Ast                 3
#> 10 wnba   401736171 17      assists       Assists          Ast                 4
#> # ℹ 18 more rows
#> # ℹ 4 more variables: athlete_id <chr>, display_value <chr>, value <dbl>,
#> #   athlete_ref <chr>
# }
```

# **Get ESPN WNBA Season Awards Index**

Returns the list of award IDs given out in a WNBA season from
`sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/{season}/awards`.
The index only contains IDs and `$ref` URLs — pass an ID to
[`espn_wnba_award()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_award.md)
for the award name, description, and winners.

## Usage

``` r
espn_wnba_season_awards(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per award.

|          |           |                                       |
|----------|-----------|---------------------------------------|
| col_name | types     | description                           |
| season   | integer   | Season year.                          |
| award_id | character | ESPN award identifier.                |
| ref      | character | Full `$ref` URL for the award detail. |
| league   | character | League slug (`"wnba"`).               |

## See also

Other ESPN WNBA Functions:
[`espn_wnba_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_awards.md),
[`espn_wnba_athlete_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_career_stats.md),
[`espn_wnba_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_eventlog.md),
[`espn_wnba_athlete_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_eventlog_v2.md),
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
[`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md),
[`espn_wnba_draft_athlete_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athlete_detail.md),
[`espn_wnba_draft_athletes()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md),
[`espn_wnba_draft_pick()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_pick.md),
[`espn_wnba_draft_rounds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_rounds.md),
[`espn_wnba_draft_status()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_status.md),
[`espn_wnba_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_broadcasts.md),
[`espn_wnba_event_competitor_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_leaders.md),
[`espn_wnba_event_competitor_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_linescores.md),
[`espn_wnba_event_competitor_records()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_records.md),
[`espn_wnba_event_competitor_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_roster.md),
[`espn_wnba_event_competitor_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_roster_entry.md),
[`espn_wnba_event_competitor_score()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_score.md),
[`espn_wnba_event_competitor_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_competitor_statistics.md),
[`espn_wnba_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_odds.md),
[`espn_wnba_event_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_official_detail.md),
[`espn_wnba_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_officials.md),
[`espn_wnba_event_play()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_play.md),
[`espn_wnba_event_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_play_personnel.md),
[`espn_wnba_event_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_player_box.md),
[`espn_wnba_event_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_powerindex.md),
[`espn_wnba_event_predictor()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_predictor.md),
[`espn_wnba_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_probabilities.md),
[`espn_wnba_event_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_propbets.md),
[`espn_wnba_event_situation()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_situation.md),
[`espn_wnba_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchise.md),
[`espn_wnba_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchises.md),
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
[`espn_wnba_position()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_position.md),
[`espn_wnba_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_positions.md),
[`espn_wnba_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_powerindex.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_season_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_draft.md),
[`espn_wnba_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group.md),
[`espn_wnba_season_group_children()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group_children.md),
[`espn_wnba_season_group_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group_teams.md),
[`espn_wnba_season_groups()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_groups.md),
[`espn_wnba_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_info.md),
[`espn_wnba_season_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_leaders.md),
[`espn_wnba_season_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_ranking.md),
[`espn_wnba_season_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_rankings.md),
[`espn_wnba_season_type()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_type.md),
[`espn_wnba_season_types()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_types.md),
[`espn_wnba_season_week()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_week.md),
[`espn_wnba_season_weeks()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_weeks.md),
[`espn_wnba_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_seasons.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md),
[`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md),
[`espn_wnba_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_injuries.md),
[`espn_wnba_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_leaders.md),
[`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md),
[`espn_wnba_team_record()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record.md),
[`espn_wnba_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record_detail.md),
[`espn_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_roster.md),
[`espn_wnba_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_schedule.md),
[`espn_wnba_team_season_profile()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_profile.md),
[`espn_wnba_team_season_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_roster.md),
[`espn_wnba_team_season_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_season_statistics.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md),
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md),
[`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md),
[`espn_wnba_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_venues.md),
[`espn_wnba_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_ranking.md),
[`espn_wnba_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_week_rankings.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_season_awards(season = 2024)
#> ── ESPN WNBA Season Awards Index ─────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-22 06:55:32 UTC
#> # A tibble: 14 × 4
#>    season award_id ref                                                    league
#>     <int> <chr>    <chr>                                                  <chr> 
#>  1   2024 241      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  2   2024 244      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  3   2024 246      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  4   2024 243      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  5   2024 242      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  6   2024 245      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  7   2024 257      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  8   2024 237      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#>  9   2024 250      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#> 10   2024 251      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#> 11   2024 238      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#> 12   2024 239      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#> 13   2024 248      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
#> 14   2024 247      http://sports.core.api.espn.com/v2/sports/basketball/… wnba  
# }
```

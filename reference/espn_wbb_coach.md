# **Get ESPN WBB Single-Coach Detail**

Returns biography, current team / college refs, and counts of career
record entries + per-season coaching entries for one WBB head coach.

## Usage

``` r
espn_wbb_coach(coach_id, ...)
```

## Arguments

- coach_id:

  ESPN coach identifier (character or numeric).

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

|                  |           |                                     |
|------------------|-----------|-------------------------------------|
| col_name         | types     | description                         |
| coach_id         | character | ESPN coach identifier.              |
| uid              | character | ESPN UID string.                    |
| first_name       | character | First name.                         |
| last_name        | character | Last name.                          |
| date_of_birth    | character | Date of birth (ISO 8601).           |
| birth_city       | character | Birth city.                         |
| birth_state      | character | Birth state / region.               |
| n_career_records | integer   | Count of career-records entries.    |
| n_coach_seasons  | integer   | Count of seasons coached.           |
| college_ref      | character | `$ref` to the coach's college.      |
| team_ref         | character | `$ref` to the coach's current team. |
| league           | character | League slug.                        |

## See also

Other ESPN WBB Functions:
[`espn_wbb_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_awards.md),
[`espn_wbb_athlete_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_career_stats.md),
[`espn_wbb_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_eventlog.md),
[`espn_wbb_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_gamelog.md),
[`espn_wbb_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_info.md),
[`espn_wbb_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_overview.md),
[`espn_wbb_athlete_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_seasons.md),
[`espn_wbb_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_splits.md),
[`espn_wbb_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_statisticslog.md),
[`espn_wbb_athlete_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_stats.md),
[`espn_wbb_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athletes_index.md),
[`espn_wbb_award()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_award.md),
[`espn_wbb_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_calendar.md),
[`espn_wbb_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach_season.md),
[`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md),
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_broadcasts.md),
[`espn_wbb_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_odds.md),
[`espn_wbb_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_officials.md),
[`espn_wbb_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_probabilities.md),
[`espn_wbb_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_franchise.md),
[`espn_wbb_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_franchises.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
[`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md),
[`espn_wbb_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_leaders.md),
[`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
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
[`espn_wbb_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_roster.md),
[`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md),
[`espn_wbb_team_season_profile()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_profile.md),
[`espn_wbb_team_season_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_roster.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md),
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md),
[`espn_wbb_tournament()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament.md),
[`espn_wbb_tournament_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament_seasons.md),
[`espn_wbb_tournaments()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournaments.md),
[`espn_wbb_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_venues.md),
[`espn_wbb_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_ranking.md),
[`espn_wbb_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_rankings.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_coach(coach_id = 1031)
#> ✖ 2026-05-18 22:28:32.597888: Failed to retrieve ESPN womens-college-basketball coach 1031
#> ✖ Args: league = "womens-college-basketball", coach_id = 1031
#> ✖ Error: The API returned an error
#> NULL
# }
```

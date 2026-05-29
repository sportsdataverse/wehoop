# **Get ESPN women's college basketball team stats data**

**Get ESPN women's college basketball team stats data**

## Usage

``` r
espn_wbb_team_stats(team_id, year, season_type = "regular", total = FALSE)
```

## Arguments

- team_id:

  Team ID

- year:

  Year

- season_type:

  (character, default: regular): Season type - regular or postseason

- total:

  (boolean, default: FALSE): Totals

## Value

Returns a tibble with the team stats data

|  |  |  |
|----|----|----|
| col_name | types | description |
| team_id | integer | Unique team identifier. |
| team_guid | character | ESPN team GUID. |
| team_uid | character | ESPN universal team identifier (UID format 's:40~l:...~t:...'). |
| team_sdr | integer | ESPN team SDR identifier. |
| team_slug | character | URL-safe team identifier (e.g. 'lasvegas-aces' / 'aces'). |
| team_location | character | Team city or location string. |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_nickname | character | Team nickname. |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| team_display_name | character | Full team display name. |
| team_short_display_name | character | Short team display name (e.g. 'Aces'). |
| team_color | character | Team primary color (hex without leading '#'). |
| team_alternate_color | character | Team alternate color (hex without leading '#'). |
| team_is_active | logical | TRUE if the team is currently active. |
| team_is_all_star | logical | TRUE if the row represents an All-Star team. |
| logo_href | character | Team or league logo URL. |
| logo_dark_href | character | Logo URL for dark backgrounds. |
| defensive_blocks | numeric | Short for blocked shot, number of times when a defensive player legally deflects a field goal attempt from an offensive player. |
| defensive_defensive_rebounds | numeric | The number of times when the defense obtains the possession of the ball after a missed shot by the offense. |
| defensive_steals | numeric | The number of times a defensive player forced a turnover by intercepting or deflecting a pass or a dribble of an offensive player. |
| defensive_turnover_points | numeric | The amount of points resulting from the possession following a turnover. |
| defensive_avg_defensive_rebounds | numeric | The average defensive rebounds per game. |
| defensive_avg_blocks | numeric | The average blocks per game. |
| defensive_avg_steals | numeric | The average steals per game. |
| general_disqualifications | numeric | The number of times a player reached the foul limit. |
| general_flagrant_fouls | numeric | The number of fouls that the officials thought were unnecessary or excessive. |
| general_fouls | numeric | The number of times a player had illegal contact with the opponent. |
| general_ejections | numeric | The number of times a player or coach is removed from the game as a result of a serious offense. |
| general_technical_fouls | numeric | The number of times an player or coach was called for a technical foul (unsportsmanlike conduct or violations). |
| general_rebounds | numeric | The total number of rebounds (offensive and defensive). |
| general_minutes | numeric | The total number of minutes played. |
| general_avg_minutes | numeric | The average number of minutes per game. |
| general_fantasy_rating | numeric | The Fantasy Rating of a player. |
| general_avg_rebounds | numeric | The average rebounds per game. |
| general_avg_fouls | numeric | The average fouls committed per game. |
| general_avg_flagrant_fouls | numeric | The average number of flagrant fouls per game. |
| general_avg_technical_fouls | numeric | The average number of technical fouls per game. |
| general_avg_ejections | numeric | The average ejections per game. |
| general_avg_disqualifications | numeric | The average number of disqualifications per game. |
| general_assist_turnover_ratio | numeric | The average number of assists a player or team records per turnover. |
| general_steal_foul_ratio | numeric | The average number of steals a player or team records per foul committed. |
| general_block_foul_ratio | numeric | The average number of blocks a player or record per foul committed. |
| general_avg_team_rebounds | numeric | The average number of rebounds for a team per game. |
| general_total_rebounds | numeric | The total number of rebounds for a team or player. |
| general_total_technical_fouls | numeric | The total number of technical fouls for a team or player. |
| general_team_assist_turnover_ratio | numeric | The number of assists per turnover for a team. |
| general_team_rebounds | numeric | The total number of rebounds for a team. |
| general_steal_turnover_ratio | numeric | The number of steals per turnover. |
| general_games_played | numeric | Games Played. |
| general_games_started | numeric | The number of games started by an athlete. |
| general_double_double | numeric | The number of times double digit values were accumulated in 2 of the following categories: points, rebounds, assists, steals, and blocked shots. |
| general_triple_double | numeric | The number of times double digit values were accumulated in 3 of the following categories: points, rebounds, assists, steals, and blocked shots. |
| offensive_assists | numeric | The number of times a player who passes the ball to a teammate in a way that leads to a score by field goal, meaning that he or she was "assisting" in the basket. There is some judgment involved in deciding whether a passer should be credited with an assist. |
| offensive_field_goals | numeric | Field Goal makes and attempts. |
| offensive_field_goals_attempted | numeric | The number of times a 2pt field goal was attempted. |
| offensive_field_goals_made | numeric | The number of times a 2pt field goal was made. |
| offensive_field_goal_pct | numeric | The ratio of field goals made to field goals attempted: FGM / FGA. |
| offensive_free_throws | numeric | Free Throw makes and attempts. |
| offensive_free_throw_pct | numeric | The ratio of free throws made to free throws attempted: FTM / FTA. |
| offensive_free_throws_attempted | numeric | The number of times a free throw was attempted. |
| offensive_free_throws_made | numeric | The number of times a free throw was made. |
| offensive_offensive_rebounds | numeric | The number of times when the offense obtains the possession of the ball after a missed shot. |
| offensive_points | numeric | The number of points scored. |
| offensive_turnovers | numeric | The number of times a player loses possession to the other team. |
| offensive_three_point_field_goals_attempted | numeric | The number of times a 3pt field goal was attempted. |
| offensive_three_point_field_goals_made | numeric | The number of times a 3pt field goal was made. |
| offensive_team_turnovers | numeric | The number of turnovers for the team. |
| offensive_total_turnovers | numeric | The number of turnovers plus team turnovers for the team. |
| offensive_fast_break_points | numeric | The number of points scored on fast breaks. |
| offensive_avg_field_goals_made | numeric | The average field goals made per game. |
| offensive_avg_field_goals_attempted | numeric | The average field goals attempted per game. |
| offensive_avg_three_point_field_goals_made | numeric | The average three point field goals made per game. |
| offensive_avg_three_point_field_goals_attempted | numeric | The average three point field goals attempted per game. |
| offensive_avg_free_throws_made | numeric | The average free throw shots made per game. |
| offensive_avg_free_throws_attempted | numeric | The average free throw shots attempted per game. |
| offensive_avg_points | numeric | The average number of points scored per game. |
| offensive_avg_offensive_rebounds | numeric | The average offensive rebounds per game. |
| offensive_avg_assists | numeric | The average assists per game. |
| offensive_avg_turnovers | numeric | The average turnovers committed per game. |
| offensive_offensive_rebound_pct | numeric | The percentage of the number of times they obtain the possession of the ball after a missed shot. |
| offensive_estimated_possessions | numeric | An estimation of the number of possessions for a team or player. |
| offensive_avg_estimated_possessions | numeric | The average number of estimated possessions per game for a team or player. |
| offensive_points_per_estimated_possessions | numeric | The number of points per estimated possession for a team or player. |
| offensive_avg_team_turnovers | numeric | The average number of turnovers for a team per game. |
| offensive_avg_total_turnovers | numeric | The average number of total turnovers for a team per game. |
| offensive_three_point_field_goal_pct | numeric | The ratio of 3pt field goals made to 3pt field goals attempted: 3PM / 3PA. |
| offensive_two_point_field_goals_made | numeric | The number of 2-point field goals made for a team or player. |
| offensive_two_point_field_goals_attempted | numeric | The number of 2-point field goals attempted for a team or player. |
| offensive_avg_two_point_field_goals_made | numeric | The number of 2-point field goals made per game for a team or player. |
| offensive_avg_two_point_field_goals_attempted | numeric | The number of 2-point field goals attempted per game for a team or player. |
| offensive_two_point_field_goal_pct | numeric | The percentage of 2-points fields goals made by a team or player. |
| offensive_shooting_efficiency | numeric | The efficiency with which a team or player shoots the basketball. |
| offensive_scoring_efficiency | numeric | The efficiency with which a team or player scores the basketball. |

## See also

Other ESPN WBB Functions:
[`espn_wbb_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_awards.md),
[`espn_wbb_athlete_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_career_stats.md),
[`espn_wbb_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_eventlog.md),
[`espn_wbb_athlete_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_eventlog_v2.md),
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
[`espn_wbb_coach()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach.md),
[`espn_wbb_coach_record()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach_record.md),
[`espn_wbb_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach_season.md),
[`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md),
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_broadcasts.md),
[`espn_wbb_event_competitor_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_competitor_leaders.md),
[`espn_wbb_event_competitor_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_competitor_linescores.md),
[`espn_wbb_event_competitor_records()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_competitor_records.md),
[`espn_wbb_event_competitor_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_competitor_roster.md),
[`espn_wbb_event_competitor_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_competitor_roster_entry.md),
[`espn_wbb_event_competitor_score()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_competitor_score.md),
[`espn_wbb_event_competitor_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_competitor_statistics.md),
[`espn_wbb_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_odds.md),
[`espn_wbb_event_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_official_detail.md),
[`espn_wbb_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_officials.md),
[`espn_wbb_event_play()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_play.md),
[`espn_wbb_event_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_play_personnel.md),
[`espn_wbb_event_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_player_box.md),
[`espn_wbb_event_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_powerindex.md),
[`espn_wbb_event_predictor()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_predictor.md),
[`espn_wbb_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_probabilities.md),
[`espn_wbb_event_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_propbets.md),
[`espn_wbb_event_situation()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_situation.md),
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
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md),
[`espn_wbb_tournament()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament.md),
[`espn_wbb_tournament_season()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_tournament_season.md),
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
  try(espn_wbb_team_stats(team_id = 2509, year = 2020))
#> ── ESPN WBB Team Season Stats from ESPN.com ──────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-29 17:35:54 UTC
#> # A tibble: 1 × 180
#>   team_x_ref_4       team_id team_guid team_uid team_sdr team_slug team_location
#>   <chr>                <int> <chr>     <chr>       <int> <chr>     <chr>        
#> 1 http://sports.cor…    2509 2fe4080d… s:40~l:…     7155 purdue-b… Purdue       
#> # ℹ 173 more variables: team_name <chr>, team_nickname <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_is_active <lgl>, is_all_star <lgl>,
#> #   logo_href <chr>, logo_dark_href <chr>, logos_href_2 <chr>,
#> #   logos_width_2 <int>, logos_height_2 <int>, logos_alt_2 <chr>,
#> #   logos_rel_full_2 <chr>, logos_rel_primary_logo_on_white_color <chr>, …
# }
```

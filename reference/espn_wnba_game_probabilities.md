# **Get ESPN WNBA Event Win Probabilities**

**Get ESPN WNBA Event Win Probabilities**

**Get ESPN WNBA Event Win Probabilities**

## Usage

``` r
espn_wnba_game_probabilities(event_id, limit = 200, ...)
```

## Arguments

- event_id:

  ESPN event/game identifier (character or numeric).

- limit:

  integer. Maximum number of probability rows to return. Defaults to
  `200`. Pagination is handled internally.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per play-level win-probability entry.

|  |  |  |
|----|----|----|
| col_name | types | description |
| event_id | character | Unique event / game identifier (ESPN). |
| sequence_number | character | Sequence number representing a shot-possession (V3 PBP). |
| play_id | character | Unique play identifier within a game. |
| period | integer | Period of the game (1-4 quarters; 5+ for OT). |
| clock | character | Game clock value. |
| home_win_percentage | numeric | Home win percentage (0-1 decimal). |
| away_win_percentage | numeric | Away win percentage (0-1 decimal). |
| tie_percentage | numeric | Tie percentage (0-1 decimal). |
| secs_to_end_of_period | numeric | Secs to end of period. |
| secs_to_end_of_game | numeric | Secs to end of game. |

## See also

Other ESPN WNBA Functions:
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
[`espn_wnba_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchise.md),
[`espn_wnba_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchises.md),
[`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md),
[`espn_wnba_futures()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_futures.md),
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md),
[`espn_wnba_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_odds.md),
[`espn_wnba_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_official_detail.md),
[`espn_wnba_game_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_officials.md),
[`espn_wnba_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play.md),
[`espn_wnba_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play_personnel.md),
[`espn_wnba_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_player_box.md),
[`espn_wnba_game_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_powerindex.md),
[`espn_wnba_game_predictor()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_predictor.md),
[`espn_wnba_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_propbets.md),
[`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md),
[`espn_wnba_game_situation()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_situation.md),
[`espn_wnba_game_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md),
[`espn_wnba_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_linescores.md),
[`espn_wnba_game_team_records()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_records.md),
[`espn_wnba_game_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_roster.md),
[`espn_wnba_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_roster_entry.md),
[`espn_wnba_game_team_score()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_score.md),
[`espn_wnba_game_team_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_statistics.md),
[`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md),
[`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md),
[`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
[`espn_wnba_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_awards.md),
[`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md),
[`espn_wnba_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_career_stats.md),
[`espn_wnba_player_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md),
[`espn_wnba_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog_v2.md),
[`espn_wnba_player_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_gamelog.md),
[`espn_wnba_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_info.md),
[`espn_wnba_player_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_overview.md),
[`espn_wnba_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_seasons.md),
[`espn_wnba_player_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_splits.md),
[`espn_wnba_player_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_statisticslog.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_player_stats_v3()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats_v3.md),
[`espn_wnba_position()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_position.md),
[`espn_wnba_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_positions.md),
[`espn_wnba_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_powerindex.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_awards.md),
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
  espn_wnba_game_probabilities(event_id = "401736171", limit = 50)
#> ── ESPN WNBA Event Probabilities (event_id=401736171) from ESPN.com ────────────
#> ℹ Data updated: 2026-06-09 19:58:03 UTC
#> # A tibble: 50 × 10
#>    event_id  sequence_number play_id period clock home_win_percentage
#>    <chr>     <chr>           <chr>    <int> <chr>               <dbl>
#>  1 401736171 4               NA          NA NA                  0.764
#>  2 401736171 7               NA          NA NA                  0.756
#>  3 401736171 9               NA          NA NA                  0.744
#>  4 401736171 10              NA          NA NA                  0.761
#>  5 401736171 11              NA          NA NA                  0.743
#>  6 401736171 12              NA          NA NA                  0.737
#>  7 401736171 13              NA          NA NA                  0.753
#>  8 401736171 14              NA          NA NA                  0.759
#>  9 401736171 15              NA          NA NA                  0.781
#> 10 401736171 17              NA          NA NA                  0.789
#> # ℹ 40 more rows
#> # ℹ 4 more variables: away_win_percentage <dbl>, tie_percentage <dbl>,
#> #   secs_to_end_of_period <dbl>, secs_to_end_of_game <dbl>
# }
```

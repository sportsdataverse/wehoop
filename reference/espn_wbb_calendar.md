# **Get ESPN WBB Calendar**

**Get ESPN WBB Calendar**

**Get ESPN Women's College Basketball Calendar**

## Usage

``` r
espn_wbb_calendar(season = most_recent_wbb_season())
```

## Arguments

- season:

  integer or character. Four-digit season year (e.g. `2025`). Defaults
  to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

## Value

Returns a tibble of calendar entries.

Columns as documented in the shared
[espn_basketball_calendar_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_calendar_schema.md)
table.

## Details

Retrieve the ESPN women's college basketball schedule calendar for a
given season. The underlying scoreboard response contains a
`leagues[[1]]$calendar` block with season-type entries (pre-season,
regular, post). Uses `getOption("wehoop.proxy")` or
`http_proxy`/`https_proxy` environment variables for proxy configuration
(per-call proxy override is not supported for ESPN wrappers).

## See also

Other ESPN WBB Functions:
[`espn_wbb_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athletes_index.md),
[`espn_wbb_award()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_award.md),
[`espn_wbb_coach()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach.md),
[`espn_wbb_coach_record()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach_record.md),
[`espn_wbb_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coach_season.md),
[`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md),
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_franchise.md),
[`espn_wbb_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_franchises.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md),
[`espn_wbb_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_official_detail.md),
[`espn_wbb_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play.md),
[`espn_wbb_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_play_personnel.md),
[`espn_wbb_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_player_box.md),
[`espn_wbb_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_probabilities.md),
[`espn_wbb_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_propbets.md),
[`espn_wbb_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md),
[`espn_wbb_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_roster_entry.md),
[`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md),
[`espn_wbb_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_leaders.md),
[`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md),
[`espn_wbb_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_awards.md),
[`espn_wbb_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_career_stats.md),
[`espn_wbb_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog_v2.md),
[`espn_wbb_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_info.md),
[`espn_wbb_player_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog.md),
[`espn_wbb_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_seasons.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_position()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_position.md),
[`espn_wbb_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_positions.md),
[`espn_wbb_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_powerindex.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_awards.md),
[`espn_wbb_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_group.md),
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
[`espn_wbb_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_injuries.md),
[`espn_wbb_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_news.md),
[`espn_wbb_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_record_detail.md),
[`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md),
[`espn_wbb_team_season_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_roster.md),
[`espn_wbb_team_season_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_season_statistics.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md),
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
  espn_wbb_calendar(season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Calendar from ESPN.com ─────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:06:32 UTC
#> # A tibble: 116 × 12
#>    season season_type season_type_label season_start_date season_end_date  
#>    <chr>  <chr>       <chr>             <chr>             <chr>            
#>  1 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  2 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  3 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  4 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  5 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  6 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  7 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  8 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  9 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#> 10 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#> # ℹ 106 more rows
#> # ℹ 7 more variables: calendar_type <chr>, label <chr>, alternate_label <chr>,
#> #   detail <chr>, value <chr>, start_date <chr>, end_date <chr>
# }
```

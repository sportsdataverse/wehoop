# **Get ESPN WBB Season Leaders (Long Format)**

Returns the per-category leaderboard for one (WBB season x season-type),
in long format. Each row is one (category x rank) entry, e.g. "Points
Per Game x rank 1 x LeBron James".

## Usage

``` r
espn_wbb_season_leaders(
  season = most_recent_wbb_season(),
  season_type = c(2L, 3L),
  ...
)
```

## Arguments

- season:

  Season year. Defaults to most recent WBB season.

- season_type:

  Season-type id (2 = regular (default), 3 = postseason).

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per (category x leader).

Columns as documented in the shared
[espn_basketball_season_leaders_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_season_leaders_schema.md)
table.

## Details

**Get ESPN WBB Season Leaders (Long Format)**

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
  espn_wbb_season_leaders(season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season-Type Leaders ────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 19:55:18 UTC
#> # A tibble: 350 × 15
#>    league       season season_type category_name category_display category_short
#>    <chr>         <int>       <int> <chr>         <chr>            <chr>         
#>  1 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  2 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  3 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  4 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  5 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  6 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  7 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  8 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#>  9 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#> 10 womens-coll…   2025           2 pointsPerGame Points Per Game  PPG           
#> # ℹ 340 more rows
#> # ℹ 9 more variables: category_abbrev <chr>, rank <int>, athlete_id <chr>,
#> #   team_id <chr>, display_value <chr>, value <dbl>, rel <chr>,
#> #   athlete_ref <chr>, team_ref <chr>
# }
```

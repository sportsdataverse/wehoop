# **Get ESPN WNBA Season Leaders (Long Format)**

Returns the per-category leaderboard for one (WNBA season x
season-type), in long format. Each row is one (category x rank) entry,
e.g. "Points Per Game x rank 1 x LeBron James".

## Usage

``` r
espn_wnba_season_leaders(
  season = most_recent_wnba_season(),
  season_type = c(2L, 3L),
  ...
)
```

## Arguments

- season:

  Season year. Defaults to most recent WNBA season.

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

**Get ESPN WNBA Season Leaders (Long Format)**

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
[`espn_wnba_draft_pick()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_pick.md),
[`espn_wnba_draft_rounds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md),
[`espn_wnba_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchise.md),
[`espn_wnba_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchises.md),
[`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md),
[`espn_wnba_futures()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_futures.md),
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md),
[`espn_wnba_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_official_detail.md),
[`espn_wnba_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play.md),
[`espn_wnba_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play_personnel.md),
[`espn_wnba_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_player_box.md),
[`espn_wnba_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_probabilities.md),
[`espn_wnba_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_propbets.md),
[`espn_wnba_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md),
[`espn_wnba_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_roster_entry.md),
[`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md),
[`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md),
[`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md),
[`espn_wnba_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_awards.md),
[`espn_wnba_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_career_stats.md),
[`espn_wnba_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog_v2.md),
[`espn_wnba_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_info.md),
[`espn_wnba_player_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md),
[`espn_wnba_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_seasons.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_position()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_position.md),
[`espn_wnba_positions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_positions.md),
[`espn_wnba_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_powerindex.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_season_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_awards.md),
[`espn_wnba_season_group()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_group.md),
[`espn_wnba_season_groups()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_groups.md),
[`espn_wnba_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_info.md),
[`espn_wnba_season_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_ranking.md),
[`espn_wnba_season_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_rankings.md),
[`espn_wnba_season_type()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_type.md),
[`espn_wnba_season_types()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_types.md),
[`espn_wnba_season_week()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_week.md),
[`espn_wnba_season_weeks()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_weeks.md),
[`espn_wnba_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_seasons.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md),
[`espn_wnba_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_injuries.md),
[`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md),
[`espn_wnba_team_record()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record.md),
[`espn_wnba_team_record_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_record_detail.md),
[`espn_wnba_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_schedule.md),
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
  espn_wnba_season_leaders(season = 2025)
#> ── ESPN WNBA Season-Type Leaders ─────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:42:32 UTC
#> # A tibble: 750 × 15
#>    league season season_type category_name category_display category_short
#>    <chr>   <int>       <int> <chr>         <chr>            <chr>         
#>  1 wnba     2025           2 pointsPerGame Points Per Game  PPG           
#>  2 wnba     2025           2 pointsPerGame Points Per Game  PPG           
#>  3 wnba     2025           2 pointsPerGame Points Per Game  PPG           
#>  4 wnba     2025           2 pointsPerGame Points Per Game  PPG           
#>  5 wnba     2025           2 pointsPerGame Points Per Game  PPG           
#>  6 wnba     2025           2 pointsPerGame Points Per Game  PPG           
#>  7 wnba     2025           2 pointsPerGame Points Per Game  PPG           
#>  8 wnba     2025           2 pointsPerGame Points Per Game  PPG           
#>  9 wnba     2025           2 pointsPerGame Points Per Game  PPG           
#> 10 wnba     2025           2 pointsPerGame Points Per Game  PPG           
#> # ℹ 740 more rows
#> # ℹ 9 more variables: category_abbrev <chr>, rank <int>, athlete_id <chr>,
#> #   team_id <chr>, display_value <chr>, value <dbl>, rel <chr>,
#> #   athlete_ref <chr>, team_ref <chr>
# }
```

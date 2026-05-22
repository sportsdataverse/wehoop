# **Get ESPN Women's College Basketball Season Info**

**Get ESPN Women's College Basketball Season Info**

**Get ESPN Women's College Basketball Season Info**

## Usage

``` r
espn_wbb_season_info(season = most_recent_wbb_season(), ...)
```

## Arguments

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WBB
  season.

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)` – see `?wehoop` for details.

## Value

A named list of `wehoop_data` tibbles: `Info`, `Types`, `Athletes`,
`Coaches`, `Teams`, `Awards`. `$ref` URL components are returned as
character columns and are NOT auto-resolved – use targeted endpoint
functions for details.

**Info**

|              |           |                            |
|--------------|-----------|----------------------------|
| col_name     | types     | description                |
| year         | integer   | 4-digit year.              |
| start_date   | character | Start date (YYYY-MM-DD).   |
| end_date     | character | End date (YYYY-MM-DD).     |
| display_name | character | Display name.              |
| type_id      | character | Type identifier (numeric). |
| type_name    | character | Type name.                 |

**Types / Athletes / Coaches / Teams / Awards**

|          |           |                 |
|----------|-----------|-----------------|
| col_name | types     | description     |
| count    | integer   | Count of count. |
| ref      | character | Ref.            |

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
[`espn_wbb_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_ranking.md),
[`espn_wbb_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_rankings.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_season_info(season = 2025)
#> $Info
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Info from ESPN.com ──── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-22 06:24:00 UTC
#> # A tibble: 1 × 6
#>    year start_date        end_date          display_name type_id type_name 
#>   <int> <chr>             <chr>             <chr>        <chr>   <chr>     
#> 1  2025 2024-07-13T07:00Z 2025-04-09T06:59Z 2024-25      3       Postseason
#> 
#> $Types
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Types from ESPN.com ─── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-22 06:24:00 UTC
#> # A tibble: 1 × 2
#>   count ref                                                                     
#>   <int> <chr>                                                                   
#> 1     4 http://sports.core.api.espn.com/v2/sports/basketball/leagues/womens-col…
#> 
#> $Athletes
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Athletes from ESPN.com ────────────────
#> ℹ Data updated: 2026-05-22 06:24:00 UTC
#> # A tibble: 1 × 2
#>   count ref                                                                     
#>   <int> <chr>                                                                   
#> 1    NA http://sports.core.api.espn.com/v2/sports/basketball/leagues/womens-col…
#> 
#> $Coaches
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Coaches from ESPN.com ─────────────────
#> ℹ Data updated: 2026-05-22 06:24:00 UTC
#> # A tibble: 0 × 0
#> 
#> $Teams
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Teams from ESPN.com ─── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-22 06:24:00 UTC
#> # A tibble: 0 × 0
#> 
#> $Awards
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Season Awards from ESPN.com ── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-22 06:24:00 UTC
#> # A tibble: 1 × 2
#>   count ref                                                                     
#>   <int> <chr>                                                                   
#> 1    NA http://sports.core.api.espn.com/v2/sports/basketball/leagues/womens-col…
#> 
# }
```

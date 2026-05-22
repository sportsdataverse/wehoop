# **Get ESPN women's college basketball schedule for a specific year**

**Get ESPN women's college basketball schedule for a specific year**

## Usage

``` r
espn_wbb_scoreboard(season)
```

## Arguments

- season:

  Either numeric or character

## Value

Returns a tibble

|  |  |  |
|----|----|----|
| col_name | types | description |
| matchup | character | Matchup. |
| matchup_short | character | Matchup short. |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| season_type | integer | Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
| season_slug | character | Season slug. |
| game_id | integer | Unique game identifier. |
| game_uid | character | Game uid. |
| game_date | Date | Game date (YYYY-MM-DD). |
| attendance | integer | Reported attendance. |
| status_name | character | Status label. |
| broadcast_market | character | Broadcast market label (e.g. 'national', 'home'). |
| broadcast_name | character | Broadcast name. |
| start_date | character | Start date (YYYY-MM-DD). |
| game_date_time | POSIXct | Game start date/time (ISO 8601). |
| home_team_name | character | Home team name. |
| home_team_logo | character | Home team logo URL. |
| home_team_abb | character | Home team's team abb. |
| home_team_id | integer | Unique identifier for the home team. |
| home_team_location | character | Home team's team location. |
| home_team_full_name | character | Full home team name (e.g. 'Las Vegas Aces'). |
| home_team_color | character | Home team primary color (hex). |
| home_score | integer | Home team score at the time of the play. |
| home_win | integer | Home team's win. |
| home_record | character | Home win-loss record. |
| away_team_name | character | Away team name. |
| away_team_logo | character | Away team logo URL. |
| away_team_abb | character | Away team's team abb. |
| away_team_id | integer | Unique identifier for the away team. |
| away_team_location | character | Away team's team location. |
| away_team_full_name | character | Full away team name (e.g. 'Las Vegas Aces'). |
| away_team_color | character | Away team primary color (hex). |
| away_score | integer | Away team score at the time of the play. |
| away_win | integer | Away team's win. |
| away_record | character | Away win-loss record. |

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
[`espn_wbb_week_ranking()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_ranking.md),
[`espn_wbb_week_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_week_rankings.md)

## Examples

``` r

# Get schedule from date 2022-11-15
# \donttest{
  try(espn_wbb_scoreboard (season = "20230225"))
#> ── ESPN WBB Scoreboard Information from ESPN.com ─────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-22 06:23:57 UTC
#> # A tibble: 532 × 36
#>    matchup         matchup_short season season_type season_slug game_id game_uid
#>    <chr>           <chr>          <int>       <int> <chr>         <int> <chr>   
#>  1 Stanford Cardi… STAN @ UTAH     2023           2 regular-se…  4.01e8 s:40~l:…
#>  2 UConn Huskies … CONN @ DEP      2023           2 regular-se…  4.01e8 s:40~l:…
#>  3 Texas Longhorn… TEX @ OU        2023           2 regular-se…  4.01e8 s:40~l:…
#>  4 Arizona Wildca… ARIZ @ ORST     2023           2 regular-se…  4.01e8 s:40~l:…
#>  5 Washington Hus… WASH @ UCLA     2023           2 regular-se…  4.01e8 s:40~l:…
#>  6 Gonzaga Bulldo… GONZ @ BYU      2023           2 regular-se…  4.01e8 s:40~l:…
#>  7 TCU Horned Fro… TCU @ ISU       2023           2 regular-se…  4.01e8 s:40~l:…
#>  8 California Gol… CAL @ COLO      2023           2 regular-se…  4.01e8 s:40~l:…
#>  9 San Diego Stat… SDSU @ UNLV     2023           2 regular-se…  4.01e8 s:40~l:…
#> 10 Middle Tenness… MTSU @ LT       2023           2 regular-se…  4.01e8 s:40~l:…
#> # ℹ 522 more rows
#> # ℹ 29 more variables: game_date <date>, attendance <int>,
#> #   play_by_play_available <lgl>, status_name <chr>, broadcast_market <chr>,
#> #   broadcast_name <chr>, start_date <chr>, broadcast <chr>,
#> #   game_date_time <dttm>, home_team_name <chr>, home_team_logo <chr>,
#> #   home_team_abb <chr>, home_team_id <int>, home_team_location <chr>,
#> #   home_team_full_name <chr>, home_team_color <chr>, home_score <int>, …
# }
```

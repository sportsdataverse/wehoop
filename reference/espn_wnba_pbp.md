# Get ESPN's WNBA play by play data

Get ESPN's WNBA play by play data

## Usage

``` r
espn_wnba_pbp(game_id)
```

## Arguments

- game_id:

  Game ID

## Value

Returns a play-by-play data frame

**Plays**

|  |  |  |
|----|----|----|
| col_name | types | description |
| id | character | Unique play identifcation number |
| sequence_number | character | Sequence number representing a shot-possession (V3 PBP). |
| text | character | Text description of the play / record. |
| away_score | integer | Away team score at the time of the play. |
| home_score | integer | Home team score at the time of the play. |
| scoring_play | logical | TRUE if the play resulted in points scored. |
| score_value | integer | Point value of the play (2 / 3 / 1). |
| wallclock | character | Wallclock. |
| shooting_play | logical | TRUE if the play was a shooting attempt. |
| type_id | integer | Type identifier (numeric). |
| type_text | character | Display text for the type field. |
| period_number | integer | Numeric period (1-4 for quarters; 5+ for OT). |
| period_display_value | character | Period display label (e.g. '1st Quarter', 'OT'). |
| clock_display_value | character | Game clock display string (e.g. '8:32'). |
| team_id | integer | Unique team identifier. |
| coordinate_x_raw | numeric | X coordinate as returned by the API before any adjustment. |
| coordinate_y_raw | numeric | Y coordinate as returned by the API before any adjustment. |
| coordinate_x | numeric | X coordinate on the court (half-court layout). |
| coordinate_y | numeric | Y coordinate on the court (half-court layout). |
| play_id | character | Unique play identifier within a game. |
| athlete_id_1 | integer | Primary athlete identifier (e.g. shooter). |
| athlete_id_2 | integer | Secondary athlete identifier (e.g. assister / fouler). |
| athlete_id_3 | integer | Athlete id 3. |
| home_team_id | integer | Unique identifier for the home team. |
| home_team_mascot | character | Home team mascot. |
| home_team_name | character | Home team name. |
| home_team_abbrev | character | Home team three-letter abbreviation. |
| home_team_logo | character | Home team logo URL. |
| home_team_logo_dark | character | Home team logo URL for dark backgrounds. |
| home_team_full_name | character | Full home team name (e.g. 'Las Vegas Aces'). |
| home_team_color | character | Home team primary color (hex). |
| home_team_alternate_color | character | Home team alternate color (hex). |
| home_team_score | integer | Home team's score. |
| home_team_winner | logical | TRUE if the home team won this game. |
| home_team_record | character | Home team's win-loss record. |
| away_team_id | integer | Unique identifier for the away team. |
| away_team_mascot | character | Away team mascot. |
| away_team_name | character | Away team name. |
| away_team_abbrev | character | Away team three-letter abbreviation. |
| away_team_logo | character | Away team logo URL. |
| away_team_logo_dark | character | Away team logo URL for dark backgrounds. |
| away_team_full_name | character | Full away team name (e.g. 'Las Vegas Aces'). |
| away_team_color | character | Away team primary color (hex). |
| away_team_alternate_color | character | Away team alternate color (hex). |
| away_team_score | integer | Away team's score. |
| away_team_winner | logical | TRUE if the away team won this game. |
| away_team_record | character | Away team's win-loss record. |
| game_id | integer | Unique game identifier. |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| season_type | integer | Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
| game_date | Date | Game date (YYYY-MM-DD). |
| game_date_time | POSIXct | Game start date/time (ISO 8601). |

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
[`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
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
   try(espn_wnba_pbp(game_id = 401455681))
#> ── ESPN WNBA Play-by-Play Information from ESPN.com ──────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-22 06:24:31 UTC
#> # A tibble: 343 × 54
#>    id       sequence_number text  away_score home_score scoring_play score_value
#>    <chr>    <chr>           <chr>      <int>      <int> <lgl>              <int>
#>  1 4014556… 4               Jonq…          0          0 FALSE                  0
#>  2 4014556… 7               A'ja…          0          2 TRUE                   2
#>  3 4014556… 9               Nati…          0          2 FALSE                  0
#>  4 4014556… 10              Kiah…          0          2 FALSE                  0
#>  5 4014556… 11              Jack…          0          5 TRUE                   3
#>  6 4014556… 13              Nati…          3          5 TRUE                   3
#>  7 4014556… 15              A'ja…          3          7 TRUE                   2
#>  8 4014556… 17              Cour…          3          7 FALSE                  0
#>  9 4014556… 18              Kels…          3          7 FALSE                  0
#> 10 4014556… 19              A'ja…          3          9 TRUE                   2
#> # ℹ 333 more rows
#> # ℹ 47 more variables: wallclock <chr>, shooting_play <lgl>,
#> #   points_attempted <int>, short_description <chr>, type_id <int>,
#> #   type_text <chr>, period_number <int>, period_display_value <chr>,
#> #   clock_display_value <chr>, team_id <int>, coordinate_x_raw <dbl>,
#> #   coordinate_y_raw <dbl>, coordinate_x <dbl>, coordinate_y <dbl>,
#> #   play_id <chr>, athlete_id_1 <int>, athlete_id_2 <int>, …
# }
```

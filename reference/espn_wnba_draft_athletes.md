# **Get ESPN WNBA Draft Rounds Summary**

Returns one row per round of the WNBA draft (typically 2 rounds: 1st
with 30 picks, 2nd with ~28 picks).

Returns one row per drafted athlete in a given WNBA draft year.

Returns the current status of one WNBA draft year (round, state,
description). Live during the draft; static afterward.

Returns a single-row tibble with top-level draft-year metadata: year,
number of rounds, display name, plus `$ref`s for the deeper
sub-resources (status, athletes, rounds) already wrapped by
`espn_wnba_draft_status()`, `espn_wnba_draft_athletes()`, and
`espn_wnba_draft_rounds()`.

## Usage

``` r
espn_wnba_draft_rounds(season = most_recent_wnba_season(), ...)

espn_wnba_draft_athletes(season = most_recent_wnba_season(), ...)

espn_wnba_draft_status(season = most_recent_wnba_season(), ...)

espn_wnba_season_draft(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Season year (numeric). Defaults to the most recent WNBA season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per round.

A tibble of athlete IDs + `$ref` URLs.

A single-row tibble.

A single-row tibble.

## Details

**Get ESPN WNBA Draft Rounds Summary**

**Get ESPN WNBA Draft Athletes Index**

**Get ESPN WNBA Draft Status**

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
  espn_wnba_draft_rounds(season = 2024)
#> ── ESPN WNBA Draft Rounds ────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:11:51 UTC
#> # A tibble: 3 × 7
#>   league season round display_name short_display_name n_picks status   
#>   <chr>   <int> <int> <chr>        <chr>                <int> <chr>    
#> 1 wnba     2024     1 1st Round    1st                     12 COMPLETED
#> 2 wnba     2024     2 2nd Round    2nd                     12 COMPLETED
#> 3 wnba     2024     3 3rd Round    3rd                     12 COMPLETED
# }
# \donttest{
  espn_wnba_draft_athletes(season = 2024)
#> ── ESPN WNBA Draft Athletes ──────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:11:51 UTC
#> # A tibble: 112 × 4
#>    league season athlete_id ref                                                 
#>    <chr>   <int> <chr>      <chr>                                               
#>  1 wnba     2024 108565     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  2 wnba     2024 108566     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  3 wnba     2024 108567     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  4 wnba     2024 108569     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  5 wnba     2024 108568     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  6 wnba     2024 108570     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  7 wnba     2024 108572     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  8 wnba     2024 108582     http://sports.core.api.espn.com/v2/sports/basketbal…
#>  9 wnba     2024 108577     http://sports.core.api.espn.com/v2/sports/basketbal…
#> 10 wnba     2024 108612     http://sports.core.api.espn.com/v2/sports/basketbal…
#> # ℹ 102 more rows
# }
# \donttest{
  espn_wnba_draft_status(season = 2024)
#> ── ESPN WNBA Draft Status ────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:11:51 UTC
#> # A tibble: 1 × 7
#>   league season round type_id type_name type_state description
#>   <chr>   <int> <int> <chr>   <chr>     <chr>      <chr>      
#> 1 wnba     2024     3 3       COMPLETED post       Completed  
# }
# \donttest{
  espn_wnba_season_draft(season = 2024)
#> ── ESPN WNBA Season Draft (top-level) ────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:11:51 UTC
#> # A tibble: 1 × 10
#>   league season  year uid       number_of_rounds display_name short_display_name
#>   <chr>   <int> <int> <chr>                <int> <chr>        <chr>             
#> 1 wnba     2024  2024 s:40~l:5…                3 2024 Women'… 2024 WNBA Draft   
#> # ℹ 3 more variables: status_ref <chr>, athletes_ref <chr>, rounds_ref <chr>
# }
```

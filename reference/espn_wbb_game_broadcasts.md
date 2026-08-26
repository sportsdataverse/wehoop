# **Get ESPN Women's College Basketball Event Odds**

Returns the live game situation for one WBB event: timeouts remaining,
team fouls, fouls to give, bonus state, and a `$ref` to the last play.
During a live game this reflects current state; after the game ends the
values are frozen.

Returns pre-game predictor statistics for one WBB event in long format:
one row per (team × statistic). Typical stats include matchup quality,
predicted score, win probability, and team strength metrics. Returns
empty for events without predictor data (often the case for
already-played games).

Returns the per-team power-index `$ref` URLs for one WBB event. Coverage
is sparse — many events return zero items.

## Usage

``` r
espn_wbb_game_odds(event_id, ...)

espn_wbb_game_officials(event_id, ...)

espn_wbb_game_broadcasts(event_id, ...)

espn_wbb_game_situation(event_id, ...)

espn_wbb_game_predictor(event_id, ...)

espn_wbb_game_powerindex(event_id, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per odds provider (typically empty for WBB because
ESPN does not carry NCAA basketball betting lines).

Columns as documented in the shared
[espn_basketball_game_odds_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_odds_schema.md)
table.

A tibble with one row per official assigned to the game.

Columns as documented in the shared
[espn_basketball_game_officials_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_officials_schema.md)
table.

A tibble with one row per broadcast outlet for the game.

Columns as documented in the shared
[espn_basketball_game_broadcasts_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_broadcasts_schema.md)
table.

A single-row tibble with timeouts + fouls for both teams.

A long tibble with rows for both home and away teams.

A tibble with one row per team-game power-index entry.

## Details

**Get ESPN WBB Event Predictor (Pre-game)**

**Get ESPN WBB Event Power Index Index**

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
  espn_wbb_game_odds(event_id = "401276115")
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Odds (event_id=401276115) from ESPN.com 
#> ℹ Data updated: 2026-08-26 20:41:46 UTC
#> # A tibble: 0 × 12
#> # ℹ 12 variables: event_id <chr>, provider_id <chr>, provider_name <chr>,
#> #   details <chr>, over_under <dbl>, spread <dbl>, home_money_line <int>,
#> #   away_money_line <int>, home_team_odds_open <dbl>,
#> #   home_team_odds_close <dbl>, away_team_odds_open <dbl>,
#> #   away_team_odds_close <dbl>
# }
# \donttest{
  espn_wbb_game_officials(event_id = "401276115")
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Officials (event_id=401276115) from ESPN
#> ℹ Data updated: 2026-08-26 20:41:46 UTC
#> # A tibble: 3 × 8
#>   event_id  official_id full_name     display_name  position_id position_name
#>   <chr>     <chr>       <chr>         <chr>         <chr>       <chr>        
#> 1 401276115 18864       Denise Brooks Denise Brooks 40          Referee      
#> 2 401276115 2609971     Tiara Cruse   Tiara Cruse   40          Referee      
#> 3 401276115 3007837     Jeffrey Smith Jeffrey Smith 40          Referee      
#> # ℹ 2 more variables: position_type <chr>, order <int>
# }
# \donttest{
  espn_wbb_game_broadcasts(event_id = "401276115")
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Broadcasts (event_id=401276115) from ESP
#> ℹ Data updated: 2026-08-26 20:41:46 UTC
#> # A tibble: 1 × 10
#>   event_id  broadcast_id type_id type_short_name type_long_name market_id
#>   <chr>     <chr>        <chr>   <chr>           <chr>          <chr>    
#> 1 401276115 NA           4       Streaming       Streaming      0        
#> # ℹ 4 more variables: market_type <chr>, names <chr>, lang <chr>, region <chr>
# }
# \donttest{
  espn_wbb_game_situation(event_id = 401276115)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Situation ────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:41:46 UTC
#> # A tibble: 1 × 15
#>   league                   event_id home_timeouts_current home_timeouts_remain…¹
#>   <chr>                    <chr>                    <int>                  <int>
#> 1 womens-college-basketba… 4012761…                     0                      0
#> # ℹ abbreviated name: ¹​home_timeouts_remaining
#> # ℹ 11 more variables: away_timeouts_current <int>,
#> #   away_timeouts_remaining <int>, home_team_fouls <int>,
#> #   home_team_fouls_current <int>, home_fouls_to_give <int>,
#> #   home_bonus_state <chr>, away_team_fouls <int>,
#> #   away_team_fouls_current <int>, away_fouls_to_give <int>,
#> #   away_bonus_state <chr>, last_play_ref <chr>
# }
# \donttest{
  espn_wbb_game_predictor(event_id = 401276115)
#> ✖ 2026-08-26 20:41:46.362567: Failed to retrieve ESPN womens-college-basketball event predictor for event_id=401276115
#> ✖ Args: league = "womens-college-basketball", event_id = 401276115
#> ✖ Error: The API returned an error
#> NULL
# }
# \donttest{
  espn_wbb_game_powerindex(event_id = 401276115)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Power Index ──────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:41:46 UTC
#> # A tibble: 0 × 4
#> # ℹ 4 variables: league <chr>, event_id <chr>, team_id <chr>, ref <chr>
# }
```

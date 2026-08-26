# **Get ESPN WNBA Event Odds**

Returns the live game situation for one WNBA event: timeouts remaining,
team fouls, fouls to give, bonus state, and a `$ref` to the last play.
During a live game this reflects current state; after the game ends the
values are frozen.

Returns pre-game predictor statistics for one WNBA event in long format:
one row per (team × statistic). Typical stats include matchup quality,
predicted score, win probability, and team strength metrics. Returns
empty for events without predictor data (often the case for
already-played games).

Returns the per-team power-index `$ref` URLs for one WNBA event.
Coverage is sparse — many events return zero items.

## Usage

``` r
espn_wnba_game_odds(event_id, ...)

espn_wnba_game_officials(event_id, ...)

espn_wnba_game_broadcasts(event_id, ...)

espn_wnba_game_situation(event_id, ...)

espn_wnba_game_predictor(event_id, ...)

espn_wnba_game_powerindex(event_id, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per odds provider.

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

**Get ESPN WNBA Event Predictor (Pre-game)**

**Get ESPN WNBA Event Power Index Index**

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
  espn_wnba_game_odds(event_id = "401736171")
#> ── ESPN WNBA Event Odds (event_id=401736171) from ESPN.com ───── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:42:19 UTC
#> # A tibble: 2 × 12
#>   event_id  provider_id provider_name  details over_under spread home_money_line
#>   <chr>     <chr>       <chr>          <chr>        <dbl>  <dbl>           <int>
#> 1 401736171 58          ESPN BET       LV -8.5       168.   -8.5              NA
#> 2 401736171 59          ESPN Bet - Li… LA -4.5       192.    4.5              NA
#> # ℹ 5 more variables: away_money_line <int>, home_team_odds_open <dbl>,
#> #   home_team_odds_close <dbl>, away_team_odds_open <dbl>,
#> #   away_team_odds_close <dbl>
# }
# \donttest{
  espn_wnba_game_officials(event_id = "401736171")
#> ── ESPN WNBA Event Officials (event_id=401736171) from ESPN.com ────────────────
#> ℹ Data updated: 2026-08-26 20:42:19 UTC
#> # A tibble: 3 × 8
#>   event_id  official_id full_name         display_name position_id position_name
#>   <chr>     <chr>       <chr>             <chr>        <chr>       <chr>        
#> 1 401736171 7671        Michael Price     Michael Pri… 40          Referee      
#> 2 401736171 52044       Fatou Cissoko-St… Fatou Cisso… 40          Referee      
#> 3 401736171 4879757     Jason Alabanza    Jason Alaba… 40          Referee      
#> # ℹ 2 more variables: position_type <chr>, order <int>
# }
# \donttest{
  espn_wnba_game_broadcasts(event_id = "401736171")
#> ── ESPN WNBA Event Broadcasts (event_id=401736171) from ESPN.com ───────────────
#> ℹ Data updated: 2026-08-26 20:42:19 UTC
#> # A tibble: 3 × 10
#>   event_id  broadcast_id type_id type_short_name      type_long_name   market_id
#>   <chr>     <chr>        <chr>   <chr>                <chr>            <chr>    
#> 1 401736171 NA           1       TV                   Television       1        
#> 2 401736171 NA           6       Subscription Package Subscription Pa… 3        
#> 3 401736171 NA           1       TV                   Television       2        
#> # ℹ 4 more variables: market_type <chr>, names <chr>, lang <chr>, region <chr>
# }
# \donttest{
  espn_wnba_game_situation(event_id = 401736171)
#> ── ESPN WNBA Event Situation ─────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:42:19 UTC
#> # A tibble: 1 × 15
#>   league event_id  home_timeouts_current home_timeouts_remaining
#>   <chr>  <chr>                     <int>                   <int>
#> 1 wnba   401736171                     2                       0
#> # ℹ 11 more variables: away_timeouts_current <int>,
#> #   away_timeouts_remaining <int>, home_team_fouls <int>,
#> #   home_team_fouls_current <int>, home_fouls_to_give <int>,
#> #   home_bonus_state <chr>, away_team_fouls <int>,
#> #   away_team_fouls_current <int>, away_fouls_to_give <int>,
#> #   away_bonus_state <chr>, last_play_ref <chr>
# }
# \donttest{
  espn_wnba_game_predictor(event_id = 401736171)
#> ── ESPN WNBA Event Predictor ─────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:42:19 UTC
#> # A tibble: 6 × 13
#>   league event_id  name         short_name last_modified side  team_id stat_name
#>   <chr>  <chr>     <chr>        <chr>      <chr>         <chr> <chr>   <chr>    
#> 1 wnba   401736171 Los Angeles… LA @ LV    2025-06-15T1… home  17      matchupQ…
#> 2 wnba   401736171 Los Angeles… LA @ LV    2025-06-15T1… home  17      teamPred…
#> 3 wnba   401736171 Los Angeles… LA @ LV    2025-06-15T1… home  17      teamPred…
#> 4 wnba   401736171 Los Angeles… LA @ LV    2025-06-15T1… away  6       matchupQ…
#> 5 wnba   401736171 Los Angeles… LA @ LV    2025-06-15T1… away  6       teamPred…
#> 6 wnba   401736171 Los Angeles… LA @ LV    2025-06-15T1… away  6       teamPred…
#> # ℹ 5 more variables: stat_display <chr>, description <chr>, value <dbl>,
#> #   display_value <chr>, team_ref <chr>
# }
# \donttest{
  espn_wnba_game_powerindex(event_id = 401736171)
#> ── ESPN WNBA Event Power Index ───────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:42:19 UTC
#> # A tibble: 2 × 4
#>   league event_id  team_id ref                                                  
#>   <chr>  <chr>     <chr>   <chr>                                                
#> 1 wnba   401736171 6       http://sports.core.api.espn.com/v2/sports/basketball…
#> 2 wnba   401736171 17      http://sports.core.api.espn.com/v2/sports/basketball…
# }
```

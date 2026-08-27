# **Get ESPN WNBA Event Competitor Linescores (Per-Quarter)**

Returns the per-quarter scoring breakdown for one team in one NBA event.
One row per period (regulation quarters + any overtime periods).

Returns the per-team statistical leaders for one WNBA event in long
format: one row per (category x athlete rank). Categories typically
include points, rebounds, assists, and rating.

Returns the game-day roster index for one team in one WNBA event. Each
row carries the athlete id and the core-v2 `$ref` URL — use the ref to
dereference athlete-game splits or biographical data.

Returns full team-game statistics for one team in one WNBA event in long
format: one row per (category x stat). Covers offensive, defensive, and
general categories with both raw values and display strings.

Returns team records as of the given WNBA event: overall, home, away,
conference, and division breakdowns where available. One row per record
type.

Returns a one-row tibble with one team's final score for one WNBA event:
numeric `value`, display string, `winner` flag, and source metadata.
Quick-lookup wrapper — use `espn_wnba_game_team_linescores()` for
per-period detail.

## Usage

``` r
espn_wnba_game_team_linescores(event_id, team_id, ...)

espn_wnba_game_team_leaders(event_id, team_id, ...)

espn_wnba_game_team_roster(event_id, team_id, ...)

espn_wnba_game_team_statistics(event_id, team_id, ...)

espn_wnba_game_team_records(event_id, team_id, ...)

espn_wnba_game_team_score(event_id, team_id, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- team_id:

  ESPN team identifier.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per period.

A long tibble with one row per (category x rank).

A tibble with one row per active athlete.

A long tibble with one row per (category x stat).

A tibble with one row per record type.

A single-row tibble.

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
  espn_wnba_game_team_linescores(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Competitor Linescores ───────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:22 UTC
#> # A tibble: 8 × 7
#>   league event_id  team_id period value display_value source      
#>   <chr>  <chr>     <chr>    <int> <dbl> <chr>         <chr>       
#> 1 wnba   401736171 17           1    17 17            1           
#> 2 wnba   401736171 17           1    17 17            Basic/Manual
#> 3 wnba   401736171 17           2    24 24            1           
#> 4 wnba   401736171 17           2    24 24            Basic/Manual
#> 5 wnba   401736171 17           3    24 24            1           
#> 6 wnba   401736171 17           3    24 24            Basic/Manual
#> 7 wnba   401736171 17           4    24 24            1           
#> 8 wnba   401736171 17           4    24 24            Basic/Manual
# }
# \donttest{
  espn_wnba_game_team_leaders(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Competitor Leaders ──────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:22 UTC
#> # A tibble: 28 × 11
#>    league event_id  team_id category_name category_display category_abbrev  rank
#>    <chr>  <chr>     <chr>   <chr>         <chr>            <chr>           <int>
#>  1 wnba   401736171 17      points        Points           Pts                 1
#>  2 wnba   401736171 17      points        Points           Pts                 2
#>  3 wnba   401736171 17      points        Points           Pts                 3
#>  4 wnba   401736171 17      points        Points           Pts                 4
#>  5 wnba   401736171 17      points        Points           Pts                 5
#>  6 wnba   401736171 17      points        Points           Pts                 6
#>  7 wnba   401736171 17      assists       Assists          Ast                 1
#>  8 wnba   401736171 17      assists       Assists          Ast                 2
#>  9 wnba   401736171 17      assists       Assists          Ast                 3
#> 10 wnba   401736171 17      assists       Assists          Ast                 4
#> # ℹ 18 more rows
#> # ℹ 4 more variables: athlete_id <chr>, display_value <chr>, value <dbl>,
#> #   athlete_ref <chr>
# }
# \donttest{
  espn_wnba_game_team_roster(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Competitor Roster ───────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:22 UTC
#> # A tibble: 0 × 5
#> # ℹ 5 variables: league <chr>, event_id <chr>, team_id <chr>, athlete_id <chr>,
#> #   ref <chr>
# }
# \donttest{
  espn_wnba_game_team_statistics(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Competitor Statistics ───────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:22 UTC
#> # A tibble: 99 × 10
#>    league event_id  team_id category_name category_display stat_name stat_abbrev
#>    <chr>  <chr>     <chr>   <chr>         <chr>            <chr>     <chr>      
#>  1 wnba   401736171 17      defensive     Defensive        blocks    BLK        
#>  2 wnba   401736171 17      defensive     Defensive        defensiv… DR         
#>  3 wnba   401736171 17      defensive     Defensive        steals    STL        
#>  4 wnba   401736171 17      defensive     Defensive        turnover… Points Con…
#>  5 wnba   401736171 17      defensive     Defensive        avgDefen… DR         
#>  6 wnba   401736171 17      defensive     Defensive        avgBlocks BLK        
#>  7 wnba   401736171 17      defensive     Defensive        avgSteals STL        
#>  8 wnba   401736171 17      defensive     Defensive        avg48Def… DR         
#>  9 wnba   401736171 17      defensive     Defensive        avg48Blo… BLK        
#> 10 wnba   401736171 17      defensive     Defensive        avg48Ste… STL        
#> # ℹ 89 more rows
#> # ℹ 3 more variables: stat_display <chr>, value <dbl>, display_value <chr>
# }
# \donttest{
  espn_wnba_game_team_records(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Competitor Records ──────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:23 UTC
#> # A tibble: 3 × 11
#>   league event_id  team_id record_id name    abbreviation display_name       
#>   <chr>  <chr>     <chr>   <chr>     <chr>   <chr>        <chr>              
#> 1 wnba   401736171 17      900       overall Game         Record Year To Date
#> 2 wnba   401736171 17      33        Home    NA           Home               
#> 3 wnba   401736171 17      34        Road    NA           Road               
#> # ℹ 4 more variables: short_display_name <chr>, type <chr>, summary <chr>,
#> #   value <dbl>
# }
# \donttest{
  espn_wnba_game_team_score(event_id = 401736171, team_id = 17)
#> ── ESPN WNBA Event Competitor Score ──────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-27 11:02:23 UTC
#> # A tibble: 1 × 8
#>   league event_id  team_id value display_value winner source_id
#>   <chr>  <chr>     <chr>   <dbl> <chr>         <lgl>  <chr>    
#> 1 wnba   401736171 17         89 89            FALSE  1        
#> # ℹ 1 more variable: source_description <chr>
# }
```

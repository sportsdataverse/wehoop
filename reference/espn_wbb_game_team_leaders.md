# **Get ESPN WBB Event Competitor Linescores (Per-Quarter)**

Returns the per-quarter scoring breakdown for one team in one NBA event.
One row per period (regulation quarters + any overtime periods).

Returns the per-team statistical leaders for one WBB event in long
format: one row per (category x athlete rank). Categories typically
include points, rebounds, assists, and rating.

Returns the game-day roster index for one team in one WBB event. Each
row carries the athlete id and the core-v2 `$ref` URL — use the ref to
dereference athlete-game splits or biographical data.

Returns full team-game statistics for one team in one WBB event in long
format: one row per (category x stat). Covers offensive, defensive, and
general categories with both raw values and display strings.

Returns team records as of the given WBB event: overall, home, away,
conference, and division breakdowns where available. One row per record
type.

Returns a one-row tibble with one team's final score for one WBB event:
numeric `value`, display string, `winner` flag, and source metadata.
Quick-lookup wrapper — use `espn_wbb_game_team_linescores()` for
per-period detail.

## Usage

``` r
espn_wbb_game_team_linescores(event_id, team_id, ...)

espn_wbb_game_team_leaders(event_id, team_id, ...)

espn_wbb_game_team_roster(event_id, team_id, ...)

espn_wbb_game_team_statistics(event_id, team_id, ...)

espn_wbb_game_team_records(event_id, team_id, ...)

espn_wbb_game_team_score(event_id, team_id, ...)
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
  espn_wbb_game_team_linescores(event_id = 401276115, team_id = 52)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Competitor Linescores ──────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:11:28 UTC
#> # A tibble: 8 × 7
#>   league                    event_id  team_id period value display_value source 
#>   <chr>                     <chr>     <chr>    <int> <dbl> <chr>         <chr>  
#> 1 womens-college-basketball 401276115 52           1    14 14            1      
#> 2 womens-college-basketball 401276115 52           1    14 14            Basic/…
#> 3 womens-college-basketball 401276115 52           2    14 14            1      
#> 4 womens-college-basketball 401276115 52           2    14 14            Basic/…
#> 5 womens-college-basketball 401276115 52           3    11 11            1      
#> 6 womens-college-basketball 401276115 52           3    11 11            Basic/…
#> 7 womens-college-basketball 401276115 52           4    29 29            1      
#> 8 womens-college-basketball 401276115 52           4    29 29            Basic/…
# }
# \donttest{
  espn_wbb_game_team_leaders(event_id = 401276115, team_id = 52)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Competitor Leaders ─────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:11:28 UTC
#> # A tibble: 41 × 11
#>    league  event_id team_id category_name category_display category_abbrev  rank
#>    <chr>   <chr>    <chr>   <chr>         <chr>            <chr>           <int>
#>  1 womens… 4012761… 52      points        Points           Pts                 1
#>  2 womens… 4012761… 52      points        Points           Pts                 2
#>  3 womens… 4012761… 52      points        Points           Pts                 3
#>  4 womens… 4012761… 52      points        Points           Pts                 4
#>  5 womens… 4012761… 52      points        Points           Pts                 5
#>  6 womens… 4012761… 52      points        Points           Pts                 6
#>  7 womens… 4012761… 52      points        Points           Pts                 7
#>  8 womens… 4012761… 52      assists       Assists          Ast                 1
#>  9 womens… 4012761… 52      assists       Assists          Ast                 2
#> 10 womens… 4012761… 52      assists       Assists          Ast                 3
#> # ℹ 31 more rows
#> # ℹ 4 more variables: athlete_id <chr>, display_value <chr>, value <dbl>,
#> #   athlete_ref <chr>
# }
# \donttest{
  espn_wbb_game_team_roster(event_id = 401276115, team_id = 52)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Competitor Roster ──────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:11:28 UTC
#> # A tibble: 0 × 5
#> # ℹ 5 variables: league <chr>, event_id <chr>, team_id <chr>, athlete_id <chr>,
#> #   ref <chr>
# }
# \donttest{
  espn_wbb_game_team_statistics(event_id = 401276115, team_id = 52)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Competitor Statistics ──────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:11:28 UTC
#> # A tibble: 71 × 10
#>    league  event_id team_id category_name category_display stat_name stat_abbrev
#>    <chr>   <chr>    <chr>   <chr>         <chr>            <chr>     <chr>      
#>  1 womens… 4012761… 52      defensive     Defensive        blocks    BLK        
#>  2 womens… 4012761… 52      defensive     Defensive        defensiv… DR         
#>  3 womens… 4012761… 52      defensive     Defensive        steals    STL        
#>  4 womens… 4012761… 52      defensive     Defensive        turnover… PTS OFF TO 
#>  5 womens… 4012761… 52      defensive     Defensive        avgDefen… DR         
#>  6 womens… 4012761… 52      defensive     Defensive        avgBlocks BLK        
#>  7 womens… 4012761… 52      defensive     Defensive        avgSteals STL        
#>  8 womens… 4012761… 52      general       General          largestL… LL         
#>  9 womens… 4012761… 52      general       General          disquali… DQ         
#> 10 womens… 4012761… 52      general       General          flagrant… FLAG       
#> # ℹ 61 more rows
#> # ℹ 3 more variables: stat_display <chr>, value <dbl>, display_value <chr>
# }
# \donttest{
  espn_wbb_game_team_records(event_id = 401276115, team_id = 52)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Competitor Records ─────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:11:29 UTC
#> # A tibble: 4 × 11
#>   league              event_id team_id record_id name  abbreviation display_name
#>   <chr>               <chr>    <chr>   <chr>     <chr> <chr>        <chr>       
#> 1 womens-college-bas… 4012761… 52      1         over… Game         Record Year…
#> 2 womens-college-bas… 4012761… 52      9002      Home  NA           Home        
#> 3 womens-college-bas… 4012761… 52      9003      Road  NA           Road        
#> 4 womens-college-bas… 4012761… 52      9009      vs. … NA           CONF        
#> # ℹ 4 more variables: short_display_name <chr>, type <chr>, summary <chr>,
#> #   value <dbl>
# }
# \donttest{
  espn_wbb_game_team_score(event_id = 401276115, team_id = 52)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Competitor Score ─────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:11:29 UTC
#> # A tibble: 1 × 8
#>   league                   event_id team_id value display_value winner source_id
#>   <chr>                    <chr>    <chr>   <dbl> <chr>         <lgl>  <chr>    
#> 1 womens-college-basketba… 4012761… 52         68 68            TRUE   1        
#> # ℹ 1 more variable: source_description <chr>
# }
```

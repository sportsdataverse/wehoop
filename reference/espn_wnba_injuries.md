# **Get ESPN WNBA Injuries**

**Get ESPN WNBA Injuries**

**Get ESPN WNBA Injuries**

## Usage

``` r
espn_wnba_injuries(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Numeric or character season year (e.g. `2025`). The ESPN injury
  endpoint does not filter by season server-side; the value is attached
  as a constant column on the returned tibble for downstream joins.
  Defaults to
  [`most_recent_wnba_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_season.md).

- ...:

  Currently unused; reserved for future argument threading.

## Value

Returns a tibble of league-wide WNBA injury records. Returns an empty
tibble (zero rows) when no injuries are reported.

**Injuries**

|               |           |
|---------------|-----------|
| col_name      | types     |
| team_id       | character |
| athlete_id    | character |
| athlete_name  | character |
| position      | character |
| status        | character |
| date          | character |
| type          | character |
| side          | character |
| returns_at    | character |
| short_comment | character |
| long_comment  | character |
| season        | integer   |

## See also

Other ESPN WNBA Functions:
[`espn_wnba_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_awards.md),
[`espn_wnba_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_eventlog.md),
[`espn_wnba_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_gamelog.md),
[`espn_wnba_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_info.md),
[`espn_wnba_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_overview.md),
[`espn_wnba_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_splits.md),
[`espn_wnba_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_statisticslog.md),
[`espn_wnba_athlete_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athlete_stats.md),
[`espn_wnba_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athletes_index.md),
[`espn_wnba_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_calendar.md),
[`espn_wnba_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coaches.md),
[`espn_wnba_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_conferences.md),
[`espn_wnba_draft()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft.md),
[`espn_wnba_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_broadcasts.md),
[`espn_wnba_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_odds.md),
[`espn_wnba_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_officials.md),
[`espn_wnba_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_event_probabilities.md),
[`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md),
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md),
[`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md),
[`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
[`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_season_info.md),
[`espn_wnba_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_seasons.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md),
[`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md),
[`espn_wnba_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_injuries.md),
[`espn_wnba_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_leaders.md),
[`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md),
[`espn_wnba_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_roster.md),
[`espn_wnba_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_schedule.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md),
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md),
[`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md),
[`espn_wnba_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_venues.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_injuries()
#> ── ESPN WNBA Injury Information from ESPN.com ────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-06 00:20:12 UTC
#> # A tibble: 14 × 12
#>    team_id athlete_id athlete_name position status date  type  side  returns_at
#>    <chr>   <chr>      <chr>        <chr>    <chr>  <chr> <chr> <chr> <chr>     
#>  1 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  2 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  3 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  4 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  5 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  6 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  7 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  8 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#>  9 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> 10 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> 11 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> 12 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> 13 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> 14 NA      NA         NA           NA       NA     NA    NA    NA    NA        
#> # ℹ 3 more variables: short_comment <chr>, long_comment <chr>, season <int>
# }
```

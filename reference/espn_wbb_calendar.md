# **Get ESPN WBB Calendar**

**Get ESPN WBB Calendar**

**Get ESPN Women's College Basketball Calendar**

## Usage

``` r
espn_wbb_calendar(season = most_recent_wbb_season())
```

## Arguments

- season:

  integer or character. Four-digit season year (e.g. `2025`). Defaults
  to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

## Value

Returns a tibble of calendar entries.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| season_type | character | Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
| season_type_label | character | Season type label. |
| season_start_date | character | Date in YYYY-MM-DD format. |
| season_end_date | character | Date in YYYY-MM-DD format. |
| label | character | Label. |
| alternate_label | character | Alternate label. |
| detail | character | Detail. |
| value | character | Numeric or string value field. |
| start_date | character | Start date (YYYY-MM-DD). |
| end_date | character | End date (YYYY-MM-DD). |

## Details

Retrieve the ESPN women's college basketball schedule calendar for a
given season. The underlying scoreboard response contains a
`leagues[[1]]$calendar` block with season-type entries (pre-season,
regular, post). Uses `getOption("wehoop.proxy")` or
`http_proxy`/`https_proxy` environment variables for proxy configuration
(per-call proxy override is not supported for ESPN wrappers).

## See also

Other ESPN WBB Functions:
[`espn_wbb_athlete_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_awards.md),
[`espn_wbb_athlete_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_eventlog.md),
[`espn_wbb_athlete_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_gamelog.md),
[`espn_wbb_athlete_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_info.md),
[`espn_wbb_athlete_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_overview.md),
[`espn_wbb_athlete_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_splits.md),
[`espn_wbb_athlete_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_statisticslog.md),
[`espn_wbb_athlete_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athlete_stats.md),
[`espn_wbb_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_athletes_index.md),
[`espn_wbb_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_coaches.md),
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_event_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_broadcasts.md),
[`espn_wbb_event_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_odds.md),
[`espn_wbb_event_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_officials.md),
[`espn_wbb_event_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_event_probabilities.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
[`espn_wbb_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_injuries.md),
[`espn_wbb_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_leaders.md),
[`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_season_info()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_season_info.md),
[`espn_wbb_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_seasons.md),
[`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md),
[`espn_wbb_team()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team.md),
[`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
[`espn_wbb_team_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_injuries.md),
[`espn_wbb_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_leaders.md),
[`espn_wbb_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_news.md),
[`espn_wbb_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_roster.md),
[`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md),
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md),
[`espn_wbb_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_venues.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_calendar(season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Calendar from ESPN.com ─────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 16:09:07 UTC
#> # A tibble: 116 × 12
#>    season season_type season_type_label season_start_date season_end_date  
#>    <chr>  <chr>       <chr>             <chr>             <chr>            
#>  1 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  2 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  3 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  4 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  5 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  6 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  7 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  8 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#>  9 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#> 10 2025   NA          NA                2024-07-13T07:00Z 2025-04-09T06:59Z
#> # ℹ 106 more rows
#> # ℹ 7 more variables: calendar_type <chr>, label <chr>, alternate_label <chr>,
#> #   detail <chr>, value <chr>, start_date <chr>, end_date <chr>
# }
```

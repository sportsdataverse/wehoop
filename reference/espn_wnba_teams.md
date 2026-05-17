# Get ESPN's WNBA team names and ids

Get ESPN's WNBA team names and ids

## Usage

``` r
espn_wnba_teams()
```

## Value

Returns a tibble

|                 |           |                                            |
|-----------------|-----------|--------------------------------------------|
| col_name        | types     | description                                |
| team_id         | integer   | Unique team identifier.                    |
| team            | character | Team-side label or team identifier.        |
| mascot          | character | Team mascot.                               |
| display_name    | character | Display name.                              |
| short_name      | character | Short display name.                        |
| abbreviation    | character | Short abbreviation.                        |
| color           | character | Primary color (hex without leading '#').   |
| alternate_color | character | Alternate color (hex without leading '#'). |
| logo            | character | Team or league logo URL.                   |
| logo_dark       | character | Logo dark.                                 |

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
[`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md),
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
[`espn_wnba_transactions()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_transactions.md),
[`espn_wnba_venues()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_venues.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wnba_teams())
#> ── ESPN WNBA Teams Information from ESPN.com ─────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-05-17 14:18:26 UTC
#> # A tibble: 15 × 10
#>    team_id team         mascot    display_name     short_name abbreviation color
#>      <int> <chr>        <chr>     <chr>            <chr>      <chr>        <chr>
#>  1      20 Atlanta      Dream     Atlanta Dream    Dream      ATL          e318…
#>  2      19 Chicago      Sky       Chicago Sky      Sky        CHI          5091…
#>  3      18 Connecticut  Sun       Connecticut Sun  Sun        CON          f050…
#>  4       3 Dallas       Wings     Dallas Wings     Wings      DAL          002b…
#>  5  129689 Golden State Valkyries Golden State Va… Valkyries  GS           b38f…
#>  6       5 Indiana      Fever     Indiana Fever    Fever      IND          002d…
#>  7      17 Las Vegas    Aces      Las Vegas Aces   Aces       LV           a7a8…
#>  8       6 Los Angeles  Sparks    Los Angeles Spa… Sparks     LA           5525…
#>  9       8 Minnesota    Lynx      Minnesota Lynx   Lynx       MIN          2660…
#> 10       9 New York     Liberty   New York Liberty Liberty    NY           86ce…
#> 11      11 Phoenix      Mercury   Phoenix Mercury  Mercury    PHX          3c28…
#> 12  132052 Portland     Fire      Portland Fire    Fire       POR          cee5…
#> 13      14 Seattle      Storm     Seattle Storm    Storm      SEA          2c52…
#> 14  131935 Toronto      Tempo     Toronto Tempo    Tempo      TOR          3347…
#> 15      16 Washington   Mystics   Washington Myst… Mystics    WSH          e03a…
#> # ℹ 3 more variables: alternate_color <chr>, logo <chr>, logo_dark <chr>
# }
```

# **Get ESPN WNBA Draft Picks**

**Get ESPN WNBA Draft Picks**

**Get ESPN WNBA Draft Picks**

## Usage

``` r
espn_wnba_draft(season = most_recent_wnba_season(), ...)
```

## Arguments

- season:

  Season year (numeric, e.g. 2025). Defaults to the most recent WNBA
  season.

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)`.

## Value

A `wehoop_data` tibble with one row per draft pick:

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| round | integer | Tournament / playoff round. |
| pick | integer | Pick. |
| overall | integer | Overall. |
| traded | logical | Traded. |
| trade_note | character | Trade note. |
| status | character | Status label. |
| athlete_id | character | Unique athlete identifier (ESPN). |
| athlete_ref | character | Athlete ref. |
| team_id | character | Unique team identifier. |
| team_ref | character | Team ref. |

Athlete and team details (name, position, college, abbreviation) are not
inlined in the draft response; resolve them via
[`espn_wnba_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_info.md)
or
[`espn_wnba_team()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team.md)
using the returned IDs.

## Details

Calls the ESPN core-v2 endpoint
`https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/{year}/draft/rounds`,
which returns each round of the draft with its picks inlined as
`picks: [...]`. For historical seasons with no ESPN draft data the
function returns an empty tibble rather than erroring.

## See also

Other ESPN WNBA Functions:
[`espn_wnba_athletes_index()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_athletes_index.md),
[`espn_wnba_award()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_award.md),
[`espn_wnba_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_calendar.md),
[`espn_wnba_coach_season()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coach_season.md),
[`espn_wnba_coaches()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_coaches.md),
[`espn_wnba_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_conferences.md),
[`espn_wnba_draft_athlete_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athlete_detail.md),
[`espn_wnba_draft_athletes()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md),
[`espn_wnba_draft_pick()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_pick.md),
[`espn_wnba_draft_rounds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_rounds.md),
[`espn_wnba_draft_status()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_status.md),
[`espn_wnba_franchise()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchise.md),
[`espn_wnba_franchises()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_franchises.md),
[`espn_wnba_freeagents()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_freeagents.md),
[`espn_wnba_futures()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_futures.md),
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_broadcasts()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md),
[`espn_wnba_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_odds.md),
[`espn_wnba_game_official_detail()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_official_detail.md),
[`espn_wnba_game_officials()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_officials.md),
[`espn_wnba_game_play()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play.md),
[`espn_wnba_game_play_personnel()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_play_personnel.md),
[`espn_wnba_game_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_player_box.md),
[`espn_wnba_game_powerindex()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_powerindex.md),
[`espn_wnba_game_predictor()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_predictor.md),
[`espn_wnba_game_probabilities()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_probabilities.md),
[`espn_wnba_game_propbets()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_propbets.md),
[`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md),
[`espn_wnba_game_situation()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_situation.md),
[`espn_wnba_game_team_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md),
[`espn_wnba_game_team_linescores()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_linescores.md),
[`espn_wnba_game_team_records()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_records.md),
[`espn_wnba_game_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_roster.md),
[`espn_wnba_game_team_roster_entry()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_roster_entry.md),
[`espn_wnba_game_team_score()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_score.md),
[`espn_wnba_game_team_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_statistics.md),
[`espn_wnba_injuries()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_injuries.md),
[`espn_wnba_leaders()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_leaders.md),
[`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
[`espn_wnba_player_awards()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_awards.md),
[`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md),
[`espn_wnba_player_career_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_career_stats.md),
[`espn_wnba_player_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md),
[`espn_wnba_player_eventlog_v2()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog_v2.md),
[`espn_wnba_player_gamelog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_gamelog.md),
[`espn_wnba_player_info()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_info.md),
[`espn_wnba_player_overview()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_overview.md),
[`espn_wnba_player_seasons()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_seasons.md),
[`espn_wnba_player_splits()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_splits.md),
[`espn_wnba_player_statisticslog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_statisticslog.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_player_stats_v3()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats_v3.md),
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
  espn_wnba_draft(season = 2024)
#> ── ESPN WNBA Draft Picks from ESPN.com ───────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-12 02:19:45 UTC
#> # A tibble: 36 × 11
#>    season round  pick overall traded trade_note    status athlete_id athlete_ref
#>     <int> <int> <int>   <int> <lgl>  <chr>         <chr>  <chr>      <chr>      
#>  1   2024     1     1       1 FALSE  NA            SELEC… 108565     http://spo…
#>  2   2024     1     2       2 FALSE  NA            SELEC… 108566     http://spo…
#>  3   2024     1     3       3 TRUE   From PHX      SELEC… 108569     http://spo…
#>  4   2024     1     4       4 TRUE   From SEA      SELEC… 108567     http://spo…
#>  5   2024     1     5       5 TRUE   From CHI      SELEC… 108570     http://spo…
#>  6   2024     1     6       6 FALSE  NA            SELEC… 108568     http://spo…
#>  7   2024     1     7       7 TRUE   From MIN      SELEC… 108572     http://spo…
#>  8   2024     1     8       8 TRUE   From CHI via… SELEC… 108574     http://spo…
#>  9   2024     1     9       9 FALSE  NA            SELEC… 108581     http://spo…
#> 10   2024     1    10      10 FALSE  NA            SELEC… 108577     http://spo…
#> # ℹ 26 more rows
#> # ℹ 2 more variables: team_id <chr>, team_ref <chr>
# }
```

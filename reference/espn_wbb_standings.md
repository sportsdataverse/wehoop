# Get ESPN women's college basketball standings

Get ESPN women's college basketball standings

## Usage

``` r
espn_wbb_standings(year)
```

## Arguments

- year:

  Either numeric or character (YYYY)

## Value

Returns a tibble

|  |  |  |
|----|----|----|
| col_name | types | description |
| team_id | integer | Unique team identifier. |
| team | character | Team-side label or team identifier. |
| conference | character | Conference group name from ESPN standings. |
| avgpointsagainst | numeric | Avgpointsagainst. |
| avgpointsfor | numeric | Avgpointsfor. |
| gamesbehind | numeric | Gamesbehind. |
| leaguewinpercent | numeric | Leaguewinpercent. |
| losses | numeric | Total losses. |
| playoffseed | numeric | Playoffseed. |
| pointsagainst | numeric | Pointsagainst. |
| pointsfor | numeric | Pointsfor. |
| streak | numeric | Current streak (e.g. 'W3' for three-game win streak). |
| winpercent | numeric | Winpercent. |
| wins | numeric | Total wins. |
| total | character | Total. |
| home_avgpointsagainst | numeric | Home team's avgpointsagainst. |
| home_avgpointsfor | numeric | Home team's avgpointsfor. |
| home_gamesbehind | numeric | Home team's gamesbehind. |
| home_leaguewinpercent | numeric | Home team's leaguewinpercent. |
| home_losses | numeric | Home team's losses. |
| home_playoffseed | numeric | Home team's playoffseed. |
| home_pointsagainst | numeric | Home team's pointsagainst. |
| home_pointsfor | numeric | Home team's pointsfor. |
| home_streak | numeric | Home team's streak. |
| home_winpercent | numeric | Home team's winpercent. |
| home_wins | numeric | Home team's wins. |
| home | character | Home. |
| road_avgpointsagainst | numeric | Road avgpointsagainst. |
| road_avgpointsfor | numeric | Road avgpointsfor. |
| road_gamesbehind | numeric | Road gamesbehind. |
| road_leaguewinpercent | numeric | Road leaguewinpercent. |
| road_losses | numeric | Road losses. |
| road_playoffseed | numeric | Road playoffseed. |
| road_pointsagainst | numeric | Road pointsagainst. |
| road_pointsfor | numeric | Road pointsfor. |
| road_streak | numeric | Road streak. |
| road_winpercent | numeric | Road winpercent. |
| road_wins | numeric | Road wins. |
| road | character | Road. |
| vsaprankedteams_avgpointsagainst | numeric | Vsaprankedteams avgpointsagainst. |
| vsaprankedteams_avgpointsfor | numeric | Vsaprankedteams avgpointsfor. |
| vsaprankedteams_gamesbehind | numeric | Vsaprankedteams gamesbehind. |
| vsaprankedteams_leaguewinpercent | numeric | Vsaprankedteams leaguewinpercent. |
| vsaprankedteams_losses | numeric | Vsaprankedteams losses. |
| vsaprankedteams_playoffseed | numeric | Vsaprankedteams playoffseed. |
| vsaprankedteams_pointsagainst | numeric | Vsaprankedteams pointsagainst. |
| vsaprankedteams_pointsfor | numeric | Vsaprankedteams pointsfor. |
| vsaprankedteams_streak | numeric | Vsaprankedteams streak. |
| vsaprankedteams_winpercent | numeric | Vsaprankedteams winpercent. |
| vsaprankedteams_wins | numeric | Vsaprankedteams wins. |
| vsaprankedteams | character | Vsaprankedteams. |
| vsusarankedteams_avgpointsagainst | numeric | Vsusarankedteams avgpointsagainst. |
| vsusarankedteams_avgpointsfor | numeric | Vsusarankedteams avgpointsfor. |
| vsusarankedteams_gamesbehind | numeric | Vsusarankedteams gamesbehind. |
| vsusarankedteams_leaguewinpercent | numeric | Vsusarankedteams leaguewinpercent. |
| vsusarankedteams_losses | numeric | Vsusarankedteams losses. |
| vsusarankedteams_playoffseed | numeric | Vsusarankedteams playoffseed. |
| vsusarankedteams_pointsagainst | numeric | Vsusarankedteams pointsagainst. |
| vsusarankedteams_pointsfor | numeric | Vsusarankedteams pointsfor. |
| vsusarankedteams_streak | numeric | Vsusarankedteams streak. |
| vsusarankedteams_winpercent | numeric | Vsusarankedteams winpercent. |
| vsusarankedteams_wins | numeric | Vsusarankedteams wins. |
| vsusarankedteams | character | Vsusarankedteams. |
| vsconf_avgpointsagainst | numeric | Vsconf avgpointsagainst. |
| vsconf_avgpointsfor | numeric | Vsconf avgpointsfor. |
| vsconf_gamesbehind | numeric | Vsconf gamesbehind. |
| vsconf_leaguewinpercent | numeric | Vsconf leaguewinpercent. |
| vsconf_losses | numeric | Vsconf losses. |
| vsconf_playoffseed | numeric | Vsconf playoffseed. |
| vsconf_pointsagainst | numeric | Vsconf pointsagainst. |
| vsconf_pointsfor | numeric | Vsconf pointsfor. |
| vsconf_streak | numeric | Vsconf streak. |
| vsconf_winpercent | numeric | Vsconf winpercent. |
| vsconf_wins | numeric | Vsconf wins. |
| vsconf | character | Vsconf. |

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

## Examples

``` r
# \donttest{
  try(espn_wbb_standings(2021))
#> ── ESPN WBB Standings Information from ESPN.com ──────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-26 20:42:02 UTC
#> # A tibble: 300 × 87
#>    team_id team             conference avgpointsagainst avgpointsfor gamesbehind
#>      <int> <chr>            <chr>                 <dbl>        <dbl>       <dbl>
#>  1     311 Maine Black Bea… America E…             52.7         66.2         0  
#>  2    2619 Stony Brook Sea… America E…             52.0         59.5         5  
#>  3     261 Vermont Catamou… America E…             57.8         62.3         6  
#>  4    2349 UMass Lowell Ri… America E…             57.1         57.4         5.5
#>  5     399 UAlbany Great D… America E…             57.1         49.8         9  
#>  6    2066 Binghamton Bear… America E…             59           53.9        10  
#>  7     160 New Hampshire W… America E…             65           53.8        12  
#>  8      42 Hartford Hawks   America E…             63.4         51.4         7  
#>  9    2378 UMBC Retrievers  America E…             64.2         57.5         9  
#> 10    2885 NJIT Highlanders America E…             62.7         56.3        12  
#> # ℹ 290 more rows
#> # ℹ 81 more variables: leaguewinpercent <dbl>, losses <dbl>, playoffseed <dbl>,
#> #   pointdifferential <chr>, pointsagainst <dbl>, pointsfor <dbl>,
#> #   streak <dbl>, winpercent <dbl>, wins <dbl>, gamesahead <chr>, total <chr>,
#> #   home_avgpointsagainst <dbl>, home_avgpointsfor <dbl>,
#> #   home_gamesbehind <dbl>, home_leaguewinpercent <dbl>, home_losses <dbl>,
#> #   home_playoffseed <dbl>, home_pointdifferential <chr>, …
 # }
```

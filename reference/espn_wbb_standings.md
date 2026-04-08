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

|                                   |           |
|-----------------------------------|-----------|
| col_name                          | types     |
| team_id                           | integer   |
| team                              | character |
| avgpointsagainst                  | numeric   |
| avgpointsfor                      | numeric   |
| gamesbehind                       | numeric   |
| leaguewinpercent                  | numeric   |
| losses                            | numeric   |
| playoffseed                       | numeric   |
| pointsagainst                     | numeric   |
| pointsfor                         | numeric   |
| streak                            | numeric   |
| winpercent                        | numeric   |
| wins                              | numeric   |
| total                             | character |
| home_avgpointsagainst             | numeric   |
| home_avgpointsfor                 | numeric   |
| home_gamesbehind                  | numeric   |
| home_leaguewinpercent             | numeric   |
| home_losses                       | numeric   |
| home_playoffseed                  | numeric   |
| home_pointsagainst                | numeric   |
| home_pointsfor                    | numeric   |
| home_streak                       | numeric   |
| home_winpercent                   | numeric   |
| home_wins                         | numeric   |
| home                              | character |
| road_avgpointsagainst             | numeric   |
| road_avgpointsfor                 | numeric   |
| road_gamesbehind                  | numeric   |
| road_leaguewinpercent             | numeric   |
| road_losses                       | numeric   |
| road_playoffseed                  | numeric   |
| road_pointsagainst                | numeric   |
| road_pointsfor                    | numeric   |
| road_streak                       | numeric   |
| road_winpercent                   | numeric   |
| road_wins                         | numeric   |
| road                              | character |
| vsaprankedteams_avgpointsagainst  | numeric   |
| vsaprankedteams_avgpointsfor      | numeric   |
| vsaprankedteams_gamesbehind       | numeric   |
| vsaprankedteams_leaguewinpercent  | numeric   |
| vsaprankedteams_losses            | numeric   |
| vsaprankedteams_playoffseed       | numeric   |
| vsaprankedteams_pointsagainst     | numeric   |
| vsaprankedteams_pointsfor         | numeric   |
| vsaprankedteams_streak            | numeric   |
| vsaprankedteams_winpercent        | numeric   |
| vsaprankedteams_wins              | numeric   |
| vsaprankedteams                   | character |
| vsusarankedteams_avgpointsagainst | numeric   |
| vsusarankedteams_avgpointsfor     | numeric   |
| vsusarankedteams_gamesbehind      | numeric   |
| vsusarankedteams_leaguewinpercent | numeric   |
| vsusarankedteams_losses           | numeric   |
| vsusarankedteams_playoffseed      | numeric   |
| vsusarankedteams_pointsagainst    | numeric   |
| vsusarankedteams_pointsfor        | numeric   |
| vsusarankedteams_streak           | numeric   |
| vsusarankedteams_winpercent       | numeric   |
| vsusarankedteams_wins             | numeric   |
| vsusarankedteams                  | character |
| vsconf_avgpointsagainst           | numeric   |
| vsconf_avgpointsfor               | numeric   |
| vsconf_gamesbehind                | numeric   |
| vsconf_leaguewinpercent           | numeric   |
| vsconf_losses                     | numeric   |
| vsconf_playoffseed                | numeric   |
| vsconf_pointsagainst              | numeric   |
| vsconf_pointsfor                  | numeric   |
| vsconf_streak                     | numeric   |
| vsconf_winpercent                 | numeric   |
| vsconf_wins                       | numeric   |
| vsconf                            | character |

## See also

Other ESPN WBB Functions:
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_rankings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_rankings.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md),
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)

## Examples

``` r
# \donttest{
  try(espn_wbb_standings(2021))
#> ── ESPN WBB Standings Information from ESPN.com ──────────────── wehoop 2.1.0 ──
#> ℹ Data updated: 2026-04-08 11:13:45 UTC
#> # A tibble: 346 × 86
#>    team_id team       avgpointsagainst avgpointsfor gamesbehind leaguewinpercent
#>      <int> <chr>                 <dbl>        <dbl>       <dbl>            <dbl>
#>  1    2856 Californi…             61.9         77.8         0              1    
#>  2      24 Stanford …             53.7         77.7        -5              0.905
#>  3      41 UConn Hus…             52.6         81.9         0              1    
#>  4     239 Baylor Be…             55.3         81.9         0              0.944
#>  5    2083 Bucknell …             55.5         70.6         0              1    
#>  6     526 Florida G…             59.6         81.6         0              1    
#>  7     120 Maryland …             69.0         90.8         0              0.944
#>  8     245 Texas A&M…             62.6         75.2         0              0.929
#>  9    2617 Stephen F…             51           80.2         0              1    
#> 10    2623 Missouri …             57.2         70.2        -0.5            1    
#> # ℹ 336 more rows
#> # ℹ 80 more variables: losses <dbl>, playoffseed <dbl>,
#> #   pointdifferential <chr>, pointsagainst <dbl>, pointsfor <dbl>,
#> #   streak <dbl>, winpercent <dbl>, wins <dbl>, gamesahead <chr>, total <chr>,
#> #   home_avgpointsagainst <dbl>, home_avgpointsfor <dbl>,
#> #   home_gamesbehind <dbl>, home_leaguewinpercent <dbl>, home_losses <dbl>,
#> #   home_playoffseed <dbl>, home_pointdifferential <chr>, …
 # }
```

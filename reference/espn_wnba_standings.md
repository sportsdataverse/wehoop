# **Get ESPN WNBA Standings**

**Get ESPN WNBA Standings**

## Usage

``` r
espn_wnba_standings(year)
```

## Arguments

- year:

  Either numeric or character (YYYY)

## Value

Returns a tibble

|                    |           |
|--------------------|-----------|
| col_name           | types     |
| team_id            | integer   |
| team               | character |
| avgpointsagainst   | numeric   |
| avgpointsfor       | numeric   |
| clincher           | numeric   |
| differential       | numeric   |
| divisionwinpercent | numeric   |
| gamesbehind        | numeric   |
| leaguewinpercent   | numeric   |
| losses             | numeric   |
| playoffseed        | numeric   |
| streak             | numeric   |
| winpercent         | numeric   |
| wins               | numeric   |
| leaguestandings    | character |
| home               | character |
| road               | character |
| vsdiv              | character |
| vsconf             | character |
| lasttengames       | character |

## See also

Other ESPN WNBA Functions:
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
[`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md),
[`espn_wnba_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_teams.md)

## Author

Geoff Hutchinson

## Examples

``` r
# \donttest{
  try(espn_wnba_standings(year = 2021))
#> ── ESPN WNBA Standings Information from ESPN.com ─────────────── wehoop 2.1.0 ──
#> ℹ Data updated: 2026-04-08 11:13:56 UTC
#> # A tibble: 12 × 25
#>    team_id team              avgpointsagainst avgpointsfor clincher differential
#>      <int> <chr>                        <dbl>        <dbl>    <dbl>        <dbl>
#>  1      18 Connecticut Sun               69.9         79.7        1        9.8  
#>  2      17 Las Vegas Aces                80.2         89.2        1        9.10 
#>  3       8 Minnesota Lynx                78.7         82.7        1        4    
#>  4      14 Seattle Storm                 80.4         84.8        8        4.40 
#>  5      11 Phoenix Mercury               79.5         82.1        1        2.60 
#>  6      19 Chicago Sky                   81.9         83.2        1        1.40 
#>  7       3 Dallas Wings                  81.7         81.1        1       -0.600
#>  8       9 New York Liberty              85.5         78.4        1       -7.10 
#>  9      16 Washington Mysti…             83.6         79.8        4       -3.8  
#> 10       6 Los Angeles Spar…             77.1         72.8        4       -4.3  
#> 11      20 Atlanta Dream                 84.2         78.7        4       -5.60 
#> 12       5 Indiana Fever                 85.1         75.3        4       -9.8  
#> # ℹ 19 more variables: divisionwinpercent <dbl>, gamesbehind <dbl>,
#> #   leaguewinpercent <dbl>, losses <dbl>, playoffseed <dbl>,
#> #   pointdifferential <chr>, points <chr>, pointsagainst <chr>,
#> #   pointsfor <chr>, streak <dbl>, winpercent <dbl>, wins <dbl>,
#> #   gamesahead <chr>, leaguestandings <chr>, home <chr>, road <chr>,
#> #   vsdiv <chr>, vsconf <chr>, lasttengames <chr>
# }
```

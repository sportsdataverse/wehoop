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

|  |  |  |
|----|----|----|
| col_name | types | description |
| team_id | integer | Unique team identifier. |
| team | character | Team-side label or team identifier. |
| avgpointsagainst | numeric | Avgpointsagainst. |
| avgpointsfor | numeric | Avgpointsfor. |
| clincher | numeric | Clincher. |
| differential | numeric | Differential. |
| divisionwinpercent | numeric | Divisionwinpercent. |
| gamesbehind | numeric | Gamesbehind. |
| leaguewinpercent | numeric | Leaguewinpercent. |
| losses | numeric | Total losses. |
| playoffseed | numeric | Playoffseed. |
| streak | numeric | Current streak (e.g. 'W3' for three-game win streak). |
| winpercent | numeric | Winpercent. |
| wins | numeric | Total wins. |
| leaguestandings | character | Leaguestandings. |
| home | character | Home. |
| road | character | Road. |
| vsdiv | character | Vsdiv. |
| vsconf | character | Vsconf. |
| lasttengames | character | Lasttengames. |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Geoff Hutchinson

## Examples

``` r
# \donttest{
  try(espn_wnba_standings(year = 2021))
#> ── ESPN WNBA Standings Information from ESPN.com ─────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:56:56 UTC
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

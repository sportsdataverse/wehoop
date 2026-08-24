# **Get Fox Sports basketball team directory**

**Get the Fox Sports (Bifrost) WNBA / women's college basketball (WBB)
team directory**, derived from the standings endpoint.
`fox_wnba_teams()` hits the `wnba` slug; `fox_wbb_teams()` hits the
`wcbk` slug.

## Usage

``` r
fox_wnba_teams(team_id = "3")

fox_wbb_teams(team_id = "11")
```

## Arguments

- team_id:

  Fox Bifrost seed team id used to fetch league standings (default
  `"3"`). The standings response enumerates every team in the seed's
  league sections.

## Value

A `wehoop_data` tibble, one row per team: `fox_team_id`,
`fox_team_name`, `fox_section`.

## See also

Other Fox Sports Functions:
[`fox_basketball_boxscore`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md),
[`fox_basketball_league_leaders`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md),
[`fox_basketball_odds`](https://wehoop.sportsdataverse.org/reference/fox_basketball_odds.md),
[`fox_basketball_pbp`](https://wehoop.sportsdataverse.org/reference/fox_basketball_pbp.md),
[`fox_basketball_standings`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md),
[`fox_basketball_team_gamelog`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_gamelog.md),
[`fox_basketball_team_roster`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_roster.md),
[`fox_basketball_team_stats`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_stats.md),
[`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md)

## Examples

``` r
# \donttest{
  try(fox_wnba_teams())
#> ── Fox Sports WNBA teams ─────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 07:32:51 UTC
#> # A tibble: 15 × 3
#>    fox_team_id fox_team_name          fox_section    
#>    <chr>       <chr>                  <chr>          
#>  1 1           Atlanta Dream          Connecticut Sun
#>  2 4           Indiana Fever          Connecticut Sun
#>  3 5           New York Liberty       Connecticut Sun
#>  4 6           Washington Mystics     Connecticut Sun
#>  5 2           Chicago Sky            Connecticut Sun
#>  6 29          Toronto Tempo          Connecticut Sun
#>  7 3           Connecticut Sun        Connecticut Sun
#>  8 9           Minnesota Lynx         Connecticut Sun
#>  9 23          Golden State Valkyries Connecticut Sun
#> 10 11          Las Vegas Aces         Connecticut Sun
#> 11 7           Dallas Wings           Connecticut Sun
#> 12 30          Portland Fire          Connecticut Sun
#> 13 8           Los Angeles Sparks     Connecticut Sun
#> 14 10          Phoenix Mercury        Connecticut Sun
#> 15 12          Seattle Storm          Connecticut Sun
# }
# \donttest{
  try(fox_wbb_teams("11"))
#> ── Fox Sports WCBK teams ─────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 07:32:51 UTC
#> # A tibble: 11 × 3
#>    fox_team_id fox_team_name           fox_section
#>    <chr>       <chr>                   <chr>      
#>  1 11          Uconn Huskies           Big East   
#>  2 77          Villanova Wildcats      Big East   
#>  3 73          Marquette Golden Eagles Big East   
#>  4 75          Seton Hall Pirates      Big East   
#>  5 76          St. John's Red Storm    Big East   
#>  6 70          Creighton Bluejays      Big East   
#>  7 74          Providence Friars       Big East   
#>  8 72          Georgetown Hoyas        Big East   
#>  9 69          Butler Bulldogs         Big East   
#> 10 71          Depaul Blue Demons      Big East   
#> 11 78          Xavier Musketeers       Big East   
# }
```

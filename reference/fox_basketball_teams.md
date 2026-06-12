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
[`fox_basketball_team_stats`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_stats.md)

## Examples

``` r
# \donttest{
  try(fox_wnba_teams())
#> ── Fox Sports WNBA teams ─────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-12 14:20:44 UTC
#> # A tibble: 15 × 3
#>    fox_team_id fox_team_name          fox_section
#>    <chr>       <chr>                  <chr>      
#>  1 5           New York Liberty       CONFERENCE 
#>  2 1           Atlanta Dream          CONFERENCE 
#>  3 4           Indiana Fever          CONFERENCE 
#>  4 29          Toronto Tempo          CONFERENCE 
#>  5 6           Washington Mystics     CONFERENCE 
#>  6 2           Chicago Sky            CONFERENCE 
#>  7 3           Connecticut Sun        CONFERENCE 
#>  8 9           Minnesota Lynx         CONFERENCE 
#>  9 11          Las Vegas Aces         CONFERENCE 
#> 10 7           Dallas Wings           CONFERENCE 
#> 11 23          Golden State Valkyries CONFERENCE 
#> 12 8           Los Angeles Sparks     CONFERENCE 
#> 13 30          Portland Fire          CONFERENCE 
#> 14 10          Phoenix Mercury        CONFERENCE 
#> 15 12          Seattle Storm          CONFERENCE 
# }
# \donttest{
  try(fox_wbb_teams("11"))
#> ── Fox Sports WCBK teams ─────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-12 14:20:44 UTC
#> # A tibble: 11 × 3
#>    fox_team_id fox_team_name           fox_section
#>    <chr>       <chr>                   <chr>      
#>  1 11          Uconn Huskies           CONFERENCE 
#>  2 77          Villanova Wildcats      CONFERENCE 
#>  3 73          Marquette Golden Eagles CONFERENCE 
#>  4 75          Seton Hall Pirates      CONFERENCE 
#>  5 76          St. John's Red Storm    CONFERENCE 
#>  6 70          Creighton Bluejays      CONFERENCE 
#>  7 74          Providence Friars       CONFERENCE 
#>  8 72          Georgetown Hoyas        CONFERENCE 
#>  9 69          Butler Bulldogs         CONFERENCE 
#> 10 71          Depaul Blue Demons      CONFERENCE 
#> 11 78          Xavier Musketeers       CONFERENCE 
# }
```

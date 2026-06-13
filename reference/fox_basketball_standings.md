# **Get Fox Sports basketball standings**

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB)
standings.** `fox_wnba_standings()` hits the `wnba` slug;
`fox_wbb_standings()` hits the `wcbk` slug.

## Usage

``` r
fox_wnba_standings(team_id)

fox_wbb_standings(team_id)
```

## Arguments

- team_id:

  Fox Bifrost team id (standings of that team's conference/division).

## Value

A `wehoop_data` tibble of standings rows (`team_id`, `section`, the
standings columns, `entity_id`).

## See also

Other Fox Sports Functions:
[`fox_basketball_boxscore`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md),
[`fox_basketball_league_leaders`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md),
[`fox_basketball_odds`](https://wehoop.sportsdataverse.org/reference/fox_basketball_odds.md),
[`fox_basketball_pbp`](https://wehoop.sportsdataverse.org/reference/fox_basketball_pbp.md),
[`fox_basketball_team_gamelog`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_gamelog.md),
[`fox_basketball_team_roster`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_roster.md),
[`fox_basketball_team_stats`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_stats.md),
[`fox_basketball_teams`](https://wehoop.sportsdataverse.org/reference/fox_basketball_teams.md),
[`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md)

## Examples

``` r
# \donttest{
  try(fox_wnba_standings("1"))
#> ── Fox Sports WNBA standings ─────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-13 04:19:53 UTC
#> # A tibble: 30 × 16
#>    team_id section eastern v2    w_l   pct   gb    pf    pa    home  away  conf 
#>    <chr>   <chr>   <chr>   <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#>  1 1       CONFER… 1       Libe… 9-4   .692  -     89.0  83.0  5-3   4-1   6-0  
#>  2 1       CONFER… 2       Dream 8-4   .667  0.5   86.0  81.0  4-2   4-2   3-2  
#>  3 1       CONFER… 3       Fever 7-5   .583  1.5   90.0  87.0  5-2   2-3   3-2  
#>  4 1       CONFER… 4       Tempo 7-6   .538  2.0   90.0  89.0  4-2   3-4   3-3  
#>  5 1       CONFER… 5       Myst… 5-6   .455  3.0   83.0  87.0  2-3   3-3   4-3  
#>  6 1       CONFER… 6       Sky   4-9   .308  5.0   82.0  88.0  1-5   3-4   1-5  
#>  7 1       CONFER… 7       Sun   2-12  .143  7.5   78.0  89.0  1-4   1-8   0-5  
#>  8 1       CONFER… NA      Lynx  10-2  .833  -     91.0  78.0  5-2   5-0   6-0  
#>  9 1       CONFER… NA      Aces  9-3   .750  1.0   91.0  86.0  2-2   7-1   6-3  
#> 10 1       CONFER… NA      Wings 8-4   .667  2.0   88.0  83.0  4-2   4-2   4-2  
#> # ℹ 20 more rows
#> # ℹ 4 more variables: l10 <chr>, strk <chr>, entity_id <chr>, western <chr>
# }
# \donttest{
  try(fox_wbb_standings("11"))
#> ── Fox Sports WCBK standings ─────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-13 04:19:53 UTC
#> # A tibble: 11 × 13
#>    team_id section    big_east v2     conf  w_l   top_25 home  away  pf    pa   
#>    <chr>   <chr>      <chr>    <chr>  <chr> <chr> <chr>  <chr> <chr> <chr> <chr>
#>  1 11      CONFERENCE 1        UConn  20-0  38-1  7-1    17-0  12-0  3387  1966 
#>  2 11      CONFERENCE 2        Villa… 16-4  25-8  1-4    12-3  10-3  2351  2021 
#>  3 11      CONFERENCE 3        Marqu… 12-8  18-12 0-3    11-4  7-5   2030  1891 
#>  4 11      CONFERENCE 4        Seton… 12-8  19-13 0-2    10-6  8-6   2160  2053 
#>  5 11      CONFERENCE 5        St. J… 11-9  22-12 1-2    11-4  8-7   2087  2081 
#>  6 11      CONFERENCE 6        Creig… 11-9  16-15 0-3    8-6   6-8   2093  2132 
#>  7 11      CONFERENCE 7        Provi… 7-13  15-18 0-3    11-7  2-9   1979  2108 
#>  8 11      CONFERENCE 8        Georg… 6-14  14-17 0-4    8-8   5-8   1942  1937 
#>  9 11      CONFERENCE 9        Butler 6-14  12-19 0-2    9-8   2-9   1927  2014 
#> 10 11      CONFERENCE 10       DePaul 5-15  8-24  0-3    7-10  1-13  2016  2313 
#> 11 11      CONFERENCE 11       Xavier 4-16  11-19 0-2    8-9   3-9   1751  1997 
#> # ℹ 2 more variables: strk <chr>, entity_id <chr>
# }
```

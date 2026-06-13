# **Bart Torvik Women's Season Schedule & Results**

**Get the full women's game-by-game schedule and results for a season
from [barttorvik.com](https://barttorvik.com/ncaaw).** Pulls the
`/ncaaw/{year}_super_sked.json` file (one row per game). No API key
required.

## Usage

``` r
bart_wbb_game_schedule(year = most_recent_wbb_season())
```

## Arguments

- year:

  Season, 4-digit ending-year format (e.g. `2024`). Defaults to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

## Value

A `wehoop_data` tibble, one row per game: `muid`, `date`, `team1`,
`team2`, `t1pts`, `t2pts`, `winner`, `loser`, plus efficiency / quality
columns, and `year`.

## See also

Other Bart Torvik Functions:
[`bart_wbb_ratings()`](https://wehoop.sportsdataverse.org/reference/bart_wbb_ratings.md)

## Examples

``` r
# \donttest{
  try(bart_wbb_game_schedule(year = 2024))
#> ── Bart Torvik women's season schedule from barttorvik.com ───── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-06-13 03:24:21 UTC
#> # A tibble: 5,899 × 56
#>    muid    date  conmatch matchup prediction   ttq  conf venue team1  t1oe  t1de
#>    <chr>   <chr> <chr>    <chr>   <chr>      <dbl> <int> <int> <chr> <dbl> <dbl>
#>  1 Missou… 2/17… MVC at … 107 Mi… Missouri … 22.8      1     0 Miss…  97.0  90.8
#>  2 New Me… 11/2… MWC vs.… 146 Ne… Georgia T… 51.3      0     1 New …  91.1  89.2
#>  3 Cal St… 11/2… BW at N… 307 Ca… Cal St. B…  5.40     0     0 Cal …  85.6 105. 
#>  4 Missou… 11/2… SEC vs.… 85 Mis… Missouri … 36.9      0     1 Miss… 103.   91.7
#>  5 TulsaA… 11/2… Amer vs… 92 Tul… Tulsa -11… 47.1      0     1 Tulsa  99.6  89.4
#>  6 Montan… 12/8… BSky at… 164 Mo… Montana S… 53.6      0     0 Mont…  85.6  87.2
#>  7 Prairi… 3/9/… SWAC at… 318 Pr… Texas Sou… 34.9      1     0 Prai…  82.2 102. 
#>  8 UC San… 3/9/… BW at BW 237 UC… UC Rivers… 33.0      1     0 UC S…  90.4 101. 
#>  9 Missis… 3/9/… SWAC at… 345 Mi… Jackson S… 19.3      1     0 Miss…  77.8 104. 
#> 10 Southe… 3/9/… SWAC at… 241 So… Southern … 43.4      1     0 Sout…  83.4  94.0
#> # ℹ 5,889 more rows
#> # ℹ 45 more variables: t1py <dbl>, t1wp <int>, t1propt <dbl>, team2 <chr>,
#> #   t2oe <dbl>, t2de <dbl>, t2py <dbl>, t2wp <int>, t2propt <dbl>, tpro <dbl>,
#> #   t1qual <chr>, t2qual <chr>, gp <int>, result <chr>, tempo <dbl>,
#> #   possessions <dbl>, t1pts <int>, t2pts <int>, winner <chr>, loser <chr>,
#> #   t1adjt <dbl>, t2adjt <dbl>, t1adjo <dbl>, t1adjd <dbl>, t2adjo <dbl>,
#> #   t2adjd <dbl>, gamevalue <dbl>, mismatch <dbl>, blowout <dbl>, …
# }
```

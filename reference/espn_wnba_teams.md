# Get ESPN's WNBA team names and ids

Get ESPN's WNBA team names and ids

## Usage

``` r
espn_wnba_teams()
```

## Value

Returns a tibble

|                 |           |
|-----------------|-----------|
| col_name        | types     |
| team_id         | integer   |
| team            | character |
| mascot          | character |
| display_name    | character |
| short_name      | character |
| abbreviation    | character |
| color           | character |
| alternate_color | character |
| logo            | character |
| logo_dark       | character |

## See also

Other ESPN WNBA Functions:
[`espn_wnba_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_all.md),
[`espn_wnba_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_rosters.md),
[`espn_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_pbp.md),
[`espn_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_box.md),
[`espn_wnba_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_stats.md),
[`espn_wnba_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_scoreboard.md),
[`espn_wnba_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_standings.md),
[`espn_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_box.md),
[`espn_wnba_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_stats.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wnba_teams())
#> ── ESPN WNBA Teams Information from ESPN.com ─────────────────── wehoop 2.1.0 ──
#> ℹ Data updated: 2026-04-08 11:13:57 UTC
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
#> 12  132052 Portland     Fire      Portland Fire    Fire       POR          B222…
#> 13      14 Seattle      Storm     Seattle Storm    Storm      SEA          2c52…
#> 14  131935 Toronto      Tempo     Toronto Tempo    Tempo      TOR          3347…
#> 15      16 Washington   Mystics   Washington Myst… Mystics    WSH          e03a…
#> # ℹ 3 more variables: alternate_color <chr>, logo <chr>, logo_dark <chr>
# }
```

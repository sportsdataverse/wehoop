# Get ESPN's WNBA team names and ids

Get ESPN's WNBA team names and ids

## Usage

``` r
espn_wnba_teams()
```

## Value

Returns a tibble

|                 |           |                                            |
|-----------------|-----------|--------------------------------------------|
| col_name        | types     | description                                |
| team_id         | integer   | Unique team identifier.                    |
| team            | character | Team-side label or team identifier.        |
| mascot          | character | Team mascot.                               |
| display_name    | character | Display name.                              |
| short_name      | character | Short display name.                        |
| abbreviation    | character | Short abbreviation.                        |
| color           | character | Primary color (hex without leading '#').   |
| alternate_color | character | Alternate color (hex without leading '#'). |
| logo            | character | Team or league logo URL.                   |
| logo_dark       | character | Logo dark.                                 |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wnba_teams())
#> ── ESPN WNBA Teams Information from ESPN.com ─────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:57:00 UTC
#> # A tibble: 14 × 10
#>    team_id team         mascot    display_name     short_name abbreviation color
#>      <int> <chr>        <chr>     <chr>            <chr>      <chr>        <chr>
#>  1      20 Atlanta      Dream     Atlanta Dream    Dream      ATL          e318…
#>  2      19 Chicago      Sky       Chicago Sky      Sky        CHI          5091…
#>  3       3 Dallas       Wings     Dallas Wings     Wings      DAL          002b…
#>  4  129689 Golden State Valkyries Golden State Va… Valkyries  GS           b38f…
#>  5       5 Indiana      Fever     Indiana Fever    Fever      IND          002d…
#>  6      17 Las Vegas    Aces      Las Vegas Aces   Aces       LV           a7a8…
#>  7       6 Los Angeles  Sparks    Los Angeles Spa… Sparks     LA           5525…
#>  8       8 Minnesota    Lynx      Minnesota Lynx   Lynx       MIN          2660…
#>  9       9 New York     Liberty   New York Liberty Liberty    NY           86ce…
#> 10      11 Phoenix      Mercury   Phoenix Mercury  Mercury    PHX          3c28…
#> 11  132052 Portland     Fire      Portland Fire    Fire       POR          cee5…
#> 12      14 Seattle      Storm     Seattle Storm    Storm      SEA          2c52…
#> 13  131935 Toronto      Tempo     Toronto Tempo    Tempo      TOR          3347…
#> 14      16 Washington   Mystics   Washington Myst… Mystics    WSH          e03a…
#> # ℹ 3 more variables: alternate_color <chr>, logo <chr>, logo_dark <chr>
# }
```

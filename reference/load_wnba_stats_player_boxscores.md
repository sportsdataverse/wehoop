# **Load wehoop WNBA Stats box scores**

`load_wnba_stats_player_boxscores()` loads WNBA Stats API
(`boxscoretraditionalv3`) player box scores, one row per player per
game, from the `wnba_stats_player_boxscores` release tag.
`load_wnba_stats_team_boxscores()` loads the matching team totals, one
row per team per game, from the `wnba_stats_team_boxscores` release tag.
Both carry the WNBA Stats ids (`team_id`, `person_id`, `game_id`), not
ESPN's; for ESPN box scores see
[`load_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md)
and
[`load_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md).

## Usage

``` r
load_wnba_stats_player_boxscores(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_team_boxscores(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Source

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_stats_player_boxscores>,
<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_stats_team_boxscores>

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. Both
  releases start in 2026, so coverage runs 2026 through the most recent
  season. Pass `seasons = TRUE` for every published season. (Min: 2026)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the box score data table within the database

## Value

`load_wnba_stats_player_boxscores()` returns a `wehoop_data` tibble with
one row per player per game:

|  |  |  |
|----|----|----|
| col_name | types | description |
| team_id | integer | WNBA Stats team identifier. |
| team_name | character | Team nickname (e.g. 'Liberty'). |
| team_tricode | character | Three-letter team code (e.g. 'NYL'). |
| side | character | `home` or `away`. |
| person_id | integer | WNBA Stats player identifier. |
| first_name | character | Player first name. |
| family_name | character | Player last name. |
| name_i | character | Abbreviated name (e.g. 'B. Stewart'). |
| player_slug | character | URL slug of the player. |
| position | character | Starting position (blank for reserves). |
| comment | character | Did-not-play reason, if any. |
| jersey_num | character | Jersey number. |
| minutes | character | Minutes played (`MM:SS`). |
| field_goals_made | integer | Field goals made. |
| field_goals_attempted | integer | Field goals attempted. |
| field_goals_percentage | numeric | Field goal percentage (0-1). |
| three_pointers_made | integer | Three-pointers made. |
| three_pointers_attempted | integer | Three-pointers attempted. |
| three_pointers_percentage | numeric | Three-point percentage (0-1). |
| free_throws_made | integer | Free throws made. |
| free_throws_attempted | integer | Free throws attempted. |
| free_throws_percentage | numeric | Free throw percentage (0-1). |
| rebounds_offensive | integer | Offensive rebounds. |
| rebounds_defensive | integer | Defensive rebounds. |
| rebounds_total | integer | Total rebounds. |
| assists | integer | Assists. |
| steals | integer | Steals. |
| blocks | integer | Blocks. |
| turnovers | integer | Turnovers. |
| fouls_personal | integer | Personal fouls. |
| points | integer | Points. |
| plus_minus_points | numeric | Plus/minus while on court. |
| game_id | character | Unique game identifier (10-digit, zero-padded). |
| season | integer | Season identifier (4-digit year). |

`load_wnba_stats_team_boxscores()` returns a `wehoop_data` tibble with
one row per team per game: `team_id`, `team_name`, `team_tricode`,
`side`, `minutes`, the same shooting, rebounding and counting columns
from `field_goals_made` through `plus_minus_points`, `game_id` and
`season`.

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_game_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_lineups.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_metric_curves()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_metric_curves.md),
[`load_wnba_stats_rolling_windows()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rolling_windows.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_player_boxscores(seasons = 2026))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 8,539 × 34
#>     team_id team_name team_tricode side  person_id first_name family_name name_i
#>       <int> <chr>     <chr>        <chr>     <int> <chr>      <chr>       <chr> 
#>  1   1.61e9 Liberty   NYL          home     204335 Betnijah   Laney-Hami… B. La…
#>  2   1.61e9 Liberty   NYL          home    1627668 Breanna    Stewart     B. St…
#>  3   1.61e9 Liberty   NYL          home    1627673 Jonquel    Jones       J. Jo…
#>  4   1.61e9 Liberty   NYL          home    1629546 Marine     Johannes    M. Jo…
#>  5   1.61e9 Liberty   NYL          home    1631136 Pauline    Astier      P. As…
#>  6   1.61e9 Liberty   NYL          home    1629566 Xu         Han         Han   
#>  7   1.61e9 Liberty   NYL          home     203822 Rebekah    Gardner     R. Ga…
#>  8   1.61e9 Liberty   NYL          home    1642210 Julie      Vanloo      J. Va…
#>  9   1.61e9 Liberty   NYL          home    1642826 Aubrey     Griffin     A. Gr…
#> 10   1.61e9 Liberty   NYL          home     204296 Rebecca    Allen       R. Al…
#> # ℹ 8,529 more rows
#> # ℹ 26 more variables: player_slug <chr>, position <chr>, comment <chr>,
#> #   jersey_num <chr>, minutes <chr>, field_goals_made <int>,
#> #   field_goals_attempted <int>, field_goals_percentage <dbl>,
#> #   three_pointers_made <int>, three_pointers_attempted <int>,
#> #   three_pointers_percentage <dbl>, free_throws_made <int>,
#> #   free_throws_attempted <int>, free_throws_percentage <dbl>, …
  try(load_wnba_stats_team_boxscores(seasons = 2026))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 704 × 26
#>       team_id team_name team_tricode side  minutes field_goals_made
#>         <int> <chr>     <chr>        <chr> <chr>              <int>
#>  1 1611661313 Liberty   NYL          home  200:00                35
#>  2 1611661323 Sun       CON          away  200:00                32
#>  3 1611661332 Tempo     TOR          home  200:00                17
#>  4 1611661322 Mystics   WAS          away  200:00                25
#>  5 1611661328 Storm     SEA          home  200:00                26
#>  6 1611661331 Valkyries GSV          away  200:00                31
#>  7 1611661325 Fever     IND          home  200:00                40
#>  8 1611661321 Wings     DAL          away  200:00                39
#>  9 1611661319 Aces      LVA          home  200:00                29
#> 10 1611661317 Mercury   PHX          away  200:00                38
#> # ℹ 694 more rows
#> # ℹ 20 more variables: field_goals_attempted <int>,
#> #   field_goals_percentage <dbl>, three_pointers_made <int>,
#> #   three_pointers_attempted <int>, three_pointers_percentage <dbl>,
#> #   free_throws_made <int>, free_throws_attempted <int>,
#> #   free_throws_percentage <dbl>, rebounds_offensive <int>,
#> #   rebounds_defensive <int>, rebounds_total <int>, assists <int>, …
# }
```

# Get women's college basketball AP and Coaches poll rankings

Get women's college basketball AP and Coaches poll rankings

## Usage

``` r
espn_wbb_rankings()
```

## Value

Returns a tibble

|                          |           |
|--------------------------|-----------|
| col_name                 | types     |
| id                       | integer   |
| name                     | character |
| short_name               | character |
| type                     | character |
| headline                 | character |
| short_headline           | character |
| current                  | integer   |
| previous                 | integer   |
| points                   | numeric   |
| first_place_votes        | integer   |
| trend                    | character |
| date                     | character |
| last_updated             | character |
| record_summary           | character |
| team_id                  | integer   |
| team_uid                 | character |
| team_location            | character |
| team_name                | character |
| team_nickname            | character |
| team_abbreviation        | character |
| team_color               | character |
| team_logo                | character |
| occurrence_number        | integer   |
| occurrence_type          | character |
| occurrence_last          | logical   |
| occurrence_value         | character |
| occurrence_display_value | character |
| season_year              | integer   |
| season_start_date        | character |
| season_end_date          | character |
| season_display_name      | character |
| season_type_type         | integer   |
| season_type_name         | character |
| season_type_abbreviation | character |
| first_occurrence_type    | character |
| first_occurrence_value   | character |

## See also

Other ESPN WBB Functions:
[`espn_wbb_conferences()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_conferences.md),
[`espn_wbb_game_all()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_all.md),
[`espn_wbb_game_rosters()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_rosters.md),
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md),
[`espn_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_box.md),
[`espn_wbb_player_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_stats.md),
[`espn_wbb_scoreboard()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_scoreboard.md),
[`espn_wbb_standings()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_standings.md),
[`espn_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_box.md),
[`espn_wbb_team_stats()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_stats.md),
[`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)

## Author

Saiem Gilani

## Examples

``` r
# Get current AP and Coaches Poll rankings
# \donttest{
  try(espn_wbb_rankings())
#> ── ESPN WBB Rankings Information from ESPN.com ───────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-04-14 04:27:16 UTC
#> # A tibble: 79 × 38
#>       id name   short_name type  headline short_headline current previous points
#>    <int> <chr>  <chr>      <chr> <chr>    <chr>            <int>    <int>  <dbl>
#>  1     1 AP To… AP Poll    ap    2026 NC… 2026 : Week 3        1        2    775
#>  2     1 AP To… AP Poll    ap    2026 NC… 2026 : Week 3        2        4    739
#>  3     1 AP To… AP Poll    ap    2026 NC… 2026 : Week 3        3        1    704
#>  4     1 AP To… AP Poll    ap    2026 NC… 2026 : Week 3        4        3    696
#>  5     1 AP To… AP Poll    ap    2026 NC… 2026 : Week 3        5        8    641
#>  6     1 AP To… AP Poll    ap    2026 NC… 2026 : Week 3        6       14    582
#>  7     1 AP To… AP Poll    ap    2026 NC… 2026 : Week 3        7        9    578
#>  8     1 AP To… AP Poll    ap    2026 NC… 2026 : Week 3        8        5    540
#>  9     1 AP To… AP Poll    ap    2026 NC… 2026 : Week 3        9       22    524
#> 10     1 AP To… AP Poll    ap    2026 NC… 2026 : Week 3       10        6    518
#> # ℹ 69 more rows
#> # ℹ 29 more variables: first_place_votes <int>, trend <chr>, date <chr>,
#> #   last_updated <chr>, record_summary <chr>, team_id <int>, team_uid <chr>,
#> #   team_location <chr>, team_name <chr>, team_nickname <chr>,
#> #   team_abbreviation <chr>, team_color <chr>, team_logos <list>,
#> #   team_logo <chr>, occurrence_number <int>, occurrence_type <chr>,
#> #   occurrence_last <lgl>, occurrence_value <chr>, …
# }
```

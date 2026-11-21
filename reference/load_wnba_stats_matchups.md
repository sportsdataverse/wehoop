# **Load wehoop WNBA Stats player matchups**

Loads the `wnba_stats_matchups` release tag: one row per (offensive
player, defensive player) pair per season, season type and per mode,
with the offensive player's production while matched up against that
defender.The regular-season rows are stats.wnba.com's
`leagueseasonmatchups` table. stats.wnba.com serves no playoff rows for
that endpoint, so the playoffs rows are the season's playoff games'
`boxscorematchupsv3` matchups summed into the same columns (summing the
regular-season games the same way reproduces the official table).

Coverage follows what stats.wnba.com publishes: 2023 onward, with no
2026 playoffs. Its matchup data is missing some games – 111 of the 330
2026 regular-season games, and about 90 of the 240 in 2023 – so those
seasons' totals undercount.

`matchup_min` is `"MM:SS"` text in `totals` rows and decimal minutes in
`pergame` rows, so reading both per modes makes it character. Pass one
`per_mode` to keep the native types.

`load_wnba_stats_matchups_manifest()` returns the per-season manifest
CSV (`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for
the `wnba_stats_matchups` release tag without downloading any season's
full data.

## Usage

``` r
load_wnba_stats_matchups(
  seasons = most_recent_wnba_stats_season(),
  season_type = NULL,
  per_mode = NULL,
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_matchups_manifest()
```

## Source

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_stats_matchups>,
published by
<https://github.com/sportsdataverse/wehoop-wnba-stats-data>.

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons.
  Published coverage runs 2023 through the most recent season. Pass
  `seasons = TRUE` for every published season. (Min: 2023)

- season_type:

  `"regular-season"` and/or `"playoffs"`; `NULL` (the default) reads
  both.

- per_mode:

  `"totals"` and/or `"pergame"`; `NULL` (the default) reads both.

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

Returns a `wehoop_data` tibble with one row per matchup pair per season
type per per mode. In `pergame` rows the counting columns are per-game
averages.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season_id | character | Season-type digit (2 regular season, 4 playoffs) followed by the season, e.g. '22025'. |
| off_player_id | integer | WNBA Stats id of the offensive player. |
| off_player_name | character | Offensive player's name. |
| def_player_id | integer | WNBA Stats id of the defender. |
| def_player_name | character | Defender's name. |
| gp | integer | Games in which the pair was matched up. |
| matchup_min | character | Time matched up: 'MM:SS' in totals rows, decimal minutes per game in pergame rows. |
| partial_poss | numeric | Possessions matched up, counting the matched-up share of each possession. |
| player_pts | integer | Points the offensive player scored while matched up. |
| team_pts | integer | Points the offensive player's team scored while matched up. |
| matchup_ast | integer | Assists by the offensive player while matched up. |
| matchup_tov | integer | Turnovers by the offensive player while matched up. |
| matchup_blk | integer | Offensive player's shots the defender blocked. |
| matchup_fgm | integer | Field goals the offensive player made while matched up. |
| matchup_fga | integer | Field goals the offensive player attempted while matched up. |
| matchup_fg_pct | numeric | matchup_fgm / matchup_fga (0 when no attempts). |
| matchup_fg3_m | integer | Three-pointers the offensive player made while matched up. |
| matchup_fg3_a | integer | Three-pointers the offensive player attempted while matched up. |
| matchup_fg3_pct | numeric | matchup_fg3_m / matchup_fg3_a (0 when no attempts). |
| help_blk | integer | Help-defense blocks (0 in every published row). |
| help_fgm | integer | Field goals made against help defense (0 in every published row). |
| help_fga | integer | Field goals attempted against help defense (0 in every published row). |
| help_fg_perc | integer | help_fgm / help_fga (0 in every published row). |
| matchup_ftm | integer | Free throws the offensive player made while matched up. |
| matchup_fta | integer | Free throws the offensive player attempted while matched up. |
| sfl | integer | Shooting fouls the defender committed on the offensive player. |
| matchup_time_sec | numeric | Seconds matched up (totals rows only; NA in pergame rows). |
| season | integer | Season (4-digit year). |
| season_type | character | 'regular-season' or 'playoffs'. |
| per_mode | character | 'totals' or 'pergame'. |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_game_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_lineups.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_metric_curves()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_metric_curves.md),
[`load_wnba_stats_player_boxscores()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_boxscores.md),
[`load_wnba_stats_rolling_windows()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rolling_windows.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_matchups(seasons = 2025, season_type = "playoffs",
                               per_mode = "totals"))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 1,267 × 30
#>    season_id off_player_id off_player_name def_player_id def_player_name      gp
#>    <chr>             <int> <chr>                   <int> <chr>             <int>
#>  1 42025            201886 DeWanna Bonner         203416 Emma Meesseman        3
#>  2 42025            201886 DeWanna Bonner         203825 Kayla McBride         4
#>  3 42025            201886 DeWanna Bonner         203833 Chelsea Gray          4
#>  4 42025            201886 DeWanna Bonner         204319 Jewell Loyd           4
#>  5 42025            201886 DeWanna Bonner         204330 Isabelle Harrison     1
#>  6 42025            201886 DeWanna Bonner         204333 Natasha Cloud         3
#>  7 42025            201886 DeWanna Bonner        1627668 Breanna Stewart       3
#>  8 42025            201886 DeWanna Bonner        1627673 Jonquel Jones         3
#>  9 42025            201886 DeWanna Bonner        1627675 Courtney Williams     4
#> 10 42025            201886 DeWanna Bonner        1628926 Maria Kliundikova     4
#> # ℹ 1,257 more rows
#> # ℹ 24 more variables: matchup_min <chr>, partial_poss <dbl>, player_pts <int>,
#> #   team_pts <int>, matchup_ast <int>, matchup_tov <int>, matchup_blk <int>,
#> #   matchup_fgm <int>, matchup_fga <int>, matchup_fg_pct <dbl>,
#> #   matchup_fg3_m <int>, matchup_fg3_a <int>, matchup_fg3_pct <dbl>,
#> #   help_blk <int>, help_fgm <int>, help_fga <int>, help_fg_perc <int>,
#> #   matchup_ftm <int>, matchup_fta <int>, sfl <int>, matchup_time_sec <dbl>, …
# }
```

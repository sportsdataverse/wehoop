# **Load NCAA women's college basketball advanced player box scores from the data repo**

Loads advanced per-player, per-game box scores for NCAA women's college
basketball – one row per player-game, with shooting splits by zone
(rim/mid/3), transition and half-court splits, assisted-vs-unassisted
splits, and shot-zone efficiency rates. A superset of the traditional
box score (points/rebounds/assists/steals/blocks/turnovers/fouls are
included alongside the advanced splits). Produced by the sdv-py
`ncaa_wbb` engine; backed by the `ncaa-wbb-hoops-data` pipeline,
published to the `ncaa_wbb_player_box` release tag as
csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_player_box(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit season-ending years for NCAA women's college
  basketball (e.g. `2024` for the 2023-24 season). Published coverage
  runs 2010 through the most recent season, with no gaps. Pass
  `seasons = TRUE` for every published season. (Min: 2010)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

Returns a `wehoop_data` tibble with one row per player-game.

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_date | character | Date the game was played (MM/DD/YYYY). |
| home | character | Home team name. |
| away | character | Away team name. |
| team | character | Team name. |
| player | character | Player name (raw, upper-cased). |
| mins | numeric | Minutes played. |
| o_poss | numeric | Offensive possessions played. |
| pts | numeric | Points scored. |
| orb | numeric | Offensive rebounds. |
| drb | numeric | Defensive rebounds. |
| ast | numeric | Assists. |
| stl | numeric | Steals. |
| blk | numeric | Blocks. |
| tov | numeric | Turnovers. |
| pf | numeric | Personal fouls. |
| ts_pct | numeric | True shooting percentage. |
| efg_pct | numeric | Effective field goal percentage. |
| fgm | numeric | Field goals made by the lineup. |
| fga | numeric | Field goal attempts by the lineup. |
| fg_pct | numeric | Field goal percentage. |
| tpm | numeric | 3-point field goals made. |
| tpa | numeric | 3-point field goal attempts. |
| tp_pct | numeric | 3-point field goal percentage. |
| ftm | numeric | Free throws made by the lineup. |
| fta | numeric | Free throw attempts by the lineup. |
| ft_pct | numeric | Free throw percentage. |
| rimm | numeric | Rim-area shots made. |
| rima | numeric | Rim-area shot attempts. |
| rim_pct | numeric | Rim-area field goal percentage. |
| midm | numeric | Mid-range shots made. |
| mida | numeric | Mid-range shot attempts. |
| mid_pct | numeric | Mid-range field goal percentage. |
| pbackm | numeric | Post/back-to-basket shots made. |
| pbacka | numeric | Post/back-to-basket attempts. |
| pback_pct | numeric | Post/back-to-basket shooting percentage. |
| blk_rim | numeric | Blocked shots at the rim. |
| blk_mid | numeric | Blocked mid-range shots. |
| blk_three | numeric | Blocked 3-point attempts. |
| pct_fga_trans | numeric | Share of field goal attempts taken in transition. |
| pct_tpa_trans | numeric | Share of 3-point attempts taken in transition. |
| pct_rima_trans | numeric | Share of rim-area attempts taken in transition. |
| pct_fgm_trans | numeric | Share of field goals made in transition. |
| pct_tpm_trans | numeric | Share of 3-pointers made in transition. |
| pct_rimm_trans | numeric | Share of rim-area shots made in transition. |
| pct_fgm_ast | numeric | Share of field goals made that were assisted. |
| pct_tpm_ast | numeric | Share of 3-pointers made that were assisted. |
| pct_rimm_ast | numeric | Share of rim-area shots made that were assisted. |
| pts_trans | numeric | Points scored in transition. |
| orb_trans | numeric | Offensive rebounds in transition possessions. |
| drb_trans | numeric | Defensive rebounds in transition possessions. |
| ast_trans | numeric | Assists in transition possessions. |
| stl_trans | numeric | Steals in transition possessions. |
| blk_trans | numeric | Blocks in transition possessions. |
| tov_trans | numeric | Turnovers in transition possessions. |
| ts_pct_trans | numeric | True shooting percentage in transition possessions. |
| efg_pct_trans | numeric | Effective field goal percentage in transition possessions. |
| fgm_trans | numeric | Field goals made in transition possessions. |
| fga_trans | numeric | Field goal attempts in transition possessions. |
| fg_pct_trans | numeric | Field goal percentage in transition possessions. |
| tpm_trans | numeric | 3-point field goals made in transition possessions. |
| tpa_trans | numeric | 3-point field goal attempts in transition possessions. |
| tp_pct_trans | numeric | 3-point field goal percentage in transition possessions. |
| ftm_trans | numeric | Free throws made in transition possessions. |
| fta_trans | numeric | Free throw attempts in transition possessions. |
| ft_pct_trans | numeric | Free throw percentage in transition possessions. |
| rimm_trans | numeric | Rim-area shots made in transition possessions. |
| rima_trans | numeric | Rim-area shot attempts in transition possessions. |
| rim_pct_trans | numeric | Rim-area field goal percentage in transition possessions. |
| midm_trans | numeric | Mid-range shots made in transition possessions. |
| mida_trans | numeric | Mid-range shot attempts in transition possessions. |
| mid_pct_trans | numeric | Mid-range field goal percentage in transition possessions. |
| pts_half | numeric | Points scored in half-court possessions. |
| orb_half | numeric | Offensive rebounds in half-court possessions. |
| drb_half | numeric | Defensive rebounds in half-court possessions. |
| ast_half | numeric | Assists in half-court possessions. |
| stl_half | numeric | Steals in half-court possessions. |
| blk_half | numeric | Blocks in half-court possessions. |
| tov_half | numeric | Turnovers in half-court possessions. |
| ts_pct_half | numeric | True shooting percentage in half-court possessions. |
| efg_pct_half | numeric | Effective field goal percentage in half-court possessions. |
| fgm_half | numeric | Field goals made in half-court possessions. |
| fga_half | numeric | Field goal attempts in half-court possessions. |
| fg_pct_half | numeric | Field goal percentage in half-court possessions. |
| tpm_half | numeric | 3-point field goals made in half-court possessions. |
| tpa_half | numeric | 3-point field goal attempts in half-court possessions. |
| tp_pct_half | numeric | 3-point field goal percentage in half-court possessions. |
| ftm_half | numeric | Free throws made in half-court possessions. |
| fta_half | numeric | Free throw attempts in half-court possessions. |
| ft_pct_half | numeric | Free throw percentage in half-court possessions. |
| rimm_half | numeric | Rim-area shots made in half-court possessions. |
| rima_half | numeric | Rim-area shot attempts in half-court possessions. |
| rim_pct_half | numeric | Rim-area field goal percentage in half-court possessions. |
| midm_half | numeric | Mid-range shots made in half-court possessions. |
| mida_half | numeric | Mid-range shot attempts in half-court possessions. |
| mid_pct_half | numeric | Mid-range field goal percentage in half-court possessions. |
| pts_ast | numeric | Points scored off an assisted make. |
| fgm_ast | numeric | Field goals made that came off an assist. |
| tpm_ast | numeric | 3-point field goals made that came off an assist. |
| rimm_ast | numeric | Rim-area shots made that came off an assist. |
| midm_ast | numeric | Mid-range shots made that came off an assist. |
| pts_unast | numeric | Points scored off an unassisted make. |
| efg_pct_unast | numeric | Effective field goal percentage that were unassisted. |
| fgm_unast | numeric | Field goals made that were unassisted. |
| fga_unast | numeric | Field goal attempts that were unassisted. |
| fg_pct_unast | numeric | Field goal percentage that were unassisted. |
| tpm_unast | numeric | 3-point field goals made that were unassisted. |
| tpa_unast | numeric | 3-point field goal attempts that were unassisted. |
| tp_pct_unast | numeric | 3-point field goal percentage that were unassisted. |
| rimm_unast | numeric | Rim-area shots made that were unassisted. |
| rima_unast | numeric | Rim-area shot attempts that were unassisted. |
| rim_pct_unast | numeric | Rim-area field goal percentage that were unassisted. |
| midm_unast | numeric | Mid-range shots made that were unassisted. |
| mida_unast | numeric | Mid-range shot attempts that were unassisted. |
| mid_pct_unast | numeric | Mid-range field goal percentage that were unassisted. |
| contest_id | character | Unique stats.ncaa.org contest identifier. |
| home_ncaa_team_id | character | stats.ncaa.org team identifier for the home team. |
| home_espn_team_id | character | ESPN team identifier for the home team. |
| away_ncaa_team_id | character | stats.ncaa.org team identifier for the away team. |
| away_espn_team_id | character | ESPN team identifier for the away team. |
| team_ncaa_team_id | character | stats.ncaa.org team identifier. |
| team_espn_team_id | character | ESPN team identifier. |
| player_id | character | stats.ncaa.org player identifier. |
| clean_name | character | Cleaned/title-cased display name. |
| espn_game_id | character | ESPN game identifier crosswalked to this contest. |
| season | integer | Season identifier (4-digit season-ending year). |

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md),
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_matchup_stints.md),
[`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_pbp.md),
[`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_possessions.md),
[`load_ncaa_wbb_rapm()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm.md),
[`load_ncaa_wbb_rapm_within_team()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm_within_team.md),
[`load_ncaa_wbb_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rosters.md),
[`load_ncaa_wbb_schedule()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_schedule.md),
[`load_ncaa_wbb_shots()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_shots.md),
[`load_ncaa_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_box.md),
[`load_ncaa_wbb_team_ids()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_ids.md),
[`load_ncaa_wbb_team_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_rosters.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_ncaa_wbb_player_box(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 121,918 × 125
#>    game_date home  away  team  player  mins o_poss   pts   orb   drb   ast   stl
#>    <chr>     <chr> <chr> <chr> <chr>  <dbl>  <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1 11/03/20… Geor… Dist… Dist… AIYAN…  34.8     60     4     1     2     1     1
#>  2 11/03/20… Geor… Dist… Dist… CALIS…  26.5     47     8     1     1     0     0
#>  3 11/03/20… Geor… Dist… Dist… DASHA…  27.2     46    10     0     1     1     1
#>  4 11/03/20… Geor… Dist… Dist… KRIST…  33.0     55     6     1     1     4     0
#>  5 11/03/20… Geor… Dist… Dist… LEASI…  29.7     53     6     2     4     0     0
#>  6 11/03/20… Geor… Dist… Dist… MAYA.…  31.6     52    10     0     2     1     0
#>  7 11/03/20… Geor… Dist… Dist… NHAIK…  16.6     27     3     1     0     1     1
#>  8 11/03/20… Geor… Dist… Geor… CAIA.…   6.7     11     2     0     3     0     0
#>  9 11/03/20… Geor… Dist… Geor… COLLE…  22.7     41    18     3     2     2     0
#> 10 11/03/20… Geor… Dist… Geor… EMMA.…  18.3     36    10     0     3     2     0
#> # ℹ 121,908 more rows
#> # ℹ 113 more variables: blk <dbl>, tov <dbl>, pf <dbl>, ts_pct <dbl>,
#> #   efg_pct <dbl>, fgm <dbl>, fga <dbl>, fg_pct <dbl>, tpm <dbl>, tpa <dbl>,
#> #   tp_pct <dbl>, ftm <dbl>, fta <dbl>, ft_pct <dbl>, rimm <dbl>, rima <dbl>,
#> #   rim_pct <dbl>, midm <dbl>, mida <dbl>, mid_pct <dbl>, pbackm <dbl>,
#> #   pbacka <dbl>, pback_pct <dbl>, blk_rim <dbl>, blk_mid <dbl>,
#> #   blk_three <dbl>, pct_fga_trans <dbl>, pct_tpa_trans <dbl>, …
# }
```

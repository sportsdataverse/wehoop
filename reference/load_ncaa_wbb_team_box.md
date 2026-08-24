# **Load NCAA women's college basketball advanced team box scores from the data repo**

Loads advanced per-team, per-game box scores for NCAA women's college
basketball – one row per team-game, with offensive/defensive ratings,
shot-zone rates and efficiency (rim/mid/3), rebounding/assist/turnover
rates, and the matching opponent (`d_*`) splits. Produced by the sdv-py
`ncaa_wbb` engine; backed by the `ncaa-wbb-hoops-data` pipeline,
published to the `ncaa_wbb_team_box` release tag as csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_team_box(
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

Returns a `wehoop_data` tibble with one row per team-game.

|  |  |  |
|----|----|----|
| col_name | types | description |
| home | character | Home team name. |
| away | character | Away team name. |
| team | character | Team name. |
| mins | numeric | Minutes played. |
| o_mins | numeric | Minutes with the team on offense. |
| d_mins | numeric | Minutes with the team on defense. |
| o_poss | numeric | Offensive possessions played. |
| d_poss | numeric | Defensive possessions played. |
| ortg | numeric | Offensive rating (points per 100 possessions). |
| drtg | numeric | Defensive rating (points allowed per 100 possessions). |
| netrtg | numeric | Net rating (ortg minus drtg). |
| pts | numeric | Points scored. |
| d_pts | numeric | Points allowed. |
| fga | numeric | Field goal attempts by the lineup. |
| d_fga | numeric | Opponent field goal attempts. |
| fgm | numeric | Field goals made by the lineup. |
| d_fgm | numeric | Opponent field goals made. |
| tpa | numeric | 3-point field goal attempts. |
| d_tpa | numeric | Opponent 3-point attempts. |
| tpm | numeric | 3-point field goals made. |
| d_tpm | numeric | Opponent 3-pointers made. |
| fta | numeric | Free throw attempts by the lineup. |
| d_fta | numeric | Opponent free throw attempts. |
| ftm | numeric | Free throws made by the lineup. |
| d_ftm | numeric | Opponent free throws made. |
| rima | numeric | Rim-area shot attempts. |
| d_rima | numeric | Opponent rim-area attempts. |
| rimm | numeric | Rim-area shots made. |
| d_rimm | numeric | Opponent rim-area shots made. |
| orb | numeric | Offensive rebounds. |
| d_orb | numeric | Opponent offensive rebounds. |
| drb | numeric | Defensive rebounds. |
| d_drb | numeric | Opponent defensive rebounds. |
| blk | numeric | Blocks. |
| d_blk | numeric | Opponent blocks. |
| to | numeric | Turnovers by the lineup. |
| d_to | numeric | Opponent turnovers. |
| ast | numeric | Assists. |
| d_ast | numeric | Opponent assists. |
| e_poss | numeric | Estimated possessions (alternate possession estimator). |
| fg_pct | numeric | Field goal percentage. |
| d_fg_pct | numeric | Opponent field goal percentage. |
| tpp | numeric | 3-point field goal percentage. |
| d_tpp | numeric | Opponent 3-point percentage. |
| ftp | numeric | Free throw percentage. |
| d_ftp | numeric | Opponent free throw percentage. |
| efg_pct | numeric | Effective field goal percentage. |
| d_efg_pct | numeric | Opponent effective field goal percentage. |
| ts_pct | numeric | True shooting percentage. |
| d_ts_pct | numeric | Opponent true shooting percentage. |
| rim_pct | numeric | Rim-area field goal percentage. |
| d_rim_pct | numeric | Opponent rim-area field goal percentage. |
| mid_pct | numeric | Mid-range field goal percentage. |
| d_mid_pct | numeric | Opponent mid-range field goal percentage. |
| tp_rate | numeric | Share of shot attempts taken from 3-point range. |
| d_tp_rate | numeric | Opponent share of shot attempts from 3-point range. |
| rim_rate | numeric | Share of shot attempts taken at the rim. |
| d_rim_rate | numeric | Opponent share of shot attempts at the rim. |
| mid_rate | numeric | Share of shot attempts taken mid-range. |
| d_mid_rate | numeric | Opponent share of shot attempts mid-range. |
| ft_rate | numeric | Free throw rate (FTA per FGA). |
| d_ft_rate | numeric | Opponent free throw rate. |
| ast_rate | numeric | Assist rate. |
| d_ast_rate | numeric | Opponent assist rate. |
| to_rate | numeric | Turnover rate. |
| d_to_rate | numeric | Opponent turnover rate. |
| blk_rate | numeric | Block rate. |
| o_blk_rate | numeric | Offensive possessions ending in a block allowed, as a rate. |
| orb_pct | numeric | Offensive rebound percentage. |
| drb_pct | numeric | Defensive rebound percentage. |
| time_per_poss | numeric | Average seconds per possession. |
| d_time_per_poss | numeric | Opponent average seconds per possession. |
| contest_id | character | Unique stats.ncaa.org contest identifier. |
| home_ncaa_team_id | character | stats.ncaa.org team identifier for the home team. |
| home_espn_team_id | character | ESPN team identifier for the home team. |
| away_ncaa_team_id | character | stats.ncaa.org team identifier for the away team. |
| away_espn_team_id | character | ESPN team identifier for the away team. |
| team_ncaa_team_id | character | stats.ncaa.org team identifier. |
| team_espn_team_id | character | ESPN team identifier. |
| espn_game_id | character | ESPN game identifier crosswalked to this contest. |
| season | integer | Season identifier (4-digit season-ending year). |

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_lineups()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md),
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_matchup_stints.md),
[`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_pbp.md),
[`load_ncaa_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_player_box.md),
[`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_possessions.md),
[`load_ncaa_wbb_rapm()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm.md),
[`load_ncaa_wbb_rapm_within_team()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rapm_within_team.md),
[`load_ncaa_wbb_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_rosters.md),
[`load_ncaa_wbb_schedule()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_schedule.md),
[`load_ncaa_wbb_shots()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_shots.md),
[`load_ncaa_wbb_team_ids()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_ids.md),
[`load_ncaa_wbb_team_rosters()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_team_rosters.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_ncaa_wbb_team_box(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 12,038 × 81
#>    home   away  team   mins o_mins d_mins o_poss d_poss  ortg  drtg netrtg   pts
#>    <chr>  <chr> <chr> <dbl>  <dbl>  <dbl>  <dbl>  <dbl> <dbl> <dbl>  <dbl> <dbl>
#>  1 Georg… Dist… Dist…  39.4   20.8   18.6     68     70  69.1 123.  -53.7     47
#>  2 Georg… Dist… Geor…  39.4   18.6   20.8     70     68 123.   69.1  53.7     86
#>  3 Temple Geor… Geor…  38.9   22.2   16.7     69     71  72.5 121.  -48.7     50
#>  4 Temple Geor… Temp…  38.9   16.7   22.2     71     69 121.   72.5  48.7     86
#>  5 Georg… Howa… Geor…  39.8   21.4   18.4     68     69  88.2  89.9  -1.62    60
#>  6 Georg… Howa… Howa…  39.8   18.4   21.4     69     68  89.9  88.2   1.62    62
#>  7 Longw… Geor… Geor…  39.8   19.4   20.4     76     76  81.6  93.4 -11.8     62
#>  8 Longw… Geor… Long…  39.8   20.4   19.4     76     76  93.4  81.6  11.8     71
#>  9 Georg… Geor… Geor…  38.7   20.0   18.7     69     71  72.5 111.  -38.8     50
#> 10 Georg… Geor… Geor…  38.7   18.7   20.0     71     69 111.   72.5  38.8     79
#> # ℹ 12,028 more rows
#> # ℹ 69 more variables: d_pts <dbl>, fga <dbl>, d_fga <dbl>, fgm <dbl>,
#> #   d_fgm <dbl>, tpa <dbl>, d_tpa <dbl>, tpm <dbl>, d_tpm <dbl>, fta <dbl>,
#> #   d_fta <dbl>, ftm <dbl>, d_ftm <dbl>, rima <dbl>, d_rima <dbl>, rimm <dbl>,
#> #   d_rimm <dbl>, orb <dbl>, d_orb <dbl>, drb <dbl>, d_drb <dbl>, blk <dbl>,
#> #   d_blk <dbl>, to <dbl>, d_to <dbl>, ast <dbl>, d_ast <dbl>, e_poss <dbl>,
#> #   fg_pct <dbl>, d_fg_pct <dbl>, tpp <dbl>, d_tpp <dbl>, ftp <dbl>, …
# }
```

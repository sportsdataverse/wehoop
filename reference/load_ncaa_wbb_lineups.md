# **Load NCAA women's college basketball 5-man lineup stints from the data repo**

Loads reconstructed 5-man lineup stints for NCAA women's college
basketball – one row per contiguous stretch a specific 5-player lineup
was on court for a team, with on/off scoring, shooting, and rebounding
splits plus the matching opponent (`opp_*`) splits. Produced by the
sdv-py `ncaa_wbb` engine's lineup reconstructor; backed by the
`ncaa-wbb-hoops-data` pipeline, published to the `ncaa_wbb_lineups`
release tag as csv.gz/parquet/rds.

## Usage

``` r
load_ncaa_wbb_lineups(
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

Returns a `wehoop_data` tibble with one row per lineup stint.

|  |  |  |
|----|----|----|
| col_name | types | description |
| lineup_key | character | Hash key uniquely identifying the 5-player lineup. |
| date | character | Game date/time (ISO 8601). |
| location_type | character | Home/away designation for `team` in this stint ('Home' or 'Away'). |
| team | character | Team name. |
| team_year | integer | Season-start calendar year for the stint. |
| opponent | character | Opponent team name. |
| lineup_id | character | Human-readable lineup identifier built from the five player codes. |
| start_min | numeric | Game-clock minute the lineup entered. |
| end_min | numeric | Game-clock minute the lineup exited. |
| duration_mins | numeric | Minutes the lineup was on court together. |
| player_1 | character | Lineup slot 1 player display name ('Last, First'). |
| player_2 | character | Lineup slot 2 player display name ('Last, First'). |
| player_3 | character | Lineup slot 3 player display name ('Last, First'). |
| player_4 | character | Lineup slot 4 player display name ('Last, First'). |
| player_5 | character | Lineup slot 5 player display name ('Last, First'). |
| players_in | character | Player(s) substituted into the lineup at the start of the stint. |
| players_out | character | Player(s) substituted out of the lineup at the start of the stint. |
| start_scored | integer | Team's points scored at the moment the lineup entered. |
| start_allowed | integer | Points allowed at the moment the lineup entered. |
| end_scored | integer | Team's points scored at the moment the lineup exited. |
| end_allowed | integer | Points allowed at the moment the lineup exited. |
| start_diff | integer | Score differential at the moment the lineup entered. |
| end_diff | integer | Score differential at the moment the lineup exited. |
| player_count_error | logical | Flag set when fewer/more than 5 players were reconstructed for the stint. |
| poss | integer | Possessions played by the lineup. |
| pts | integer | Points scored. |
| plus_minus | integer | Point differential while the lineup was on court. |
| fga | integer | Field goal attempts by the lineup. |
| fgm | integer | Field goals made by the lineup. |
| rima | integer | Rim-area shot attempts. |
| rimm | integer | Rim-area shots made. |
| rim_ast | integer | Rim-area makes that came off an assist. |
| mida | integer | Mid-range shot attempts. |
| midm | integer | Mid-range shots made. |
| mid_ast | integer | Mid-range makes that came off an assist. |
| fg2a | integer | 2-point field goal attempts by the lineup. |
| fg2m | integer | 2-point field goals made by the lineup. |
| tpa | integer | 3-point field goal attempts. |
| tpm | integer | 3-point field goals made. |
| tp_ast | integer | 3-pointers made that came off an assist. |
| fta | integer | Free throw attempts by the lineup. |
| ftm | integer | Free throws made by the lineup. |
| orb | integer | Offensive rebounds. |
| drb | integer | Defensive rebounds. |
| to | integer | Turnovers by the lineup. |
| stl | integer | Steals. |
| blk | integer | Blocks. |
| ast | integer | Assists. |
| foul | integer | Personal fouls. |
| opp_poss | integer | Opponent possessions while this lineup was on court. |
| opp_pts | integer | Opponent points scored while this lineup was on court. |
| opp_plus_minus | integer | Opponent point differential while this lineup was on court (negative of `plus_minus`). |
| opp_fga | integer | Opponent field goal attempts. |
| opp_fgm | integer | Opponent field goals made. |
| opp_rima | integer | Opponent rim-area shot attempts. |
| opp_rimm | integer | Opponent rim-area shots made. |
| opp_rim_ast | integer | Opponent rim-area makes that came off an assist. |
| opp_mida | integer | Opponent mid-range shot attempts. |
| opp_midm | integer | Opponent mid-range shots made. |
| opp_mid_ast | integer | Opponent mid-range makes that came off an assist. |
| opp_fg2a | integer | Opponent 2-point field goal attempts. |
| opp_fg2m | integer | Opponent 2-point field goals made. |
| opp_tpa | integer | Opponent 3-point field goal attempts. |
| opp_tpm | integer | Opponent 3-point field goals made. |
| opp_tp_ast | integer | Opponent 3-pointers made that came off an assist. |
| opp_fta | integer | Opponent free throw attempts. |
| opp_ftm | integer | Opponent free throws made. |
| opp_orb | integer | Opponent offensive rebounds. |
| opp_drb | integer | Opponent defensive rebounds. |
| opp_to | integer | Opponent turnovers. |
| opp_stl | integer | Opponent steals. |
| opp_blk | integer | Opponent blocks. |
| opp_ast | integer | Opponent assists. |
| opp_foul | integer | Opponent personal fouls. |
| stint_num | integer | Sequential stint number for this lineup within the game. |
| contest_id | character | Unique stats.ncaa.org contest identifier. |
| season | integer | Season identifier (4-digit season-ending year). |

## See also

Other NCAA WBB loader functions:
[`load_ncaa_wbb_matchup_stints()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_matchup_stints.md),
[`load_ncaa_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_pbp.md),
[`load_ncaa_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_player_box.md),
[`load_ncaa_wbb_possessions()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_possessions.md),
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
  try(load_ncaa_wbb_lineups(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 286,277 × 77
#>    lineup_key   date  location_type team  team_year opponent lineup_id start_min
#>    <chr>        <chr> <chr>         <chr>     <int> <chr>    <chr>         <dbl>
#>  1 df6fae292b6… 2025… Home          Geor…      2025 Dist. C… MiJames_…      0   
#>  2 2f2aac04c50… 2025… Home          Geor…      2025 Dist. C… CoPhiri_…     33.3 
#>  3 24edf54ac02… 2025… Home          Geor…      2025 Dist. C… CoPhiri_…     34.2 
#>  4 985e9726e60… 2025… Home          Geor…      2025 Dist. C… MiJames_…     34.6 
#>  5 f4de5f52ce5… 2025… Home          Geor…      2025 Dist. C… CoPhiri_…     36.9 
#>  6 e1c6a31d4f9… 2025… Home          Geor…      2025 Dist. C… CoPhiri_…      9.10
#>  7 b9749a2194c… 2025… Home          Geor…      2025 Dist. C… EmTheodo…     10   
#>  8 b00030feb96… 2025… Home          Geor…      2025 Dist. C… JaWilson…     12.4 
#>  9 f0274ff383f… 2025… Home          Geor…      2025 Dist. C… GaReynol…     14.5 
#> 10 893c7c14841… 2025… Home          Geor…      2025 Dist. C… CoPhiri_…     15.6 
#> # ℹ 286,267 more rows
#> # ℹ 69 more variables: end_min <dbl>, duration_mins <dbl>, player_1 <chr>,
#> #   player_2 <chr>, player_3 <chr>, player_4 <chr>, player_5 <chr>,
#> #   players_in <chr>, players_out <chr>, start_scored <int>,
#> #   start_allowed <int>, end_scored <int>, end_allowed <int>, start_diff <int>,
#> #   end_diff <int>, player_count_error <???>, poss <int>, pts <int>,
#> #   plus_minus <int>, fga <int>, fgm <int>, rima <int>, rimm <int>, …
# }
```

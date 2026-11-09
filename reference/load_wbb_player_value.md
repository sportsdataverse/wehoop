# **Load WNBA player-impact ratings (RAPM / SPM / BPM / DARKO) from the data repo**

Loads season-level WNBA player-impact ratings – one row per
player-team-season, combining regularized adjusted plus-minus (RAPM),
statistical plus-minus (SPM), box plus-minus (BPM), wins above
replacement (WAR), and a DARKO-style skill/projection pair. Produced by
the sportsdataverse-py NBA/WNBA possession-engine model program;
published to the `wnba_player_impact` release tag as csv/parquet/rds.

Loads season-level NCAA women's college basketball player-value ratings
– one row per player-team-season, with a box-score-derived
offensive/defensive/net box plus-minus (BPM). Coverage starts at 2014
(the earliest season with published box-score inputs of sufficient
quality for the model); this tag is parquet-only, with no csv/rds
sibling assets. Produced by the sportsdataverse-py NCAA WBB model
program; published to the `wbb_player_value` release tag.

Loads season-level NCAA women's college basketball team ratings – one
row per team-season, with adjusted (opponent-strength-normalized)
offensive/defensive efficiency, adjusted tempo, raw efficiency, and a
national rank. A KenPom-style adjusted-efficiency-margin rating. This
tag is parquet-only, with no csv/rds sibling assets. Produced by the
sportsdataverse-py NCAA WBB model program; published to the
`wbb_ratings` release tag.

## Usage

``` r
load_wnba_player_impact(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_player_value(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_ratings(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit seasons, or `TRUE` for every published season:
  1997 onward for `load_wnba_player_impact()` (WNBA seasons), 2014
  onward for `load_wbb_player_value()` and 2009 onward for
  `load_wbb_ratings()` (NCAA women's season-ending years, e.g. `2024`
  for 2023-24), with no gaps. The upper bound is
  [`most_recent_wnba_stats_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_stats_season.md)
  /
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).
  When `seasons` is left at its default and that season's file is not
  published yet, the loader reads the newest published season instead,
  with a message. An explicit request for an unpublished season is kept
  as asked: the read warns and returns an empty frame.

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

Returns a `wehoop_data` tibble with one row per player-team-season.

|  |  |  |
|----|----|----|
| col_name | types | description |
| player_id | integer | Unique WNBA Stats player identifier. |
| player_name | character | Player display name. |
| team_id | integer | Unique team identifier. |
| team_abbreviation | character | Team abbreviation. |
| team_name | character | Full team display name. |
| teams | character | Team abbreviation(s) the player appeared for this season. |
| season | integer | Season identifier (4-digit year). |
| season_type | character | Season portion (e.g. 'Regular Season'). |
| o_rapm | numeric | Offensive regularized adjusted plus-minus. |
| d_rapm | numeric | Defensive regularized adjusted plus-minus. |
| rapm | numeric | Net regularized adjusted plus-minus (o_rapm + d_rapm). |
| off_poss | integer | Offensive possessions used in the RAPM fit. |
| def_poss | integer | Defensive possessions used in the RAPM fit. |
| o_adj_rapm | numeric | Offensive RAPM adjusted for minutes/possession stability. |
| d_adj_rapm | numeric | Defensive RAPM adjusted for minutes/possession stability. |
| adj_rapm | numeric | Net adjusted RAPM (o_adj_rapm + d_adj_rapm). |
| ospm | numeric | Offensive statistical plus-minus (box-score component). |
| dspm | numeric | Defensive statistical plus-minus (box-score component). |
| spm | numeric | Net statistical plus-minus. |
| min | numeric | Minutes played. |
| gp | integer | Games played. |
| obpm | numeric | Offensive box plus-minus. |
| dbpm | numeric | Defensive box plus-minus. |
| bpm | numeric | Net box plus-minus. |
| war | numeric | Wins above replacement. |
| boban_filtered_skill | numeric | DARKO-style filtered skill rating. |
| boban_projected_rating | numeric | DARKO-style forward-looking projected rating. |
| boban_projected_sd | numeric | Standard deviation of the DARKO-style projected rating. |

Returns a `wehoop_data` tibble with one row per player-team-season.

|           |           |                                                     |
|-----------|-----------|-----------------------------------------------------|
| col_name  | types     | description                                         |
| player_id | character | stats.ncaa.org player identifier.                   |
| player    | character | Player display name (title-cased).                  |
| season    | integer   | Season identifier (4-digit season-ending year).     |
| team_id   | character | Unique team identifier.                             |
| min       | numeric   | Minutes played.                                     |
| box_obpm  | numeric   | Box-score offensive box plus-minus.                 |
| box_dbpm  | numeric   | Box-score defensive box plus-minus.                 |
| box_bpm   | numeric   | Box-score net box plus-minus (box_obpm + box_dbpm). |

Returns a `wehoop_data` tibble with one row per team-season.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit season-ending year). |
| team_id | character | Unique team identifier. |
| adj_o | numeric | Adjusted offensive efficiency (points per 100 possessions, opponent-adjusted). |
| adj_d | numeric | Adjusted defensive efficiency (points allowed per 100 possessions, opponent-adjusted). |
| adj_em | numeric | Adjusted efficiency margin (adj_o minus adj_d). |
| adj_tempo | numeric | Adjusted possessions per 40 minutes. |
| raw_o | numeric | Unadjusted (raw) offensive efficiency. |
| raw_d | numeric | Unadjusted (raw) defensive efficiency. |
| games | integer | Games played (season total). |
| rank | integer | National rank by adj_em. |
| adj_em_z | numeric | Z-score of adj_em relative to the season's team distribution. |

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_wnba_player_impact(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 329 × 76
#>    player_id player_name        team_id team_abbreviation team_name teams season
#>        <int> <chr>                <int> <chr>             <chr>     <chr>  <int>
#>  1    201886 DeWanna Bonner      1.61e9 PHX               Phoenix … PHX     2026
#>  2    202252 Alysha Clark        1.61e9 DAL               Dallas W… DAL     2026
#>  3    202664 Courtney Vandersl…  1.61e9 CHI               Chicago … CHI     2026
#>  4    203014 Nneka Ogwumike      1.61e9 LAS               Los Ange… LAS     2026
#>  5    203024 Damiris Dantas      1.61e9 IND               Indiana … IND     2026
#>  6    203026 Tiffany Hayes       1.61e9 GSV               Golden S… GSV     2026
#>  7    203398 Brittney Griner     1.61e9 CON               Connecti… CON     2026
#>  8    203400 Skylar Diggins      1.61e9 CHI               Chicago … CHI     2026
#>  9    203405 Kayla Alexander     1.61e9 TOR               Toronto … TOR     2026
#> 10    203822 Rebekah Gardner     1.61e9 NYL               New York… NYL     2026
#> # ℹ 319 more rows
#> # ℹ 69 more variables: season_type <chr>, o_rapm <dbl>, d_rapm <dbl>,
#> #   rapm <dbl>, off_poss <int>, def_poss <int>, o_adj_rapm <dbl>,
#> #   d_adj_rapm <dbl>, adj_rapm <dbl>, ospm <dbl>, dspm <dbl>, spm <dbl>,
#> #   min <dbl>, gp <int>, obpm <dbl>, dbpm <dbl>, bpm <dbl>, war <dbl>,
#> #   boban_filtered_skill <dbl>, boban_projected_rating <dbl>,
#> #   boban_projected_sd <dbl>, o_rapm_n <int>, d_rapm_n <int>, rapm_n <int>, …
# }
# \donttest{
  try(load_wbb_player_value(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 5,681 × 9
#>    player_id player     season team_id   min box_obpm box_dbpm box_bpm qualified
#>    <chr>     <chr>       <int> <chr>   <dbl>    <dbl>    <dbl>   <dbl> <lgl>    
#>  1 5314716   Addie Sch…   2027 2900        5     29.4    -8.37    21.1 FALSE    
#>  2 5313315   Kate Lipa…   2027 219        10     13.1     7.38    20.5 FALSE    
#>  3 5457760   Demi Gill…   2027 256         5     30.0   -10.1     20.0 FALSE    
#>  4 5456272   Ona Riope…   2027 356         2     25.8    -6.56    19.3 FALSE    
#>  5 5461420   Ava Jones    2027 219        13     26.1    -6.89    19.2 FALSE    
#>  6 5315658   Brianne B…   2027 147        21     26.8    -7.67    19.1 FALSE    
#>  7 5464732   Jada Vand…   2027 2304       12     31.9   -12.9     19.0 FALSE    
#>  8 5181733   Amaya Tho…   2027 2635        5     22.8    -4.07    18.8 FALSE    
#>  9 5178552   Julianna …   2027 2739        6     14.7     3.70    18.4 FALSE    
#> 10 5239680   Elsa Lemm…   2027 194        40     29.2   -11.4     17.8 FALSE    
#> # ℹ 5,671 more rows
# }
# \donttest{
  try(load_wbb_ratings(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 491 × 11
#>    season team_id adj_o adj_d adj_em adj_tempo raw_o raw_d games  rank adj_em_z
#>     <int> <chr>   <dbl> <dbl>  <dbl>     <dbl> <dbl> <dbl> <int> <int>    <dbl>
#>  1   2027 99       158.  35.8  122.       82.4  158.  35.1     2     1     3.00
#>  2   2027 2617     141.  42.6   98.6      96.3  141.  42.6     1     2     2.45
#>  3   2027 221      131.  37.0   94.5      81.0  121.  65.6     2     3     2.36
#>  4   2027 2603     132.  37.4   94.3      72.1  132.  37.4     1     4     2.35
#>  5   2027 43       128.  36.6   91.9      84.4  128.  36.6     2     5     2.29
#>  6   2027 97       126.  52.1   74.0      80.5  127.  50.7     2     6     1.87
#>  7   2027 127      117.  43.3   73.8      85.0  104.  66.9     2     7     1.87
#>  8   2027 2599     135.  62.8   72.4      70.7  139.  49.6     2     8     1.83
#>  9   2027 2441     125.  53.5   71.7      82.2  125.  53.5     1     9     1.82
#> 10   2027 130      137.  66.2   70.9      71.3  104.  89.4     1    10     1.80
#> # ℹ 481 more rows
# }
```

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

## Source

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_player_impact>

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wbb_player_value>

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wbb_ratings>

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
#> # A tibble: 6,932 × 9
#>    player_id player     season team_id   min box_obpm box_dbpm box_bpm qualified
#>    <chr>     <chr>       <int> <chr>   <dbl>    <dbl>    <dbl>   <dbl> <lgl>    
#>  1 5462084   Tessa Gla…   2027 113         5    29.8    -6.15     23.6 FALSE    
#>  2 5313315   Kate Lipa…   2027 219        10    13.1     7.38     20.5 FALSE    
#>  3 5174424   Sydney Ba…   2027 153        10     8.71   10.4      19.1 FALSE    
#>  4 5178552   Julianna …   2027 2739        6    14.7     3.70     18.4 FALSE    
#>  5 5466461   Gabby Wri…   2027 499        17    13.7     4.44     18.2 FALSE    
#>  6 5461420   Ava Jones    2027 219        21    19.7    -1.72     18.0 FALSE    
#>  7 5317767   Ana Vakan…   2027 589         2    20.2    -3.66     16.6 FALSE    
#>  8 5241042   Olivia Bo…   2027 2489       26    16.4     0.147    16.5 FALSE    
#>  9 5240291   Reina Gre…   2027 2599       12    12.9     3.28     16.2 FALSE    
#> 10 5459435   Le'Sedra …   2027 2460        7     7.20    8.91     16.1 FALSE    
#> # ℹ 6,922 more rows
# }
# \donttest{
  try(load_wbb_ratings(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 565 × 16
#>    season team_id adj_o adj_d adj_em adj_tempo raw_o raw_d games  rank adj_em_z
#>     <int> <chr>   <dbl> <dbl>  <dbl>     <dbl> <dbl> <dbl> <int> <int>    <dbl>
#>  1   2027 2579     134.  52.8   81.2      76.2  116.  78.6     6     1     2.46
#>  2   2027 30       143.  62.2   80.4      73.9  129.  81.2     5     2     2.44
#>  3   2027 99       127.  54.6   72.8      81.3  139.  49.5     6     3     2.25
#>  4   2027 251      132.  60.9   70.9      72.5  125.  73.6     6     4     2.20
#>  5   2027 130      130.  64.1   65.7      74.4  128.  63.3     5     5     2.07
#>  6   2027 356      130.  64.8   64.8      70.7  136.  63.6     4     6     2.04
#>  7   2027 120      130.  65.8   64.4      76.3  118.  74.2     5     7     2.03
#>  8   2027 26       120.  55.9   63.8      71.6  111.  67.1     6     8     2.02
#>  9   2027 41       124.  61.4   62.9      75.0  107.  80.9     6     9     2.00
#> 10   2027 96       125.  63.2   61.7      71.9  125.  65.0     6    10     1.97
#> # ℹ 555 more rows
#> # ℹ 5 more variables: adj_o_blend <dbl>, adj_d_blend <dbl>, adj_em_blend <dbl>,
#> #   rank_blend <int>, prior_games <dbl>
# }
```

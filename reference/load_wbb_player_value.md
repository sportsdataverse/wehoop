# **Load WNBA player-impact ratings (RAPM / SPM / BPM / DARKO) from the data repo**

Loads season-level WNBA player-impact ratings – one row per
player-team-season, combining regularized adjusted plus-minus (RAPM),
statistical plus-minus (SPM), box plus-minus (BPM), wins above
replacement (WAR), and a DARKO-style skill/projection pair. Produced by
the sdv-py NBA/WNBA possession-engine model program; published to the
`wnba_player_impact` release tag as csv/parquet/rds.

Loads season-level NCAA women's college basketball player-value ratings
– one row per player-team-season, with a box-score-derived
offensive/defensive/net box plus-minus (BPM). Coverage starts at 2014
(the earliest season with published box-score inputs of sufficient
quality for the model); this tag is parquet-only, with no csv/rds
sibling assets. Produced by the sdv-py NCAA WBB model program; published
to the `wbb_player_value` release tag.

Loads season-level NCAA women's college basketball team ratings – one
row per team-season, with adjusted (opponent-strength-normalized)
offensive/defensive efficiency, adjusted tempo, raw efficiency, and a
national rank. A KenPom-style adjusted-efficiency-margin rating. This
tag is parquet-only, with no csv/rds sibling assets. Produced by the
sdv-py NCAA WBB model program; published to the `wbb_ratings` release
tag.

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

  A vector of 4-digit season-ending years for NCAA women's college
  basketball. Published coverage runs 2008 through the most recent
  season, with no gaps. Pass `seasons = TRUE` for every published
  season. (Min: 2008)

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
| darko_filtered_skill | numeric | DARKO-style filtered skill rating. |
| darko_projected_rating | numeric | DARKO-style forward-looking projected rating. |
| darko_projected_sd | numeric | Standard deviation of the DARKO-style projected rating. |

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
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 221 × 28
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
#> # ℹ 211 more rows
#> # ℹ 21 more variables: season_type <chr>, o_rapm <dbl>, d_rapm <dbl>,
#> #   rapm <dbl>, off_poss <int>, def_poss <int>, o_adj_rapm <dbl>,
#> #   d_adj_rapm <dbl>, adj_rapm <dbl>, ospm <dbl>, dspm <dbl>, spm <dbl>,
#> #   min <dbl>, gp <int>, obpm <dbl>, dbpm <dbl>, bpm <dbl>, war <dbl>,
#> #   darko_filtered_skill <dbl>, darko_projected_rating <dbl>,
#> #   darko_projected_sd <dbl>
# }
# \donttest{
  try(load_wbb_player_value(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 8,305 × 8
#>    player_id player              season team_id   min box_obpm box_dbpm box_bpm
#>    <chr>     <chr>                <int> <chr>   <dbl>    <dbl>    <dbl>   <dbl>
#>  1 5318437   Claudia Ierullo       2026 215         7    22.3    -3.21     19.1
#>  2 5321613   Maggie Chambers       2026 2654        4    18.8    -0.261    18.5
#>  3 5312308   Gandy Malou-Mamel     2026 41          4    16.7     1.70     18.4
#>  4 5125264   Jana El Alfy          2026 41        402     6.70   11.4      18.1
#>  5 4682860   Kyla Oldacre          2026 251       830    10.4     7.54     17.9
#>  6 5317669   Abigail Wilson        2026 2880        4    22.3    -4.42     17.8
#>  7 5313314   Ari Paraskevopoulou   2026 219        13    11.8     6.00     17.8
#>  8 5318684   J'Nyria Kelly         2026 2170        2    24.4    -6.80     17.6
#>  9 5108587   Madina Okot           2026 2579      906    10.6     6.86     17.4
#> 10 5239592   Sarah Strong          2026 41       1044    15.8     1.61     17.4
#> # ℹ 8,295 more rows
# }
# \donttest{
  try(load_wbb_ratings(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 663 × 11
#>    season team_id adj_o adj_d adj_em adj_tempo raw_o raw_d games  rank adj_em_z
#>     <int> <chr>   <dbl> <dbl>  <dbl>     <dbl> <dbl> <dbl> <int> <int>    <dbl>
#>  1   2026 41       129.  58.1   71.2      72.9  119.  69.4    39     1     2.45
#>  2   2026 26       135.  63.9   71.1      68.2  122.  81.8    38     2     2.45
#>  3   2026 2579     131.  63.4   67.1      71.9  117.  79.5    40     3     2.35
#>  4   2026 251      127.  61.3   66.0      71.8  116.  77.7    39     4     2.32
#>  5   2026 99       131.  68.4   62.3      77.0  122.  79.1    35     5     2.23
#>  6   2026 130      120.  66.6   53.1      74.7  109.  83.3    35     6     2.00
#>  7   2026 150      116.  67.1   48.4      71.4  103.  83.5    36     7     1.89
#>  8   2026 238      124.  76.7   47.6      72.8  115.  89.1    34     8     1.87
#>  9   2026 135      118.  72.1   45.8      68.0  109.  86.3    33     9     1.82
#> 10   2026 97       120.  74.1   45.5      71.3  110.  85.7    37    10     1.82
#> # ℹ 653 more rows
# }
```

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
#> # A tibble: 6,258 × 9
#>    player_id player     season team_id   min box_obpm box_dbpm box_bpm qualified
#>    <chr>     <chr>       <int> <chr>   <dbl>    <dbl>    <dbl>   <dbl> <lgl>    
#>  1 5313315   Kate Lipa…   2027 219        10    13.1      7.38    20.5 FALSE    
#>  2 5242463   Kendra Hi…   2027 2440       10    13.5      6.34    19.9 FALSE    
#>  3 5456272   Ona Riope…   2027 356         2    25.8     -6.56    19.3 FALSE    
#>  4 5174424   Sydney Ba…   2027 153        10     8.71    10.4     19.1 FALSE    
#>  5 5178552   Julianna …   2027 2739        6    14.7      3.70    18.4 FALSE    
#>  6 5466461   Gabby Wri…   2027 499        17    13.7      4.44    18.2 FALSE    
#>  7 5457710   Sage Misk…   2027 2086       16    26.0     -8.59    17.5 FALSE    
#>  8 5315696   Valeria M…   2027 357        10     5.16    12.3     17.4 FALSE    
#>  9 5314716   Addie Sch…   2027 2900       14    21.7     -4.39    17.3 FALSE    
#> 10 5461420   Ava Jones    2027 219        15    18.8     -1.53    17.3 FALSE    
#> # ℹ 6,248 more rows
# }
# \donttest{
  try(load_wbb_ratings(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 525 × 11
#>    season team_id adj_o adj_d adj_em adj_tempo raw_o raw_d games  rank adj_em_z
#>     <int> <chr>   <dbl> <dbl>  <dbl>     <dbl> <dbl> <dbl> <int> <int>    <dbl>
#>  1   2027 2579     151.  49.7  101.       67.4  122.  85.0     2     1     2.66
#>  2   2027 30       153.  69.9   83.5      75.2  145.  67.8     3     2     2.24
#>  3   2027 344      118.  39.8   78.0      78.5  105.  60.0     3     3     2.11
#>  4   2027 120      136.  60.8   75.5      85.1  106.  99.8     2     4     2.05
#>  5   2027 96       132.  57.2   75.2      72.6  127.  62.3     4     5     2.04
#>  6   2027 356      134.  60.1   73.7      69.5  134.  56.4     2     6     2.01
#>  7   2027 87       132.  61.9   70.0      77.6  136.  73.8     3     7     1.92
#>  8   2027 238      132.  62.8   69.2      75.6  137.  67.6     4     8     1.90
#>  9   2027 201      135.  66.6   68.7      75.0  123.  67.9     3     9     1.89
#> 10   2027 258      131.  63.5   67.6      71.4  122.  72.1     4    10     1.86
#> # ℹ 515 more rows
# }
```

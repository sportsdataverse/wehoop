# **Load NCAA women's college basketball adjusted efficiency team ratings from the data repo**

Loads season-level NCAA women's college basketball team ratings – one
row per team-season, with adjusted (opponent-strength-normalized)
offensive/defensive efficiency, adjusted tempo, raw efficiency, and a
national rank. A KenPom-style adjusted-efficiency-margin rating. This
tag is parquet-only, with no csv/rds sibling assets. Produced by the
sdv-py NCAA WBB model program; published to the `wbb_ratings` release
tag.

## Usage

``` r
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

## See also

Other Model Dataset loader functions:
[`load_wbb_player_value()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_value.md),
[`load_wnba_player_impact()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_impact.md)

## Author

Saiem Gilani

## Examples

``` r
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

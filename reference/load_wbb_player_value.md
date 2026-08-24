# **Load NCAA women's college basketball player-value ratings (box BPM) from the data repo**

Loads season-level NCAA women's college basketball player-value ratings
– one row per player-team-season, with a box-score-derived
offensive/defensive/net box plus-minus (BPM). Coverage starts at 2014
(the earliest season with published box-score inputs of sufficient
quality for the model); this tag is parquet-only, with no csv/rds
sibling assets. Produced by the sdv-py NCAA WBB model program; published
to the `wbb_player_value` release tag.

## Usage

``` r
load_wbb_player_value(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit season-ending years for NCAA women's college
  basketball. Published coverage runs 2014 through the most recent
  season, with no gaps. Pass `seasons = TRUE` for every published
  season. (Min: 2014)

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

## See also

Other Model Dataset loader functions:
[`load_wbb_ratings()`](https://wehoop.sportsdataverse.org/reference/load_wbb_ratings.md),
[`load_wnba_player_impact()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_impact.md)

## Author

Saiem Gilani

## Examples

``` r
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
```

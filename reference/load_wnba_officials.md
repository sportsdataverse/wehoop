# **Load wehoop WNBA Officials**

`load_wnba_officials_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
officials release tag without downloading any season's full data.

Loads game-level officials data scraped from ESPN WNBA summary feeds.
One row per official-game pair. Backed by the `wehoop-wnba-data`
pipeline that reads raw JSONs from `wehoop-wnba-raw` and publishes
parquet/rds artifacts to the `espn_wnba_officials` release tag.

## Usage

``` r
load_wnba_officials_manifest()

load_wnba_officials(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2002)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the officials data table within the database

## Value

Returns a `wehoop_data` tibble with one row per official-game pair.

|  |  |  |
|----|----|----|
| col_name | types | description |
| game_id | character | Unique game identifier. |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| official_id | character | Unique official / referee identifier. |
| display_name | character | Display name. |
| full_name | character | Player's full name. |
| first_name | character | Player's first name. |
| last_name | character | Player's last name. |
| position | character | Listed roster position (G, F, C, etc.). |
| order | integer | Display order within the result set. |

## See also

Other WNBA loader functions:
[`load_wnba_draft_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_draft.md),
[`load_wnba_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_game_rosters.md),
[`load_wnba_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_stats.md),
[`load_wnba_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_rosters.md),
[`load_wnba_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_shots.md),
[`load_wnba_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_standings.md),
[`load_wnba_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_officials(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 214 × 11
#>    season game_id   official_id official_uid official_full_name    
#>     <int> <chr>           <int> <chr>        <chr>                 
#>  1   2026 401856890       52042 NA           Roy Gulbeyan          
#>  2   2026 401856890     3951614 NA           Ryan Sassano          
#>  3   2026 401856890     4236122 NA           Tyler Mirkovich       
#>  4   2026 401856891       52044 NA           Fatou Cissoko-Stephens
#>  5   2026 401856891       52049 NA           Charles Watson        
#>  6   2026 401856891     4356548 NA           Clare Aubry           
#>  7   2026 401856892        1211 NA           Angelica Suffren      
#>  8   2026 401856892     5113092 NA           Sarah Williams        
#>  9   2026 401856892     5184398 NA           Josh Reed             
#> 10   2026 401856893        1183 NA           Tim Greene            
#> # ℹ 204 more rows
#> # ℹ 6 more variables: official_display_name <chr>, official_first_name <chr>,
#> #   official_last_name <chr>, official_order <int>, position_name <chr>,
#> #   position_display_name <chr>
# }
```

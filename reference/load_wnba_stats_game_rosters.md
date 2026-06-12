# **Load wehoop WNBA Stats Game Rosters**

Loads per-game rosters scraped from the WNBA Stats API
(`boxscoretraditionalv3`-style outputs). One row per athlete-team-game
triple with jersey, position, starter flag, and DNP status. Backed by
the `wehoop-wnba-stats-data` pipeline that reads raw JSONs from
`wehoop-wnba-stats-raw` and publishes parquet/rds artifacts to the
`wnba_stats_game_rosters` release tag.

`load_wnba_stats_game_rosters_manifest()` returns the per-season
manifest CSV (`season`, `row_count`, `generated_at_utc`,
`source_endpoint`) for the WNBA Stats game rosters release tag without
downloading any season's full data.

## Usage

``` r
load_wnba_stats_game_rosters(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_game_rosters_manifest()
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  1997)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the game rosters data table within the database

## Value

Returns a `wehoop_data` tibble with one row per athlete-team-game.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| game_id | character | Unique game identifier. |
| team_id | character | Unique team identifier. |
| team_city | character | Team city or region (e.g. 'Las Vegas'). |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_tricode | character | Three-letter team code (e.g. 'LAS' / 'NYL'). |
| athlete_id | character | Unique athlete identifier (ESPN). |
| first_name | character | Player's first name. |
| family_name | character | Player's family / last name. |
| name_i | character | Initialed name (e.g. 'A. Wilson'). |
| player_slug | character | URL-safe player identifier. |
| jersey_num | character | Jersey number worn by the player. |
| position | character | Listed roster position (G, F, C, etc.). |
| starter | logical | TRUE if the player was in the starting lineup; FALSE otherwise. |
| did_not_play | logical | TRUE if the player did not appear in the game. |
| status | character | Status label. |
| comment | character | Player status / inactive reason (e.g. 'DNP - Coach's Decision', 'Inactive'). |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_game_rosters(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 299 × 10
#>    player_id first_name last_name        jersey_num team_id  team_city team_name
#>    <chr>     <chr>      <chr>            <chr>      <chr>    <chr>     <chr>    
#>  1 1630446   Michaela   Onyenwere        "12  "     1611661… Washingt… Mystics  
#>  2 1643430   Cotie      McMahon          "23  "     1611661… Washingt… Mystics  
#>  3 1643440   Darianna   Littlepage-Buggs "5   "     1611661… Washingt… Mystics  
#>  4 1643644   Alicia     Florez Getino    "2   "     1611661… Washingt… Mystics  
#>  5 204330    Isabelle   Harrison         "21  "     1611661… Toronto   Tempo    
#>  6 1630469   Marine     Fauthoux         "4   "     1611661… New York  Liberty  
#>  7 1630389   Dana       Evans            "11  "     1611661… Las Vegas Aces     
#>  8 1643434   Janiah     Barker           "2   "     1611661… Las Vegas Aces     
#>  9 1643438   Marta      Suarez           "77  "     1611661… Phoenix   Mercury  
#> 10 1643470   Shay       Ciezki           "5   "     1611661… Phoenix   Mercury  
#> # ℹ 289 more rows
#> # ℹ 3 more variables: team_abbreviation <chr>, game_id <chr>, season <int>
# }
```

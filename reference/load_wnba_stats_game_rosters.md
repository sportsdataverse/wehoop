# **Load wehoop WNBA Stats Game Rosters**

Loads the per-game **inactive player** list scraped from the WNBA Stats
API – the `InactivePlayers` result set of `boxscoresummaryv2`. One row
per inactive athlete-game pair, not a full per-game roster: use
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md)
for the athletes who did play. Backed by the `wehoop-wnba-stats-data`
pipeline that reads raw JSONs from `wehoop-wnba-stats-raw` and publishes
parquet/rds artifacts to the `wnba_stats_game_rosters` release tag.

Coverage is thin by construction because the upstream result set is
thin: stats.wnba.com reports inactives for only a fraction of games, and
most heavily for 2006-2008 and 2021 onward. Season row counts range from
1 (1997) to 610 across 184 games (2026); 2009-2012 carry fewer than 10
rows each. A season with almost no rows is upstream sparsity, not a
download failure.

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

  A vector of 4-digit years associated with given WNBA seasons.
  Published coverage runs 1997 through the most recent season, with no
  gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the game rosters data table within the database

## Value

Returns a `wehoop_data` tibble with one row per inactive athlete-game
pair.

|  |  |  |
|----|----|----|
| col_name | types | description |
| player_id | integer | Unique player identifier. |
| first_name | character | Player's first name. |
| last_name | character | Player's last name. |
| jersey_num | character | Jersey number worn by the player. |
| team_id | integer | Unique team identifier. |
| team_city | character | Team city or region (e.g. 'Las Vegas'). |
| team_name | character | Full team display name (e.g. 'Las Vegas Aces'). |
| team_abbreviation | character | Short team abbreviation (e.g. 'LAS'). |
| season | integer | Season identifier (4-digit year). |
| game_id | character | Unique game identifier. |

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_possessions()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_possessions.md),
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
#> # A tibble: 610 × 10
#>    player_id first_name last_name        jersey_num  team_id team_city team_name
#>        <int> <chr>      <chr>            <chr>         <int> <chr>     <chr>    
#>  1   1630469 Marine     Fauthoux         "4   "       1.61e9 New York  Liberty  
#>  2   1630446 Michaela   Onyenwere        "12  "       1.61e9 Washingt… Mystics  
#>  3   1643430 Cotie      McMahon          "23  "       1.61e9 Washingt… Mystics  
#>  4   1643440 Darianna   Littlepage-Buggs "5   "       1.61e9 Washingt… Mystics  
#>  5   1643644 Alicia     Florez Getino    "2   "       1.61e9 Washingt… Mystics  
#>  6    204330 Isabelle   Harrison         "21  "       1.61e9 Toronto   Tempo    
#>  7   1643495 Justine    Pissott          "13  "       1.61e9 Indiana   Fever    
#>  8   1643424 Costanza   Verona           "6   "       1.61e9 Dallas    Wings    
#>  9   1630389 Dana       Evans            "11  "       1.61e9 Las Vegas Aces     
#> 10   1643434 Janiah     Barker           "2   "       1.61e9 Las Vegas Aces     
#> # ℹ 600 more rows
#> # ℹ 3 more variables: team_abbreviation <chr>, season <int>, game_id <chr>
# }
```

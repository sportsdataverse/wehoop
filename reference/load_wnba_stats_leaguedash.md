# **Load wehoop WNBA Stats League Dashboard cube**

Loads one asset of the `wnba_stats_leaguedash` release tag – the
Python-scraped `leaguedash*` parameter cube that supersedes the old
R-scraped player / team / lineups / standings tags. The cube publishes
24 tables per season and is the full surface behind the compatibility
reshapes in
[`load_wnba_stats_player_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_stats.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md)
and
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md);
several tables (`player_bio`, `*_master`, `team_stats_fourfactors`, the
non-5-man and non-Base/Advanced `lineups_*` measures) are reachable only
through this function.

## Usage

``` r
load_wnba_stats_leaguedash(
  seasons = most_recent_wnba_stats_season(),
  table = NULL,
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons.
  Published coverage runs 1997 through the most recent season, with no
  gaps. Pass `seasons = TRUE` for every published season. (Min: 1997)

- table:

  Name of the cube table to load. One of `player_bio`, `player_master`,
  `player_stats_base`, `player_stats_advanced`, `player_stats_misc`,
  `player_stats_scoring`, `player_stats_usage`, `player_stats_defense`,
  `team_master`, `team_stats_base`, `team_stats_advanced`,
  `team_stats_misc`, `team_stats_scoring`, `team_stats_defense`,
  `team_stats_opponent`, `team_stats_fourfactors`, `lineups_master`,
  `lineups_base`, `lineups_advanced`, `lineups_misc`, `lineups_scoring`,
  `lineups_opponent`, `lineups_fourfactors`, `standings`.

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

Returns a `wehoop_data` tibble of the requested cube table, one row per
player-season, team-season or lineup-season depending on `table`. Column
sets differ per table; the `*_master` tables are wide joins of every
measure type for that entity.

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
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
  try(load_wnba_stats_leaguedash(seasons = most_recent_wnba_stats_season(),
                                 table = "player_bio"))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 226 × 27
#>    player_id player_name        team_id team_abbreviation   age player_height
#>        <int> <chr>                <int> <chr>             <dbl> <chr>        
#>  1   1628932 A'ja Wilson     1611661319 LVA                  30 6-4          
#>  2   1642290 Aaliyah Edwards 1611661323 CON                  24 6-3          
#>  3   1642801 Aaliyah Nye     1611661330 ATL                  23 6-0          
#>  4   1642786 Aicha Coulibaly 1611661329 CHI                  24 6-0          
#>  5   1629501 Alanna Smith    1611661321 DAL                  29 6-4          
#>  6   1643525 Alex Fowler     1611661313 NYL                  25 6-2          
#>  7   1642775 Alex Wilson     1611661322 WAS                  32 5-9          
#>  8   1643644 Alicia Florez   1611661322 WAS                  22 5-9          
#>  9   1642293 Alissa Pili     1611661320 LAS                  25 5-11         
#> 10   1641648 Aliyah Boston   1611661325 IND                  24 6-5          
#> # ℹ 216 more rows
#> # ℹ 21 more variables: player_height_inches <int>, player_weight <chr>,
#> #   college <chr>, country <chr>, draft_year <chr>, draft_round <chr>,
#> #   draft_number <chr>, gp <int>, pts <int>, reb <int>, ast <int>,
#> #   net_rating <dbl>, oreb_pct <dbl>, dreb_pct <dbl>, usg_pct <dbl>,
#> #   ts_pct <dbl>, ast_pct <dbl>, season <int>, league_id <chr>,
#> #   season_type <chr>, per_mode <chr>
# }
```

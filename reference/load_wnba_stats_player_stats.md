# **Load wehoop WNBA Stats Player Season Stats**

**\[deprecated\]** Loads season-level WNBA player statistics.
**Deprecated**: the `wnba_stats_player_season_stats` release tag
(R-scraped, `Base`/`Advanced`/`Misc`/`Scoring`/`Usage`/ `Defense`
measures) is superseded by the `wnba_stats_leaguedash` tag
(Python-scraped parameter cube, same 6 measure types plus `player_bio`
and a wide `player_master` mega). This function reshapes the cube back
into the old stacked-by-`measure_type` contract for compatibility; call
the cube's `player_stats_*` / `player_master` assets directly with
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md)
for the full surface.

`load_wnba_stats_player_stats_manifest()` returns the per-season
manifest CSV (`season`, `row_count`, `generated_at_utc`,
`source_endpoint`) for the WNBA Stats player season stats release tag
without downloading any season's full data.

## Usage

``` r
load_wnba_stats_player_stats(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_stats_player_stats_manifest()
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

  The name of the player season stats table within the database

## Value

Returns a `wehoop_data` tibble of player season stats.

## See also

Other WNBA Stats loader functions:
[`load_wnba_stats_coaches()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_coaches.md),
[`load_wnba_stats_draft()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_draft.md),
[`load_wnba_stats_game_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_game_rosters.md),
[`load_wnba_stats_leaguedash()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_leaguedash.md),
[`load_wnba_stats_lineups()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_lineups.md),
[`load_wnba_stats_officials()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_officials.md),
[`load_wnba_stats_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_pbp.md),
[`load_wnba_stats_player_game_logs()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_player_game_logs.md),
[`load_wnba_stats_possessions()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_possessions.md),
[`load_wnba_stats_rosters()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_rosters.md),
[`load_wnba_stats_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_schedule.md),
[`load_wnba_stats_shots()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_shots.md),
[`load_wnba_stats_standings()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_standings.md),
[`load_wnba_stats_team_stats()`](https://wehoop.sportsdataverse.org/reference/load_wnba_stats_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_stats_player_stats(seasons = most_recent_wnba_stats_season()))
#> Warning: `load_wnba_stats_player_stats()` was deprecated in wehoop 3.0.0.
#> ℹ Backing data moved from the wnba_stats_player_season_stats release tag to the
#>   wnba_stats_leaguedash release tag (a Python-scraped parameter cube). This
#>   call reshapes the cube's
#>   player_stats_{base,advanced,misc,scoring,usage,defense} assets back into the
#>   old stacked-by-measure_type contract.
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 1,356 × 211
#>    player_id player_name    nickname team_id team_abbreviation   age    gp     w
#>        <int> <chr>          <chr>      <int> <chr>             <dbl> <int> <int>
#>  1   1628932 A'ja Wilson    A'ja      1.61e9 LVA                  30    31    22
#>  2   1642290 Aaliyah Edwar… Aaliyah   1.61e9 CON                  24    21     7
#>  3   1642801 Aaliyah Nye    Aaliyah   1.61e9 ATL                  23    15     9
#>  4   1642786 Aicha Couliba… Aicha     1.61e9 CHI                  24    23     8
#>  5   1629501 Alanna Smith   Alanna    1.61e9 DAL                  29    26    16
#>  6   1643525 Alex Fowler    Alex      1.61e9 NYL                  25     2     1
#>  7   1642775 Alex Wilson    Alex      1.61e9 WAS                  32     4     2
#>  8   1643644 Alicia Florez  Alicia    1.61e9 WAS                  22    23    14
#>  9   1642293 Alissa Pili    Alissa    1.61e9 LAS                  25     3     2
#> 10   1641648 Aliyah Boston  Aliyah    1.61e9 IND                  24    30    19
#> # ℹ 1,346 more rows
#> # ℹ 203 more variables: l <int>, w_pct <dbl>, min <dbl>, fgm <int>, fga <int>,
#> #   fg_pct <dbl>, fg3_m <int>, fg3_a <int>, fg3_pct <dbl>, ftm <int>,
#> #   fta <int>, ft_pct <dbl>, oreb <int>, dreb <int>, reb <int>, ast <int>,
#> #   tov <int>, stl <int>, blk <int>, blka <int>, pf <int>, pfd <int>,
#> #   pts <int>, plus_minus <int>, nba_fantasy_pts <dbl>, dd2 <int>, td3 <int>,
#> #   wnba_fantasy_pts <dbl>, gp_rank <int>, w_rank <int>, l_rank <int>, …
# }
```

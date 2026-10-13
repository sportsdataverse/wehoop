# **Parse ESPN WBB PBP, helper function**

**Parse ESPN WBB PBP, helper function**

**Parse ESPN WBB Team Box, helper function**

**Parse ESPN WBB Player Box, helper function**

## Usage

``` r
helper_espn_wbb_pbp(resp)

helper_espn_wbb_team_box(resp)

helper_espn_wbb_player_box(resp)
```

## Arguments

- resp:

  Response object from the ESPN WBB game summary endpoint

## Value

For `helper_espn_wbb_pbp()`: a tibble with the columns of
[espn_basketball_game_all_plays_plays_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_all_plays_plays_schema.md),
or `NULL` when the game has no play-by-play. `home_score` / `away_score`
are rebuilt from the scoring plays when that reproduces the header's
official final, otherwise they are ESPN's per-play values; the last
column, `score_source` (`"rebuilt"` / `"espn"`), says which.

Returns a tibble

Returns a tibble

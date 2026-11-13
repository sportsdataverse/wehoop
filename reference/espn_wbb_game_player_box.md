# **Get ESPN WBB Event Player Box Score (Long Format)**

Returns the long-format per-game box score for a single athlete in one
WBB event. One row per (category x stat). Same shape as
[`espn_wbb_game_team_statistics()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md)
but scoped to a single athlete-in-event instead of the full team.
`stat_type` defaults to 0 (regular-season aggregate as ESPN tags it for
finished events).

## Usage

``` r
espn_wbb_game_player_box(event_id, team_id, athlete_id, stat_type = 0L, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- team_id:

  ESPN team identifier (the competitor the athlete played for).

- athlete_id:

  ESPN athlete identifier.

- stat_type:

  Integer stat-type segment. Defaults to 0 (the only type commonly
  populated for finished events).

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per (category x stat).

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_game_player_box(event_id = 401276115, team_id = 52,
                               athlete_id = 4433404)
#> ✖ 2026-11-13 11:56:18.011356: Failed to retrieve ESPN womens-college-basketball event player box for event_id=401276115, team_id=52, athlete_id=4433404
#> ✖ Args: league = "womens-college-basketball", event_id = 401276115, team_id = 52, athlete_id = 4433404, stat_type = 0L
#> ✖ Error: The API returned an error
#> NULL
# }
```

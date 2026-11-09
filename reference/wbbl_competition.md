# **Women's British Basketball League (Genius LiveStats)**

Convenience wrappers binding the Genius family to the Women's British
Basketball League (women's; Genius ORG `WBBL`, LiveStats ORG `WBBL`).
Season rule: END year; the label span 2025-26 = 2026.

- `wbbl_competitions()`: every competition of the `WBBL` org, with its
  END-year season
  ([`genius_competitions()`](https://wehoop.sportsdataverse.org/reference/genius_competitions.md)).

- `wbbl_schedule()`: every match of one season
  ([`genius_schedule()`](https://wehoop.sportsdataverse.org/reference/genius_schedule.md)).

- `wbbl_team_box()`, `wbbl_player_box()`, `wbbl_pbp()`, `wbbl_shots()`:
  one finished game
  ([`genius_team_box()`](https://wehoop.sportsdataverse.org/reference/genius_team_box.md),
  [`genius_player_box()`](https://wehoop.sportsdataverse.org/reference/genius_player_box.md),
  [`genius_pbp()`](https://wehoop.sportsdataverse.org/reference/genius_pbp.md),
  [`genius_shots()`](https://wehoop.sportsdataverse.org/reference/genius_shots.md)).

## Usage

``` r
wbbl_competitions(return_parsed = TRUE)

wbbl_schedule(season = NULL, comp_id = NULL, round_number = -1, return_parsed = TRUE)

wbbl_team_box(match_id, return_parsed = TRUE)

wbbl_player_box(match_id, return_parsed = TRUE)

wbbl_pbp(match_id, return_parsed = TRUE)

wbbl_shots(match_id, return_parsed = TRUE)
```

## Arguments

- season:

  END-year season (see the season rule). `NULL` (default) = the newest
  season the org lists.

- comp_id:

  Genius competition id; skips the season lookup (needed when the label
  rule matches several competitions).

- round_number:

  Round to list; -1 (default) lists every round.

- match_id:

  Genius match id (`match_id` of `wbbl_schedule()`) of a game of this
  competition.

- return_parsed:

  Parse into a tibble (default `TRUE`); `FALSE` returns the raw list.

## Value

The base function's `wehoop_data` tibble, same columns and types (the
raw list when `return_parsed = FALSE`) of each function:

- `wbbl_competitions()`: the columns of
  [`genius_competitions()`](https://wehoop.sportsdataverse.org/reference/genius_competitions.md).

- `wbbl_schedule()`: the columns of
  [`genius_schedule()`](https://wehoop.sportsdataverse.org/reference/genius_schedule.md).

- `wbbl_team_box()`: the columns of
  [`genius_team_box()`](https://wehoop.sportsdataverse.org/reference/genius_team_box.md).

- `wbbl_player_box()`: the columns of
  [`genius_player_box()`](https://wehoop.sportsdataverse.org/reference/genius_player_box.md).

- `wbbl_pbp()`: the columns of
  [`genius_pbp()`](https://wehoop.sportsdataverse.org/reference/genius_pbp.md).

- `wbbl_shots()`: the columns of
  [`genius_shots()`](https://wehoop.sportsdataverse.org/reference/genius_shots.md).

## Details

The season's competition is picked from the `WBBL` chooser by the label
rule include = `Championship`, exclude = `Play-?Offs`
(case-insensitive); cups and play-offs have their own `comp_id`. Several
matching competitions raise `wehoop_bad_request` (pass `comp_id`); none
raises `wehoop_no_data`.

Genius match ids are one global sequence shared by every customer and
`data.json` names no competition, so each game alias checks the id on
the game's LiveStats shell (`/u/WBBL/<match_id>/`: one extra request per
game, cached per process for an hour): its competition name must pass
the label rule. Another org's game, a cup or play-off game of `WBBL`, or
a shell request that fails twice (or names no competition) raises
`wehoop_asset_fetch`. The base `genius_*()` function reads any game
unchecked.

Access, proxy and error notes: see
[`genius_game()`](https://wehoop.sportsdataverse.org/reference/genius_game.md).

     wbbl_competitions()
     wbbl_schedule()

## See also

Other Genius Functions:
[`genius_competition_games()`](https://wehoop.sportsdataverse.org/reference/genius_competition_games.md),
[`genius_competitions()`](https://wehoop.sportsdataverse.org/reference/genius_competitions.md),
[`genius_game()`](https://wehoop.sportsdataverse.org/reference/genius_game.md),
[`genius_game_crosswalk()`](https://wehoop.sportsdataverse.org/reference/genius_game_crosswalk.md),
[`genius_match_competition()`](https://wehoop.sportsdataverse.org/reference/genius_match_competition.md),
[`genius_pbp()`](https://wehoop.sportsdataverse.org/reference/genius_pbp.md),
[`genius_player_box()`](https://wehoop.sportsdataverse.org/reference/genius_player_box.md),
[`genius_schedule()`](https://wehoop.sportsdataverse.org/reference/genius_schedule.md),
[`genius_schedule_embed()`](https://wehoop.sportsdataverse.org/reference/genius_schedule_embed.md),
[`genius_shots()`](https://wehoop.sportsdataverse.org/reference/genius_shots.md),
[`genius_team_box()`](https://wehoop.sportsdataverse.org/reference/genius_team_box.md),
[`genius_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/genius_team_crosswalk.md),
[`genius_widget_games()`](https://wehoop.sportsdataverse.org/reference/genius_widget_games.md),
[`lfb_competition`](https://wehoop.sportsdataverse.org/reference/lfb_competition.md)

# **Ligue Feminine de Basket (France, FFBB) (Genius LiveStats)**

Convenience wrappers binding the Genius family to the Ligue Feminine de
Basket (France, FFBB) (women's; Genius ORG `FFBB`, LiveStats ORG
`FFBB`). Season rule: END year; Genius year + 1 (2018-19 = 2019); Genius
hosts only 2018 and 2019.

- `lfb_competitions()`: every competition of the `FFBB` org, with its
  END-year season
  ([`genius_competitions()`](https://wehoop.sportsdataverse.org/reference/genius_competitions.md)).

- `lfb_schedule()`: every match of one season
  ([`genius_schedule()`](https://wehoop.sportsdataverse.org/reference/genius_schedule.md)).

- `lfb_team_box()`, `lfb_player_box()`, `lfb_pbp()`, `lfb_shots()`: one
  finished game
  ([`genius_team_box()`](https://wehoop.sportsdataverse.org/reference/genius_team_box.md),
  [`genius_player_box()`](https://wehoop.sportsdataverse.org/reference/genius_player_box.md),
  [`genius_pbp()`](https://wehoop.sportsdataverse.org/reference/genius_pbp.md),
  [`genius_shots()`](https://wehoop.sportsdataverse.org/reference/genius_shots.md)).

## Usage

``` r
lfb_competitions(return_parsed = TRUE)

lfb_schedule(season = NULL, comp_id = NULL, round_number = -1, return_parsed = TRUE)

lfb_team_box(match_id, return_parsed = TRUE)

lfb_player_box(match_id, return_parsed = TRUE)

lfb_pbp(match_id, return_parsed = TRUE)

lfb_shots(match_id, return_parsed = TRUE)
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

  Genius match id (`match_id` of `lfb_schedule()`) of a game of this
  competition.

- return_parsed:

  Parse into a tibble (default `TRUE`); `FALSE` returns the raw list.

## Value

The base function's `wehoop_data` tibble, same columns and types (the
raw list when `return_parsed = FALSE`) of each function:

- `lfb_competitions()`: the columns of
  [`genius_competitions()`](https://wehoop.sportsdataverse.org/reference/genius_competitions.md).

- `lfb_schedule()`: the columns of
  [`genius_schedule()`](https://wehoop.sportsdataverse.org/reference/genius_schedule.md).

- `lfb_team_box()`: the columns of
  [`genius_team_box()`](https://wehoop.sportsdataverse.org/reference/genius_team_box.md).

- `lfb_player_box()`: the columns of
  [`genius_player_box()`](https://wehoop.sportsdataverse.org/reference/genius_player_box.md).

- `lfb_pbp()`: the columns of
  [`genius_pbp()`](https://wehoop.sportsdataverse.org/reference/genius_pbp.md).

- `lfb_shots()`: the columns of
  [`genius_shots()`](https://wehoop.sportsdataverse.org/reference/genius_shots.md).

## Details

The season's competition is picked from the `FFBB` chooser by the label
rule include = `^ligue feminine( de basket)?$`, exclude = `^$`
(case-insensitive); cups and play-offs have their own `comp_id`. Several
matching competitions raise `wehoop_bad_request` (pass `comp_id`); none
raises `wehoop_no_data`.

Genius match ids are one global sequence shared by every customer and
`data.json` names no competition, so each game alias checks the id on
the game's LiveStats shell (`/u/FFBB/<match_id>/`: one extra request per
game, cached per process for an hour): its competition name must pass
the label rule. Another org's game, a cup or play-off game of `FFBB`, or
a shell request that fails twice (or names no competition) raises
`wehoop_asset_fetch`. The base `genius_*()` function reads any game
unchecked.

Access, proxy and error notes: see
[`genius_game()`](https://wehoop.sportsdataverse.org/reference/genius_game.md).

     lfb_competitions()
     lfb_schedule()

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
[`wbbl_competition`](https://wehoop.sportsdataverse.org/reference/wbbl_competition.md)

# **Genius Game Crosswalk**

Provider game key \<-\> Genius LiveStats match id, from a frame that
carries both.

Reads a frame you already have (no request is made), checks the id types
and returns the distinct id pairs, one-to-one both ways. Rows without a
Genius id (older seasons, upcoming games) are dropped.

## Usage

``` r
genius_game_crosswalk(df, source)
```

## Arguments

- df:

  A data frame from the wrapper named for `source`.

- source:

  One of `"sportpress"`, `"cebl"`, `"tbf"`, `"kzs"`, `"sportality"`.

## Value

A `wehoop_data` tibble, one row per game:

|  |  |  |
|----|----|----|
| col_name | type | description |
| game_key | integer or character | Provider's own game key: the BNXT, CEBL, TBF or KZS integer game id, or the Sportality platform game uuid (a string) for source sportality. |
| genius_match_id | integer | Genius Sports LiveStats match id of the same game (the match_id every genius\_\* wrapper takes). |

## Details

Sources: `sportpress` (BNXT `sportpress_game_slider`: `game_id` /
`genius_id`), `cebl` (`game_id` / `genius_match_id`), `tbf` (`match_id`
/ `genius_id`), `kzs` (`match_id` / `genius_match_id`) and `sportality`
(`game_uuid` / `game_id`, the Genius match id). The provider key is
integer for every source but `sportality` (a character uuid); the Genius
id is integer. A wrong source, a missing column, a wrong id type or a
key that maps to two ids raises `wehoop_bad_request`.

## See also

Other Genius:
[`genius_competition_games()`](https://wehoop.sportsdataverse.org/reference/genius_competition_games.md),
[`genius_competitions()`](https://wehoop.sportsdataverse.org/reference/genius_competitions.md),
[`genius_game()`](https://wehoop.sportsdataverse.org/reference/genius_game.md),
[`genius_match_competition()`](https://wehoop.sportsdataverse.org/reference/genius_match_competition.md),
[`genius_pbp()`](https://wehoop.sportsdataverse.org/reference/genius_pbp.md),
[`genius_player_box()`](https://wehoop.sportsdataverse.org/reference/genius_player_box.md),
[`genius_schedule()`](https://wehoop.sportsdataverse.org/reference/genius_schedule.md),
[`genius_schedule_embed()`](https://wehoop.sportsdataverse.org/reference/genius_schedule_embed.md),
[`genius_shots()`](https://wehoop.sportsdataverse.org/reference/genius_shots.md),
[`genius_team_box()`](https://wehoop.sportsdataverse.org/reference/genius_team_box.md),
[`genius_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/genius_team_crosswalk.md),
[`genius_widget_games()`](https://wehoop.sportsdataverse.org/reference/genius_widget_games.md),
[`lfb_competition`](https://wehoop.sportsdataverse.org/reference/lfb_competition.md),
[`wbbl_competition`](https://wehoop.sportsdataverse.org/reference/wbbl_competition.md)

## Examples

``` r
# \donttest{
  slider <- data.frame(game_id = c(1L, 2L), genius_id = c(2902690L, NA))
  genius_game_crosswalk(slider, "sportpress")
#> ── Genius LiveStats game crosswalk ───────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-10-18 19:24:11 UTC
#> # A tibble: 1 × 2
#>   game_key genius_match_id
#>      <int>           <int>
#> 1        1         2902690
# }
```

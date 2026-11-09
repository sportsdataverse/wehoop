# **FIBA competition: FIBA Women's EuroBasket**

Per-competition aliases of the FIBA wrappers for FIBA Women's EuroBasket
(GDAP competition family 297), named as in sportsdataverse-py. Season
rule: event year (2025 = 2025).

## Usage

``` r
fiba_weurobasket_editions(season = NULL, to_season = NULL, return_parsed = TRUE)

fiba_weurobasket_schedule(season = NULL, comp = NULL, return_parsed = TRUE)

fiba_weurobasket_standings(season = NULL, comp = NULL, return_parsed = TRUE)

fiba_weurobasket_teams(season = NULL, comp = NULL, return_parsed = TRUE)

fiba_weurobasket_player_box(game_id, season = NULL, comp = NULL, return_parsed = TRUE)

fiba_weurobasket_team_box(game_id, season = NULL, comp = NULL, return_parsed = TRUE)

fiba_weurobasket_pbp(game_id, season = NULL, comp = NULL, return_parsed = TRUE)

fiba_weurobasket_shots(game_id, season = NULL, comp = NULL, return_parsed = TRUE)
```

## Arguments

- game_id:

  FIBA game id (`game_id` in the schedule).

- season:

  Edition season key (event year (2025 = 2025)). Omitted = the newest
  edition that has started; a game function needs `season` or `comp`.
  For `fiba_weurobasket_editions()`: the first season (inclusive),
  omitted = every edition.

- to_season:

  Last season, inclusive (`fiba_weurobasket_editions()` only).

- comp:

  FIBA competition id (one per edition); skips the edition lookup and is
  needed when a season lists several editions. Checked to be an edition
  of this competition (one cached getGdapCompetitionById request).

- return_parsed:

  Parse the payload into a tibble (default `TRUE`); `FALSE` returns the
  raw JSON list.

## Value

A `wehoop_data` tibble with the columns of the base wrapper (the raw
JSON list when `return_parsed = FALSE`) of each function:

- `fiba_weurobasket_editions()`: the columns of
  [`fiba_gdap_editions()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_editions.md).

- `fiba_weurobasket_schedule()`: the columns of
  [`fiba_gdap_schedule()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_schedule.md).

- `fiba_weurobasket_standings()`: the columns of
  [`fiba_gdap_final_standings()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_final_standings.md).

- `fiba_weurobasket_teams()`: the columns of
  [`fiba_gdap_teams()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_teams.md).

- `fiba_weurobasket_player_box()`: the columns of
  [`fiba_gamepage_box_players()`](https://wehoop.sportsdataverse.org/reference/fiba_gamepage_box_players.md).

- `fiba_weurobasket_team_box()`: the columns of
  [`fiba_gamepage_box_teams()`](https://wehoop.sportsdataverse.org/reference/fiba_gamepage_box_teams.md).

- `fiba_weurobasket_pbp()`: the columns of
  [`fiba_gamepage_pbp()`](https://wehoop.sportsdataverse.org/reference/fiba_gamepage_pbp.md).

- `fiba_weurobasket_shots()`: the columns of
  [`fiba_gamepage_shots()`](https://wehoop.sportsdataverse.org/reference/fiba_gamepage_shots.md).

## Details

FIBA's terms restrict this source: the GDAP developer-portal terms limit
API use to 'Authorized Users' and the fiba.basketball terms say no
portion of the site may be duplicated, redistributed or manipulated.
Users who are not themselves authorised by FIBA should check the terms
before using the wrappers. See
[`fiba_gdap_awards()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_awards.md)
for the shared notes.

A `comp` of another competition family, or one GDAP gives no family, is
`wehoop_asset_fetch`; a season with no edition is `wehoop_no_data`; a
season listing several editions, or a game function called with neither
`season` nor `comp`, is `wehoop_bad_request`.

     fiba_weurobasket_editions(season = 2025)
     fiba_weurobasket_schedule(season = 2025)

## See also

Other FIBA Competition Functions:
[`fiba_ecw_competition`](https://wehoop.sportsdataverse.org/reference/fiba_ecw_competition.md),
[`fiba_elw_competition`](https://wehoop.sportsdataverse.org/reference/fiba_elw_competition.md),
[`fiba_wafrobasket_competition`](https://wehoop.sportsdataverse.org/reference/fiba_wafrobasket_competition.md),
[`fiba_wamericup_competition`](https://wehoop.sportsdataverse.org/reference/fiba_wamericup_competition.md),
[`fiba_wasiacup_competition`](https://wehoop.sportsdataverse.org/reference/fiba_wasiacup_competition.md),
[`fiba_woly_competition`](https://wehoop.sportsdataverse.org/reference/fiba_woly_competition.md),
[`fiba_wwc_competition`](https://wehoop.sportsdataverse.org/reference/fiba_wwc_competition.md)

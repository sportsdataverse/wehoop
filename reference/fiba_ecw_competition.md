# **FIBA competition: EuroCup Women (FIBA Women's European Club Competitions Tier 2)**

Per-competition aliases of the FIBA wrappers for EuroCup Women (FIBA
Women's European Club Competitions Tier 2) (GDAP competition family
165), named as in sportsdataverse-py. Season rule: END year (2024-25 =
2025).

## Usage

``` r
fiba_ecw_editions(season = NULL, to_season = NULL, return_parsed = TRUE)

fiba_ecw_schedule(season = NULL, comp = NULL, return_parsed = TRUE)

fiba_ecw_standings(season = NULL, comp = NULL, return_parsed = TRUE)

fiba_ecw_teams(season = NULL, comp = NULL, return_parsed = TRUE)

fiba_ecw_player_box(game_id, season = NULL, comp = NULL, return_parsed = TRUE)

fiba_ecw_team_box(game_id, season = NULL, comp = NULL, return_parsed = TRUE)

fiba_ecw_pbp(game_id, season = NULL, comp = NULL, return_parsed = TRUE)

fiba_ecw_shots(game_id, season = NULL, comp = NULL, return_parsed = TRUE)
```

## Arguments

- game_id:

  FIBA game id (`game_id` in the schedule).

- season:

  Edition season key (END year (2024-25 = 2025)). Omitted = the newest
  edition that has started; a game function needs `season` or `comp`.
  For `fiba_ecw_editions()`: the first season (inclusive), omitted =
  every edition.

- to_season:

  Last season, inclusive (`fiba_ecw_editions()` only).

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

- `fiba_ecw_editions()`: the columns of
  [`fiba_gdap_editions()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_editions.md).

- `fiba_ecw_schedule()`: the columns of
  [`fiba_gdap_schedule()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_schedule.md).

- `fiba_ecw_standings()`: the columns of
  [`fiba_gdap_final_standings()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_final_standings.md).

- `fiba_ecw_teams()`: the columns of
  [`fiba_gdap_teams()`](https://wehoop.sportsdataverse.org/reference/fiba_gdap_teams.md).

- `fiba_ecw_player_box()`: the columns of
  [`fiba_gamepage_box_players()`](https://wehoop.sportsdataverse.org/reference/fiba_gamepage_box_players.md).

- `fiba_ecw_team_box()`: the columns of
  [`fiba_gamepage_box_teams()`](https://wehoop.sportsdataverse.org/reference/fiba_gamepage_box_teams.md).

- `fiba_ecw_pbp()`: the columns of
  [`fiba_gamepage_pbp()`](https://wehoop.sportsdataverse.org/reference/fiba_gamepage_pbp.md).

- `fiba_ecw_shots()`: the columns of
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

     fiba_ecw_editions(season = 2025)
     fiba_ecw_schedule(season = 2025)

## See also

Other FIBA Competition Functions:
[`fiba_elw_competition`](https://wehoop.sportsdataverse.org/reference/fiba_elw_competition.md),
[`fiba_wafrobasket_competition`](https://wehoop.sportsdataverse.org/reference/fiba_wafrobasket_competition.md),
[`fiba_wamericup_competition`](https://wehoop.sportsdataverse.org/reference/fiba_wamericup_competition.md),
[`fiba_wasiacup_competition`](https://wehoop.sportsdataverse.org/reference/fiba_wasiacup_competition.md),
[`fiba_weurobasket_competition`](https://wehoop.sportsdataverse.org/reference/fiba_weurobasket_competition.md),
[`fiba_woly_competition`](https://wehoop.sportsdataverse.org/reference/fiba_woly_competition.md),
[`fiba_wwc_competition`](https://wehoop.sportsdataverse.org/reference/fiba_wwc_competition.md)

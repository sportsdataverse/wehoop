# **Atrium Competition Team Stats (long form)**

**Team statistics of a competition in long form (names only: the bodies
carry no ids).**

Endpoint:
`GET https://embed-api.eui.connect.sportradar.com/v1/embed/{website_id}/statistics_competition_entities`

## Usage

``` r
atrium_competition_team_stats(website_id, competition_id, locale = NULL)
```

## Arguments

- website_id:

  (*integer* required): Site config id: which league site's widget this
  is (12 LNB France, 14 LNBP Mexico, 3 NBL1 Australia, 13 El Salvador,
  22 Panama, 236 Austria, 326 Montenegro). Not a league id: one site
  serves several competitions.

- competition_id:

  (*character* required): Competition UUID (`competition_id` in
  [`atrium_seasons()`](https://wehoop.sportsdataverse.org/reference/atrium_seasons.md)),
  e.g. `"3f4064bb-51ad-11f0-aaaf-2923c944b404"`.

- locale:

  (*character* optional): Locale of the labels, e.g. `"en-EN"` or
  `"fr-FR"`. Omitted = the site's own language. Ids and codes never
  change.

## Value

A `wehoop_data` tibble, one row per
`(table_key, entity_name, stat_key)`, with the same columns as
[`atrium_team_stats()`](https://wehoop.sportsdataverse.org/reference/atrium_team_stats.md)
(listed there).

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`atrium_fixtures()`](https://wehoop.sportsdataverse.org/reference/atrium_fixtures.md).

     atrium_competition_team_stats(
       website_id = 12, competition_id = "3f4064bb-51ad-11f0-aaaf-2923c944b404"
     )

## See also

Other Atrium Functions:
[`atrium_box_score()`](https://wehoop.sportsdataverse.org/reference/atrium_box_score.md),
[`atrium_competition_player_stats()`](https://wehoop.sportsdataverse.org/reference/atrium_competition_player_stats.md),
[`atrium_end_year()`](https://wehoop.sportsdataverse.org/reference/atrium_end_year.md),
[`atrium_fixture()`](https://wehoop.sportsdataverse.org/reference/atrium_fixture.md),
[`atrium_fixture_periods()`](https://wehoop.sportsdataverse.org/reference/atrium_fixture_periods.md),
[`atrium_fixtures()`](https://wehoop.sportsdataverse.org/reference/atrium_fixtures.md),
[`atrium_fixtures_ribbon()`](https://wehoop.sportsdataverse.org/reference/atrium_fixtures_ribbon.md),
[`atrium_leaders()`](https://wehoop.sportsdataverse.org/reference/atrium_leaders.md),
[`atrium_pbp()`](https://wehoop.sportsdataverse.org/reference/atrium_pbp.md),
[`atrium_player()`](https://wehoop.sportsdataverse.org/reference/atrium_player.md),
[`atrium_player_game_log()`](https://wehoop.sportsdataverse.org/reference/atrium_player_game_log.md),
[`atrium_player_seasons()`](https://wehoop.sportsdataverse.org/reference/atrium_player_seasons.md),
[`atrium_player_stats()`](https://wehoop.sportsdataverse.org/reference/atrium_player_stats.md),
[`atrium_players()`](https://wehoop.sportsdataverse.org/reference/atrium_players.md),
[`atrium_season_id()`](https://wehoop.sportsdataverse.org/reference/atrium_season_id.md),
[`atrium_seasons()`](https://wehoop.sportsdataverse.org/reference/atrium_seasons.md),
[`atrium_shots()`](https://wehoop.sportsdataverse.org/reference/atrium_shots.md),
[`atrium_standings()`](https://wehoop.sportsdataverse.org/reference/atrium_standings.md),
[`atrium_standings_summary()`](https://wehoop.sportsdataverse.org/reference/atrium_standings_summary.md),
[`atrium_team()`](https://wehoop.sportsdataverse.org/reference/atrium_team.md),
[`atrium_team_box_score()`](https://wehoop.sportsdataverse.org/reference/atrium_team_box_score.md),
[`atrium_team_stats()`](https://wehoop.sportsdataverse.org/reference/atrium_team_stats.md),
[`atrium_teams()`](https://wehoop.sportsdataverse.org/reference/atrium_teams.md),
[`lmb_competition`](https://wehoop.sportsdataverse.org/reference/lmb_competition.md),
[`lnbp_competition`](https://wehoop.sportsdataverse.org/reference/lnbp_competition.md),
[`lpb_competition`](https://wehoop.sportsdataverse.org/reference/lpb_competition.md),
[`nbl1_competition`](https://wehoop.sportsdataverse.org/reference/nbl1_competition.md)

# **Atrium END Year**

**The sdv season key (END year) of a site's own `year`, or `NA` when it
cannot be mapped.**

## Usage

``` r
atrium_end_year(website_id, year)
```

## Arguments

- website_id:

  (*integer* required): The site (12 LNB, 14 LNBP, 3 NBL1, 13 El
  Salvador, 22 Panama, 236 Austria, 326 Montenegro).

- year:

  (*integer* required): The `year` of a site's season list (START year
  on site 12, the calendar year elsewhere); a vector is mapped element
  by element.

## Value

An integer vector: `year + 1` on site 12 (2025 -\> 2026 = 2025-26),
`year` on the calendar-year sites, `NA` for an unregistered site, site
236 (no season list) or a value that is not a whole number.

## See also

Other Atrium Functions:
[`atrium_box_score()`](https://wehoop.sportsdataverse.org/reference/atrium_box_score.md),
[`atrium_competition_player_stats()`](https://wehoop.sportsdataverse.org/reference/atrium_competition_player_stats.md),
[`atrium_competition_team_stats()`](https://wehoop.sportsdataverse.org/reference/atrium_competition_team_stats.md),
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

## Examples

``` r
atrium_end_year(12, 2025)
#> [1] 2026
atrium_end_year(14, 2026)
#> [1] 2026
```

# **Atrium Player Stats (season, long form)**

**Player season statistics in long form (one row per player, table and
statistic); ids decoded from the widget links.**

Endpoint:
`GET https://embed-api.eui.connect.sportradar.com/v1/embed/{website_id}/statistics_persons`

Each body holds several tables (`averages`, `shootingstatistics`,
`totals`, ...) whose statistic set the site configures. `stat_key`
(`pointsPerGame`) carries its numeric `value` or, for ISO durations,
`value_text`; pivot on `stat_key` for a wide table. Percentages are
0-100.

## Usage

``` r
atrium_player_stats(
  website_id,
  season = NULL,
  season_id = NULL,
  competition_id = NULL,
  locale = NULL
)
```

## Arguments

- website_id:

  (*integer* required): Site config id: which league site's widget this
  is (12 LNB France, 14 LNBP Mexico, 3 NBL1 Australia, 13 El Salvador,
  22 Panama, 236 Austria, 326 Montenegro). Not a league id: one site
  serves several competitions.

- season:

  (*integer* optional): Season END year (2026 = 2025-26 on LNB, site 12,
  whose own year is the START year; the calendar year on the other
  sites). Needs `competition_id` when several competitions share that
  year (see
  [`atrium_seasons()`](https://wehoop.sportsdataverse.org/reference/atrium_seasons.md)).
  Omit `season` and `season_id` for the site's default season.

- season_id:

  (*character* optional): Season UUID (`season_id` in
  [`atrium_seasons()`](https://wehoop.sportsdataverse.org/reference/atrium_seasons.md));
  sent as is, skipping the END-year lookup of `season`.

- competition_id:

  (*character* optional): Competition UUID (`competition_id` in
  [`atrium_seasons()`](https://wehoop.sportsdataverse.org/reference/atrium_seasons.md)).
  Picks the season together with `season`, and is then not sent; with
  neither `season` nor `season_id` the API filters by it.

- locale:

  (*character* optional): Locale of the labels, e.g. `"en-EN"` or
  `"fr-FR"`. Omitted = the site's own language. Ids and codes never
  change.

## Value

A `wehoop_data` tibble, one row per `(table_key, person_id, stat_key)`:

|  |  |  |
|----|----|----|
| col_name | type | description |
| website_id | integer | Site config id the body came from (12 LNB, 14 LNBP, 3 NBL1, 13 El Salvador, 22 Panama, 236 Austria, 326 Montenegro), read from the body's links.self. |
| season_id | character | Season UUID of the table; null for the competition-scoped routes (their bodies carry none). |
| table_key | character | Statistics table the row is from: averages, shootingstatistics, totals, ... (the set is per site). |
| table_label | character | The table's heading in the site's language (e.g. Moyennes). |
| person_id | character | Player UUID decoded from the widget link beside the name (the tables carry names only); null when the link is missing or undecodable, and always null in team and competition bodies. |
| person_name | character | Player name as the site prints it; null in team tables. |
| entity_id | character | Team UUID decoded from the widget link (team tables only; player tables name the team but carry no id). |
| entity_name | character | Team name as the site prints it; for player rows of a stat table it is the player's team. |
| stat_key | character | Statistic key as the API names it (pointsPerGame, fieldGoalsMade, ...), unchanged from header key. |
| stat_name | character | Short column heading the site shows for the statistic (PTS, REB), in the site's language. |
| stat_label | character | Longer statistic label the site shows (code in the API), in the site's language. |
| value | double | Numeric value of the statistic; null when the API sends a duration or text (see value_text). |
| value_text | character | Non-numeric statistic value, e.g. an ISO 8601 duration such as PT12M2S for minutes per game. |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`atrium_fixtures()`](https://wehoop.sportsdataverse.org/reference/atrium_fixtures.md).

## See also

Other Atrium Functions:
[`atrium_box_score()`](https://wehoop.sportsdataverse.org/reference/atrium_box_score.md),
[`atrium_competition_player_stats()`](https://wehoop.sportsdataverse.org/reference/atrium_competition_player_stats.md),
[`atrium_competition_team_stats()`](https://wehoop.sportsdataverse.org/reference/atrium_competition_team_stats.md),
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
# \donttest{
  # The players the stats tables cover:
  try(atrium_players(
    website_id = 12, season = 2026, competition_id = "3f4064bb-51ad-11f0-aaaf-2923c944b404"
  ))
#> ── Atrium players from embed-api.eui.connect.sportradar.com ──── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:56:34 UTC
#> # A tibble: 294 × 15
#>    website_id season_id  person_id name  bib   entity_id team_name position_code
#>         <int> <chr>      <chr>     <chr> <chr> <chr>     <chr>     <chr>        
#>  1         12 df310a05-… 01173036… Isma… 21    f43b1b0f… Paris     C            
#>  2         12 df310a05-… 03e0ef50… Juha… 23    736b73ae… Monaco    GF           
#>  3         12 df310a05-… 0602120f… Jare… NA    f43b1b0f… Paris     NA           
#>  4         12 df310a05-… 06ded7ee… Dayl… 2     c281453b… Cholet    SG           
#>  5         12 df310a05-… 08ee670c… John… 8     7e9f3d8d… Le Mans   GF           
#>  6         12 df310a05-… 095e7eb6… Davi… 4     7e9f3d8d… Le Mans   FC           
#>  7         12 df310a05-… 0a26b3fe… Just… 1     238ad480… Dijon     PG           
#>  8         12 df310a05-… 0b6849a9… Just… 5     f43b1b0f… Paris     PG           
#>  9         12 df310a05-… 0c8e19b5… Cat … 1     689d1a0a… Saint-Qu… GF           
#> 10         12 df310a05-… 16742263… Aaro… 79    c281453b… Cholet    PG           
#> # ℹ 284 more rows
#> # ℹ 7 more variables: position_name <chr>, nationality <chr>,
#> #   date_of_birth <date>, age <int>, height <int>, status <chr>,
#> #   image_url <chr>
# }
# \donttest{
  # Interactive only: the server can take 5 s to build a season's tables.
  try(atrium_player_stats(
    website_id = 12, season = 2026, competition_id = "3f4064bb-51ad-11f0-aaaf-2923c944b404"
  ))
#> ── Atrium player stats from embed-api.eui.connect.sportradar.com ───────────────
#> ℹ Data updated: 2026-11-13 13:56:35 UTC
#> # A tibble: 10,212 × 13
#>    website_id season_id    table_key table_label person_id person_name entity_id
#>         <int> <chr>        <chr>     <chr>       <chr>     <chr>       <chr>    
#>  1         12 df310a05-51… averages  Moyennes    01173036… Ismael Bako NA       
#>  2         12 df310a05-51… averages  Moyennes    01173036… Ismael Bako NA       
#>  3         12 df310a05-51… averages  Moyennes    01173036… Ismael Bako NA       
#>  4         12 df310a05-51… averages  Moyennes    01173036… Ismael Bako NA       
#>  5         12 df310a05-51… averages  Moyennes    01173036… Ismael Bako NA       
#>  6         12 df310a05-51… averages  Moyennes    01173036… Ismael Bako NA       
#>  7         12 df310a05-51… averages  Moyennes    01173036… Ismael Bako NA       
#>  8         12 df310a05-51… averages  Moyennes    01173036… Ismael Bako NA       
#>  9         12 df310a05-51… averages  Moyennes    01173036… Ismael Bako NA       
#> 10         12 df310a05-51… averages  Moyennes    01173036… Ismael Bako NA       
#> # ℹ 10,202 more rows
#> # ℹ 6 more variables: entity_name <chr>, stat_key <chr>, stat_name <chr>,
#> #   stat_label <chr>, value <dbl>, value_text <chr>
# }
```

# **TBF Game Players**

Game roster from the header: every listed player of both sides (names
and shirt numbers, no usable ids).

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Match/mac-header`

## Usage

``` r
tbf_game_players(match_id)
```

## Arguments

- match_id:

  Required. TBF game id (integer), e.g. 346279; match_id in
  [`tbf_schedule()`](https://wehoop.sportsdataverse.org/reference/tbf_schedule.md).
  One global sequence across leagues and seasons. Only a finished game
  is served.

## Value

A `wehoop_data` tibble. One row per rostered player. The header carries
no usable player id; join on name + shirt number + side. Every column
below is always present (a zero-row tibble keeps them and their types);
an answer with nothing in it raises `wehoop_no_data`, as in
sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| match_id | integer | TBF game id (key space: TBF games, ONE global sequence across leagues and seasons: 62552 in 2006-07, 346279 in 2026-27). The match_id argument of every game wrapper; the routes echo it as a string or null, the runtime stamps the integer asked for. |
| side | character | Side of the game the row belongs to: home or away (from the route's isHome flag or home / away block). |
| team | character | Team name for the roster row; empty in the samples, so null. |
| player_name | character | Player name as the header roster lists it. |
| jersey_number | character | Shirt number as a string, so '0' and '00' stay distinct. |
| is_starter | logical | True for a starter in the header roster (isStarter). |
| is_active | logical | True when the player is flagged active in the header (isActive). |

## Details

Source, terms of use, request pacing, seasons, coverage and error
classes of this family: see the notes in
[`tbf_seasons()`](https://wehoop.sportsdataverse.org/reference/tbf_seasons.md).

     tbf_game_players(match_id = 346279)

## See also

[family_tbf](https://wehoop.sportsdataverse.org/reference/family_tbf.md)
lists every function in this family.

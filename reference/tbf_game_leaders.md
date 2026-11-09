# **TBF Game Leaders**

Game leaders of a finished game per statistic category (top five each).

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Match/mac-leader`

## Usage

``` r
tbf_game_leaders(match_id)
```

## Arguments

- match_id:

  Required. TBF game id (integer), e.g. 346279; match_id in
  [`tbf_schedule()`](https://wehoop.sportsdataverse.org/reference/tbf_schedule.md).
  One global sequence across leagues and seasons. Only a finished game
  is served.

## Value

A `wehoop_data` tibble. One row per leader, best first within a
category. Every column below is always present (a zero-row tibble keeps
them and their types); an answer with nothing in it raises
`wehoop_no_data`, as in sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| match_id | integer | TBF game id (key space: TBF games, ONE global sequence across leagues and seasons: 62552 in 2006-07, 346279 in 2026-27). The match_id argument of every game wrapper; the routes echo it as a string or null, the runtime stamps the integer asked for. |
| category | character | Leader category code (leaderCategory), e.g. VerimlilikPuani = efficiency rating. |
| category_label | character | Leader category label in Turkish (leaderCategoryDescription), e.g. Verimlilik Puani. |
| rank | integer | Position in the category's list, 1 = best (top five per category). |
| side | character | Side of the leader's team (isHome). |
| player_id | integer | TBF person id of the leader (key space: TBF persons; equals the box score player_id). |
| player_name | character | Player name as TBF prints it for that route (title case, Turkish letters kept). |
| jersey_number | character | Shirt number as a string, so '0' and '00' stay distinct. |
| value | double | The leader's value in the category (points, rebounds, ...). |

## Details

Source, terms of use, request pacing, seasons, coverage and error
classes of this family: see the notes in
[`tbf_seasons()`](https://wehoop.sportsdataverse.org/reference/tbf_seasons.md).

     tbf_game_leaders(match_id = 346279)

## See also

[family_tbf](https://wehoop.sportsdataverse.org/reference/family_tbf.md)
lists every function in this family.

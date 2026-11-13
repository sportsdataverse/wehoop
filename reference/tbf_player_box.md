# **TBF Player Box Score**

Player box score of a finished game: minutes, shooting splits, rebounds,
assists, +/- and efficiency.

Endpoint:
`GET https://miniappapi.tbf.org.tr/webapi-service/api/Match/mac-istatistik`

## Usage

``` r
tbf_player_box(match_id)
```

## Arguments

- match_id:

  Required. TBF game id (integer), e.g. 346279; match_id in
  [`tbf_schedule()`](https://wehoop.sportsdataverse.org/reference/tbf_schedule.md).
  One global sequence across leagues and seasons. Only a finished game
  is served.

## Value

A `wehoop_data` tibble. One row per player who is on the sheet;
`is_starter` marks the starting five (none flagged in 2006-07). Every
column below is always present (a zero-row tibble keeps them and their
types); an answer with nothing in it raises `wehoop_no_data`, as in
sportsdataverse-py.

|  |  |  |
|----|----|----|
| col_name | type | description |
| match_id | integer | TBF game id (key space: TBF games, ONE global sequence across leagues and seasons: 62552 in 2006-07, 346279 in 2026-27). The match_id argument of every game wrapper; the routes echo it as a string or null, the runtime stamps the integer asked for. |
| side | character | Side of the game the row belongs to: home or away (from the route's isHome flag or home / away block). |
| team_process_id | integer | Team-season id of the player's side (from the game header; key space: TBF team registrations). |
| player_id | integer | TBF person id (key space: TBF persons, stable across seasons and clubs: 196413). The same value as person_id in the player and team tables and the player_id argument of tbf_player_career. |
| player_name | character | Player name as TBF prints it for that route (title case, Turkish letters kept). |
| jersey_number | character | Shirt number as a string, so '0' and '00' stay distinct. |
| is_starter | logical | True for the starting five (homeTopFive / awayTopFive block); none are flagged in 2006-07. |
| seconds_played | integer | Time on court in seconds, parsed from the 'mm:ss' or 'hh:mm:ss' text the API sends (team totals sum their players, so 200:00 = 12000). |
| points | integer | Points scored in the game (or season) the row covers. |
| fg_made | integer | Field goals made, 2PT + 3PT (successfulShots). |
| fg_attempted | integer | Field goals attempted, 2PT + 3PT (shotAttempts). |
| fg_pct | integer | Field-goal percentage 0-100, rounded to an integer by the API. |
| fg2_made | integer | Two-point field goals MADE (the API calls it twoPointShots; attempts are fg2_attempted). |
| fg2_attempted | integer | Two-point field goals attempted (twoPointShotAttempts). |
| fg2_pct | integer | Two-point percentage 0-100, an integer. |
| fg3_made | integer | Three-point field goals MADE (the API calls it threePointShots). |
| fg3_attempted | integer | Three-point field goals attempted (threePointShotAttempts). |
| fg3_pct | integer | Three-point percentage 0-100, an integer. |
| ft_made | integer | Free throws MADE (serbest atis; the API calls it freeThrows). |
| ft_attempted | integer | Free throws attempted (freeThrowAttempts). |
| ft_pct | integer | Free-throw percentage 0-100, an integer. |
| off_rebounds | integer | Offensive rebounds (hucum ribaundu). |
| def_rebounds | integer | Defensive rebounds (savunma ribaundu). |
| rebounds | integer | Total rebounds (toplam ribaund). |
| assists | integer | Assists in this game (asist). |
| steals | integer | Steals in this game (top calma). |
| blocks | integer | Shots this player blocked in this game (blok). |
| turnovers | integer | Turnovers committed in this game (top kaybi). |
| fouls | integer | Personal fouls committed (faul). |
| fouls_drawn | integer | Fouls drawn (rivalFoul = foul committed by the opponent). |
| blocks_received | integer | Own shots blocked by an opponent (blocksReceived). |
| plus_minus | integer | Plus/minus while on court (plusMinus); null when the API sends ”. |
| efficiency | integer | Efficiency rating (verimlilik puani, PIR): points + rebounds + assists + steals + blocks + fouls drawn - missed shots - turnovers - fouls. An integer on player rows. |

## Details

Source, terms of use, request pacing, seasons, coverage and error
classes of this family: see the notes in
[`tbf_seasons()`](https://wehoop.sportsdataverse.org/reference/tbf_seasons.md).

## See also

[family_tbf](https://wehoop.sportsdataverse.org/reference/family_tbf.md)
lists every function in this family.

## Examples

``` r
# \donttest{
  try(tbf_player_box(match_id = 346279))
#> ── TBF Player Box Score ──────────────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 14:52:46 UTC
#> # A tibble: 24 × 33
#>    match_id side  team_process_id player_id player_name jersey_number is_starter
#>       <int> <chr>           <int>     <int> <chr>       <chr>         <lgl>     
#>  1   346279 home           265995    196413 Yiğitcan S… 3             TRUE      
#>  2   346279 home           265995    485299 Terrell Ca… 5             TRUE      
#>  3   346279 home           265995    389934 Efe Postel  22            TRUE      
#>  4   346279 home           265995    778401 Bryce Jones 32            TRUE      
#>  5   346279 home           265995    778398 Gabe Brown  44            TRUE      
#>  6   346279 home           265995    227173 Sadık Kaba… 6             FALSE     
#>  7   346279 home           265995    508900 Jamuni McN… 8             FALSE     
#>  8   346279 home           265995    778402 Zach Nutall 10            FALSE     
#>  9   346279 home           265995    736069 Tre'shawn … 15            FALSE     
#> 10   346279 home           265995    434482 Emirhan Se… 24            FALSE     
#> # ℹ 14 more rows
#> # ℹ 26 more variables: seconds_played <int>, points <int>, fg_made <int>,
#> #   fg_attempted <int>, fg_pct <int>, fg2_made <int>, fg2_attempted <int>,
#> #   fg2_pct <int>, fg3_made <int>, fg3_attempted <int>, fg3_pct <int>,
#> #   ft_made <int>, ft_attempted <int>, ft_pct <int>, off_rebounds <int>,
#> #   def_rebounds <int>, rebounds <int>, assists <int>, steals <int>,
#> #   blocks <int>, turnovers <int>, fouls <int>, fouls_drawn <int>, …
# }
```

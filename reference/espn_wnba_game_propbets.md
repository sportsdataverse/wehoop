# **Get ESPN WNBA Event Prop Bets (Long Format)**

Returns prop-bet markets for one WNBA event + provider in long format:
one row per (athlete x prop type). Each row has american / decimal /
fraction odds plus the current target (e.g. over/under line). Hits the
core-v2 `competitions/{id}/odds/{provider_id}/propBets` endpoint and
auto-paginates.

## Usage

``` r
espn_wnba_game_propbets(event_id, provider_id, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- provider_id:

  Sportsbook provider id (e.g. 58 = ESPN BET, 100 = Caesars). Look up
  via
  [`espn_wnba_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_broadcasts.md).

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per (athlete x prop type).

## Details

**Get ESPN WNBA Event Prop Bets (Long Format)**

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_game_propbets(event_id = 401736171, provider_id = 58)
#> ✖ 2026-11-13 11:56:47.15371: Failed to retrieve ESPN wnba event prop bets for event_id=401736171, provider_id=58
#> ✖ Args: league = "wnba", event_id = 401736171, provider_id = 58
#> ✖ Error: arguments imply differing number of rows: 1, 2, 0
#> NULL
# }
```

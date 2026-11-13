# **Get ESPN WBB Event Prop Bets (Long Format)**

Returns prop-bet markets for one WBB event + provider in long format:
one row per (athlete x prop type). Each row has american / decimal /
fraction odds plus the current target (e.g. over/under line). Hits the
core-v2 `competitions/{id}/odds/{provider_id}/propBets` endpoint and
auto-paginates.

## Usage

``` r
espn_wbb_game_propbets(event_id, provider_id, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- provider_id:

  Sportsbook provider id (e.g. 58 = ESPN BET, 100 = Caesars). Look up
  via
  [`espn_wbb_game_odds()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_broadcasts.md).

- ...:

  Additional arguments; currently unused.

## Value

A long tibble with one row per (athlete x prop type).

## Details

**Get ESPN WBB Event Prop Bets (Long Format)**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_game_propbets(event_id = 401276115, provider_id = 58)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Prop Bets ────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 11:56:18 UTC
#> # A tibble: 0 × 13
#> # ℹ 13 variables: league <chr>, event_id <chr>, provider_id <chr>,
#> #   athlete_id <chr>, prop_type_id <chr>, prop_type_name <chr>, american <chr>,
#> #   decimal <dbl>, fraction <chr>, total <dbl>, current_target <dbl>,
#> #   last_updated <chr>, athlete_ref <chr>
# }
```

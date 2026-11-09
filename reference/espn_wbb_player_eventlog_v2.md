# **Get ESPN WBB Athlete Per-Season Event Log (core-v2)**

Returns one row per (event x team) for an WBB athlete's appearances in a
given season. Distinct from
[`espn_wbb_player_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_player_eventlog.md)
which wraps the web-common-v3 endpoint; this core-v2 variant is
era-correct.

## Usage

``` r
espn_wbb_player_eventlog_v2(athlete_id, season = most_recent_wbb_season(), ...)
```

## Arguments

- athlete_id:

  ESPN athlete identifier.

- season:

  Season year. Defaults to most recent WBB season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per event appearance.

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_player_eventlog_v2(athlete_id = 4433404, season = 2025)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Event Log ──────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:09:44 UTC
#> # A tibble: 0 × 8
#> # ℹ 8 variables: league <chr>, athlete_id <chr>, season <int>, event_id <chr>,
#> #   team_id <chr>, played <lgl>, event_ref <chr>, competition_ref <chr>
# }
```

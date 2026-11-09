# **Get ESPN WNBA Athlete Per-Season Event Log (core-v2)**

Returns one row per (event x team) for an WNBA athlete's appearances in
a given season. Distinct from
[`espn_wnba_player_eventlog()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_player_eventlog.md)
which wraps the web-common-v3 gamelog endpoint returning stats per game;
this core-v2 variant returns refs + `played` flag and is era-correct.

## Usage

``` r
espn_wnba_player_eventlog_v2(
  athlete_id,
  season = most_recent_wnba_season(),
  ...
)
```

## Arguments

- athlete_id:

  ESPN athlete identifier.

- season:

  Season year. Defaults to most recent WNBA season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per event appearance. See package source for
column schema.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_player_eventlog_v2(athlete_id = 2999102, season = 2025)
#> ── ESPN WNBA Athlete Event Log ───────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 11:37:17 UTC
#> # A tibble: 0 × 8
#> # ℹ 8 variables: league <chr>, athlete_id <chr>, season <int>, event_id <chr>,
#> #   team_id <chr>, played <lgl>, event_ref <chr>, competition_ref <chr>
# }
```

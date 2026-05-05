# Internal helper – ESPN basketball calendar

Fetches the schedule calendar for an ESPN basketball league and returns
a tidy tibble of calendar entries. This is the single implementation
shared by
[`espn_wbb_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_calendar.md)
(league = "womens-college-basketball") and
[`espn_wnba_calendar()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_calendar.md)
(league = "wnba"). The scoreboard endpoint carries a
`leagues[[1]]$calendar` block that describes the season types and their
date-range entries (weeks / round labels).

## Usage

``` r
.espn_basketball_calendar(league, season, ...)
```

## Arguments

- league:

  character. One of `"wnba"` or `"womens-college-basketball"`.

- season:

  integer or character. Four-digit season year (e.g. `2025`).

- ...:

  Currently unused; reserved for future pass-through arguments.

## Value

A `wehoop_data` tibble of calendar entries, or `NULL` on error.

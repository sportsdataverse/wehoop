# **Her Hoop Stats NCAA Team Single-Season Index**

**Get the NCAA women's team single-season summary table from [Her Hoop
Stats](https://herhoopstats.com).**

Her Hoop Stats is a *subscription* service; this logs in with your own
credentials (read from the `email`/`password` arguments, the
`wehoop.herhoopstats_email`/`..._password` options, or the
`HERHOOPSTATS_EMAIL`/`HERHOOPSTATS_PW` environment variables) and
returns one row per team-season, with a `team_link` column for
[`hhs_team_stats()`](https://wehoop.sportsdataverse.org/reference/hhs_team_stats.md)
/
[`hhs_team_roster()`](https://wehoop.sportsdataverse.org/reference/hhs_team_roster.md).

## Usage

``` r
hhs_teams(
  min_season = most_recent_wbb_season(),
  max_season = most_recent_wbb_season(),
  division = 1,
  email = NULL,
  password = NULL
)
```

## Arguments

- min_season, max_season:

  Season range (4-digit ending year; `2024` = 2023-24). Default both to
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).

- division:

  NCAA division: `1` (default), `2` or `3`.

- email, password:

  Optional explicit subscription credentials.

## Value

A `wehoop_data` tibble, one row per team-season (record, scoring and
per-100-possession columns), plus a `team_link` column and the requested
`min_season` / `max_season` / `division`.

## Note

Requires a Her Hoop Stats subscription. The member-table layout may
change over time; selectors here are a starting point.

## See also

Other Her Hoop Stats Functions:
[`hhs_team_roster()`](https://wehoop.sportsdataverse.org/reference/hhs_team_roster.md),
[`hhs_team_stats()`](https://wehoop.sportsdataverse.org/reference/hhs_team_stats.md)

## Examples

``` r
if (FALSE) { # \dontrun{
  # requires HERHOOPSTATS_EMAIL / HERHOOPSTATS_PW
  hhs_teams(min_season = 2024, max_season = 2024, division = 1)
} # }
```

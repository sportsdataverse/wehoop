# **Her Hoop Stats Team Roster**

**Get a team's player roster + stats from [Her Hoop
Stats](https://herhoopstats.com).**

Requires a Her Hoop Stats subscription (see
[`hhs_teams()`](https://wehoop.sportsdataverse.org/reference/hhs_teams.md)).

## Usage

``` r
hhs_team_roster(team_link, email = NULL, password = NULL)
```

## Arguments

- team_link:

  A team page path or URL (the `team_link` column from
  [`hhs_teams()`](https://wehoop.sportsdataverse.org/reference/hhs_teams.md)).

- email, password:

  Optional explicit subscription credentials.

## Value

A `wehoop_data` tibble, one row per player.

## Note

Requires a Her Hoop Stats subscription. Member-table layout may change.

## See also

Other Her Hoop Stats Functions:
[`hhs_team_stats()`](https://wehoop.sportsdataverse.org/reference/hhs_team_stats.md),
[`hhs_teams()`](https://wehoop.sportsdataverse.org/reference/hhs_teams.md)

## Examples

``` r
if (FALSE) { # \dontrun{
  teams <- hhs_teams(2024, 2024, 1)
  hhs_team_roster(team_link = teams$team_link[1])
} # }
```

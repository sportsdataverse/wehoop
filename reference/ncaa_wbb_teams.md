# **Scrape NCAA Women's Basketball Teams (Division I, II, and III)**

Scrapes the NCAA Stats per-season team list at
`http://stats.ncaa.org/team/inst_team_list?academic_year=YYYY&conf_id=-1&division=N&sport_code=WBB`.
Returns one row per team for the requested season-year and division,
with the per-season `season_id` and `team_id` parsed out of the
`stats.ncaa.org` team URL.

**Network access:** as of v3.0.0 `stats.ncaa.org` is fronted by Akamai
and returns HTTP 403 (`Reference #18.<...>`) to many residential and
cloud IP ranges regardless of headers. If you hit that block, supply a
proxy that egresses from a non-blocked address — pass `proxy =` directly
via `...` (forwarded to
[`.retry_request()`](https://wehoop.sportsdataverse.org/reference/dot-retry_request.md)),
or set it once with
`options(wehoop.proxy = list(url=, port=, username=, password=))`. See
the wehoop CLAUDE.md / pkgdown docs for the full proxy resolution order.

## Usage

``` r
ncaa_wbb_teams(year = most_recent_wbb_season(), division = 1, ...)
```

## Arguments

- year:

  The season for which data should be returned, in the form of "YYYY".
  Years currently available: 2002 onward.

- division:

  Division - 1, 2, or 3.

- ...:

  Forwarded to the internal
  [`.retry_request()`](https://wehoop.sportsdataverse.org/reference/dot-retry_request.md)
  HTTP helper. The most useful pass-through is `proxy =` (string
  `"http://host:port"` or named list
  `list(url=, port=, username=, password=, auth=)`); see
  [`?.retry_request`](https://wehoop.sportsdataverse.org/reference/dot-retry_request.md)
  for the full set of recognized arguments.

## Value

A data frame with the following variables

|                |           |                                                   |
|----------------|-----------|---------------------------------------------------|
| col_name       | types     | description                                       |
| team_id        | character | Franchise team id (legacy `/team/{id}/...` urls). |
| team_name      | character | Full team display name (e.g. 'Las Vegas Aces').   |
| team_url       | character | URL for team.                                     |
| conference_id  | character | Conference identifier.                            |
| conference     | character | Filter players or teams by conference.            |
| division       | numeric   | Team division.                                    |
| year           | numeric   | 4-digit year.                                     |
| season_id      | character | Season id (legacy urls).                          |
| season_team_id | character | Season-team id (modern `/teams/{id}` urls).       |

## Details

      ncaa_wbb_teams(year = 2025, division = 1)

      # Behind a proxy (per-call):
      ncaa_wbb_teams(
        year = 2025, division = 1,
        proxy = list(url = "http://my-proxy", port = 8080,
                     username = "user", password = "pass")
      )

      # Or session-wide:
      options(wehoop.proxy = list(url = "http://my-proxy", port = 8080,
                                  username = "user", password = "pass"))
      ncaa_wbb_teams(year = 2025, division = 1)

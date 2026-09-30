# **WNBA referee assignments for a given date**

Retrieves the referee crew assignments and replay-center officials for
every WNBA game on `date`, from official.nba.com's internal
`get-game-officials` endpoint (the same feed used by the NBA officiating
pages). That endpoint returns NBA and G-League blocks in the same
payload; this function extracts only `"wnba"`. Port of the scraping
logic in [atlhawksfanatic/L2M](https://github.com/atlhawksfanatic/L2M)
(MIT, (c) 2019 atlhawksfanatic).

## Usage

``` r
wnba_referee_assignments(date, proxy = NULL)
```

## Arguments

- date:

  Date to fetch: a single `Date`, `POSIXct`/`POSIXlt`, or `"YYYY-MM-DD"`
  string. Date-times are formatted in their own time zone, so a
  late-evening `POSIXct` keeps its calendar day.

- proxy:

  Optional proxy config. `NULL` (default) falls back to
  `getOption("wehoop.proxy")`, then lets libcurl honor the standard
  `http_proxy` / `https_proxy` / `no_proxy` environment variables. A
  single URL string (e.g. `"http://host:port"`) is forwarded to
  `httr2::req_proxy(url = proxy)`. A named list is spread as keyword
  args into
  [`httr2::req_proxy()`](https://httr2.r-lib.org/reference/req_proxy.html)
  (`url`, `port`, `username`, `password`, `auth`).

## Value

A named list of two `wehoop_data` tibbles.

`officials` – long format, one row per game x filled crew slot (WNBA
crews have three officials, so slot 4 is usually absent):

|  |  |  |
|----|----|----|
| col_name | types | description |
| league | character | League slug; always "wnba". |
| game_id | character | 10-character zero-padded game id. |
| game_date | Date | Game date. |
| season | integer | Season (the START year of the feed's season code; one calendar year for the WNBA). NA when the code is missing, not 5 characters, or its year is not numeric. |
| season_type | character | One of preseason / regular / all-star / playoffs / play-in / nba-cup-final, from the season code's leading digit. NA when the code is missing or the digit is unknown. |
| game_code | character | official.nba.com game code (`YYYYMMDD/AWAYHOME`). |
| home_team_id | integer | Home team id. |
| home_team_abbr | character | Home team abbreviation. |
| away_team_id | integer | Away team id. |
| away_team_abbr | character | Away team abbreviation. |
| crew_position | integer | Feed slot order (1-4); slot 1 is inferred to be the crew chief. |
| official_id | integer | Official id. |
| official_name | character | Official display name. |
| jersey_num | character | Official jersey number. |

`replay_center` – one row per replay-center official per game date:

|               |           |                                      |
|---------------|-----------|--------------------------------------|
| col_name      | types     | description                          |
| league        | character | League slug; always "wnba".          |
| game_date     | Date      | Game date.                           |
| official_id   | integer   | Replay-center official id.           |
| official_name | character | Replay-center official display name. |

A date with no WNBA games returns zero-row tibbles carrying this schema,
not an error. A field the feed omits comes back as `NA`; it never drops
the row or the column.

## Details

`crew_position` (1-4) is the feed's slot order; slot 1 is inferred to be
the crew chief – official.nba.com does not label crew roles in this
feed. The feed encodes the season as `<type digit><START year>` (e.g.
`"22026"` is the 2026 regular season). `season` is that START year: a
WNBA season sits inside one calendar year, so no end-year conversion is
applied. `season_type` decodes the leading digit.

Failures are signalled as classed conditions, both inheriting
`wehoop_error`:

- `wehoop_no_data` – HTTP 404, or HTTP 403 with an S3
  `<Code>AccessDenied</Code>` XML body: official.nba.com has no report
  for `date`.

- `wehoop_fetch_error` – any other non-200 status (e.g. an Akamai HTML
  403 block, or a rate limit / 5xx that outlived the retries), an empty
  or non-JSON body, JSON without the `wnba` `Table`/`Table1` `rows`
  lists or with a `Table` row that has no `game_id` or a `Table1` row
  that has no `replaycenter_official` name, or a transport failure (DNS,
  TLS, dropped connection). The feed carries the `wnba` block on every
  date, with zero rows on a day without games, so a missing block is
  never an empty day.

An invalid argument (`date` or `proxy`), including an impossible date
such as `"2026-02-31"`, is an ordinary error raised before any request.

Statuses 408, 429, 500, 502, 503 and 504 and transport failures are
retried (3 attempts in total); 403 and 404 are definitive and never
retried.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(wnba_referee_assignments(date = "2026-06-13"))
#> $officials
#> ── WNBA referee assignments from official.nba.com ───────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 02:10:28 UTC
#> # A tibble: 12 × 14
#>    league game_id    game_date  season season_type game_code       home_team_id
#>    <chr>  <chr>      <date>      <int> <chr>       <chr>                  <int>
#>  1 wnba   1022600097 2026-06-13   2026 regular     20260613/INDCON   1611661323
#>  2 wnba   1022600097 2026-06-13   2026 regular     20260613/INDCON   1611661323
#>  3 wnba   1022600097 2026-06-13   2026 regular     20260613/INDCON   1611661323
#>  4 wnba   1022600098 2026-06-13   2026 regular     20260613/MINLVA   1611661319
#>  5 wnba   1022600098 2026-06-13   2026 regular     20260613/MINLVA   1611661319
#>  6 wnba   1022600098 2026-06-13   2026 regular     20260613/MINLVA   1611661319
#>  7 wnba   1022600099 2026-06-13   2026 regular     20260613/DALPDX   1611661327
#>  8 wnba   1022600099 2026-06-13   2026 regular     20260613/DALPDX   1611661327
#>  9 wnba   1022600099 2026-06-13   2026 regular     20260613/DALPDX   1611661327
#> 10 wnba   1022600100 2026-06-13   2026 regular     20260613/LASPHX   1611661317
#> 11 wnba   1022600100 2026-06-13   2026 regular     20260613/LASPHX   1611661317
#> 12 wnba   1022600100 2026-06-13   2026 regular     20260613/LASPHX   1611661317
#> # ℹ 7 more variables: home_team_abbr <chr>, away_team_id <int>,
#> #   away_team_abbr <chr>, crew_position <int>, official_id <int>,
#> #   official_name <chr>, jersey_num <chr>
#> 
#> $replay_center
#> ── WNBA replay-center officials from official.nba.com ───── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 02:10:28 UTC
#> # A tibble: 1 × 4
#>   league game_date  official_id official_name
#>   <chr>  <date>           <int> <chr>        
#> 1 wnba   2026-06-13      101284 John Goble   
#> 
# }
```

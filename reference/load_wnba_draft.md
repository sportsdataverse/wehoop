# **Load wehoop WNBA Draft**

`load_wnba_draft_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
draft release tag without downloading any season's full data.

Loads season-level WNBA draft picks scraped from ESPN. One row per pick.
Backed by the `wehoop-wnba-data` pipeline that reads raw JSONs from
`wehoop-wnba-raw` and publishes parquet/rds artifacts to the
`espn_wnba_draft` release tag.

## Usage

``` r
load_wnba_draft_manifest()

load_wnba_draft(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA draft seasons.
  (Min: 2002)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the draft data table within the database

## Value

Returns a `wehoop_data` tibble of WNBA draft picks.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit year or 'YYYY-YY' string). |
| round | integer | Tournament / playoff round. |
| pick | integer | Pick. |
| overall | integer | Overall. |
| team_id | character | Unique team identifier. |
| team_display_name | character | Full team display name. |
| athlete_id | character | Unique athlete identifier (ESPN). |
| athlete_display_name | character | Athlete display name (full). |
| athlete_position | character | Athlete position. |
| college_id | character | Unique identifier for college. |
| college_name | character | College name. |

## See also

Other WNBA loader functions:
[`load_wnba_game_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_game_rosters.md),
[`load_wnba_officials_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_officials.md),
[`load_wnba_player_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_stats.md),
[`load_wnba_rosters_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_rosters.md),
[`load_wnba_shots_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_shots.md),
[`load_wnba_standings_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_standings.md),
[`load_wnba_team_stats_manifest()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_stats.md)

## Examples

``` r
# \donttest{
  try(load_wnba_draft(seasons = most_recent_wnba_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_draft/draft_2026.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_wnba_draft/draft_2026.rds>
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 0 × 0
# }
```

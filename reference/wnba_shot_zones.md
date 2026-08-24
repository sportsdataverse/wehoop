# **Fetch WNBA Play-by-Play and Classify Field-Goal Attempts by Shot Zone**

**Fetch WNBA Play-by-Play and Classify Field-Goal Attempts by Shot
Zone**

**Fetch WNBA Play-by-Play and Classify Field-Goal Attempts by Shot
Zone**

## Usage

``` r
wnba_shot_zones(game_id, ...)
```

## Arguments

- game_id:

  A length-1 character string — the ten-character WNBA Stats game
  identifier (e.g. `"1022400003"` for a 2024 WNBA game).

- ...:

  Reserved for future keyword arguments (currently ignored).

## Value

Returns a `data.frame` containing the full V3 play-by-play for `game_id`
with an appended `shot_zone` column:

|  |  |  |
|----|----|----|
| col_name | types | description |
| event_type | character | Play event type code. `"1"` = MadeShot, `"2"` = MissedShot, `"3"` = FreeThrow, etc. |
| shot_value | integer | Point value of the shot attempt (2 or 3); 0 for non-FGA events. |
| x_legacy | numeric | Horizontal court coordinate (legacy units). Negative = left side of the court. |
| y_legacy | numeric | Vertical court coordinate (legacy units). Values near 0 = baseline. |
| shot_distance | numeric | Distance from the basket in feet. |
| shot_zone | character | Shot-zone classification. One of `"corner_3"`, `"above_the_break_3"`, `"restricted_area"`, `"in_the_paint_non_ra"`, `"mid_range"`. `NA` on non-field-goal rows. |

All other columns from the V3 PBP schema
([`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md))
are also present. Returns a 0-row frame when the game cannot be fetched
(never-raise).

**Shot zone definitions (pbpstats-core aligned):**

- `"corner_3"` — three-point attempt with `abs(x_legacy) >= 220` and
  `y_legacy <= 87.5` (baseline corner area).

- `"above_the_break_3"` — all other three-point attempts.

- `"restricted_area"` — two-point attempt within 4 ft of the basket.

- `"in_the_paint_non_ra"` — two-point attempt 4–8 ft from the basket and
  within 80 legacy units of the paint center (`abs(x_legacy) <= 80`).

- `"mid_range"` — all remaining two-point attempts.

## Details

     df <- wnba_shot_zones(game_id = "1022400003")
     print(table(df$shot_zone, useNA = "ifany"))

## See also

Other WNBA Lineup Functions:
[`wnba_gamerotation()`](https://wehoop.sportsdataverse.org/reference/wnba_gamerotation.md),
[`wnba_leaguedashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguedashlineups.md),
[`wnba_leaguelineupviz()`](https://wehoop.sportsdataverse.org/reference/wnba_leaguelineupviz.md),
[`wnba_possession_lineups()`](https://wehoop.sportsdataverse.org/reference/wnba_possession_lineups.md),
[`wnba_rapm()`](https://wehoop.sportsdataverse.org/reference/wnba_rapm.md),
[`wnba_shotchartlineupdetail()`](https://wehoop.sportsdataverse.org/reference/wnba_shotchartlineupdetail.md),
[`wnba_teamdashlineups()`](https://wehoop.sportsdataverse.org/reference/wnba_teamdashlineups.md)

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try({
    df <- wnba_shot_zones(game_id = "1022400003")
    print(df[!is.na(df$shot_zone), c("shot_distance", "shot_zone")])
  })
#> ✖ 2026-08-24 07:37:01.430782: Invalid arguments or no V3 play-by-play data for 1022400003 available!
#> ✖ Args: game_id = "1022400003", start_period = 0, end_period = 0
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-08-24 07:38:01.468987: Invalid arguments or no traditional boxscore v3 data for 1022400003 available!
#> ✖ Args: game_id = "1022400003", start_period = 0, end_period = 14, start_range = 0, end_range = 0, range_type = 0
#> ✖ Error: Failed to perform HTTP request. Caused by error in `curl::curl_fetch_memory()`: ! Timeout was reached [stats.wnba.com]: Operation timed out after 60001 milliseconds with 0 bytes received
#> ✖ 2026-08-24 07:38:01.485571: Invalid arguments or no V3 play-by-play data for 1022400003 available!
#> ✖ Args: game_id = "1022400003", on_court = FALSE, version = "v3", p = NULL
#> ✖ Error: incorrect number of dimensions
#> Error in if (nrow(pbp) == 0L) { : argument is of length zero
# }
```

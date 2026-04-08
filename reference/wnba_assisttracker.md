# **Get WNBA Stats API Assist Tracker**

**Get WNBA Stats API Assist Tracker**

**Get WNBA Stats API Assist Tracker**

## Usage

``` r
wnba_assisttracker(
  league_id = "10",
  per_mode = "PerGame",
  season = most_recent_wnba_season() - 1,
  season_type = "Regular Season",
  ...
)
```

## Arguments

- league_id:

  League - default: '00'. Other options include '10': WWNBA, '20':
  G-League

- per_mode:

  Per Mode - PerGame, Totals

- season:

  Season - format 2020-21

- season_type:

  Season Type - Regular Season, Playoffs, All-Star

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: AssistTracker

**AssistTracker**

|          |         |
|----------|---------|
| col_name | types   |
| ASSISTS  | numeric |

## Details

      wnba_assisttracker(league_id = '10')

## See also

Other WNBA Leaders Functions:
[`wnba_alltimeleadersgrids()`](https://wehoop.sportsdataverse.org/reference/wnba_alltimeleadersgrids.md),
[`wnba_assistleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_assistleaders.md),
[`wnba_homepagewidget()`](https://wehoop.sportsdataverse.org/reference/wnba_homepagewidget.md),
[`wnba_leagueleaders()`](https://wehoop.sportsdataverse.org/reference/wnba_leagueleaders.md)

## Author

Saiem Gilani

# **Get WNBA Stats API Cumulative Team Game Stats**

**Get WNBA Stats API Cumulative Team Game Stats**

**Get WNBA Stats API Cumulative Team Game Stats**

## Usage

``` r
wnba_cumestatsteamgames(
  league_id = "10",
  location = "",
  outcome = "",
  season = "2021-22",
  season_id = "",
  season_type = "Regular Season",
  team_id = 1611661317,
  vs_conference = "",
  vs_division = "",
  vs_team_id = "",
  ...
)
```

## Arguments

- league_id:

  league_id

- location:

  location

- outcome:

  outcome

- season:

  season

- season_id:

  season_id

- season_type:

  season_type

- team_id:

  team_id

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- vs_team_id:

  vs_team_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: CumeStatsTeamGames

**CumeStatsTeamGames**

|          |           |
|----------|-----------|
| col_name | types     |
| MATCHUP  | character |
| GAME_ID  | character |

## Details

      wnba_cumestatsteamgames(team_id = 1611661317, season = "2021-22")
    ``

## See also

Other WNBA Cume Functions:
[`wnba_cumestatsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayer.md),
[`wnba_cumestatsplayergames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayergames.md),
[`wnba_cumestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteam.md)

## Author

Saiem Gilani

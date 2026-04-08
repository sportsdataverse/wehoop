# **Get WNBA Stats API Cumulative Player Game Stats**

**Get WNBA Stats API Cumulative Player Game Stats**

**Get WNBA Stats API Cumulative Player Game Stats**

## Usage

``` r
wnba_cumestatsplayergames(
  league_id = "10",
  location = "",
  outcome = "",
  player_id = "204319",
  season = "2021-22",
  season_type = "Regular Season",
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

- player_id:

  player_id

- season:

  season

- season_type:

  season_type

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- vs_team_id:

  vs_team_id

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a named list of data frames: CumeStatsPlayerGames

**CumeStatsPlayerGames**

|          |           |
|----------|-----------|
| col_name | types     |
| MATCHUP  | character |
| GAME_ID  | character |

## Details

      wnba_cumestatsplayergames(player_id = "204319", season = "2021-22")

## See also

Other WNBA Cume Functions:
[`wnba_cumestatsplayer()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsplayer.md),
[`wnba_cumestatsteamgames()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteamgames.md),
[`wnba_cumestatsteam()`](https://wehoop.sportsdataverse.org/reference/wnba_cumestatsteam.md)

## Author

Saiem Gilani

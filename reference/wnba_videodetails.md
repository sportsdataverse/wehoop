# **Get WNBA Stats API Video Details**

**Get WNBA Stats API Video Details**

**Get WNBA Stats API Video Details**

## Usage

``` r
wnba_videodetails(
  ahead_behind = "",
  clutch_time = "",
  context_filter = "",
  context_measure = "FGA",
  date_from = "",
  date_to = "",
  end_period = "",
  end_range = "",
  game_id = "",
  game_segment = "",
  last_n_games = 0,
  league_id = "10",
  location = "",
  month = 0,
  opponent_team_id = 0,
  outcome = "",
  period = 0,
  player_id = "1627668",
  point_diff = "",
  position = "",
  range_type = "",
  rookie_year = "",
  season = most_recent_wnba_season(),
  season_segment = "",
  season_type = "Regular Season",
  start_period = "",
  start_range = "",
  team_id = "1611661328",
  vs_conference = "",
  vs_division = "",
  ...
)
```

## Arguments

- ahead_behind:

  ahead_behind

- clutch_time:

  clutch_time

- context_filter:

  context_filter

- context_measure:

  context_measure

- date_from:

  date_from

- date_to:

  date_to

- end_period:

  end_period

- end_range:

  end_range

- game_id:

  game_id

- game_segment:

  game_segment

- last_n_games:

  last_n_games

- league_id:

  league_id

- location:

  location

- month:

  month

- opponent_team_id:

  opponent_team_id

- outcome:

  outcome

- period:

  period

- player_id:

  player_id

- point_diff:

  point_diff

- position:

  position

- range_type:

  range_type

- rookie_year:

  rookie_year

- season:

  season

- season_segment:

  season_segment

- season_type:

  season_type

- start_period:

  start_period

- start_range:

  start_range

- team_id:

  team_id

- vs_conference:

  vs_conference

- vs_division:

  vs_division

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Return a list of tibbles: videoUrls, playlist

**videoUrls**

|          |           |
|----------|-----------|
| col_name | types     |
| uuid     | character |
| dur      | logical   |
| stt      | logical   |
| stp      | logical   |
| sth      | logical   |
| stw      | logical   |
| mtt      | logical   |
| mtp      | logical   |
| mth      | logical   |
| mtw      | logical   |
| ltt      | logical   |
| ltp      | logical   |
| lth      | logical   |
| ltw      | logical   |

**playlist**

|          |           |
|----------|-----------|
| col_name | types     |
| gi       | character |
| ei       | integer   |
| y        | integer   |
| m        | character |
| d        | character |
| gc       | character |
| p        | integer   |
| dsc      | character |
| ha       | character |
| va       | character |
| hpb      | integer   |
| hpa      | integer   |
| vpb      | integer   |
| vpa      | integer   |
| pta      | integer   |

## Details

      wnba_videodetails(player_id = '1627668', team_id = '1611661328')

## See also

Other WNBA Video Functions:
[`wnba_videodetailsasset()`](https://wehoop.sportsdataverse.org/reference/wnba_videodetailsasset.md),
[`wnba_videoevents()`](https://wehoop.sportsdataverse.org/reference/wnba_videoevents.md),
[`wnba_videostatus()`](https://wehoop.sportsdataverse.org/reference/wnba_videostatus.md)

## Author

Saiem Gilani

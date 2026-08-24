# **Get WNBA Stats API Video Details**

**Get WNBA Stats API Video Details**

**Get WNBA Stats API Video Details**

**Get WNBA Stats API Video Details**

## Usage

``` r
wnba_videodetailsasset(
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

|          |           |             |
|----------|-----------|-------------|
| col_name | types     | description |
| uuid     | character | Uuid.       |
| sdur     | integer   | Sdur.       |
| surl     | character | Surl.       |
| sth      | character | Sth.        |
| mdur     | integer   | Mdur.       |
| murl     | character | Murl.       |
| mth      | character | Mth.        |
| ldur     | integer   | Ldur.       |
| lurl     | character | Lurl.       |
| lth      | character | Lth.        |
| vtt      | character | Vtt.        |
| scc      | character | Scc.        |
| srt      | character | Srt.        |

**playlist**

|          |           |             |
|----------|-----------|-------------|
| col_name | types     | description |
| gi       | character | Gi.         |
| ei       | integer   | Ei.         |
| y        | integer   | Y.          |
| m        | character | M.          |
| d        | character | D.          |
| gc       | character | Gc.         |
| p        | integer   | P.          |
| dsc      | character | Dsc.        |
| ha       | character | Ha.         |
| hid      | integer   | Hid.        |
| va       | character | Va.         |
| vid      | integer   | Vid.        |
| hpb      | integer   | Hpb.        |
| hpa      | integer   | Hpa.        |
| vpb      | integer   | Vpb.        |
| vpa      | integer   | Vpa.        |
| pta      | integer   | Pta.        |

Return a list of tibbles: videoUrls, playlist

**videoUrls**

|          |           |             |
|----------|-----------|-------------|
| col_name | types     | description |
| uuid     | character | Uuid.       |
| dur      | logical   | Dur.        |
| stt      | logical   | Stt.        |
| stp      | logical   | Stp.        |
| sth      | logical   | Sth.        |
| stw      | logical   | Stw.        |
| mtt      | logical   | Mtt.        |
| mtp      | logical   | Mtp.        |
| mth      | logical   | Mth.        |
| mtw      | logical   | Mtw.        |
| ltt      | logical   | Ltt.        |
| ltp      | logical   | Ltp.        |
| lth      | logical   | Lth.        |
| ltw      | logical   | Ltw.        |

**playlist**

|          |           |             |
|----------|-----------|-------------|
| col_name | types     | description |
| gi       | character | Gi.         |
| ei       | integer   | Ei.         |
| y        | integer   | Y.          |
| m        | character | M.          |
| d        | character | D.          |
| gc       | character | Gc.         |
| p        | integer   | P.          |
| dsc      | character | Dsc.        |
| ha       | character | Ha.         |
| va       | character | Va.         |
| hpb      | integer   | Hpb.        |
| hpa      | integer   | Hpa.        |
| vpb      | integer   | Vpb.        |
| vpa      | integer   | Vpa.        |
| pta      | integer   | Pta.        |

## Details

      wnba_videodetailsasset(player_id = '1627668', team_id = '1611661328')

      wnba_videodetails(player_id = '1627668', team_id = '1611661328')

## See also

Other WNBA Video Functions:
[`wnba_videoevents()`](https://wehoop.sportsdataverse.org/reference/wnba_videoevents.md),
[`wnba_videostatus()`](https://wehoop.sportsdataverse.org/reference/wnba_videostatus.md)

## Author

Saiem Gilani

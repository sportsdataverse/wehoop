# **Get WNBA Stats API play-by-play (Multiple Games)**

**Get WNBA Stats API play-by-play (Multiple Games)**

**Get WNBA Stats API play-by-play (Multiple Games)**

## Usage

``` r
wnba_pbps(
  game_ids = NULL,
  on_court = TRUE,
  version = "v3",
  nest_data = FALSE,
  ...
)
```

## Arguments

- game_ids:

  Game IDs

- on_court:

  IF TRUE will be added ID of players on court

- version:

  Play-by-play version - `"v3"` (default) or `"v2"`. V3 returns richer
  data with shot coordinates, shot values, and V3 action types. V2 is
  available from 2016-17 onwards.

- nest_data:

  If TRUE returns nested data by game

- ...:

  Additional arguments passed to an underlying function like httr.

## Value

Returns a data frame: PlayByPlay

Columns as documented in the shared
[wnba_players_on_court_schema](https://wehoop.sportsdataverse.org/reference/wnba_players_on_court_schema.md)
table.

## Details

    y <- c("1022200034", "1022200035" )

    wnba_pbps(game_ids = y, version = "v2")

## See also

Other WNBA PBP Functions:
[`wnba_data_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_data_pbp.md),
[`wnba_live_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_live_pbp.md),
[`wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/wnba_pbp.md),
[`wnba_playbyplayv3()`](https://wehoop.sportsdataverse.org/reference/wnba_playbyplayv3.md)

## Author

Jason Lee

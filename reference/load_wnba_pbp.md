# **Load wehoop WNBA play-by-play**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

## Usage

``` r
load_wnba_pbp(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2002)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database (used by
  [`update_wnba_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_db.md)).

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the play by play data table within the database

## Value

A dataframe with 42 columns

- shooting_play:

  Logical value (TRUE/FALSE) indicating whether the play was a shooting
  play

- sequence_number:

  Sequence number is supposed to represent a shot-possession, examine
  the last two numbers to see if there are multiple events that occur
  within the same shot-possession. A shot-possession is basically any
  sequence of plays until there is a shot, change in possession, and
  probably things like technical fouls and the like. So as soon as a
  shot goes up, a new sequence starts regardless, even if the shooting
  team retains possession via offensive or deadball rebound. The first
  portion of the number is usually time related (i.e. the numeric
  representation of when the sequence started, from a seconds remaining
  in the period perspective or so)

- period_display_value:

  Long form of period (1st quarter, 2nd Quarter, OT, etc.)

- period_number:

  The numeric period of play in the game

- home_score:

  Home score at the time of the play

- coordinate_x:

  The entire scale is a rectangle of size 25x47, intended as a
  half-court representation of the basketball court (i.e. on the side of
  the offense), with each coordinate unit representing a foot. It
  appears that the basket is roughly represented as the (25, 0) point.
  This is a nonsensical definition when considering that the basket
  overhangs the court, with the backboard aligned 48 inches from the
  baseline, then the center of the hoop being roughly 11 inches from
  there. This is an idiosyncracy of either sensor placement or software
  and data entry. Use your best judgement in making your charts, I think
  you will find that making some translations will be helpful.

- coordinate_y:

- scoring_play:

  Logical value (TRUE/FALSE) indicating whether the play was a play on
  which the offense scored

- clock_display_value:

  Time left within the period

- team_id:

  Unique team identification number for the offensive team

- type_id:

  Unique play type identifcation number

- type_text:

  Play type text description

- away_score:

  Away score at the time of the play

- id:

  Unique play identifcation number

- text:

  Text description of the play

- score_value:

  The points value of the shot taken

- participants_0_athlete_id:

  Unique player identification number

- participants_1_athlete_id:

  Unique player identification number

- participants_2_athlete_id:

  Unique player identification number

- type_abbreviation:

  Play type abbreviation

- season:

  Season of the game

- season_type:

  Season type of the game, 1 is pre-season, 2 is regular season, 3 is
  post-season, 4 is off-season

- away_team_id:

  Unique away team identification number

- away_team_name:

  Away team name

- away_team_mascot:

  Away team mascot

- away_team_abbrev:

  Text abbreviation for the away team

- away_team_name_alt:

  Alternate versions of the away team abbreviation

- home_team_id:

  Unique home team identification number

- home_team_name:

  home team name

- home_team_mascot:

  home team mascot

- home_team_abbrev:

  Text abbreviation for the home team

- home_team_name_alt:

  Alternate versions of the home team abbreviation

- home_team_spread:

  The game spread with respect to the home team

- game_spread:

  Game spread in (-X Team) format. There are almost none, I would
  recommend not trusting any of these three columns

- home_favorite:

  Logical (TRUE/FALSE) indicating whether the home team is favored

- clock_minutes:

  Clock minutes split from seconds for developer convenience

- clock_seconds:

  Clock seconds split from minutes for developer convenience

- half:

  Half of the game

- lag_half:

  A lag column on the half

- lead_half:

  A lead column on the half

- game_play_number:

  Game play number

- game_id:

  Unique identifier for the game event

## Examples

``` r
# \donttest{
  try(load_wnba_pbp())
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 121,342 × 62
#>    game_play_number        id sequence_number type_id type_text text  away_score
#>               <int>     <dbl>           <int>   <int> <chr>     <chr>      <int>
#>  1                1   4.02e 9               4     615 Jumpball  NaLy…          0
#>  2                2   4.02e 9               7     131 Pullup J… Kahl…          0
#>  3                3   4.02e 9               8     155 Defensiv… Jack…          0
#>  4                4   4.02e 9               9      95 Layup Sh… NaLy…          0
#>  5                5   4.02e10              10     156 Offensiv… NaLy…          0
#>  6                6   4.02e10              11     125 Layup Sh… NaLy…          2
#>  7                7   4.02e10              12     131 Pullup J… Moni…          2
#>  8                8   4.02e10              13      44 Shooting… Nata…          2
#>  9                9   4.02e10              15      98 Free Thr… A'ja…          3
#> 10               10   4.02e10              16      99 Free Thr… A'ja…          4
#> # ℹ 121,332 more rows
#> # ℹ 55 more variables: home_score <int>, period_number <int>,
#> #   period_display_value <chr>, clock_display_value <chr>, scoring_play <lgl>,
#> #   score_value <int>, team_id <int>, athlete_id_1 <int>, athlete_id_2 <int>,
#> #   athlete_id_3 <int>, wallclock <chr>, shooting_play <lgl>,
#> #   coordinate_x_raw <dbl>, coordinate_y_raw <dbl>, game_id <int>,
#> #   season <int>, season_type <int>, home_team_id <int>, …
# }
```

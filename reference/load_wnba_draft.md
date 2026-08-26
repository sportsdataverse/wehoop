# **Load cleaned WNBA play-by-play from the data repo**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

`load_wnba_rosters_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
rosters release tag without downloading any season's full data.

`load_wnba_player_stats_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
player season stats release tag without downloading any season's full
data.

`load_wnba_team_stats_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
team season stats release tag without downloading any season's full
data.

`load_wnba_standings_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
standings release tag without downloading any season's full data.

`load_wnba_draft_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
draft release tag without downloading any season's full data.

`load_wnba_shots_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
shots release tag without downloading any season's full data.

`load_wnba_game_rosters_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
game rosters release tag without downloading any season's full data.

`load_wnba_officials_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
officials release tag without downloading any season's full data.

Loads season-level WNBA team rosters scraped from ESPN. One row per
athlete-team-season triple. Backed by the `wehoop-wnba-data` pipeline
that reads raw JSONs from `wehoop-wnba-raw` and publishes parquet/rds
artifacts to the `espn_wnba_rosters` release tag.

Loads season-level WNBA player statistics scraped from ESPN. One row per
athlete-team-season-statistic-grouping. Backed by the `wehoop-wnba-data`
pipeline that reads raw JSONs from `wehoop-wnba-raw` and publishes
parquet/rds artifacts to the `espn_wnba_player_season_stats` release
tag.

Loads season-level WNBA team statistics scraped from ESPN. One row per
team-season-statistic-grouping. Backed by the `wehoop-wnba-data`
pipeline that reads raw JSONs from `wehoop-wnba-raw` and publishes
parquet/rds artifacts to the `espn_wnba_team_season_stats` release tag.

Loads season-level WNBA standings scraped from ESPN. One row per
team-season. Backed by the `wehoop-wnba-data` pipeline that reads raw
JSONs from `wehoop-wnba-raw` and publishes parquet/rds artifacts to the
`espn_wnba_standings` release tag.

Loads season-level WNBA draft picks scraped from ESPN. One row per pick.
Backed by the `wehoop-wnba-data` pipeline that reads raw JSONs from
`wehoop-wnba-raw` and publishes parquet/rds artifacts to the
`espn_wnba_draft` release tag.

Loads shot events parsed from ESPN WNBA play-by-play feeds. One row per
shot attempt (made or missed), with court coordinates and shot metadata.
Backed by the `wehoop-wnba-data` pipeline that reads raw JSONs from
`wehoop-wnba-raw` and publishes parquet/rds artifacts to the
`espn_wnba_shots` release tag.

Loads per-game rosters scraped from ESPN WNBA box scores. One row per
athlete-team-game triple, with athlete identifiers, jersey, position,
starter flag, and DNP status. Backed by the `wehoop-wnba-data` pipeline
that reads raw JSONs from `wehoop-wnba-raw` and publishes parquet/rds
artifacts to the `espn_wnba_game_rosters` release tag.

Loads game-level officials data scraped from ESPN WNBA summary feeds.
One row per official-game pair. Backed by the `wehoop-wnba-data`
pipeline that reads raw JSONs from `wehoop-wnba-raw` and publishes
parquet/rds artifacts to the `espn_wnba_officials` release tag.

Loads ESPN WNBA athlete core records – identity and biographical fields,
one row per athlete who appeared in the season. Backed by the
`wehoop-wnba-data` pipeline that reads raw JSONs from `wehoop-wnba-raw`
and publishes parquet/rds artifacts to the `espn_wnba_player_core`
release tag.

This is the only source of athlete bio in the pipeline: the player
season stats payload carries no identity at all – not even the athlete
id.

Two properties of the source are worth knowing before joining:

- `current_team_id` is the athlete's CURRENT team, not their team in the
  requested season. Season team lives in `load_wnba_player_box()` /
  `load_wnba_player_stats()`.

- Bio (height / weight / jersey) is a current snapshot that ESPN
  overwrites in place; it is not era-correct for a historical season.
  The season dimension here is participation, not the bio's vintage.

Field coverage is era-dependent by nature – headshots exist only for
modern players, while college and date of birth thin out the other way.

## Usage

``` r
load_wnba_pbp(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_team_box(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_player_box(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_schedule(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_rosters_manifest()

load_wnba_player_stats_manifest()

load_wnba_team_stats_manifest()

load_wnba_standings_manifest()

load_wnba_draft_manifest()

load_wnba_shots_manifest()

load_wnba_game_rosters_manifest()

load_wnba_officials_manifest()

load_wnba_rosters(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_player_stats(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_team_stats(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_standings(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_draft(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_shots(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_game_rosters(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_officials(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wnba_player_core(
  seasons = most_recent_wnba_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WNBA seasons. (Min:
  2003)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the player core table within the database

## Value

A dataframe with 42 columns

|  |  |
|----|----|
| col_name | description |
| shooting_play | Logical value (TRUE/FALSE) indicating whether the play was a shooting play |
| sequence_number | Sequence number is supposed to represent a shot-possession, examine the last two numbers to see if there are multiple events that occur within the same shot-possession. A shot-possession is basically any sequence of plays until there is a shot, change in possession, and probably things like technical fouls and the like. So as soon as a shot goes up, a new sequence starts regardless, even if the shooting team retains possession via offensive or deadball rebound. The first portion of the number is usually time related (i.e. the numeric representation of when the sequence started, from a seconds remaining in the period perspective or so) |
| period_display_value | Long form of period (1st quarter, 2nd Quarter, OT, etc.) |
| period_number | The numeric period of play in the game |
| home_score | Home score at the time of the play |
| coordinate_x | The entire scale is a rectangle of size 25x47, intended as a half-court representation of the basketball court (i.e. on the side of the offense), with each coordinate unit representing a foot. It appears that the basket is roughly represented as the (25, 0) point. This is a nonsensical definition when considering that the basket overhangs the court, with the backboard aligned 48 inches from the baseline, then the center of the hoop being roughly 11 inches from there. This is an idiosyncracy of either sensor placement or software and data entry. Use your best judgement in making your charts, I think you will find that making some translations will be helpful. |
| coordinate_y |  |
| scoring_play | Logical value (TRUE/FALSE) indicating whether the play was a play on which the offense scored |
| clock_display_value | Time left within the period |
| team_id | Unique team identification number for the offensive team |
| type_id | Unique play type identifcation number |
| type_text | Play type text description, passed through verbatim from ESPN. Note: ESPN labels the free-throw play TYPE "MadeFreeThrow" for made AND missed free throws; filter makes vs. misses with `scoring_play` (TRUE = made), not `type_text` |
| away_score | Away score at the time of the play |
| id | Unique play identifcation number |
| text | Text description of the play |
| score_value | The points value of the shot taken (1 / 2 / 3). Set to the attempt's value even on misses (a missed free throw still carries 1); use `scoring_play` to identify points actually scored |
| participants_0_athlete_id | Unique player identification number |
| participants_1_athlete_id | Unique player identification number |
| participants_2_athlete_id | Unique player identification number |
| type_abbreviation | Play type abbreviation |
| season | Season of the game |
| season_type | Season type of the game, 1 is pre-season, 2 is regular season, 3 is post-season, 4 is off-season |
| away_team_id | Unique away team identification number |
| away_team_name | Away team name |
| away_team_mascot | Away team mascot |
| away_team_abbrev | Text abbreviation for the away team |
| away_team_name_alt | Alternate versions of the away team abbreviation |
| home_team_id | Unique home team identification number |
| home_team_name | home team name |
| home_team_mascot | home team mascot |
| home_team_abbrev | Text abbreviation for the home team |
| home_team_name_alt | Alternate versions of the home team abbreviation |
| home_team_spread | The game spread with respect to the home team |
| game_spread | Game spread in (-X Team) format. There are almost none, I would recommend not trusting any of these three columns |
| home_favorite | Logical (TRUE/FALSE) indicating whether the home team is favored |
| clock_minutes | Clock minutes split from seconds for developer convenience |
| clock_seconds | Clock seconds split from minutes for developer convenience |
| half | Half of the game |
| lag_half | A lag column on the half |
| lead_half | A lead column on the half |
| game_play_number | Game play number |
| game_id | Unique identifier for the game event |

Returns a tibble

Returns a tibble

Returns a tibble

Returns a `wehoop_data` tibble with one row per athlete-team-season.

Returns a `wehoop_data` tibble of player season stats.

Returns a `wehoop_data` tibble of team season stats.

Columns as documented in the shared
[basketball_load_wbb_team_stats_schema](https://wehoop.sportsdataverse.org/reference/basketball_load_wbb_team_stats_schema.md)
table.

Returns a `wehoop_data` tibble of team standings.

Columns as documented in the shared
[basketball_load_wbb_standings_schema](https://wehoop.sportsdataverse.org/reference/basketball_load_wbb_standings_schema.md)
table.

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

Returns a `wehoop_data` tibble with one row per shot attempt.

Columns as documented in the shared
[basketball_load_wbb_shots_schema](https://wehoop.sportsdataverse.org/reference/basketball_load_wbb_shots_schema.md)
table.

Returns a `wehoop_data` tibble with one row per athlete-team-game.

Columns as documented in the shared
[basketball_load_wbb_game_rosters_schema](https://wehoop.sportsdataverse.org/reference/basketball_load_wbb_game_rosters_schema.md)
table.

Returns a `wehoop_data` tibble with one row per official-game pair.

Columns as documented in the shared
[basketball_load_wbb_officials_schema](https://wehoop.sportsdataverse.org/reference/basketball_load_wbb_officials_schema.md)
table.

Returns a `wehoop_data` tibble of athlete core records.

## Examples

``` r
# \donttest{
  try(load_wnba_pbp())
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 117,923 × 67
#>    game_play_number        id sequence_number type_id type_text text  away_score
#>               <int>     <dbl>           <int>   <int> <chr>     <chr>      <int>
#>  1                1   4.02e 9               4     615 "Jumpbal… "Kam…          0
#>  2                2   4.02e 9               7      92 "Jump Sh… "Syd…          0
#>  3                3   4.02e 9               8     155 "Defensi… "San…          0
#>  4                4   4.02e 9               9     113 "Running… "Dia…          0
#>  5                5   4.02e10              10     155 "Defensi… "Cou…          0
#>  6                6   4.02e10              11      62 "Bad Pas… "Kam…          0
#>  7                7   4.02e10              13     137 "Turnaro… "Aal…          0
#>  8                8   4.02e10              14     141 "Cutting… "Azu…          0
#>  9                9   4.02e10              15     155 "Defensi… "Aal…          0
#> 10               10   4.02e10              16     127 "Layup R… "Dia…          0
#> # ℹ 117,913 more rows
#> # ℹ 60 more variables: home_score <int>, period_number <int>,
#> #   period_display_value <chr>, clock_display_value <chr>, scoring_play <lgl>,
#> #   score_value <int>, team_id <int>, athlete_id_1 <int>, athlete_id_2 <int>,
#> #   athlete_id_3 <int>, wallclock <chr>, shooting_play <lgl>,
#> #   coordinate_x_raw <dbl>, coordinate_y_raw <dbl>, points_attempted <int>,
#> #   short_description <chr>, game_id <int>, season <int>, season_type <int>, …
# }
# \donttest{
  try(load_wnba_team_box())
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 576 × 59
#>      game_id season season_type game_date  game_date_time      team_id team_uid 
#>        <int>  <int>       <int> <date>     <dttm>                <int> <chr>    
#>  1 401857173   2026           2 2026-08-25 2026-08-25 19:00:00      19 s:40~l:5…
#>  2 401857173   2026           2 2026-08-25 2026-08-25 19:00:00      18 s:40~l:5…
#>  3 401857174   2026           2 2026-08-25 2026-08-25 20:00:00  132052 s:40~l:5…
#>  4 401857174   2026           2 2026-08-25 2026-08-25 20:00:00       3 s:40~l:5…
#>  5 401857175   2026           2 2026-08-25 2026-08-25 22:00:00      16 s:40~l:5…
#>  6 401857175   2026           2 2026-08-25 2026-08-25 22:00:00      11 s:40~l:5…
#>  7 401857171   2026           2 2026-08-24 2026-08-24 20:00:00  129689 s:40~l:5…
#>  8 401857171   2026           2 2026-08-24 2026-08-24 20:00:00       8 s:40~l:5…
#>  9 401857172   2026           2 2026-08-24 2026-08-24 22:00:00      20 s:40~l:5…
#> 10 401857172   2026           2 2026-08-24 2026-08-24 22:00:00       6 s:40~l:5…
#> # ℹ 566 more rows
#> # ℹ 52 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>, …
# }
# \donttest{
  try(load_wnba_player_box())
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 6,945 × 57
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401857173   2026           2 2026-08-25 2026-08-25 19:00:00    3142010
#>  2 401857173   2026           2 2026-08-25 2026-08-25 19:00:00    4433405
#>  3 401857173   2026           2 2026-08-25 2026-08-25 19:00:00        981
#>  4 401857173   2026           2 2026-08-25 2026-08-25 19:00:00    2529137
#>  5 401857173   2026           2 2026-08-25 2026-08-25 19:00:00    4594786
#>  6 401857173   2026           2 2026-08-25 2026-08-25 19:00:00    2566081
#>  7 401857173   2026           2 2026-08-25 2026-08-25 19:00:00    2566186
#>  8 401857173   2026           2 2026-08-25 2026-08-25 19:00:00    4066548
#>  9 401857173   2026           2 2026-08-25 2026-08-25 19:00:00    4432865
#> 10 401857173   2026           2 2026-08-25 2026-08-25 19:00:00    4433433
#> # ℹ 6,935 more rows
#> # ℹ 51 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
# }
# \donttest{
  try(load_wnba_schedule())
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 333 × 77
#>         id uid   date  attendance time_valid neutral_site conference_competition
#>      <int> <chr> <chr>      <dbl> <lgl>      <lgl>        <lgl>                 
#>  1  4.02e8 s:40… 2026…          0 TRUE       FALSE        FALSE                 
#>  2  4.02e8 s:40… 2026…          0 TRUE       FALSE        FALSE                 
#>  3  4.02e8 s:40… 2026…          0 TRUE       FALSE        FALSE                 
#>  4  4.02e8 s:40… 2026…          0 TRUE       FALSE        FALSE                 
#>  5  4.02e8 s:40… 2026…          0 TRUE       FALSE        FALSE                 
#>  6  4.02e8 s:40… 2026…          0 TRUE       FALSE        FALSE                 
#>  7  4.02e8 s:40… 2026…          0 TRUE       FALSE        FALSE                 
#>  8  4.02e8 s:40… 2026…          0 TRUE       FALSE        FALSE                 
#>  9  4.02e8 s:40… 2026…          0 TRUE       FALSE        FALSE                 
#> 10  4.02e8 s:40… 2026…          0 TRUE       FALSE        FALSE                 
#> # ℹ 323 more rows
#> # ℹ 70 more variables: play_by_play_available <lgl>, recent <lgl>,
#> #   start_date <chr>, broadcast <chr>, highlights <chr>, notes_type <chr>,
#> #   notes_headline <chr>, broadcast_market <chr>, broadcast_name <chr>,
#> #   type_id <int>, type_abbreviation <chr>, venue_id <int>,
#> #   venue_full_name <chr>, venue_address_city <chr>, venue_address_state <chr>,
#> #   venue_indoor <lgl>, status_clock <dbl>, status_display_clock <chr>, …
# }
# \donttest{
  try(load_wnba_rosters(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 212 × 36
#>    season team_id team_slug team_abbreviation team_display_name
#>     <int>   <int> <chr>     <chr>             <chr>            
#>  1   2026      11 NA        PHX               Phoenix Mercury  
#>  2   2026      11 NA        PHX               Phoenix Mercury  
#>  3   2026      11 NA        PHX               Phoenix Mercury  
#>  4   2026      11 NA        PHX               Phoenix Mercury  
#>  5   2026      11 NA        PHX               Phoenix Mercury  
#>  6   2026      11 NA        PHX               Phoenix Mercury  
#>  7   2026      11 NA        PHX               Phoenix Mercury  
#>  8   2026      11 NA        PHX               Phoenix Mercury  
#>  9   2026      11 NA        PHX               Phoenix Mercury  
#> 10   2026      11 NA        PHX               Phoenix Mercury  
#> # ℹ 202 more rows
#> # ℹ 31 more variables: team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, athlete_id <chr>, uid <chr>,
#> #   guid <chr>, full_name <chr>, display_name <chr>, short_name <chr>,
#> #   first_name <chr>, last_name <chr>, jersey <chr>,
#> #   position_abbreviation <chr>, position_name <chr>, position_id <chr>,
#> #   height <chr>, weight <chr>, age <chr>, date_of_birth <chr>, …
# }
# \donttest{
  try(load_wnba_player_stats(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 9,896 × 16
#>    season athlete_id athlete_display_name athlete_first_name athlete_last_name
#>     <int>      <int> <chr>                <chr>              <chr>            
#>  1   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  2   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  3   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  4   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  5   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  6   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  7   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  8   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#>  9   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#> 10   2026       1054 Tiffany Hayes        Tiffany            Hayes            
#> # ℹ 9,886 more rows
#> # ℹ 11 more variables: athlete_position_abbreviation <chr>,
#> #   athlete_jersey <chr>, team_id <int>, team_display_name <chr>,
#> #   category <chr>, stat_label <chr>, stat_name <chr>, stat_display_name <chr>,
#> #   stat_description <chr>, display_value <chr>, value <dbl>
# }
# \donttest{
  try(load_wnba_team_stats(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 675 × 16
#>    season team_id team_slug team_abbreviation team_display_name
#>     <int>   <int> <chr>     <chr>             <chr>            
#>  1   2026      11 NA        PHX               Phoenix Mercury  
#>  2   2026      11 NA        PHX               Phoenix Mercury  
#>  3   2026      11 NA        PHX               Phoenix Mercury  
#>  4   2026      11 NA        PHX               Phoenix Mercury  
#>  5   2026      11 NA        PHX               Phoenix Mercury  
#>  6   2026      11 NA        PHX               Phoenix Mercury  
#>  7   2026      11 NA        PHX               Phoenix Mercury  
#>  8   2026      11 NA        PHX               Phoenix Mercury  
#>  9   2026      11 NA        PHX               Phoenix Mercury  
#> 10   2026      11 NA        PHX               Phoenix Mercury  
#> # ℹ 665 more rows
#> # ℹ 11 more variables: team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, category <chr>,
#> #   stat_label <chr>, stat_name <chr>, stat_display_name <chr>,
#> #   stat_description <chr>, display_value <chr>, value <dbl>
# }
# \donttest{
  try(load_wnba_standings(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 345 × 24
#>    season group_id group_name        group_abbreviation group_short_name team_id
#>     <int> <chr>    <chr>             <chr>              <chr>              <int>
#>  1   2026 1        Eastern Conferen… E                  NA                    20
#>  2   2026 1        Eastern Conferen… E                  NA                    20
#>  3   2026 1        Eastern Conferen… E                  NA                    20
#>  4   2026 1        Eastern Conferen… E                  NA                    20
#>  5   2026 1        Eastern Conferen… E                  NA                    20
#>  6   2026 1        Eastern Conferen… E                  NA                    20
#>  7   2026 1        Eastern Conferen… E                  NA                    20
#>  8   2026 1        Eastern Conferen… E                  NA                    20
#>  9   2026 1        Eastern Conferen… E                  NA                    20
#> 10   2026 1        Eastern Conferen… E                  NA                    20
#> # ℹ 335 more rows
#> # ℹ 18 more variables: team_uid <chr>, team_slug <chr>, team_location <chr>,
#> #   team_name <chr>, team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, stat_name <chr>,
#> #   stat_display_name <chr>, stat_short_display_name <chr>,
#> #   stat_description <chr>, stat_abbreviation <chr>, stat_type <chr>, …
# }
# \donttest{
  try(load_wnba_draft(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 45 × 35
#>    season round round_display_name  pick overall_pick pick_traded pick_notes
#>     <int> <int> <chr>              <int>        <int> <chr>       <chr>     
#>  1   2026     1 NA                     1            1 FALSE       NA        
#>  2   2026     1 NA                     2            2 TRUE        NA        
#>  3   2026     1 NA                     3            3 TRUE        NA        
#>  4   2026     1 NA                     4            4 FALSE       NA        
#>  5   2026     1 NA                     5            5 TRUE        NA        
#>  6   2026     1 NA                     6            6 FALSE       NA        
#>  7   2026     1 NA                     7            7 FALSE       NA        
#>  8   2026     1 NA                     8            8 TRUE        NA        
#>  9   2026     1 NA                     9            9 TRUE        NA        
#> 10   2026     1 NA                    10           10 FALSE       NA        
#> # ℹ 35 more rows
#> # ℹ 28 more variables: athlete_id <int>, athlete_uid <chr>, athlete_guid <chr>,
#> #   athlete_first_name <chr>, athlete_last_name <chr>, athlete_full_name <chr>,
#> #   athlete_display_name <chr>, athlete_short_name <chr>, athlete_height <chr>,
#> #   athlete_weight <chr>, athlete_position_abbreviation <chr>,
#> #   athlete_position_name <chr>, athlete_headshot_href <chr>, college_id <int>,
#> #   college_name <chr>, college_short_name <chr>, college_abbreviation <chr>, …
# }
# \donttest{
  try(load_wnba_shots(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 51,599 × 20
#>      game_id season period_number clock_display_value team_id athlete_id_1
#>        <int>  <int>         <int> <chr>                 <int>        <int>
#>  1 401857173   2026             1 9:43                     19      4594786
#>  2 401857173   2026             1 9:34                     18      4433635
#>  3 401857173   2026             1 8:58                     18      4433408
#>  4 401857173   2026             1 8:46                     19      3142010
#>  5 401857173   2026             1 8:39                     18      4433635
#>  6 401857173   2026             1 8:24                     19      4594786
#>  7 401857173   2026             1 8:05                     18      4433408
#>  8 401857173   2026             1 7:53                     18      4703609
#>  9 401857173   2026             1 7:46                     19      3142010
#> 10 401857173   2026             1 7:22                     18      4433514
#> # ℹ 51,589 more rows
#> # ℹ 14 more variables: athlete_id_2 <int>, type_id <int>, type_text <chr>,
#> #   scoring_play <lgl>, score_value <int>, coordinate_x <dbl>,
#> #   coordinate_y <dbl>, coordinate_x_raw <dbl>, coordinate_y_raw <dbl>,
#> #   athlete_name_1 <chr>, athlete_name_2 <chr>, team_name <chr>,
#> #   team_mascot <chr>, team_abbrev <chr>
# }
# \donttest{
  try(load_wnba_game_rosters(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 6,945 × 22
#>    season game_id   team_id team_slug       team_abbreviation team_display_name
#>     <int> <chr>       <int> <chr>           <chr>             <chr>            
#>  1   2026 401856890      18 connecticut-sun CON               Connecticut Sun  
#>  2   2026 401856890      18 connecticut-sun CON               Connecticut Sun  
#>  3   2026 401856890      18 connecticut-sun CON               Connecticut Sun  
#>  4   2026 401856890      18 connecticut-sun CON               Connecticut Sun  
#>  5   2026 401856890      18 connecticut-sun CON               Connecticut Sun  
#>  6   2026 401856890      18 connecticut-sun CON               Connecticut Sun  
#>  7   2026 401856890      18 connecticut-sun CON               Connecticut Sun  
#>  8   2026 401856890      18 connecticut-sun CON               Connecticut Sun  
#>  9   2026 401856890      18 connecticut-sun CON               Connecticut Sun  
#> 10   2026 401856890      18 connecticut-sun CON               Connecticut Sun  
#> # ℹ 6,935 more rows
#> # ℹ 16 more variables: home_away <chr>, athlete_id <int>, athlete_uid <chr>,
#> #   athlete_guid <chr>, athlete_display_name <chr>, athlete_short_name <chr>,
#> #   athlete_first_name <chr>, athlete_last_name <chr>, athlete_jersey <chr>,
#> #   athlete_position <chr>, athlete_headshot <chr>, starter <lgl>,
#> #   did_not_play <lgl>, active <lgl>, ejected <lgl>, reason <chr>
# }
# \donttest{
  try(load_wnba_officials(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 865 × 11
#>    season game_id   official_id official_uid official_full_name    
#>     <int> <chr>           <int> <chr>        <chr>                 
#>  1   2026 401856890       52042 NA           Roy Gulbeyan          
#>  2   2026 401856890     3951614 NA           Ryan Sassano          
#>  3   2026 401856890     4236122 NA           Tyler Mirkovich       
#>  4   2026 401856891       52044 NA           Fatou Cissoko-Stephens
#>  5   2026 401856891       52049 NA           Charles Watson        
#>  6   2026 401856891     4356548 NA           Clare Simmons         
#>  7   2026 401856892        1211 NA           Angelica Suffren      
#>  8   2026 401856892     5113092 NA           Sarah Williams        
#>  9   2026 401856892     5184398 NA           Josh Reed             
#> 10   2026 401856893        1183 NA           Tim Greene            
#> # ℹ 855 more rows
#> # ℹ 6 more variables: official_display_name <chr>, official_first_name <chr>,
#> #   official_last_name <chr>, official_order <int>, position_name <chr>,
#> #   position_display_name <chr>
# }
# \donttest{
  try(load_wnba_player_core(seasons = most_recent_wnba_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.0.0 ──
#> # A tibble: 234 × 36
#>    season athlete_id guid       uid   slug  type  first_name last_name full_name
#>     <int>      <int> <chr>      <chr> <chr> <chr> <chr>      <chr>     <chr>    
#>  1   2026        869 74bfe609-… s:40… dewa… bask… DeWanna    Bonner    DeWanna …
#>  2   2026        887 c74956ad-… s:40… sami… bask… Sami       Whitcomb  Sami Whi…
#>  3   2026        924 09609790-… s:40… alys… bask… Alysha     Clark     Alysha C…
#>  4   2026        981 1d736065-… s:40… cour… bask… Courtney   Vandersl… Courtney…
#>  5   2026       1054 026e19c6-… s:40… tiff… bask… Tiffany    Hayes     Tiffany …
#>  6   2026       1068 759b52cb-… s:40… nnek… bask… Nneka      Ogwumike  Nneka Og…
#>  7   2026       1107 5530f9d2-… s:40… shey… bask… Shey       Peddy     Shey Ped…
#>  8   2026    2284331 3f0f0fd1-… s:40… emma… bask… Emma       Cannon    Emma Can…
#>  9   2026    2327695 cea6f839-… s:40… rebe… bask… Rebekah    Gardner   Rebekah …
#> 10   2026    2490553 40e7dc87-… s:40… brit… bask… Brittney   Griner    Brittney…
#> # ℹ 224 more rows
#> # ℹ 27 more variables: display_name <chr>, short_name <chr>, height <dbl>,
#> #   display_height <chr>, weight <dbl>, display_weight <chr>, age <int>,
#> #   date_of_birth <chr>, birth_city <chr>, birth_state <chr>,
#> #   birth_country <chr>, jersey <chr>, position_id <int>, position_name <chr>,
#> #   position_abbreviation <chr>, position_display_name <chr>, college_id <int>,
#> #   current_team_id <int>, headshot_href <chr>, experience_years <int>, …
# }
```

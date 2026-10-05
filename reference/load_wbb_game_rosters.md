# **Load cleaned women's college basketball play-by-play from the data repo**

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

helper that loads multiple seasons from the data repo either into memory
or writes it into a db using some forwarded arguments in the dots

`load_wbb_rosters_manifest()` returns the per-season manifest CSV
(columns: `season`, `row_count`, `generated_at_utc`, `source_endpoint`)
describing which seasons are currently published to the release tag,
without downloading any season's full data.

`load_wbb_player_stats_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
player season stats release tag without downloading any season's full
data.

`load_wbb_team_stats_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
team season stats release tag without downloading any season's full
data.

`load_wbb_standings_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
standings release tag without downloading any season's full data.

`load_wbb_shots_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
shots release tag without downloading any season's full data.

`load_wbb_game_rosters_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
game rosters release tag without downloading any season's full data.

`load_wbb_officials_manifest()` returns the per-season manifest CSV
(`season`, `row_count`, `generated_at_utc`, `source_endpoint`) for the
officials release tag without downloading any season's full data.

Loads season-level team rosters scraped from ESPN. One row per
athlete-team-season triple. Backed by the `wehoop-wbb-data` pipeline
that reads raw JSONs from `wehoop-wbb-raw` and publishes parquet/rds
artifacts to the `espn_womens_college_basketball_rosters` release tag.

Loads season-level player statistics scraped from ESPN. One row per
athlete-team-season-statistic-grouping. Backed by the `wehoop-wbb-data`
pipeline that reads raw JSONs from `wehoop-wbb-raw` and publishes
parquet/rds artifacts to the
`espn_womens_college_basketball_player_season_stats` release tag.

Loads season-level team statistics scraped from ESPN. One row per
team-season-statistic-grouping. Backed by the `wehoop-wbb-data` pipeline
that reads raw JSONs from `wehoop-wbb-raw` and publishes parquet/rds
artifacts to the `espn_womens_college_basketball_team_season_stats`
release tag.

Loads season-level conference and overall standings scraped from ESPN.
One row per team-season. Backed by the `wehoop-wbb-data` pipeline that
reads raw JSONs from `wehoop-wbb-raw` and publishes parquet/rds
artifacts to the `espn_womens_college_basketball_standings` release tag.

Loads shot events parsed from ESPN women's college basketball
play-by-play feeds. One row per shot attempt (made or missed), with
court coordinates and shot metadata. Backed by the `wehoop-wbb-data`
pipeline that reads raw JSONs from `wehoop-wbb-raw` and publishes
parquet/rds artifacts to the `espn_womens_college_basketball_shots`
release tag.

Loads per-game rosters scraped from ESPN women's college basketball box
scores. One row per athlete-team-game triple, with athlete identifiers,
jersey, position, starter flag, and DNP status. Backed by the
`wehoop-wbb-data` pipeline that reads raw JSONs from `wehoop-wbb-raw`
and publishes parquet/rds artifacts to the
`espn_womens_college_basketball_game_rosters` release tag.

Loads game-level officials data scraped from ESPN women's college
basketball summary feeds. One row per official-game pair. Backed by the
`wehoop-wbb-data` pipeline that reads raw JSONs from `wehoop-wbb-raw`
and publishes parquet/rds artifacts to the
`espn_womens_college_basketball_officials` release tag.

Loads ESPN WBB athlete core records – identity and biographical fields,
one row per athlete who appeared in the season. Backed by the
`wehoop-wbb-data` pipeline that reads raw JSONs from `wehoop-wbb-raw`
and publishes parquet/rds artifacts to the
`espn_womens_college_basketball_player_core` release tag.

This is the only source of athlete bio in the pipeline: the player
season stats payload carries no identity at all – not even the athlete
id.

Two properties of the source are worth knowing before joining:

- `current_team_id` is the athlete's CURRENT team, not their team in the
  requested season. Season team lives in `load_wbb_player_box()` /
  `load_wbb_player_stats()`.

- Bio (height / weight / jersey) is a current snapshot that ESPN
  overwrites in place; it is not era-correct for a historical season.
  The season dimension here is participation, not the bio's vintage.

Field coverage is era-dependent by nature – headshots exist only for
modern players, while college and date of birth thin out the other way.

## Usage

``` r
load_wbb_pbp(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_team_box(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_player_box(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_schedule(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_rosters_manifest()

load_wbb_player_stats_manifest()

load_wbb_team_stats_manifest()

load_wbb_standings_manifest()

load_wbb_shots_manifest()

load_wbb_game_rosters_manifest()

load_wbb_officials_manifest()

load_wbb_rosters(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_player_stats(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_team_stats(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_standings(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_shots(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_game_rosters(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_officials(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_player_core(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Arguments

- seasons:

  A vector of 4-digit years associated with given WBB seasons. (Min:
  2004)

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the player core table within the database

## Value

A dataframe of play-by-play events with the columns documented below:

|  |  |
|----|----|
| col_name | description |
| shooting_play | Logical value (TRUE/FALSE) indicating whether the play was a shooting play |
| sequence_number | Sequence number is supposed to represent a shot-possession, examine the last two numbers to see if there are multiple events that occur within the same shot-possession. A shot-possession is basically any sequence of plays until there is a shot, change in possession, and probably things like technical fouls and the like. So as soon as a shot goes up, a new sequence starts regardless, even if the shooting team retains possession via offensive or deadball rebound. The first portion of the number is usually time related (i.e. the numeric representation of when the sequence started, from a seconds remaining in the period perspective or so) |
| period_display_value | Long form of period (1st quarter, 2nd Quarter, OT, etc.) |
| period_number | The numeric period of play in the game |
| home_score | Home score at the time of the play |
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
| game_spread | Game spread in (-X Team) format |
| home_favorite | Logical (TRUE/FALSE) indicating whether the home team is favored |
| game_spread_available | Logical (TRUE/FALSE) indicating whether the spread was available from ESPN. Basically, I would just not recommend using any of the spread information, I think I defaulted a lot of them to -2.5 for the home team. Most games probably do not have spread information. This column should really be listed first |
| game_id | Unique identifier for the game event |
| qtr | Quarter of the game |
| time | Time left within the period |
| clock_minutes | Clock minutes split from seconds for developer convenience |
| clock_seconds | Clock seconds split from minutes for developer convenience |
| half | Half of the game |
| game_half | Half of the game |
| lag_qtr | A lag column on the quarter |
| lead_qtr | A lead column on the quarter |
| lag_game_half | A lag column on the half |
| lead_game_half | A lead column on the half |
| start_quarter_seconds_remaining | Quarter seconds remaining at the start of the play (these are more or less code artifacts from other sports, but may eventually be used more seriously) |
| start_half_seconds_remaining | Game half seconds remaining at the start of the play (these are more or less code artifacts from other sports, but may eventually be used more seriously) |
| start_game_seconds_remaining | Game seconds remaining at the start of the play (”') |
| game_play_number | Game play number |
| end_quarter_seconds_remaining | Quarter seconds remaining at the end of the play (”') |
| end_half_seconds_remaining | Game half seconds remaining at the end of the play (”') |
| end_game_seconds_remaining | Game seconds remaining at the end of the play (”') |
| period | Period of the game |
| coordinate_x | The entire scale is a rectangle of size 25x47, intended as a half-court representation of the basketball court (i.e. on the side of the offense), with each coordinate unit representing a foot. It appears that the basket is roughly represented as the (25, 0) point. This is a nonsensical definition when considering that the basket overhangs the court, with the backboard aligned 48 inches from the baseline, then the center of the hoop being roughly 11 inches from there. This is an idiosyncracy of either sensor placement or software and data entry. Use your best judgement in making your charts, I think you will find that making some translations will be helpful. |
| coordinate_y |  |
| week | Apparently there are weeks |
| media_id | Where did you come from |
| pregame_home_prob | Pre-game win probability for the home team, constant across every play of the game |
| home_win_prob | Home team's win probability at this play, updated play-by-play |

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
  try(load_wbb_pbp())
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_pbp/play_by_play_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_pbp/play_by_play_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_team_box())
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_team_boxscores/team_box_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_team_boxscores/team_box_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_player_box())
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_player_boxscores/player_box_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_player_boxscores/player_box_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_schedule())
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 2,283 × 93
#>         id uid   date  attendance time_valid neutral_site conference_competition
#>      <int> <chr> <chr>      <dbl> <lgl>      <lgl>        <lgl>                 
#>  1  4.02e8 s:40… 2027…          0 TRUE       FALSE        TRUE                  
#>  2  4.02e8 s:40… 2027…          0 TRUE       FALSE        TRUE                  
#>  3  4.02e8 s:40… 2027…          0 TRUE       FALSE        TRUE                  
#>  4  4.02e8 s:40… 2027…          0 FALSE      FALSE        TRUE                  
#>  5  4.02e8 s:40… 2027…          0 FALSE      FALSE        TRUE                  
#>  6  4.02e8 s:40… 2027…          0 FALSE      FALSE        TRUE                  
#>  7  4.02e8 s:40… 2027…          0 FALSE      FALSE        TRUE                  
#>  8  4.02e8 s:40… 2027…          0 FALSE      FALSE        TRUE                  
#>  9  4.02e8 s:40… 2027…          0 FALSE      FALSE        TRUE                  
#> 10  4.02e8 s:40… 2027…          0 FALSE      FALSE        TRUE                  
#> # ℹ 2,273 more rows
#> # ℹ 86 more variables: play_by_play_available <lgl>, recent <lgl>,
#> #   start_date <chr>, broadcast <chr>, highlights <chr>, notes_type <chr>,
#> #   notes_headline <chr>, broadcast_market <chr>, broadcast_name <chr>,
#> #   type_id <int>, type_abbreviation <chr>, venue_id <int>,
#> #   venue_full_name <chr>, venue_address_city <chr>, venue_address_state <chr>,
#> #   venue_indoor <lgl>, status_clock <dbl>, status_display_clock <chr>, …
# }
# \donttest{
  try(load_wbb_rosters(seasons = most_recent_wbb_season()))
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 5,616 × 36
#>    season team_id team_slug team_abbreviation team_display_name         
#>     <int>   <int> <chr>     <chr>             <chr>                     
#>  1   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  2   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  3   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  4   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  5   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  6   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  7   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  8   2027       1 NA        UAA               Alaska Anchorage Seawolves
#>  9   2027       1 NA        UAA               Alaska Anchorage Seawolves
#> 10   2027       1 NA        UAA               Alaska Anchorage Seawolves
#> # ℹ 5,606 more rows
#> # ℹ 31 more variables: team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, athlete_id <chr>, uid <chr>,
#> #   guid <chr>, full_name <chr>, display_name <chr>, short_name <chr>,
#> #   first_name <chr>, last_name <chr>, jersey <chr>,
#> #   position_abbreviation <chr>, position_name <chr>, position_id <chr>,
#> #   height <chr>, weight <chr>, age <chr>, date_of_birth <chr>, …
# }
# \donttest{
  try(load_wbb_player_stats(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_player_season_stats/player_season_stats_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_player_season_stats/player_season_stats_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_team_stats(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_team_season_stats/team_season_stats_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_team_season_stats/team_season_stats_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_standings(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_standings/standings_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_standings/standings_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_shots(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_shots/shots_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_shots/shots_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_game_rosters(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_game_rosters/game_rosters_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_game_rosters/game_rosters_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_officials(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_officials/officials_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_officials/officials_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
# \donttest{
  try(load_wbb_player_core(seasons = most_recent_wbb_season()))
#> Warning: cannot open URL 'https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_player_core/player_core_2027.rds': HTTP status was '404 Not Found'
#> Warning: Failed to readRDS from <https://github.com/sportsdataverse/sportsdataverse-data/releases/download/espn_womens_college_basketball_player_core/player_core_2027.rds>
#> ─────────────────────────────────────────────────────────── wehoop 3.0.0.9000 ──
#> # A tibble: 0 × 0
# }
```

# Women's College Basketball Cookbook

## Before we cook

Women’s college basketball has never been more watched, and the data has
never been better. `wehoop` covers it end to end – 360-odd Division I
teams, a March bracket, and the NCAA’s own NET rankings. The trick to
not drowning is the same as everywhere else in this family of packages:
**learn the grammar of the function names and you can guess your way to
almost anything.**

If you’ve read the WNBA cookbook, you already know most of the grammar.
This one swaps the league token from `wnba` to `wbb` and adds one new
prefix – `ncaa_wbb_` for NCAA.com data. That’s nearly the whole diff.

### The grammar, refreshed for college

A `wehoop` college function answers three questions, in order:

1.  **Where’s the data from?** – the prefix.
    - `espn_` – ESPN’s APIs. The broad, stable backbone.
    - `ncaa_wbb_` – NCAA.com. Home of the NET rankings and the official
      bracket machinery. (Here the prefix carries the league with it.)
    - `load_` – pre-built bulk season files.
2.  **Which league?** – for ESPN it’s spelled out: `espn_wbb_`. The
    `wbb` token is “women’s basketball.”
3.  **What do you want?** – the rest of the name, general to specific.

So “a team’s schedule from ESPN” is `espn_` + `wbb_` + `team_schedule`
-\>
[`espn_wbb_team_schedule()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_schedule.md).
“NCAA NET rankings” is `ncaa_wbb_` + `NET_rankings` -\>
[`ncaa_wbb_NET_rankings()`](https://wehoop.sportsdataverse.org/reference/ncaa_wbb_NET_rankings.md).
You’ll be right far more often than wrong, and being wrong just means
opening the reference index.

``` r

library(wehoop)
library(dplyr)
```

## Recipe 1: A powerhouse program’s season

**The story.** It’s November and you want to set the table for UConn’s
season – schedule, roster, where they sit.

Type `espn_wbb_team` and the grammar lays out the menu:

``` r

team_id <- 2509            # UConn
season  <- most_recent_wbb_season()

espn_wbb_team(team_id = team_id)                              # identity + record
#> $Info
#> # A tibble: 1 × 13
#>   id    uid    slug  abbreviation display_name short_display_name name  nickname
#>   <chr> <chr>  <chr> <chr>        <chr>        <chr>              <chr> <chr>   
#> 1 2509  s:40~… purd… PUR          Purdue Boil… Purdue             Boil… Purdue  
#> # ℹ 5 more variables: location <chr>, color <chr>, alternate_color <chr>,
#> #   logo <chr>, logo_dark <chr>
#> 
#> $Record
#> data frame with 0 columns and 0 rows
#> 
#> $NextEvent
#> # A tibble: 1 × 4
#>   id        date              name                                short_name
#>   <chr>     <chr>             <chr>                               <chr>     
#> 1 401851368 2026-03-05T01:30Z Purdue Boilermakers at Oregon Ducks PUR VS ORE
#> 
#> $StandingSummary
#> # A tibble: 1 × 1
#>   standing_summary
#>   <chr>           
#> 1 14th in Big Ten 
#> 
#> $Coaches
#> data frame with 0 columns and 0 rows
espn_wbb_team_schedule(team_id = team_id, season = season)    # the slate
#> # A tibble: 30 × 21
#>    event_id  season season_type  week date          name  short_name opponent_id
#>    <chr>      <int>       <int> <int> <chr>         <chr> <chr>      <chr>      
#>  1 401812419   2026          NA     1 2025-11-04T0… Fair… FDU @ PUR  NA         
#>  2 401818691   2026          NA     1 2025-11-07T0… East… EIU @ PUR  NA         
#>  3 401818692   2026          NA     2 2025-11-13T0… Purd… PUR @ PFW  NA         
#>  4 401818581   2026          NA     3 2025-11-19T0… Purd… PUR @ UK   NA         
#>  5 401818693   2026          NA     3 2025-11-23T1… Miam… M-OH @ PUR NA         
#>  6 401818694   2026          NA     4 2025-11-26T1… Howa… HOW @ PUR  NA         
#>  7 401818695   2026          NA     4 2025-11-30T1… Purd… PUR @ CMU  NA         
#>  8 401818696   2026          NA     5 2025-12-04T0… Evan… EVAN @ PUR NA         
#>  9 401825225   2026          NA     5 2025-12-07T1… Purd… PUR @ MICH NA         
#> 10 401818697   2026          NA     6 2025-12-11T1… Lips… LIP @ PUR  NA         
#> # ℹ 20 more rows
#> # ℹ 13 more variables: opponent_abbrev <chr>, home_away <chr>,
#> #   neutral_site <lgl>, conference_competition <lgl>, venue_id <chr>,
#> #   venue_name <chr>, venue_city <chr>, venue_state <chr>, broadcast <chr>,
#> #   result <chr>, team_score <chr>, opponent_score <chr>, winner <lgl>
espn_wbb_team_roster(team_id = team_id, season = season)      # the players
#> # A tibble: 13 × 15
#>    athlete_id full_name jersey position_abbrev position_name height weight age  
#>    <chr>      <chr>     <chr>  <chr>           <chr>         <chr>  <chr>  <chr>
#>  1 5311737    Carley B… 24     G               Guard         "5' 7… NA     NA   
#>  2 5106182    Tara Daye 44     G               Guard         "5' 1… NA     NA   
#>  3 5107710    Taylor F… 5      G               Guard         "5' 8… NA     NA   
#>  4 5311739    Avery Go… 55     F               Forward       "6' 7… NA     NA   
#>  5 5108895    Taylor H… 2      G               Guard         "5' 1… NA     NA   
#>  6 5311736    Hila Kar… 8      G               Guard         "5' 8… NA     NA   
#>  7 5175722    McKenna … 11     G               Guard         "6' 2… NA     NA   
#>  8 4433438    Madison … 33     G               Guard         "6' 1… NA     NA   
#>  9 5240041    Lana McC… 35     F               Forward       "6' 4… NA     NA   
#> 10 5240040    Kendall … 22     F               Forward       "6' 3… NA     NA   
#> 11 5239064    Kiki Smi… 23     G               Guard         "5' 7… NA     NA   
#> 12 5243531    Nya Smith 3      G               Guard         "5' 9… NA     NA   
#> 13 5178283    Saige St… 13     F               Forward       "6' 1… NA     NA   
#> # ℹ 7 more variables: birth_date <chr>, birth_place <chr>, headshot <chr>,
#> #   link_web <chr>, status <chr>, team_id <chr>, season <int>
espn_wbb_team_season_statistics(team_id = team_id, season = season)
#> # A tibble: 77 × 13
#>    league    season season_type team_id category_name category_display stat_name
#>    <chr>      <int>       <int> <chr>   <chr>         <chr>            <chr>    
#>  1 womens-c…   2026           2 2509    defensive     Defensive        blocks   
#>  2 womens-c…   2026           2 2509    defensive     Defensive        defensiv…
#>  3 womens-c…   2026           2 2509    defensive     Defensive        steals   
#>  4 womens-c…   2026           2 2509    defensive     Defensive        turnover…
#>  5 womens-c…   2026           2 2509    defensive     Defensive        avgDefen…
#>  6 womens-c…   2026           2 2509    defensive     Defensive        avgBlocks
#>  7 womens-c…   2026           2 2509    defensive     Defensive        avgSteals
#>  8 womens-c…   2026           2 2509    general       General          disquali…
#>  9 womens-c…   2026           2 2509    general       General          flagrant…
#> 10 womens-c…   2026           2 2509    general       General          fouls    
#> # ℹ 67 more rows
#> # ℹ 6 more variables: stat_abbrev <chr>, stat_display <chr>, value <dbl>,
#> #   display_value <chr>, rank <int>, rank_display_value <chr>
```

Margin note:
[`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md)
is worth knowing. Every league in `wehoop` has a
`most_recent_<league>_season()` companion, and the newer `espn_wbb_*`
functions use it as their default `season`. Most of the time you can
simply *omit* `season` – the function already knows what “now” means.

## Recipe 2: The star guard

**The story.** Women’s college basketball has become a star-driven
sport, and you want a marquee guard’s numbers.

College rosters turn over fast – this year’s star is next year’s pro –
so the reliable move is to pull the current roster first and lift an
`athlete_id` straight off it, then walk the `athlete_` family:

``` r

roster     <- espn_wbb_team_roster(team_id = 2509, season = most_recent_wbb_season())
athlete_id <- roster$athlete_id[1]   # whoever is first on the roster

espn_wbb_player_info(athlete_id = athlete_id)            # bio
#> $Bio
#> # A tibble: 1 × 16
#>   id      uid       guid  first_name last_name full_name display_name short_name
#>   <chr>   <chr>     <chr> <chr>      <chr>     <chr>     <chr>        <chr>     
#> 1 5311737 s:40~l:5… e082… Carley     Barrett   Carley B… Carley Barr… C. Barrett
#> # ℹ 8 more variables: height <dbl>, display_height <chr>, jersey <chr>,
#> #   active <lgl>, headshot_href <chr>, birth_city <chr>, birth_state <chr>,
#> #   birth_country <chr>
#> 
#> $Team
#> # A tibble: 1 × 1
#>   x_ref                                                                         
#>   <chr>                                                                         
#> 1 http://sports.core.api.espn.com/v2/sports/basketball/leagues/womens-college-b…
#> 
#> $Position
#> # A tibble: 1 × 5
#>   id    name  display_name abbreviation leaf 
#>   <chr> <chr> <chr>        <chr>        <lgl>
#> 1 3     Guard Guard        G            FALSE
#> 
#> $Status
#> # A tibble: 1 × 4
#>   id    name   type   abbreviation
#>   <chr> <chr>  <chr>  <chr>       
#> 1 1     Active active Active      
#> 
#> $College
#> # A tibble: 0 × 0
#> 
#> $Draft
#> # A tibble: 0 × 0
espn_wbb_player_gamelog(athlete_id = athlete_id, season = most_recent_wbb_season())
#> # A tibble: 5 × 26
#>   athlete_id season id     week  at_vs game_date score home_team_id away_team_id
#>   <chr>       <dbl> <chr>  <chr> <chr> <chr>     <chr> <chr>        <chr>       
#> 1 5311737      2026 40181… 7     vs    2025-12-… 93-62 2509         2296        
#> 2 5311737      2026 40181… 6     vs    2025-12-… 80-43 2509         2168        
#> 3 5311737      2026 40181… 6     vs    2025-12-… 88-45 2509         288         
#> 4 5311737      2026 40181… 5     vs    2025-12-… 91-49 2509         339         
#> 5 5311737      2026 40181… 4     vs    2025-11-… 92-62 2509         47          
#> # ℹ 17 more variables: home_team_score <chr>, away_team_score <chr>,
#> #   game_result <chr>, league_name <chr>, league_abbreviation <chr>,
#> #   league_short_name <chr>, team_id <chr>, team_uid <chr>,
#> #   team_abbreviation <chr>, team_logo <chr>, team_is_all_star <chr>,
#> #   opponent_id <chr>, opponent_uid <chr>, opponent_display_name <chr>,
#> #   opponent_abbreviation <chr>, opponent_logo <chr>, event_id <chr>
espn_wbb_player_career_stats(athlete_id = athlete_id)    # career rollup, long format
#> # A tibble: 87 × 17
#>    league   athlete_id stat_type_id split_id split_name split_type category_name
#>    <chr>    <chr>      <chr>        <chr>    <chr>      <chr>      <chr>        
#>  1 womens-… 5311737    0            0        Season     season     defensive    
#>  2 womens-… 5311737    0            0        Season     season     defensive    
#>  3 womens-… 5311737    0            0        Season     season     defensive    
#>  4 womens-… 5311737    0            0        Season     season     defensive    
#>  5 womens-… 5311737    0            0        Season     season     defensive    
#>  6 womens-… 5311737    0            0        Season     season     defensive    
#>  7 womens-… 5311737    0            0        Season     season     defensive    
#>  8 womens-… 5311737    0            0        Season     season     defensive    
#>  9 womens-… 5311737    0            0        Season     season     general      
#> 10 womens-… 5311737    0            0        Season     season     general      
#> # ℹ 77 more rows
#> # ℹ 10 more variables: category_display <chr>, category_short <chr>,
#> #   category_abbrev <chr>, stat_name <chr>, stat_abbrev <chr>,
#> #   stat_display <chr>, stat_short <chr>, description <chr>, value <dbl>,
#> #   display_value <chr>
```

That “pull the index, lift an ID, drill down” move is the single most
useful habit in the whole package. `athlete_gamelog` in particular only
has data for players *currently* on a roster – last year’s star has
moved on – so feeding it an ID you just lifted off `team_roster` is how
you guarantee it returns something.

Margin note: `athlete_info`, `athlete_gamelog`, `athlete_career_stats`
all share the `athlete_` stem. A repeated stem is a *namespace* – a
promise that everything under it is about the same subject. Browsing by
stem (`espn_wbb_athlete` + Tab) is often faster than searching.

## Recipe 3: The NET rankings

**The story.** Box scores and the eye test only get you so far in
seeding arguments. The NCAA’s NET ranking is the number that actually
drives the bracket, and you want it.

This is where the new prefix earns its keep. NCAA.com data is
`ncaa_wbb_`.

``` r

# ncaa_wbb / NET / rankings. The name is the thing.
net <- ncaa_wbb_NET_rankings()

net |>
  select(rank, team, conference, net_wins, net_losses) |>
  head(25)
#> Error in `select()`:
#> ! Can't select columns that don't exist.
#> ✖ Column `team` doesn't exist.
```

The grammar lesson: a prefix is a compressed paragraph. The moment you
see `ncaa_wbb_`, you know the data is women’s-college-only and comes
from the NCAA’s own systems rather than ESPN’s. Learn what each prefix
promises and a lot of the documentation becomes redundant.

## Recipe 4: Game flow

**The story.** A December non-conference game went down to the wire. You
want the play-by-play and a sense of the swing.

Same three zoom levels as every other cookbook – the grammar is
league-agnostic:

``` r

game_id <- 401276115

espn_wbb_game_all(game_id = game_id)      # everything, as a named list
#> $Plays
#> # A tibble: 386 × 53
#>    id       sequence_number text  away_score home_score scoring_play score_value
#>    <chr>    <chr>           <chr>      <int>      <int> <lgl>              <int>
#>  1 4012761… 101899901       Jump…          0          0 FALSE                  0
#>  2 4012761… 101904901       Morg…          0          2 TRUE                   2
#>  3 4012761… 101907701       Kian…          3          2 TRUE                   3
#>  4 4012761… 101914901       Vale…          3          2 FALSE                  2
#>  5 4012761… 101914902       Morg…          3          2 FALSE                  0
#>  6 4012761… 101915701       Kour…          3          5 TRUE                   3
#>  7 4012761… 101919001       Dana…          3          5 FALSE                  3
#>  8 4012761… 101919002       Kian…          3          5 FALSE                  0
#>  9 4012761… 101919501       Myka…          5          5 TRUE                   2
#> 10 4012761… 101924601       Morg…          5          5 FALSE                  2
#> # ℹ 376 more rows
#> # ℹ 46 more variables: wallclock <chr>, shooting_play <lgl>,
#> #   points_attempted <int>, short_description <chr>, type_id <int>,
#> #   type_text <chr>, period_number <int>, period_display_value <chr>,
#> #   clock_display_value <chr>, team_id <int>, coordinate_x_raw <dbl>,
#> #   coordinate_y_raw <dbl>, coordinate_x <dbl>, coordinate_y <dbl>,
#> #   play_id <chr>, athlete_id_1 <int>, athlete_id_2 <int>, …
#> 
#> $Team
#> # A tibble: 2 × 56
#>     game_id season season_type game_date  game_date_time      team_id team_uid  
#>       <int>  <int>       <int> <date>     <dttm>                <int> <chr>     
#> 1 401276115   2021           2 2021-02-21 2021-02-21 14:00:00      97 s:40~l:54…
#> 2 401276115   2021           2 2021-02-21 2021-02-21 14:00:00      52 s:40~l:54…
#> # ℹ 49 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>,
#> #   field_goals_made <int>, field_goals_attempted <int>, fouls <int>, …
#> 
#> $Player
#> # A tibble: 25 × 54
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4433426
#>  2 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4433412
#>  3 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398604
#>  4 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4281919
#>  5 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4281190
#>  6 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4703211
#>  7 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398591
#>  8 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398589
#>  9 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4433094
#> 10 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398835
#> # ℹ 15 more rows
#> # ℹ 48 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
espn_wbb_team_box(game_id = game_id)      # team box
#> # A tibble: 2 × 56
#>     game_id season season_type game_date  game_date_time      team_id team_uid  
#>       <int>  <int>       <int> <date>     <dttm>                <int> <chr>     
#> 1 401276115   2021           2 2021-02-21 2021-02-21 14:00:00      97 s:40~l:54…
#> 2 401276115   2021           2 2021-02-21 2021-02-21 14:00:00      52 s:40~l:54…
#> # ℹ 49 more variables: team_slug <chr>, team_location <chr>, team_name <chr>,
#> #   team_abbreviation <chr>, team_display_name <chr>,
#> #   team_short_display_name <chr>, team_color <chr>,
#> #   team_alternate_color <chr>, team_logo <chr>, team_home_away <chr>,
#> #   team_score <int>, team_winner <lgl>, assists <int>, blocks <int>,
#> #   defensive_rebounds <int>, fast_break_points <chr>, field_goal_pct <dbl>,
#> #   field_goals_made <int>, field_goals_attempted <int>, fouls <int>, …
espn_wbb_player_box(game_id = game_id)    # player box
#> # A tibble: 25 × 54
#>      game_id season season_type game_date  game_date_time      athlete_id
#>        <int>  <int>       <int> <date>     <dttm>                   <int>
#>  1 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4433426
#>  2 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4433412
#>  3 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398604
#>  4 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4281919
#>  5 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4281190
#>  6 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4703211
#>  7 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398591
#>  8 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398589
#>  9 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4433094
#> 10 401276115   2021           2 2021-02-21 2021-02-21 14:00:00    4398835
#> # ℹ 15 more rows
#> # ℹ 48 more variables: athlete_display_name <chr>, team_id <int>,
#> #   team_name <chr>, team_location <chr>, team_short_display_name <chr>,
#> #   minutes <dbl>, field_goals_made <int>, field_goals_attempted <int>,
#> #   three_point_field_goals_made <int>,
#> #   three_point_field_goals_attempted <int>, free_throws_made <int>,
#> #   free_throws_attempted <int>, offensive_rebounds <int>, …
espn_wbb_pbp(game_id = game_id)           # play-by-play
#> # A tibble: 386 × 53
#>    id       sequence_number text  away_score home_score scoring_play score_value
#>    <chr>    <chr>           <chr>      <int>      <int> <lgl>              <int>
#>  1 4012761… 101899901       Jump…          0          0 FALSE                  0
#>  2 4012761… 101904901       Morg…          0          2 TRUE                   2
#>  3 4012761… 101907701       Kian…          3          2 TRUE                   3
#>  4 4012761… 101914901       Vale…          3          2 FALSE                  2
#>  5 4012761… 101914902       Morg…          3          2 FALSE                  0
#>  6 4012761… 101915701       Kour…          3          5 TRUE                   3
#>  7 4012761… 101919001       Dana…          3          5 FALSE                  3
#>  8 4012761… 101919002       Kian…          3          5 FALSE                  0
#>  9 4012761… 101919501       Myka…          5          5 TRUE                   2
#> 10 4012761… 101924601       Morg…          5          5 FALSE                  2
#> # ℹ 376 more rows
#> # ℹ 46 more variables: wallclock <chr>, shooting_play <lgl>,
#> #   points_attempted <int>, short_description <chr>, type_id <int>,
#> #   type_text <chr>, period_number <int>, period_display_value <chr>,
#> #   clock_display_value <chr>, team_id <int>, coordinate_x_raw <dbl>,
#> #   coordinate_y_raw <dbl>, coordinate_x <dbl>, coordinate_y <dbl>,
#> #   play_id <chr>, athlete_id_1 <int>, athlete_id_2 <int>, …

# ESPN's win-probability-per-play for the same game.
espn_wbb_game_probabilities(event_id = game_id)
#> # A tibble: 200 × 10
#>    event_id  sequence_number play_id period clock home_win_percentage
#>    <chr>     <chr>           <chr>    <int> <chr>               <dbl>
#>  1 401276115 101899901       NA          NA NA                  0.26 
#>  2 401276115 101904901       NA          NA NA                  0.283
#>  3 401276115 101907701       NA          NA NA                  0.241
#>  4 401276115 101914901       NA          NA NA                  0.233
#>  5 401276115 101914902       NA          NA NA                  0.243
#>  6 401276115 101915701       NA          NA NA                  0.29 
#>  7 401276115 101919001       NA          NA NA                  0.307
#>  8 401276115 101919002       NA          NA NA                  0.294
#>  9 401276115 101919501       NA          NA NA                  0.27 
#> 10 401276115 101924601       NA          NA NA                  0.255
#> # ℹ 190 more rows
#> # ℹ 4 more variables: away_win_percentage <dbl>, tie_percentage <dbl>,
#> #   secs_to_end_of_period <dbl>, secs_to_end_of_game <dbl>
```

If you read the WNBA cookbook, you’ve now seen `espn_*_game_all`,
`espn_*_team_box`, `espn_*_player_box`, `espn_*_pbp` in two leagues with
*only the league token changing*. That’s the payoff of a regular
grammar: a recipe learned once transfers by editing a single word.

## Recipe 5: Per-player, per-game box scores

**The story.** You want one player’s line from one game, tidy and long –
not the whole `player_box`.

``` r

# event + team + athlete -- three IDs, because you're naming one cell
# of one game. More identifiers = finer grain. Always.
espn_wbb_game_player_box(
  event_id   = 401276115,
  team_id    = 52,
  athlete_id = 4398583
)
#> # A tibble: 77 × 12
#>    league   event_id team_id athlete_id stat_type category_name category_display
#>    <chr>    <chr>    <chr>   <chr>          <int> <chr>         <chr>           
#>  1 womens-… 4012761… 52      4398583            0 defensive     Defensive       
#>  2 womens-… 4012761… 52      4398583            0 defensive     Defensive       
#>  3 womens-… 4012761… 52      4398583            0 defensive     Defensive       
#>  4 womens-… 4012761… 52      4398583            0 defensive     Defensive       
#>  5 womens-… 4012761… 52      4398583            0 defensive     Defensive       
#>  6 womens-… 4012761… 52      4398583            0 defensive     Defensive       
#>  7 womens-… 4012761… 52      4398583            0 defensive     Defensive       
#>  8 womens-… 4012761… 52      4398583            0 general       General         
#>  9 womens-… 4012761… 52      4398583            0 general       General         
#> 10 womens-… 4012761… 52      4398583            0 general       General         
#> # ℹ 67 more rows
#> # ℹ 5 more variables: stat_name <chr>, stat_abbrev <chr>, stat_display <chr>,
#> #   value <dbl>, display_value <chr>
```

## Recipe 6: The conference race

**The story.** It’s February and your conference is a dogfight. You want
the standings and the structure beneath them.

College conferences are a *hierarchy* – divisions, conferences, the
whole D-I grouping – and ESPN models that with the `season_group`
family.

``` r

season <- most_recent_wbb_season()

# A grammar gotcha worth flagging: espn_wbb_standings() takes `year`,
# not `season`. Most functions say `season`, a few older ones say
# `year` -- when an argument name surprises you, ?function is the
# two-second fix.
espn_wbb_standings(year = season)
#> # A tibble: 363 × 87
#>    team_id team             conference avgpointsagainst avgpointsfor gamesbehind
#>      <int> <chr>            <chr>                 <dbl>        <dbl>       <dbl>
#>  1     261 Vermont Catamou… America E…             52.2         65.4         0  
#>  2    2066 Binghamton Bear… America E…             61.8         65.2         6  
#>  3    2803 Bryant Bulldogs  America E…             55.0         63.2         6.5
#>  4    2885 NJIT Highlanders America E…             62.9         65.4         6.5
#>  5     311 Maine Black Bea… America E…             60.0         61.7         6.5
#>  6    2378 UMBC Retrievers  America E…             58.4         62.3         8.5
#>  7     399 UAlbany Great D… America E…             55.2         57.6        10.5
#>  8     160 New Hampshire W… America E…             60.1         55.8        14.5
#>  9    2349 UMass Lowell Ri… America E…             66.4         55.4        16  
#> 10     242 Rice Owls        American …             59.6         69.5         0  
#> # ℹ 353 more rows
#> # ℹ 81 more variables: leaguewinpercent <dbl>, losses <dbl>, playoffseed <dbl>,
#> #   pointdifferential <chr>, pointsagainst <dbl>, pointsfor <dbl>,
#> #   streak <dbl>, winpercent <dbl>, wins <dbl>, gamesahead <chr>, total <chr>,
#> #   home_avgpointsagainst <dbl>, home_avgpointsfor <dbl>,
#> #   home_gamesbehind <dbl>, home_leaguewinpercent <dbl>, home_losses <dbl>,
#> #   home_playoffseed <dbl>, home_pointdifferential <chr>, …

# The group tree: groups -> one group -> its teams.
espn_wbb_season_groups(season = season, season_type = 2)
#> # A tibble: 2 × 5
#>   league                    season season_type group_id ref                     
#>   <chr>                      <int>       <int> <chr>    <chr>                   
#> 1 womens-college-basketball   2026           2 50       http://sports.core.api.…
#> 2 womens-college-basketball   2026           2 51       http://sports.core.api.…
espn_wbb_season_group(group_id = 50, season = season, season_type = 2)
#> # A tibble: 1 × 15
#>   league         season season_type group_id uid   name  abbreviation short_name
#>   <chr>           <int>       <int> <chr>    <chr> <chr> <chr>        <chr>     
#> 1 womens-colleg…   2026           2 50       s:40… NCAA… NCAA         Division I
#> # ℹ 7 more variables: midsize_name <chr>, is_conference <lgl>, slug <chr>,
#> #   parent_ref <chr>, children_ref <chr>, teams_ref <chr>, standings_ref <chr>
espn_wbb_season_group_teams(group_id = 50, season = season, season_type = 2)
#> # A tibble: 200 × 6
#>    league                    season season_type group_id team_id ref            
#>    <chr>                      <int>       <int> <chr>    <chr>   <chr>          
#>  1 womens-college-basketball   2026           2 50       2       http://sports.…
#>  2 womens-college-basketball   2026           2 50       5       http://sports.…
#>  3 womens-college-basketball   2026           2 50       6       http://sports.…
#>  4 womens-college-basketball   2026           2 50       8       http://sports.…
#>  5 womens-college-basketball   2026           2 50       9       http://sports.…
#>  6 womens-college-basketball   2026           2 50       12      http://sports.…
#>  7 womens-college-basketball   2026           2 50       13      http://sports.…
#>  8 womens-college-basketball   2026           2 50       16      http://sports.…
#>  9 womens-college-basketball   2026           2 50       21      http://sports.…
#> 10 womens-college-basketball   2026           2 50       23      http://sports.…
#> # ℹ 190 more rows
```

Margin note: `season_groups` (plural) is the index; `season_group`
(singular) is one item. That singular/plural pair runs through the whole
package – `franchises`/`franchise`, `tournaments`/`tournament`,
`positions`/`position`. Plural = “give me the list,” singular = “give me
this one.” It’s the most reliable two-word rule in the grammar.

## Recipe 7: March

**The story.** The bracket. You want the tournament.

``` r

season <- most_recent_wbb_season()

espn_wbb_tournaments()                                  # which tournaments exist
#> # A tibble: 38 × 3
#>    tournament_id ref                                                      league
#>    <chr>         <chr>                                                    <chr> 
#>  1 3             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  2 1             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  3 39            http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  4 2             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  5 4             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  6 5             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  7 6             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  8 7             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#>  9 8             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#> 10 9             http://sports.core.api.espn.com/v2/sports/basketball/le… women…
#> # ℹ 28 more rows
espn_wbb_tournament(tournament_id = 3)                  # one tournament
#> # A tibble: 1 × 4
#>   tournament_id display_name                   seasons_ref                league
#>   <chr>         <chr>                          <chr>                      <chr> 
#> 1 3             Atlantic Coast Conf Tournament http://sports.core.api.es… women…
espn_wbb_tournament_seasons(tournament_id = 3)          # its yearly editions
#> # A tibble: 11 × 4
#>    league                    tournament_id season ref                           
#>    <chr>                     <chr>          <int> <chr>                         
#>  1 womens-college-basketball 3               2010 http://sports.core.api.espn.c…
#>  2 womens-college-basketball 3               2011 http://sports.core.api.espn.c…
#>  3 womens-college-basketball 3               2014 http://sports.core.api.espn.c…
#>  4 womens-college-basketball 3               2015 http://sports.core.api.espn.c…
#>  5 womens-college-basketball 3               2016 http://sports.core.api.espn.c…
#>  6 womens-college-basketball 3               2017 http://sports.core.api.espn.c…
#>  7 womens-college-basketball 3               2018 http://sports.core.api.espn.c…
#>  8 womens-college-basketball 3               2019 http://sports.core.api.espn.c…
#>  9 womens-college-basketball 3               2020 http://sports.core.api.espn.c…
#> 10 womens-college-basketball 3               2022 http://sports.core.api.espn.c…
#> 11 womens-college-basketball 3               2023 http://sports.core.api.espn.c…
espn_wbb_tournament_season(tournament_id = 3, season = season)
#> # A tibble: 1 × 8
#>   league   tournament_id season display_name short_display_name number_of_rounds
#>   <chr>    <chr>          <int> <chr>        <chr>                         <int>
#> 1 womens-… 3               2026 ACC Tournam… ACC                               0
#> # ℹ 2 more variables: season_ref <chr>, bracketology_ref <chr>
```

Same singular/plural rule as Recipe 6, same general-to-specific march
from `tournaments` down to one `tournament_season`. By now you should be
able to *predict* this family before reading it – which is the whole
point of the cookbook.

## Recipe 8: A whole season, in bulk

**The story.** You’re done with single games. You want every women’s
college game of a season to model on.

Looping
[`espn_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_pbp.md)
over thousands of games works but is slow and rude to ESPN. The `load_`
prefix exists for exactly this:

``` r

# load / wbb / pbp -- one call, one season.
pbp <- load_wbb_pbp(seasons = 2024)

load_wbb_player_box(seasons = 2024)
load_wbb_team_box(seasons = 2024)
load_wbb_schedule(seasons = 2024)
load_wbb_shots(seasons = 2024)         # shot locations, ready to chart
```

And straight into a database, with the
`(seasons, dbConnection, tablename)` plumbing every `load_` function
shares:

``` r

library(DBI)
con <- dbConnect(RSQLite::SQLite(), "wbb.sqlite")
load_wbb_pbp(seasons = 2020:2024, dbConnection = con, tablename = "wbb_pbp")
dbDisconnect(con)
```

Margin note: consistency is a feature. Every `load_` function shares the
same signature, so learning one teaches you all of them – guess the
arguments the same way you guess the names.

## Working through a proxy

Campus networks love a proxy. `wehoop` handles them in three layers –
reach for the least invasive one that works.

**Layer 1 – set it once for the session.** Covers everything: ESPN,
NCAA, loaders.

``` r

options(wehoop.proxy = "http://proxy.university.edu:8080")

# Authenticated proxy? Pass a list instead of a string.
options(wehoop.proxy = list(
  url      = "http://proxy.university.edu",
  port     = 8080,
  username = "netid",
  password = Sys.getenv("PROXY_PASS")
))

# Then just work -- every call inherits it.
espn_wbb_team_roster(team_id = 2509, season = most_recent_wbb_season())
ncaa_wbb_NET_rankings()
```

**Layer 2 – environment variables.** For shared scripts and CI, where
the proxy belongs to the machine and not the analysis, set the standard
variables and let libcurl pick them up:

``` r

Sys.setenv(
  http_proxy  = "http://proxy.university.edu:8080",
  https_proxy = "http://proxy.university.edu:8080",
  no_proxy    = "localhost,127.0.0.1"
)
```

A grammar-flavored note on what *doesn’t* take a per-call `proxy =`
argument: the `espn_*`, `ncaa_wbb_*`, and `load_*` functions call the
HTTP layer directly, so they read the proxy from the session option or
the environment – not from an argument. (In the WNBA cookbook, the
`wnba_*` Stats API functions *do* accept per-call `proxy =`, because
they thread `...` through. Women’s college basketball has no equivalent
Stats-API surface, so for `wbb` you’ll use Layer 1 or Layer 2 every
time.) Once again, the prefix tells you the capability before you go
looking.

## Where to go next

The women’s college game has more teams, a deeper conference hierarchy,
and the `ncaa_wbb_` prefix – but the grammar is identical to every other
league in this family. You decided where the data lived, you named the
league, you named the thing from general to specific, and you let the
singular/plural rule and the shared stems carry you the rest of the way.

`wehoop` is the women’s-game sibling of `hoopR`, and the two share this
grammar bone for bone. `espn_wbb_team_roster` has a mirror image in
`hoopR`’s `espn_mbb_team_roster`; a recipe you learn in one package
crosses straight into the other. Four leagues, one grammar – and now
it’s yours.

# **Get ESPN Women's College Basketball Event Odds**

Returns the live game situation for one WBB event: timeouts remaining,
team fouls, fouls to give, bonus state, and a `$ref` to the last play.
During a live game this reflects current state; after the game ends the
values are frozen.

Returns pre-game predictor statistics for one WBB event in long format:
one row per (team x statistic). Typical stats include matchup quality,
predicted score, win probability, and team strength metrics. Returns
empty for events without predictor data (often the case for
already-played games).

Returns the per-team power-index `$ref` URLs for one WBB event. Coverage
is sparse – many events return zero items.

## Usage

``` r
espn_wbb_game_odds(event_id, ...)

espn_wbb_game_officials(event_id, ...)

espn_wbb_game_broadcasts(event_id, ...)

espn_wbb_game_situation(event_id, ...)

espn_wbb_game_predictor(event_id, ...)

espn_wbb_game_powerindex(event_id, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per odds provider (typically empty for WBB because
ESPN does not carry NCAA basketball betting lines).

Columns as documented in the shared
[espn_basketball_game_odds_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_odds_schema.md)
table.

A tibble with one row per official assigned to the game.

Columns as documented in the shared
[espn_basketball_game_officials_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_officials_schema.md)
table.

A tibble with one row per broadcast outlet for the game.

Columns as documented in the shared
[espn_basketball_game_broadcasts_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_game_broadcasts_schema.md)
table.

A single-row tibble with timeouts + fouls for both teams.

A long tibble with rows for both home and away teams.

A tibble with one row per team-game power-index entry.

## Details

**Get ESPN WBB Event Predictor (Pre-game)**

**Get ESPN WBB Event Power Index Index**

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_game_odds(event_id = "401276115")
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Odds (event_id=401276115) from ESPN.com 
#> ℹ Data updated: 2026-11-09 21:09:37 UTC
#> # A tibble: 0 × 12
#> # ℹ 12 variables: event_id <chr>, provider_id <chr>, provider_name <chr>,
#> #   details <chr>, over_under <dbl>, spread <dbl>, home_money_line <int>,
#> #   away_money_line <int>, home_team_odds_open <dbl>,
#> #   home_team_odds_close <dbl>, away_team_odds_open <dbl>,
#> #   away_team_odds_close <dbl>
# }
# \donttest{
  espn_wbb_game_officials(event_id = "401276115")
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Officials (event_id=401276115) from ESPN
#> ℹ Data updated: 2026-11-09 21:09:37 UTC
#> # A tibble: 3 × 8
#>   event_id  official_id full_name     display_name  position_id position_name
#>   <chr>     <chr>       <chr>         <chr>         <chr>       <chr>        
#> 1 401276115 18864       Denise Brooks Denise Brooks 40          Referee      
#> 2 401276115 2609971     Tiara Cruse   Tiara Cruse   40          Referee      
#> 3 401276115 3007837     Jeffrey Smith Jeffrey Smith 40          Referee      
#> # ℹ 2 more variables: position_type <chr>, order <int>
# }
# \donttest{
  espn_wbb_game_broadcasts(event_id = "401276115")
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Broadcasts (event_id=401276115) from ESP
#> ℹ Data updated: 2026-11-09 21:09:37 UTC
#> # A tibble: 1 × 10
#>   event_id  broadcast_id type_id type_short_name type_long_name market_id
#>   <chr>     <chr>        <chr>   <chr>           <chr>          <chr>    
#> 1 401276115 NA           4       Streaming       Streaming      0        
#> # ℹ 4 more variables: market_type <chr>, names <chr>, lang <chr>, region <chr>
# }
# \donttest{
  espn_wbb_game_situation(event_id = 401276115)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Situation ────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:09:37 UTC
#> # A tibble: 1 × 15
#>   league                   event_id home_timeouts_current home_timeouts_remain…¹
#>   <chr>                    <chr>                    <int>                  <int>
#> 1 womens-college-basketba… 4012761…                     0                      0
#> # ℹ abbreviated name: ¹​home_timeouts_remaining
#> # ℹ 11 more variables: away_timeouts_current <int>,
#> #   away_timeouts_remaining <int>, home_team_fouls <int>,
#> #   home_team_fouls_current <int>, home_fouls_to_give <int>,
#> #   home_bonus_state <chr>, away_team_fouls <int>,
#> #   away_team_fouls_current <int>, away_fouls_to_give <int>,
#> #   away_bonus_state <chr>, last_play_ref <chr>
# }
# \donttest{
  espn_wbb_game_predictor(event_id = 401276115)
#> ✖ 2026-11-09 21:09:37.569415: Failed to retrieve ESPN womens-college-basketball event predictor for event_id=401276115
#> ✖ Args: league = "womens-college-basketball", event_id = 401276115
#> ✖ Error: The API returned an error
#> NULL
# }
# \donttest{
  espn_wbb_game_powerindex(event_id = 401276115)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Event Power Index ──────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 21:09:37 UTC
#> # A tibble: 0 × 4
#> # ℹ 4 variables: league <chr>, event_id <chr>, team_id <chr>, ref <chr>
# }
```

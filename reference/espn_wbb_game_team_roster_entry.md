# **Get ESPN WBB Event Competitor Roster Entry (Per-Athlete Game-Day Row)**

Returns a single-row tibble describing one athlete's game-day roster
entry for one WBB event. Carries the **starter** flag, **didNotPlay**
flag with reason, ejection flag, and the substitution slot if the
athlete came in for another player. Pair with
[`espn_wbb_game_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_game_team_leaders.md)
to enumerate the roster.

## Usage

``` r
espn_wbb_game_team_roster_entry(event_id, team_id, athlete_id, ...)
```

## Arguments

- event_id:

  ESPN event identifier.

- team_id:

  ESPN team identifier.

- athlete_id:

  ESPN athlete identifier.

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_game_team_roster_entry(event_id = 401276115,
                                            team_id = 2509,
                                            athlete_id = 4433404)
#> ✖ 2026-11-13 13:57:04.153069: Failed to retrieve ESPN womens-college-basketball event roster entry for event_id=401276115, team_id=2509, athlete_id=4433404
#> ✖ Args: league = "womens-college-basketball", event_id = 401276115, team_id = 2509, athlete_id = 4433404
#> ✖ Error: The API returned an error
#> NULL
# }
```

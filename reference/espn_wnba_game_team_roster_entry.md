# **Get ESPN WNBA Event Competitor Roster Entry (Per-Athlete Game-Day Row)**

Returns a single-row tibble describing one athlete's game-day roster
entry for one WNBA event. Carries the **starter** flag, **didNotPlay**
flag with reason, ejection flag, and the substitution slot if the
athlete came in for another player. Pair with
[`espn_wnba_game_team_roster()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_game_team_leaders.md)
to enumerate the roster.

## Usage

``` r
espn_wnba_game_team_roster_entry(event_id, team_id, athlete_id, ...)
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

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_game_team_roster_entry(event_id = 401736171,
                                            team_id = 17,
                                            athlete_id = 3149391)
#> ── ESPN WNBA Event Competitor Roster Entry ───────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:22:10 UTC
#> # A tibble: 1 × 16
#>   league event_id  team_id athlete_id player_id period active starter
#>   <chr>  <chr>     <chr>   <chr>      <chr>      <int> <lgl>  <lgl>  
#> 1 wnba   401736171 17      3149391    3149391        0 FALSE  TRUE   
#> # ℹ 8 more variables: did_not_play <lgl>, reason <chr>, ejected <lgl>,
#> #   for_player_id <chr>, jersey <chr>, display_name <chr>, athlete_ref <chr>,
#> #   position_ref <chr>
# }
```

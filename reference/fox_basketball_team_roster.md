# **Get Fox Sports basketball team roster**

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) team
roster.** `fox_wnba_team_roster()` hits the `wnba` slug;
`fox_wbb_team_roster()` hits the `wcbk` slug.

## Usage

``` r
fox_wnba_team_roster(team_id)

fox_wbb_team_roster(team_id)
```

## Arguments

- team_id:

  Fox Bifrost team id (e.g. `"1"`). Discover via the league team
  directory.

## Value

A `wehoop_data` tibble, one row per player: `team_id`, `position_group`,
`player`, position/age/etc. columns, `athlete_id`.

## See also

Other Fox Sports Functions:
[`fox_basketball_boxscore`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md),
[`fox_basketball_league_leaders`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md),
[`fox_basketball_odds`](https://wehoop.sportsdataverse.org/reference/fox_basketball_odds.md),
[`fox_basketball_pbp`](https://wehoop.sportsdataverse.org/reference/fox_basketball_pbp.md),
[`fox_basketball_standings`](https://wehoop.sportsdataverse.org/reference/fox_basketball_standings.md),
[`fox_basketball_team_gamelog`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_gamelog.md),
[`fox_basketball_team_stats`](https://wehoop.sportsdataverse.org/reference/fox_basketball_team_stats.md),
[`fox_basketball_teams`](https://wehoop.sportsdataverse.org/reference/fox_basketball_teams.md),
[`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md)

## Examples

``` r
# \donttest{
  try(fox_wnba_team_roster("1"))
#> ── Fox Sports WNBA roster ────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-12 21:56:50 UTC
#> # A tibble: 14 × 9
#>    team_id position_group player      pos   age   ht    wt    college athlete_id
#>    <chr>   <chr>          <chr>       <chr> <chr> <chr> <chr> <chr>   <chr>     
#>  1 1       GUARD          Isobel Bor… G     21    "5'1… -     -       809       
#>  2 1       GUARD          Jordin Can… G     31    "5'6… 135 … UCLA    203       
#>  3 1       GUARD          Allisha Gr… G     31    "6'0… 167 … South … 138       
#>  4 1       GUARD          Rhyne Howa… G     26    "6'2… 175 … -       638       
#>  5 1       GUARD          Indya Nivar G     22    "5'1… -     -       934       
#>  6 1       GUARD          Aaliyah Nye G/F   23    "6'0… -     -       854       
#>  7 1       GUARD          Te-Hina Pa… G     23    "5'9… -     -       859       
#>  8 1       GUARD          Jaylyn She… G     24    "5'7… 147 … -       822       
#>  9 1       GUARD          Shatori Wa… G     31    "5'9… 140 … Maryla… 116       
#> 10 1       FORWARD        Naz Hillmon F     26    "6'2… 190 … -       646       
#> 11 1       FORWARD        Brionna Jo… F     30    "6'3… 215 … Maryla… 111       
#> 12 1       FORWARD        Sika Koné   F     24    "6'3… 180 … -       630       
#> 13 1       FORWARD        Angel Reese F     24    "6'4… 165 … -       799       
#> 14 1       CENTER         Madina Okot C     21    "6'6… -     -       921       
# }
# \donttest{
  try(fox_wbb_team_roster("11"))
#> ── Fox Sports WCBK roster ────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-12 21:56:51 UTC
#> # A tibble: 16 × 7
#>    team_id position_group player            pos   cls   ht       athlete_id
#>    <chr>   <chr>          <chr>             <chr> <chr> <chr>    <chr>     
#>  1 11      GUARD          KK Arnold         G     JR    "5'9\""  16007     
#>  2 11      GUARD          Morgan Cheli      G     SO    "6'2\""  21657     
#>  3 11      GUARD          Caroline Ducharme G     SR    "6'2\""  13649     
#>  4 11      GUARD          Marine Dursus     G     FR    "5'9\""  30433     
#>  5 11      GUARD          Kelis Fisher      G     FR    "5'9\""  25928     
#>  6 11      GUARD          Azzi Fudd         G     GS    "5'11\"" 13648     
#>  7 11      GUARD          Kayleigh Heckel   G     SO    "5'9\""  21534     
#>  8 11      GUARD          Ashlynn Shade     G     JR    "5'10\"" 16006     
#>  9 11      GUARD          Allie Ziebell     G     SO    "6'0\""  21659     
#> 10 11      FORWARD        Ice Brady         F     JR    "6'3\""  14739     
#> 11 11      FORWARD        Ayanna Patterson  F     SO    "6'2\""  14740     
#> 12 11      FORWARD        Blanca Quiñonez   F     FR    "6'2\""  25927     
#> 13 11      FORWARD        Sarah Strong      F     SO    "6'2\""  21658     
#> 14 11      FORWARD        Serah Williams    F     SR    "6'4\""  14797     
#> 15 11      CENTER         Jana El Alfy      C     SO    "6'5\""  15956     
#> 16 11      CENTER         Gandy Malou-Mamel C     FR    "6'5\""  25929     
# }
```

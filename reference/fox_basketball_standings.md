# **Get Fox Sports basketball team roster**

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) team
roster.** `fox_wnba_team_roster()` hits the `wnba` slug;
`fox_wbb_team_roster()` hits the `wcbk` slug.

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) team
stat leaders.** `fox_wnba_team_stats()` hits the `wnba` slug;
`fox_wbb_team_stats()` hits the `wcbk` slug.

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB) team
game log.** `fox_wnba_team_gamelog()` hits the `wnba` slug;
`fox_wbb_team_gamelog()` hits the `wcbk` slug.

**Get Fox Sports (Bifrost) WNBA / women's college basketball (WBB)
standings.** `fox_wnba_standings()` hits the `wnba` slug;
`fox_wbb_standings()` hits the `wcbk` slug.

**Get the Fox Sports (Bifrost) WNBA / women's college basketball (WBB)
team directory**, derived from the standings endpoint.
`fox_wnba_teams()` hits the `wnba` slug; `fox_wbb_teams()` hits the
`wcbk` slug.

## Usage

``` r
fox_wnba_team_roster(team_id)

fox_wbb_team_roster(team_id)

fox_wnba_team_stats(team_id)

fox_wbb_team_stats(team_id)

fox_wnba_team_gamelog(team_id)

fox_wbb_team_gamelog(team_id)

fox_wnba_standings(team_id)

fox_wbb_standings(team_id)

fox_wnba_teams(team_id = "3")

fox_wbb_teams(team_id = "11")
```

## Arguments

- team_id:

  Fox Bifrost seed team id used to fetch league standings (default
  `"3"`). The standings response enumerates every team in the seed's
  league sections.

## Value

A `wehoop_data` tibble, one row per player: `team_id`, `position_group`,
`player`, position/age/etc. columns, `athlete_id`.

A `wehoop_data` tibble: `team_id`, `category`, `stat`,
`stat_abbreviation`, `player`, `value`.

A `wehoop_data` tibble (long): `team_id`, `season_type`, `category`,
`game_id`, `game_date`, `opponent`, `stat`, `value`.

A `wehoop_data` tibble of standings rows (`team_id`, `section`, the
standings columns, `entity_id`).

A `wehoop_data` tibble, one row per team: `fox_team_id`,
`fox_team_name`, `fox_section`.

## See also

Other Fox Sports Functions:
[`fox_basketball_league_leaders`](https://wehoop.sportsdataverse.org/reference/fox_basketball_league_leaders.md),
[`fox_wbb_teams_all()`](https://wehoop.sportsdataverse.org/reference/fox_wbb_teams_all.md),
[`fox_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/fox_basketball_boxscore.md)

## Examples

``` r
# \donttest{
  try(fox_wnba_team_roster("1"))
#> ── Fox Sports WNBA roster ───────────────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 14:46:17 UTC
#> # A tibble: 14 × 9
#>    team_id position_group player      pos   age   ht    wt    college athlete_id
#>    <chr>   <chr>          <chr>       <chr> <chr> <chr> <chr> <chr>   <chr>     
#>  1 1       GUARD          DeWanna Bo… G/F   39    "6'4… 140 … Auburn  211       
#>  2 1       GUARD          Isobel Bor… G     22    "5'1… -     -       809       
#>  3 1       GUARD          Jordin Can… G     31    "5'6… 135 … UCLA    203       
#>  4 1       GUARD          Allisha Gr… G     31    "6'0… 167 … South … 138       
#>  5 1       GUARD          Rhyne Howa… G     26    "6'2… 175 … -       638       
#>  6 1       GUARD          Indya Nivar G     22    "5'1… -     -       934       
#>  7 1       GUARD          Te-Hina Pa… G     24    "5'9… -     -       859       
#>  8 1       GUARD          Matilde Vi… G     21    "5'7… -     -       816       
#>  9 1       GUARD          Shatori Wa… G     31    "5'9… 140 … Maryla… 116       
#> 10 1       FORWARD        Naz Hillmon F     26    "6'2… 190 … -       646       
#> 11 1       FORWARD        Brionna Jo… F     30    "6'3… 215 … Maryla… 111       
#> 12 1       FORWARD        Sika Koné   F     24    "6'3… 180 … -       630       
#> 13 1       FORWARD        Angel Reese F     24    "6'4… 165 … -       799       
#> 14 1       CENTER         Madina Okot C     22    "6'6… -     -       921       
# }
# \donttest{
  try(fox_wbb_team_roster("11"))
#> ── Fox Sports WCBK roster ───────────────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 14:46:18 UTC
#> # A tibble: 11 × 7
#>    team_id position_group player            pos   cls   ht       athlete_id
#>    <chr>   <chr>          <chr>             <chr> <chr> <chr>    <chr>     
#>  1 11      GUARD          KK Arnold         G     JR    "5'9\""  16007     
#>  2 11      GUARD          Morgan Cheli      G     SO    "6'2\""  21657     
#>  3 11      GUARD          Marine Dursus     G     FR    "5'9\""  30433     
#>  4 11      GUARD          Kelis Fisher      G     FR    "5'9\""  25928     
#>  5 11      GUARD          Kayleigh Heckel   G     SO    "5'9\""  21534     
#>  6 11      GUARD          Ashlynn Shade     G     JR    "5'10\"" 16006     
#>  7 11      GUARD          Allie Ziebell     G     SO    "6'0\""  21659     
#>  8 11      FORWARD        Blanca Quiñonez   F     FR    "6'2\""  25927     
#>  9 11      FORWARD        Sarah Strong      F     SO    "6'2\""  21658     
#> 10 11      CENTER         Jana El Alfy      C     SO    "6'5\""  15956     
#> 11 11      CENTER         Gandy Malou-Mamel C     FR    "6'5\""  25929     
# }
# \donttest{
  try(fox_wnba_team_stats("1"))
#> ── Fox Sports WNBA team_stats ───────────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 14:46:18 UTC
#> # A tibble: 17 × 6
#>    team_id category     stat       stat_abbreviation player         value
#>    <chr>   <chr>        <chr>      <chr>             <chr>          <chr>
#>  1 1       PLAYER STATS SCORING    PPG               Rhyne Howard   26.0 
#>  2 1       PLAYER STATS REBOUNDING RPG               Angel Reese    12.0 
#>  3 1       PLAYER STATS SHOOTING   FG%               Madina Okot    66.7 
#>  4 1       PLAYER STATS ASSISTS    APG               Jordin Canada  10.0 
#>  5 1       PLAYER STATS DEFENSE    STL               Rhyne Howard   5    
#>  6 1       PLAYER STATS DEFENSE    BLK               Allisha Gray   1    
#>  7 1       PLAYER STATS MISC       DBL DBL           Jordin Canada  1    
#>  8 1       PLAYER STATS ADVANCED   OFF RTG           DeWanna Bonner 125.0
#>  9 1       PLAYER STATS ADVANCED   MPG               Rhyne Howard   39.0 
#> 10 1       TEAM STATS   SCORING    PPG               NA             92.0 
#> 11 1       TEAM STATS   REBOUNDING RPG               NA             31.0 
#> 12 1       TEAM STATS   SHOOTING   FG%               NA             40.8 
#> 13 1       TEAM STATS   ASSISTS    APG               NA             15.0 
#> 14 1       TEAM STATS   DEFENSE    STL               NA             16   
#> 15 1       TEAM STATS   DEFENSE    BLK               NA             5    
#> 16 1       TEAM STATS   MISC       DBL DBL           NA             2    
#> 17 1       TEAM STATS   ADVANCED   NET RTG           NA             17.6 
# }
# \donttest{
  try(fox_wbb_team_stats("11"))
#> ── Fox Sports WCBK team_stats ───────────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 14:46:18 UTC
#> # A tibble: 29 × 6
#>    team_id category     stat                      stat_abbreviation player value
#>    <chr>   <chr>        <chr>                     <chr>             <chr>  <chr>
#>  1 11      PLAYER STATS Points Per Game           PPG               Sarah… 18.5 
#>  2 11      PLAYER STATS Three Point Field Goals … 3FGM/G            Azzi … 3.1  
#>  3 11      PLAYER STATS Free Throws Made Per Game FTM/G             Sarah… 1.9  
#>  4 11      PLAYER STATS High Game Points          HIGH              Allie… 34   
#>  5 11      PLAYER STATS Rebounds Per Game         RPG               Sarah… 7.6  
#>  6 11      PLAYER STATS True Shooting Percentage  TS%               Gandy… 100.0
#>  7 11      PLAYER STATS Assists Per Game          APG               KK Ar… 4.8  
#>  8 11      PLAYER STATS Turnovers Per Game        TPG               Blanc… 2.0  
#>  9 11      PLAYER STATS Steals Per Game           SPG               Sarah… 3.4  
#> 10 11      PLAYER STATS Blocks Per Game           BPG               Sarah… 1.6  
#> # ℹ 19 more rows
# }
# \donttest{
  try(fox_wnba_team_gamelog("1"))
#> ── Fox Sports WNBA gamelog ──────────────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 14:46:19 UTC
#> # A tibble: 165 × 8
#>    team_id season_type category game_id game_date opponent stat         value
#>    <chr>   <chr>       <chr>    <chr>   <chr>     <chr>    <chr>        <chr>
#>  1 1       POSTSEASON  scoring  2571    9/27      WAS      fgm          31   
#>  2 1       POSTSEASON  scoring  2571    9/27      WAS      fga          76   
#>  3 1       POSTSEASON  scoring  2571    9/27      WAS      fg_percent   40.8 
#>  4 1       POSTSEASON  scoring  2571    9/27      WAS      ftm          25   
#>  5 1       POSTSEASON  scoring  2571    9/27      WAS      fta          26   
#>  6 1       POSTSEASON  scoring  2571    9/27      WAS      ft_percent   96.0 
#>  7 1       POSTSEASON  scoring  2571    9/27      WAS      x3fgm        5    
#>  8 1       POSTSEASON  scoring  2571    9/27      WAS      x3fga        21   
#>  9 1       POSTSEASON  scoring  2571    9/27      WAS      x3fg_percent 23.8 
#> 10 1       POSTSEASON  scoring  2571    9/27      WAS      pts          92   
#> # ℹ 155 more rows
# }
# \donttest{
  try(fox_wbb_team_gamelog("11"))
#> ── Fox Sports WCBK gamelog ──────────────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 14:46:21 UTC
#> # A tibble: 110 × 8
#>    team_id season_type category game_id game_date opponent stat         value
#>    <chr>   <chr>       <chr>    <chr>   <chr>     <chr>    <chr>        <chr>
#>  1 11      POSTSEASON  scoring  389046  4/3       SCAR     fgm          19   
#>  2 11      POSTSEASON  scoring  389046  4/3       SCAR     fga          61   
#>  3 11      POSTSEASON  scoring  389046  4/3       SCAR     fg_percent   31.1 
#>  4 11      POSTSEASON  scoring  389046  4/3       SCAR     ftm          4    
#>  5 11      POSTSEASON  scoring  389046  4/3       SCAR     fta          6    
#>  6 11      POSTSEASON  scoring  389046  4/3       SCAR     ft_percent   66.7 
#>  7 11      POSTSEASON  scoring  389046  4/3       SCAR     x3fgm        6    
#>  8 11      POSTSEASON  scoring  389046  4/3       SCAR     x3fga        21   
#>  9 11      POSTSEASON  scoring  389046  4/3       SCAR     x3fg_percent 28.6 
#> 10 11      POSTSEASON  scoring  389046  4/3       SCAR     pts          48   
#> # ℹ 100 more rows
# }
# \donttest{
  try(fox_wnba_standings("1"))
#> ── Fox Sports WNBA standings ────────────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 14:46:22 UTC
#> # A tibble: 30 × 16
#>    team_id section eastern v2    w_l   pct   gb    pf    pa    home  away  conf 
#>    <chr>   <chr>   <chr>   <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#>  1 1       CONFER… 1       Dream 30-14 .682  -     91.0  84.0  15-7  15-7  15-5 
#>  2 1       CONFER… 2       Myst… 28-16 .636  2.0   84.0  83.0  15-7  13-9  15-5 
#>  3 1       CONFER… 3       Fever 28-16 .636  2.0   96.0  90.0  15-7  13-9  14-6 
#>  4 1       CONFER… 4       Libe… 26-18 .591  4.0   90.0  86.0  14-8  12-10 13-7 
#>  5 1       CONFER… 5       Sky   16-28 .364  14.0  87.0  91.0  11-11 5-17  4-16 
#>  6 1       CONFER… 6       Tempo 11-33 .250  19.0  86.0  94.0  7-15  4-18  5-15 
#>  7 1       CONFER… 7       Sun   11-33 .250  19.0  79.0  88.0  8-14  3-19  4-16 
#>  8 1       CONFER… NA      Lynx  33-11 .750  -     91.0  84.0  15-7  18-4  20-3 
#>  9 1       CONFER… NA      Valk… 32-12 .727  1.0   82.0  75.0  17-5  15-7  15-8 
#> 10 1       CONFER… NA      Aces  31-13 .705  2.0   91.0  86.0  15-7  16-6  17-6 
#> # ℹ 20 more rows
#> # ℹ 4 more variables: l10 <chr>, strk <chr>, entity_id <chr>, western <chr>
# }
# \donttest{
  try(fox_wbb_standings("11"))
#> ── Fox Sports WCBK standings ────────────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 14:46:23 UTC
#> # A tibble: 11 × 13
#>    team_id section    big_east v2     conf  w_l   top_25 home  away  pf    pa   
#>    <chr>   <chr>      <chr>    <chr>  <chr> <chr> <chr>  <chr> <chr> <chr> <chr>
#>  1 11      CONFERENCE 1        Marqu… -     0-0   -      -     -     0     0    
#>  2 11      CONFERENCE 2        St. J… -     0-0   -      -     -     0     0    
#>  3 11      CONFERENCE 3        Xavier -     0-0   -      -     -     0     0    
#>  4 11      CONFERENCE 4        Villa… -     0-0   -      -     -     0     0    
#>  5 11      CONFERENCE 5        Seton… -     0-0   -      -     -     0     0    
#>  6 11      CONFERENCE 6        Provi… -     0-0   -      -     -     0     0    
#>  7 11      CONFERENCE 7        DePaul -     0-0   -      -     -     0     0    
#>  8 11      CONFERENCE 8        UConn  -     0-0   -      -     -     0     0    
#>  9 11      CONFERENCE 9        Creig… -     0-0   -      -     -     0     0    
#> 10 11      CONFERENCE 10       Butler -     0-0   -      -     -     0     0    
#> 11 11      CONFERENCE 11       Georg… -     0-0   -      -     -     0     0    
#> # ℹ 2 more variables: strk <chr>, entity_id <chr>
# }
# \donttest{
  try(fox_wnba_teams())
#> ── Fox Sports WNBA teams ────────────────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 14:46:24 UTC
#> # A tibble: 15 × 3
#>    fox_team_id fox_team_name          fox_section    
#>    <chr>       <chr>                  <chr>          
#>  1 1           Atlanta Dream          Connecticut Sun
#>  2 6           Washington Mystics     Connecticut Sun
#>  3 4           Indiana Fever          Connecticut Sun
#>  4 5           New York Liberty       Connecticut Sun
#>  5 2           Chicago Sky            Connecticut Sun
#>  6 29          Toronto Tempo          Connecticut Sun
#>  7 3           Connecticut Sun        Connecticut Sun
#>  8 9           Minnesota Lynx         Connecticut Sun
#>  9 23          Golden State Valkyries Connecticut Sun
#> 10 11          Las Vegas Aces         Connecticut Sun
#> 11 7           Dallas Wings           Connecticut Sun
#> 12 30          Portland Fire          Connecticut Sun
#> 13 10          Phoenix Mercury        Connecticut Sun
#> 14 8           Los Angeles Sparks     Connecticut Sun
#> 15 12          Seattle Storm          Connecticut Sun
# }
# \donttest{
  try(fox_wbb_teams("11"))
#> ── Fox Sports WCBK teams ────────────────────────────────── wehoop 3.0.0.9000 ──
#> ℹ Data updated: 2026-09-30 14:46:24 UTC
#> # A tibble: 11 × 3
#>    fox_team_id fox_team_name           fox_section
#>    <chr>       <chr>                   <chr>      
#>  1 73          Marquette Golden Eagles Big East   
#>  2 76          St. John's Red Storm    Big East   
#>  3 78          Xavier Musketeers       Big East   
#>  4 77          Villanova Wildcats      Big East   
#>  5 75          Seton Hall Pirates      Big East   
#>  6 74          Providence Friars       Big East   
#>  7 71          Depaul Blue Demons      Big East   
#>  8 11          Uconn Huskies           Big East   
#>  9 70          Creighton Bluejays      Big East   
#> 10 69          Butler Bulldogs         Big East   
#> 11 72          Georgetown Hoyas        Big East   
# }
```

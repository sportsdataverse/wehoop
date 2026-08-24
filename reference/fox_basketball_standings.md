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
#> ── Fox Sports WNBA roster ────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:39:58 UTC
#> # A tibble: 14 × 9
#>    team_id position_group player      pos   age   ht    wt    college athlete_id
#>    <chr>   <chr>          <chr>       <chr> <chr> <chr> <chr> <chr>   <chr>     
#>  1 1       GUARD          Isobel Bor… G     21    "5'1… -     -       809       
#>  2 1       GUARD          Jordin Can… G     31    "5'6… 135 … UCLA    203       
#>  3 1       GUARD          Allisha Gr… G     31    "6'0… 167 … South … 138       
#>  4 1       GUARD          Rhyne Howa… G     26    "6'2… 175 … -       638       
#>  5 1       GUARD          Indya Nivar G     22    "5'1… -     -       934       
#>  6 1       GUARD          Aaliyah Nye G/F   24    "6'0… -     -       854       
#>  7 1       GUARD          Te-Hina Pa… G     24    "5'9… -     -       859       
#>  8 1       GUARD          Jaylyn She… G     24    "5'7… 147 … -       822       
#>  9 1       GUARD          Shatori Wa… G     31    "5'9… 140 … Maryla… 116       
#> 10 1       FORWARD        Naz Hillmon F     26    "6'2… 190 … -       646       
#> 11 1       FORWARD        Brionna Jo… F     30    "6'3… 215 … Maryla… 111       
#> 12 1       FORWARD        Sika Koné   F     24    "6'3… 180 … -       630       
#> 13 1       FORWARD        Angel Reese F     24    "6'4… 165 … -       799       
#> 14 1       CENTER         Madina Okot C     22    "6'6… -     -       921       
# }
# \donttest{
  try(fox_wbb_team_roster("11"))
#> ── Fox Sports WCBK roster ────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:39:58 UTC
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
# \donttest{
  try(fox_wnba_team_stats("1"))
#> ── Fox Sports WNBA team_stats ────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:39:58 UTC
#> # A tibble: 17 × 6
#>    team_id category     stat       stat_abbreviation player        value
#>    <chr>   <chr>        <chr>      <chr>             <chr>         <chr>
#>  1 1       PLAYER STATS SCORING    PPG               Allisha Gray  19.4 
#>  2 1       PLAYER STATS REBOUNDING RPG               Angel Reese   12.0 
#>  3 1       PLAYER STATS SHOOTING   FG%               Madina Okot   57.9 
#>  4 1       PLAYER STATS ASSISTS    APG               Jordin Canada 7.4  
#>  5 1       PLAYER STATS DEFENSE    STL               Rhyne Howard  87   
#>  6 1       PLAYER STATS DEFENSE    BLK               Rhyne Howard  33   
#>  7 1       PLAYER STATS MISC       DBL DBL           Angel Reese   26   
#>  8 1       PLAYER STATS ADVANCED   OFF RTG           Rhyne Howard  122.4
#>  9 1       PLAYER STATS ADVANCED   MPG               Rhyne Howard  34.5 
#> 10 1       TEAM STATS   SCORING    PPG               NA            91.4 
#> 11 1       TEAM STATS   REBOUNDING RPG               NA            35.2 
#> 12 1       TEAM STATS   SHOOTING   FG%               NA            44.1 
#> 13 1       TEAM STATS   ASSISTS    APG               NA            21.2 
#> 14 1       TEAM STATS   DEFENSE    STL               NA            339  
#> 15 1       TEAM STATS   DEFENSE    BLK               NA            124  
#> 16 1       TEAM STATS   MISC       DBL DBL           NA            33   
#> 17 1       TEAM STATS   ADVANCED   NET RTG           NA            6.9  
# }
# \donttest{
  try(fox_wbb_team_stats("11"))
#> ── Fox Sports WCBK team_stats ────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:39:58 UTC
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
#> ── Fox Sports WNBA gamelog ───────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:39:59 UTC
#> # A tibble: 165 × 8
#>    team_id season_type    category game_id game_date opponent stat         value
#>    <chr>   <chr>          <chr>    <chr>   <chr>     <chr>    <chr>        <chr>
#>  1 1       REGULAR SEASON scoring  2352    8/22      @PHX     fgm          37   
#>  2 1       REGULAR SEASON scoring  2352    8/22      @PHX     fga          76   
#>  3 1       REGULAR SEASON scoring  2352    8/22      @PHX     fg_percent   48.7 
#>  4 1       REGULAR SEASON scoring  2352    8/22      @PHX     ftm          14   
#>  5 1       REGULAR SEASON scoring  2352    8/22      @PHX     fta          16   
#>  6 1       REGULAR SEASON scoring  2352    8/22      @PHX     ft_percent   88.0 
#>  7 1       REGULAR SEASON scoring  2352    8/22      @PHX     x3fgm        11   
#>  8 1       REGULAR SEASON scoring  2352    8/22      @PHX     x3fga        38   
#>  9 1       REGULAR SEASON scoring  2352    8/22      @PHX     x3fg_percent 28.9 
#> 10 1       REGULAR SEASON scoring  2352    8/22      @PHX     pts          99   
#> # ℹ 155 more rows
# }
# \donttest{
  try(fox_wbb_team_gamelog("11"))
#> ── Fox Sports WCBK gamelog ───────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:39:59 UTC
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
#> ── Fox Sports WNBA standings ─────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:39:59 UTC
#> # A tibble: 30 × 16
#>    team_id section eastern v2    w_l   pct   gb    pf    pa    home  away  conf 
#>    <chr>   <chr>   <chr>   <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr> <chr>
#>  1 1       CONFER… 1       Dream 24-13 .649  -     91.0  86.0  12-6  12-7  11-5 
#>  2 1       CONFER… 2       Fever 25-14 .641  -     97.0  91.0  13-6  12-8  12-5 
#>  3 1       CONFER… 3       Libe… 23-15 .605  1.5   91.0  88.0  13-5  10-10 11-5 
#>  4 1       CONFER… 4       Myst… 22-15 .595  2.0   83.0  83.0  13-7  9-8   11-5 
#>  5 1       CONFER… 5       Sky   15-23 .395  9.5   87.0  90.0  10-10 5-13  3-11 
#>  6 1       CONFER… 6       Tempo 11-26 .297  13.0  87.0  94.0  7-13  4-13  5-11 
#>  7 1       CONFER… 7       Sun   9-27  .250  14.5  79.0  87.0  6-12  3-15  2-13 
#>  8 1       CONFER… NA      Lynx  31-7  .816  -     92.0  83.0  14-5  17-2  20-2 
#>  9 1       CONFER… NA      Valk… 25-11 .694  5.0   83.0  77.0  15-5  10-6  10-7 
#> 10 1       CONFER… NA      Aces  26-13 .667  5.5   91.0  87.0  12-7  14-6  13-6 
#> # ℹ 20 more rows
#> # ℹ 4 more variables: l10 <chr>, strk <chr>, entity_id <chr>, western <chr>
# }
# \donttest{
  try(fox_wbb_standings("11"))
#> ── Fox Sports WCBK standings ─────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:40:00 UTC
#> # A tibble: 11 × 13
#>    team_id section    big_east v2     conf  w_l   top_25 home  away  pf    pa   
#>    <chr>   <chr>      <chr>    <chr>  <chr> <chr> <chr>  <chr> <chr> <chr> <chr>
#>  1 11      CONFERENCE 1        UConn  20-0  38-1  7-1    17-0  12-0  3387  1966 
#>  2 11      CONFERENCE 2        Villa… 16-4  25-8  1-4    12-3  10-3  2351  2021 
#>  3 11      CONFERENCE 3        Marqu… 12-8  18-12 0-3    11-4  7-5   2030  1891 
#>  4 11      CONFERENCE 4        Seton… 12-8  19-13 0-2    10-6  8-6   2160  2053 
#>  5 11      CONFERENCE 5        St. J… 11-9  22-12 1-2    11-4  8-7   2087  2081 
#>  6 11      CONFERENCE 6        Creig… 11-9  16-15 0-3    8-6   6-8   2093  2132 
#>  7 11      CONFERENCE 7        Provi… 7-13  15-18 0-3    11-7  2-9   1979  2108 
#>  8 11      CONFERENCE 8        Georg… 6-14  14-17 0-4    8-8   5-8   1942  1937 
#>  9 11      CONFERENCE 9        Butler 6-14  12-19 0-2    9-8   2-9   1927  2014 
#> 10 11      CONFERENCE 10       DePaul 5-15  8-24  0-3    7-10  1-13  2016  2313 
#> 11 11      CONFERENCE 11       Xavier 4-16  11-19 0-2    8-9   3-9   1751  1997 
#> # ℹ 2 more variables: strk <chr>, entity_id <chr>
# }
# \donttest{
  try(fox_wnba_teams())
#> ── Fox Sports WNBA teams ─────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:40:00 UTC
#> # A tibble: 15 × 3
#>    fox_team_id fox_team_name          fox_section    
#>    <chr>       <chr>                  <chr>          
#>  1 1           Atlanta Dream          Connecticut Sun
#>  2 4           Indiana Fever          Connecticut Sun
#>  3 5           New York Liberty       Connecticut Sun
#>  4 6           Washington Mystics     Connecticut Sun
#>  5 2           Chicago Sky            Connecticut Sun
#>  6 29          Toronto Tempo          Connecticut Sun
#>  7 3           Connecticut Sun        Connecticut Sun
#>  8 9           Minnesota Lynx         Connecticut Sun
#>  9 23          Golden State Valkyries Connecticut Sun
#> 10 11          Las Vegas Aces         Connecticut Sun
#> 11 7           Dallas Wings           Connecticut Sun
#> 12 30          Portland Fire          Connecticut Sun
#> 13 8           Los Angeles Sparks     Connecticut Sun
#> 14 10          Phoenix Mercury        Connecticut Sun
#> 15 12          Seattle Storm          Connecticut Sun
# }
# \donttest{
  try(fox_wbb_teams("11"))
#> ── Fox Sports WCBK teams ─────────────────────────────────────── wehoop 3.0.0 ──
#> ℹ Data updated: 2026-08-24 16:40:00 UTC
#> # A tibble: 11 × 3
#>    fox_team_id fox_team_name           fox_section
#>    <chr>       <chr>                   <chr>      
#>  1 11          Uconn Huskies           Big East   
#>  2 77          Villanova Wildcats      Big East   
#>  3 73          Marquette Golden Eagles Big East   
#>  4 75          Seton Hall Pirates      Big East   
#>  5 76          St. John's Red Storm    Big East   
#>  6 70          Creighton Bluejays      Big East   
#>  7 74          Providence Friars       Big East   
#>  8 72          Georgetown Hoyas        Big East   
#>  9 69          Butler Bulldogs         Big East   
#> 10 71          Depaul Blue Demons      Big East   
#> 11 78          Xavier Musketeers       Big East   
# }
```

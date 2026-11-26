# **Load WNBA player-impact ratings (RAPM / SPM / BPM / DARKO) from the data repo**

Loads season-level WNBA player-impact ratings – one row per player,
team, season and season type, combining regularized adjusted plus-minus
(RAPM), statistical plus-minus (SPM), box plus-minus (BPM), wins above
replacement (WAR), and a DARKO-style skill/projection pair. Produced by
the sportsdataverse-py NBA/WNBA possession-engine model program;
published to the `wnba_player_impact` release tag as csv/parquet/rds.

Loads season-level NCAA women's college basketball player-value ratings
– one row per player-team-season, with a box-score-derived
offensive/defensive/net box plus-minus (BPM). Coverage starts at 2014
(the earliest season with published box-score inputs of sufficient
quality for the model); this tag is parquet-only, with no csv/rds
sibling assets. Produced by the sportsdataverse-py NCAA WBB model
program; published to the `wbb_player_value` release tag.

Loads season-level NCAA women's college basketball team ratings – one
row per team-season, with adjusted (opponent-strength-normalized)
offensive/defensive efficiency, adjusted tempo, raw efficiency, and a
rank by adj_em over every team in the file (including non-Division I
opponents), solved as an iterative fixed point. This tag is
parquet-only, with no csv/rds sibling assets. Produced by the
sportsdataverse-py NCAA WBB model program; published to the
`wbb_ratings` release tag.

## Usage

``` r
load_wnba_player_impact(
  seasons = most_recent_wnba_stats_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_player_value(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)

load_wbb_ratings(
  seasons = most_recent_wbb_season(),
  ...,
  dbConnection = NULL,
  tablename = NULL
)
```

## Source

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wnba_player_impact>

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wbb_player_value>

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wbb_ratings>

## Arguments

- seasons:

  A vector of 4-digit seasons, or `TRUE` for every published season:
  1997 onward for `load_wnba_player_impact()` (WNBA seasons), 2014
  onward for `load_wbb_player_value()` and 2009 onward for
  `load_wbb_ratings()` (NCAA women's season-ending years, e.g. `2024`
  for 2023-24), with no gaps. The upper bound is
  [`most_recent_wnba_stats_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wnba_stats_season.md)
  /
  [`most_recent_wbb_season()`](https://wehoop.sportsdataverse.org/reference/most_recent_wbb_season.md).
  When `seasons` is left at its default and that season's file is not
  published yet, the loader reads the newest published season instead,
  with a message. An explicit request for an unpublished season is kept
  as asked: the read warns and returns an empty frame.

- ...:

  Additional arguments passed to an underlying function that writes the
  season data into a database.

- dbConnection:

  A `DBIConnection` object, as returned by
  [`DBI::dbConnect()`](https://dbi.r-dbi.org/reference/dbConnect.html)

- tablename:

  The name of the data table within the database

## Value

`load_wnba_player_impact()` returns a `wehoop_data` tibble with one row
per player, team, season and season type (`Regular Season` and
`Playoffs` rows are separate). Each of the 16 ratings gets an `_n`
(sample size), `_rank` and `_pct` column, computed within each season
and season type. The sample gates are regular-season sized: in the
published 1997-2026 files no season has 10 playoff players past a gate,
so every playoff `_rank` and `_pct` is null except `war_rank` and
`war_pct`.

|  |  |  |
|----|----|----|
| col_name | types | description |
| player_id | integer | Unique WNBA Stats player identifier. |
| player_name | character | Player display name. |
| team_id | integer | Unique team identifier. |
| team_abbreviation | character | Team abbreviation. |
| team_name | character | Full team display name. |
| teams | character | Team abbreviation(s) the player appeared for this season. |
| season | integer | Season identifier (4-digit year). |
| season_type | character | Season portion (e.g. 'Regular Season'). |
| o_rapm | numeric | Offensive regularized adjusted plus-minus. |
| d_rapm | numeric | Defensive regularized adjusted plus-minus. |
| rapm | numeric | Net regularized adjusted plus-minus (o_rapm + d_rapm). |
| off_poss | integer | Offensive possessions used in the RAPM fit. |
| def_poss | integer | Defensive possessions used in the RAPM fit. |
| o_adj_rapm | numeric | Offensive RAPM fitted with a ridge prior toward SPM instead of zero: the previous season's SPM in the regular season, the same season's regular-season SPM in the playoffs. A player with no prior (a first season, or after a gap) is shrunk toward zero. |
| d_adj_rapm | numeric | Defensive RAPM fitted with a ridge prior toward SPM instead of zero: the previous season's SPM in the regular season, the same season's regular-season SPM in the playoffs. A player with no prior (a first season, or after a gap) is shrunk toward zero. |
| adj_rapm | numeric | Net adjusted RAPM (o_adj_rapm + d_adj_rapm). |
| ospm | numeric | Offensive statistical plus-minus (box-score component). |
| dspm | numeric | Defensive statistical plus-minus (box-score component). |
| spm | numeric | Net statistical plus-minus. |
| min | numeric | Minutes played. |
| gp | integer | Games played. |
| obpm | numeric | Offensive box plus-minus. |
| dbpm | numeric | Defensive box plus-minus. |
| bpm | numeric | Net box plus-minus. |
| war | numeric | Wins above replacement. |
| boban_filtered_skill | numeric | DARKO-style filtered skill rating. |
| boban_projected_rating | numeric | DARKO-style forward-looking projected rating. |
| boban_projected_sd | numeric | Standard deviation of the DARKO-style projected rating. |
| o_rapm_n | integer | Possessions o_rapm is measured over (off_poss). Its rank and percentile are set only when it reaches 610, the WNBA sample at which an offensive on-court rating is half signal. |
| d_rapm_n | integer | Possessions d_rapm is measured over (def_poss). Its rank and percentile are set only when it reaches 1,200, the WNBA sample at which a defensive on-court rating is half signal. |
| rapm_n | integer | Possessions rapm is measured over (off_poss + def_poss). Its rank and percentile are set only when it reaches 1,600, the WNBA sample at which a net on-court rating is half signal. |
| o_adj_rapm_n | integer | Possessions o_adj_rapm is measured over (off_poss). Its rank and percentile are set only when it reaches 610, the WNBA sample at which an offensive on-court rating is half signal. |
| d_adj_rapm_n | integer | Possessions d_adj_rapm is measured over (def_poss). Its rank and percentile are set only when it reaches 1,200, the WNBA sample at which a defensive on-court rating is half signal. |
| adj_rapm_n | integer | Possessions adj_rapm is measured over (off_poss + def_poss). Its rank and percentile are set only when it reaches 1,600, the WNBA sample at which a net on-court rating is half signal. |
| ospm_n | integer | Possessions ospm is measured over (off_poss). Its rank and percentile are set only when it reaches 610, the WNBA sample at which an offensive on-court rating is half signal. |
| dspm_n | integer | Possessions dspm is measured over (def_poss). Its rank and percentile are set only when it reaches 1,200, the WNBA sample at which a defensive on-court rating is half signal. |
| spm_n | integer | Possessions spm is measured over (off_poss + def_poss). Its rank and percentile are set only when it reaches 1,600, the WNBA sample at which a net on-court rating is half signal. |
| obpm_n | integer | Possessions obpm is measured over (off_poss). Its rank and percentile are set only when it reaches 610, the WNBA sample at which an offensive on-court rating is half signal. |
| dbpm_n | integer | Possessions dbpm is measured over (def_poss). Its rank and percentile are set only when it reaches 1,200, the WNBA sample at which a defensive on-court rating is half signal. |
| bpm_n | integer | Possessions bpm is measured over (off_poss + def_poss). Its rank and percentile are set only when it reaches 1,600, the WNBA sample at which a net on-court rating is half signal. |
| war_n | integer | Possessions behind war (off_poss + def_poss). war is a count, not a rate, so its rank has no sample gate. |
| boban_filtered_skill_n | integer | Possessions behind boban_filtered_skill (off_poss + def_poss this season). A multi-season estimate takes the net gate: its rank and percentile are set only when it reaches 1,600. |
| boban_projected_rating_n | integer | Possessions behind boban_projected_rating (off_poss + def_poss this season). A multi-season estimate takes the net gate: its rank and percentile are set only when it reaches 1,600. |
| boban_projected_sd_n | integer | Possessions behind boban_projected_sd (off_poss + def_poss this season). A multi-season estimate takes the net gate: its rank and percentile are set only when it reaches 1,600. |
| o_rapm_rank | numeric | Rank of o_rapm within the season and season type, 1 = best, ties averaged. Null when o_rapm is null, o_rapm_n is under 610, or fewer than 10 players are ranked. |
| d_rapm_rank | numeric | Rank of d_rapm within the season and season type, 1 = best, ties averaged. Null when d_rapm is null, d_rapm_n is under 1,200, or fewer than 10 players are ranked. |
| rapm_rank | numeric | Rank of rapm within the season and season type, 1 = best, ties averaged. Null when rapm is null, rapm_n is under 1,600, or fewer than 10 players are ranked. |
| o_adj_rapm_rank | numeric | Rank of o_adj_rapm within the season and season type, 1 = best, ties averaged. Null when o_adj_rapm is null, o_adj_rapm_n is under 610, or fewer than 10 players are ranked. |
| d_adj_rapm_rank | numeric | Rank of d_adj_rapm within the season and season type, 1 = best, ties averaged. Null when d_adj_rapm is null, d_adj_rapm_n is under 1,200, or fewer than 10 players are ranked. |
| adj_rapm_rank | numeric | Rank of adj_rapm within the season and season type, 1 = best, ties averaged. Null when adj_rapm is null, adj_rapm_n is under 1,600, or fewer than 10 players are ranked. |
| ospm_rank | numeric | Rank of ospm within the season and season type, 1 = best, ties averaged. Null when ospm is null, ospm_n is under 610, or fewer than 10 players are ranked. |
| dspm_rank | numeric | Rank of dspm within the season and season type, 1 = best, ties averaged. Null when dspm is null, dspm_n is under 1,200, or fewer than 10 players are ranked. |
| spm_rank | numeric | Rank of spm within the season and season type, 1 = best, ties averaged. Null when spm is null, spm_n is under 1,600, or fewer than 10 players are ranked. |
| obpm_rank | numeric | Rank of obpm within the season and season type, 1 = best, ties averaged. Null when obpm is null, obpm_n is under 610, or fewer than 10 players are ranked. |
| dbpm_rank | numeric | Rank of dbpm within the season and season type, 1 = best, ties averaged. Null when dbpm is null, dbpm_n is under 1,200, or fewer than 10 players are ranked. |
| bpm_rank | numeric | Rank of bpm within the season and season type, 1 = best, ties averaged. Null when bpm is null, bpm_n is under 1,600, or fewer than 10 players are ranked. |
| war_rank | numeric | Rank of war within the season and season type, 1 = best, ties averaged. Ungated; null when war is null or fewer than 10 players are ranked. |
| boban_filtered_skill_rank | numeric | Rank of boban_filtered_skill within the season and season type, 1 = best, ties averaged. Null when boban_filtered_skill is null, boban_filtered_skill_n is under 1,600, or fewer than 10 players are ranked. |
| boban_projected_rating_rank | numeric | Rank of boban_projected_rating within the season and season type, 1 = best, ties averaged. Null when boban_projected_rating is null, boban_projected_rating_n is under 1,600, or fewer than 10 players are ranked. |
| boban_projected_sd_rank | numeric | Rank of boban_projected_sd within the season and season type, ascending: 1 = the smallest sd (the most certain projection), ties averaged. Null when boban_projected_sd is null, boban_projected_sd_n is under 1,600, or fewer than 10 players are ranked. |
| o_rapm_pct | numeric | Percentile of o_rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| d_rapm_pct | numeric | Percentile of d_rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| rapm_pct | numeric | Percentile of rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| o_adj_rapm_pct | numeric | Percentile of o_adj_rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| d_adj_rapm_pct | numeric | Percentile of d_adj_rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| adj_rapm_pct | numeric | Percentile of adj_rapm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| ospm_pct | numeric | Percentile of ospm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| dspm_pct | numeric | Percentile of dspm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| spm_pct | numeric | Percentile of spm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| obpm_pct | numeric | Percentile of obpm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| dbpm_pct | numeric | Percentile of dbpm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| bpm_pct | numeric | Percentile of bpm_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| war_pct | numeric | Percentile of war_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| boban_filtered_skill_pct | numeric | Percentile of boban_filtered_skill_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| boban_projected_rating_pct | numeric | Percentile of boban_projected_rating_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players; null where the rank is. |
| boban_projected_sd_pct | numeric | Percentile of boban_projected_sd_rank, 100 x (n + 1 - rank) / (n + 1) over the n ranked players: high means a more certain projection. Null where the rank is. |

`load_wbb_player_value()` returns a `wehoop_data` tibble with one row
per player-team-season.

|  |  |  |
|----|----|----|
| col_name | types | description |
| player_id | character | ESPN athlete identifier (the box score's athlete_id, as a string). |
| player | character | Player display name (title-cased). |
| season | integer | Season identifier (4-digit season-ending year). |
| team_id | character | Unique team identifier. |
| min | numeric | Minutes played. |
| box_obpm | numeric | Box-score offensive box plus-minus. |
| box_dbpm | numeric | Box-score defensive box plus-minus. |
| box_bpm | numeric | Box-score net box plus-minus (box_obpm + box_dbpm). |
| qualified | logical | TRUE when min is at least 300, the floor where the spread of box_bpm first sits within 2 |

`load_wbb_ratings()` returns a `wehoop_data` tibble with one row per
team-season.

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | integer | Season identifier (4-digit season-ending year). |
| team_id | character | Unique team identifier. |
| adj_o | numeric | Adjusted offensive efficiency (points per 100 possessions, opponent-adjusted). |
| adj_d | numeric | Adjusted defensive efficiency (points allowed per 100 possessions, opponent-adjusted). |
| adj_em | numeric | Adjusted efficiency margin (adj_o minus adj_d). |
| adj_tempo | numeric | Adjusted possessions per 40 minutes. |
| raw_o | numeric | Unadjusted (raw) offensive efficiency. |
| raw_d | numeric | Unadjusted (raw) defensive efficiency. |
| games | integer | Games played (season total). |
| rank | integer | Rank by adj_em among every team in the file (dense, 1 = best; includes non-Division I opponents). |
| adj_em_z | numeric | Z-score of adj_em relative to the season's team distribution. |
| adj_o_blend | numeric | Adjusted offensive efficiency with the preseason prior blended in: the same fixed point as adj_o, with each Division I team shrunk toward last season's regressed rating as if it had played prior_games extra games at it. A team new to Division I (or with no rated game last season) is shrunk toward the 23rd percentile of last season's Division I adj_em instead. Non-Division I opponents get no prior; their values move only through their Division I opponents. |
| adj_d_blend | numeric | Adjusted defensive efficiency with the preseason prior blended in, on the same basis as adj_o_blend (lower is better). |
| adj_em_blend | numeric | adj_o_blend minus adj_d_blend. A team with g games is rated about g / (g + prior_games) on this season. |
| rank_blend | integer | Rank by adj_em_blend among every team in the file (dense, 1 = best; includes non-Division I opponents). |
| prior_games | numeric | Weight of the preseason prior, in games (3). 0 when the previous season has no ratable games (2009); the blend then equals the unblended rating. |

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(load_wnba_player_impact(seasons = most_recent_wnba_stats_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 329 × 76
#>    player_id player_name        team_id team_abbreviation team_name teams season
#>        <int> <chr>                <int> <chr>             <chr>     <chr>  <int>
#>  1    201886 DeWanna Bonner      1.61e9 PHX               Phoenix … PHX     2026
#>  2    202252 Alysha Clark        1.61e9 DAL               Dallas W… DAL     2026
#>  3    202664 Courtney Vandersl…  1.61e9 CHI               Chicago … CHI     2026
#>  4    203014 Nneka Ogwumike      1.61e9 LAS               Los Ange… LAS     2026
#>  5    203024 Damiris Dantas      1.61e9 IND               Indiana … IND     2026
#>  6    203026 Tiffany Hayes       1.61e9 GSV               Golden S… GSV     2026
#>  7    203398 Brittney Griner     1.61e9 CON               Connecti… CON     2026
#>  8    203400 Skylar Diggins      1.61e9 CHI               Chicago … CHI     2026
#>  9    203405 Kayla Alexander     1.61e9 TOR               Toronto … TOR     2026
#> 10    203822 Rebekah Gardner     1.61e9 NYL               New York… NYL     2026
#> # ℹ 319 more rows
#> # ℹ 69 more variables: season_type <chr>, o_rapm <dbl>, d_rapm <dbl>,
#> #   rapm <dbl>, off_poss <int>, def_poss <int>, o_adj_rapm <dbl>,
#> #   d_adj_rapm <dbl>, adj_rapm <dbl>, ospm <dbl>, dspm <dbl>, spm <dbl>,
#> #   min <dbl>, gp <int>, obpm <dbl>, dbpm <dbl>, bpm <dbl>, war <dbl>,
#> #   boban_filtered_skill <dbl>, boban_projected_rating <dbl>,
#> #   boban_projected_sd <dbl>, o_rapm_n <int>, d_rapm_n <int>, rapm_n <int>, …
# }
# \donttest{
  try(load_wbb_player_value(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 7,053 × 9
#>    player_id player     season team_id   min box_obpm box_dbpm box_bpm qualified
#>    <chr>     <chr>       <int> <chr>   <dbl>    <dbl>    <dbl>   <dbl> <lgl>    
#>  1 5462084   Tessa Gla…   2027 113         5     29.8   -6.15     23.6 FALSE    
#>  2 5313315   Kate Lipa…   2027 219        13     11.2    7.77     19.0 FALSE    
#>  3 5178552   Julianna …   2027 2739        6     14.7    3.70     18.4 FALSE    
#>  4 5466461   Gabby Wri…   2027 499        17     13.7    4.44     18.2 FALSE    
#>  5 5458129   Alyssa Dr…   2027 2239        5     13.8    3.12     17.0 FALSE    
#>  6 5461420   Ava Jones    2027 219        25     15.8    1.08     16.9 FALSE    
#>  7 5317767   Ana Vakan…   2027 589         2     20.2   -3.66     16.6 FALSE    
#>  8 5241042   Olivia Bo…   2027 2489       26     16.4    0.147    16.5 FALSE    
#>  9 5468400   Madison K…   2027 157        17     21.5   -5.08     16.5 FALSE    
#> 10 5240291   Reina Gre…   2027 2599       12     12.9    3.28     16.2 FALSE    
#> # ℹ 7,043 more rows
# }
# \donttest{
  try(load_wbb_ratings(seasons = most_recent_wbb_season()))
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 574 × 16
#>    season team_id adj_o adj_d adj_em adj_tempo raw_o raw_d games  rank adj_em_z
#>     <int> <chr>   <dbl> <dbl>  <dbl>     <dbl> <dbl> <dbl> <int> <int>    <dbl>
#>  1   2027 2579     132.  52.4   80.0      74.7  112.  78.5     7     1     2.46
#>  2   2027 30       138.  61.3   77.2      74.5  127.  77.9     6     2     2.38
#>  3   2027 99       127.  54.4   72.9      82.1  137.  50.2     7     3     2.28
#>  4   2027 251      132.  61.1   70.4      72.2  125.  73.6     6     4     2.21
#>  5   2027 356      132.  65.5   66.4      70.0  136.  63.6     4     5     2.11
#>  6   2027 130      129.  63.6   65.1      75.4  125.  66.6     6     6     2.08
#>  7   2027 120      128.  63.8   63.9      76.7  117.  73.2     6     7     2.05
#>  8   2027 41       122.  59.3   62.8      73.8  103.  82.2     7     8     2.02
#>  9   2027 150      124.  62.2   61.8      72.2  119.  65.7     6     9     1.99
#> 10   2027 2628     126.  64.7   61.4      71.3  132.  63.3     8    10     1.99
#> # ℹ 564 more rows
#> # ℹ 5 more variables: adj_o_blend <dbl>, adj_d_blend <dbl>, adj_em_blend <dbl>,
#> #   rank_blend <int>, prior_games <dbl>
# }
```

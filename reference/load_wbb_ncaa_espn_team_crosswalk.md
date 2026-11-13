# **Load the stats.ncaa.org to ESPN WBB crosswalks**

stats.ncaa.org gives a team a new numeric id every season and spells
school names in AP style; ESPN keeps one id per school. These loaders
read the all-seasons crosswalk tables on the `wbb_crosswalk` release tag
that join the two, so the `load_ncaa_wbb_*()` tables can be matched to
the ESPN-based `load_wbb_*()` tables.

- `load_wbb_ncaa_espn_team_crosswalk()`: one row per season and
  stats.ncaa.org team id (2009-10 onward), with the ESPN team and both
  sources' conference for that season. The same table as
  sportsdataverse-py's `ncaa_espn_team_crosswalk(league = "wbb")`.

- `load_wbb_ncaa_espn_schools()`: one row per NCAA school (org id) with
  its ESPN team.

- `load_wbb_ncaa_espn_school_seasons()`: one row per school, sport and
  season with that season's stats.ncaa.org team id. It covers both
  sports (`sport` is `mbb` or `wbb`), since an org id is shared by every
  team of a school.

The ESPN ids (`espn_team_id`, `espn_conference_id`) are returned as
integer, matching the ESPN loaders; `ncaa_team_id` and `ncaa_org_id` are
integer, as in
[`load_ncaa_wbb_team_ids()`](https://wehoop.sportsdataverse.org/reference/load_ncaa_wbb_lineups.md).
`season` is the `"YYYY-YY"` string the release uses.

## Usage

``` r
load_wbb_ncaa_espn_team_crosswalk()

load_wbb_ncaa_espn_schools()

load_wbb_ncaa_espn_school_seasons()
```

## Source

<https://github.com/sportsdataverse/sportsdataverse-data/releases/tag/wbb_crosswalk>

## Value

`load_wbb_ncaa_espn_team_crosswalk()` returns a `wehoop_data` tibble:

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | character | Season, `"YYYY-YY"` (e.g. `"2024-25"`). |
| ncaa_team_id | integer | stats.ncaa.org team id for that season. |
| ncaa_org_id | integer | stats.ncaa.org school (org) id, stable across seasons. |
| ncaa_team | character | stats.ncaa.org school name. |
| ncaa_conference | character | stats.ncaa.org conference that season. |
| conference_id | character | SportsDataverse group id (e.g. `wbb:big-ten`). |
| espn_team_id | integer | ESPN team id. |
| espn_display_name | character | ESPN team display name. |
| espn_location | character | ESPN team location. |
| espn_mascot | character | ESPN team mascot. |
| espn_abbreviation | character | ESPN team abbreviation. |
| espn_conference_name | character | ESPN conference name that season. |
| espn_conference_id | integer | ESPN conference (group) id that season. |
| match_method | character | How the team was matched: `exact`, `dict`, `alias`, `org` or `unmatched`. |

`load_wbb_ncaa_espn_schools()` returns `ncaa_org_id`, `ncaa_team`,
`espn_team_id` and `espn_display_name`.
`load_wbb_ncaa_espn_school_seasons()` returns `ncaa_org_id`, `sport`,
`season`, `ncaa_team_id` and `espn_team_id`.

## See also

Other WBB Crosswalk Functions:
[`load_wnba_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_crosswalk.md),
[`wbb_player_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_player_crosswalk.md),
[`wbb_schedule_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_schedule_crosswalk.md),
[`wbb_team_crosswalk()`](https://wehoop.sportsdataverse.org/reference/wbb_team_crosswalk.md)

## Examples

``` r
# \donttest{
  try(load_wbb_ncaa_espn_team_crosswalk())
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 6,335 × 14
#>    season  ncaa_team_id ncaa_org_id ncaa_team      ncaa_conference conference_id
#>    <chr>          <int>       <int> <chr>          <chr>           <chr>        
#>  1 2009-10        52488       26172 A&M-Corpus Ch… Southland       wbb:southland
#>  2 2009-10        52439         721 Air Force      Mountain West   wbb:mountain…
#>  3 2009-10        52147           5 Akron          MAC             wbb:mac      
#>  4 2009-10        52150           8 Alabama        SEC             wbb:sec      
#>  5 2009-10        52148           6 Alabama A&M    SWAC            wbb:swac     
#>  6 2009-10        52149           7 Alabama St.    SWAC            wbb:swac     
#>  7 2009-10        52152          14 Albany (NY)    America East    wbb:america-…
#>  8 2009-10        52153          17 Alcorn         SWAC            wbb:swac     
#>  9 2009-10        52154          23 American       Patriot         wbb:patriot  
#> 10 2009-10        52155          27 App State      SoCon           wbb:socon    
#> # ℹ 6,325 more rows
#> # ℹ 8 more variables: espn_team_id <int>, espn_display_name <chr>,
#> #   espn_location <chr>, espn_mascot <chr>, espn_abbreviation <chr>,
#> #   espn_conference_name <chr>, espn_conference_id <int>, match_method <chr>
  try(load_wbb_ncaa_espn_schools())
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 371 × 4
#>    ncaa_org_id ncaa_team         espn_team_id espn_display_name         
#>          <int> <chr>                    <int> <chr>                     
#>  1           2 Abilene Christian         2000 Abilene Christian Wildcats
#>  2           5 Akron                     2006 Akron Zips                
#>  3           6 Alabama A&M               2010 Alabama A&M Bulldogs      
#>  4           7 Alabama St.               2011 Alabama State Hornets     
#>  5           8 Alabama                    333 Alabama Crimson Tide      
#>  6           9 UAB                          5 UAB Blazers               
#>  7          14 UAlbany                    399 UAlbany Great Danes       
#>  8          17 Alcorn                    2016 Alcorn State Braves       
#>  9          23 American                    44 American University Eagles
#> 10          27 App State                 2026 App State Mountaineers    
#> # ℹ 361 more rows
  try(load_wbb_ncaa_espn_school_seasons())
#> ──────────────────────────────────────────────────────────────── wehoop 3.1.0 ──
#> # A tibble: 12,706 × 5
#>    ncaa_org_id sport season  ncaa_team_id espn_team_id
#>          <int> <chr> <chr>          <int>        <int>
#>  1           2 mbb   2013-14       102423         2000
#>  2           2 mbb   2014-15        83943         2000
#>  3           2 mbb   2015-16        21731         2000
#>  4           2 mbb   2016-17        42376         2000
#>  5           2 mbb   2017-18       110938         2000
#>  6           2 mbb   2018-19       450462         2000
#>  7           2 mbb   2019-20       486751         2000
#>  8           2 mbb   2020-21       505571         2000
#>  9           2 mbb   2021-22       527486         2000
#> 10           2 mbb   2022-23       541987         2000
#> # ℹ 12,696 more rows
# }
```

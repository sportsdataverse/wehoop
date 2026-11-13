# Get ESPN women's college basketball team names and ids

Get ESPN women's college basketball team names and ids

## Usage

``` r
espn_wbb_teams(year = most_recent_wbb_season())
```

## Arguments

- year:

  Either numeric or character (YYYY)

## Value

Returns a teams information data frame

|  |  |  |
|----|----|----|
| col_name | types | description |
| team_id | integer | Unique team identifier. |
| abbreviation | character | Short abbreviation. |
| display_name | character | Display name. |
| short_name | character | Short display name. |
| mascot | character | Team mascot. |
| nickname | character | Team or athlete nickname. |
| team | character | Team-side label or team identifier. |
| color | character | Primary color (hex without leading '#'). |
| alternate_color | character | Alternate color (hex without leading '#'). |
| logo | character | Team or league logo URL. |
| logo_dark | character | Logo dark. |
| href | character | Link / page URL. |
| conference_url | character | URL for conference. |
| group_id | integer | Group identifier (e.g. conference group_id). |
| conference_short_name | character | Conference short name (e.g. 'ACC'). |
| conference_uid | character | ESPN universal conference identifier. |
| conference_name | character | Full conference name. |
| conference_logo | character | Logo image URL for conference. |
| parent_group_id | integer | Unique identifier for parent group. |
| conference_id | integer | Conference identifier. |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  # The conferences espn_wbb_teams() joins each team to:
  try(espn_wbb_conferences())
#> ── ESPN WBB Conferences Information from ESPN.com ────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:20 UTC
#> # A tibble: 32 × 7
#>    group_id conference_name conference_short_name conference_uid conference_logo
#>       <int> <chr>           <chr>                 <chr>          <chr>          
#>  1        3 Atlantic 10 Co… A-10                  s:40~l:54~g:3  https://a.espn…
#>  2        2 Atlantic Coast… ACC                   s:40~l:54~g:2  https://a.espn…
#>  3        1 America East C… Am. East              s:40~l:54~g:1  https://a.espn…
#>  4       62 American Confe… American              s:40~l:54~g:62 NA             
#>  5       46 Atlantic Sun C… Atlantic Sun          s:40~l:54~g:46 https://a.espn…
#>  6        8 Big 12 Confere… Big 12                s:40~l:54~g:8  https://a.espn…
#>  7        4 Big East Confe… Big East              s:40~l:54~g:4  https://a.espn…
#>  8        5 Big Sky Confer… Big Sky               s:40~l:54~g:5  https://a.espn…
#>  9        6 Big South Conf… Big South             s:40~l:54~g:6  https://a.espn…
#> 10        7 Big Ten Confer… Big Ten               s:40~l:54~g:7  https://a.espn…
#> # ℹ 22 more rows
#> # ℹ 2 more variables: parent_group_id <int>, conference_id <int>
# }
# \donttest{
  # Interactive only: it makes one request per conference (about 30), 7 to 20 s.
  try(espn_wbb_teams())
#> ── ESPN WBB Teams Information from ESPN.com ──────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 13:57:22 UTC
#> # A tibble: 363 × 32
#>    abbreviation alternate_color color display_name team_id team  logo  logo_dark
#>    <chr>        <chr>           <chr> <chr>          <int> <chr> <chr> <chr>    
#>  1 ACU          b1b3b3          592d… Abilene Chr…    2000 Abil… http… https://…
#>  2 AF           ffffff          0035… Air Force F…    2005 Air … http… https://…
#>  3 AKR          c5b783          041e… Akron Zips      2006 Akron http… https://…
#>  4 AAMU         ffffff          7900… Alabama A&M…    2010 Alab… http… https://…
#>  5 ALA          ffffff          9e1b… Alabama Cri…     333 Alab… http… https://…
#>  6 ALST         0a0a0a          e9a9… Alabama Sta…    2011 Alab… http… https://…
#>  7 ALCN         46166a          4b00… Alcorn Stat…    2016 Alco… http… https://…
#>  8 AMER         c8102e          c411… American Un…      44 Amer… http… https://…
#>  9 APP          ffcd00          0000… App State M…    2026 App … http… https://…
#> 10 ASU          8c1d40          ffc6… Arizona Sta…       9 Ariz… http… https://…
#> # ℹ 353 more rows
#> # ℹ 24 more variables: logos_href_3 <chr>, logos_href_4 <chr>,
#> #   logos_href_5 <chr>, logos_href_6 <chr>, logos_href_7 <chr>,
#> #   logos_href_8 <chr>, logos_href_9 <chr>, logos_href_10 <chr>,
#> #   logos_href_11 <chr>, logos_href_12 <chr>, logos_href_13 <chr>,
#> #   logos_href_14 <chr>, mascot <chr>, nickname <chr>, short_name <chr>,
#> #   href <chr>, conference_url <chr>, group_id <int>, conference_name <chr>, …
# }
```

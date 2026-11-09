# Get women's college basketball conferences

Get women's college basketball conferences

## Usage

``` r
espn_wbb_conferences()
```

## Value

Returns a tibble

Columns as documented in the shared
[espn_basketball_conferences_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_conferences_schema.md)
table.

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  try(espn_wbb_conferences())
#> ── ESPN WBB Conferences Information from ESPN.com ────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 23:08:45 UTC
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
```

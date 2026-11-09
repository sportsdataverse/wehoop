# **Get ESPN WBB News**

**Get ESPN WBB News**

**Get ESPN Women's College Basketball News**

## Usage

``` r
espn_wbb_news(limit = 50)
```

## Arguments

- limit:

  integer. Maximum number of articles to return. Default `50`.

## Value

Returns a tibble of news articles.

Columns as documented in the shared
[espn_basketball_news_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_news_schema.md)
table.

## Details

Retrieve ESPN women's college basketball news. Uses
`getOption("wehoop.proxy")` or `http_proxy`/`https_proxy` environment
variables for proxy configuration (per-call proxy override is not
supported for ESPN wrappers).

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_news(limit = 5)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL News from ESPN.com ─────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-09 11:36:47 UTC
#> # A tibble: 5 × 8
#>         id type  headline       description published premium link_web league_id
#>      <int> <chr> <chr>          <chr>       <chr>     <lgl>   <chr>    <chr>    
#> 1 50429917 Media Maryland Terr… Watch the … 2026-11-… FALSE   https:/… 54       
#> 2 50428995 Media Utah State Ag… Utah State… 2026-11-… FALSE   https:/… 54       
#> 3 50428964 Recap JuJu Watkins … — JuJu Wat… 2026-11-… FALSE   http://… 54       
#> 4 50428512 Media East Texas A&… East Texas… 2026-11-… FALSE   https:/… 54       
#> 5 50427868 Media James Madison… James Madi… 2026-11-… FALSE   https:/… 54       
# }
```

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
#> ℹ Data updated: 2026-11-25 04:39:28 UTC
#> # A tibble: 5 × 9
#>        id type  headline description published premium byline link_web league_id
#>     <int> <chr> <chr>    <chr>       <chr>     <lgl>   <chr>  <chr>    <chr>    
#> 1  5.06e7 Media Carroll… Carroll (M… 2026-11-… FALSE   NA     https:/… 54       
#> 2  5.06e7 Media Whittie… Whittier P… 2026-11-… FALSE   NA     https:/… 54       
#> 3  5.05e7 Story Tuesday… The top no… 2026-11-… FALSE   Charl… https:/… 54       
#> 4  5.06e7 Media Whitwor… Whitworth … 2026-11-… FALSE   NA     https:/… 54       
#> 5  5.06e7 Head… S. Caro… Tessa John… 2026-11-… FALSE   NA     https:/… 54       
# }
```

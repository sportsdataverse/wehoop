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
#> ℹ Data updated: 2026-11-13 11:56:19 UTC
#> # A tibble: 5 × 8
#>         id type  headline       description published premium link_web league_id
#>      <int> <chr> <chr>          <chr>       <chr>     <lgl>   <chr>    <chr>    
#> 1 50469096 Recap Addy Brown, S… — Addy Bro… 2026-11-… FALSE   http://… 54       
#> 2 50469068 Media Arizona Wildc… Arizona Wi… 2026-11-… FALSE   https:/… 54       
#> 3 50468843 Recap No. 16 Washin… — Avery Ho… 2026-11-… FALSE   http://… 54       
#> 4 50468617 Media Arkansas-Pine… Arkansas-P… 2026-11-… FALSE   https:/… 54       
#> 5 50468236 Media Jianna Morris… Morris des… 2026-11-… FALSE   https:/… 54       
# }
```

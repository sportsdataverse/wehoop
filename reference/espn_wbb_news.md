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
#> ℹ Data updated: 2026-11-26 19:19:35 UTC
#> # A tibble: 5 × 9
#>        id type  headline description published premium byline link_web league_id
#>     <int> <chr> <chr>    <chr>       <chr>     <lgl>   <chr>  <chr>    <chr>    
#> 1  5.06e7 Story Friday … A Seton Ha… 2026-11-… FALSE   Brian… https:/… 28       
#> 2  5.06e7 Media Ace Aus… After reco… 2026-11-… FALSE   NA     https:/… 54       
#> 3  5.06e7 Recap Clark s… — Jayda Cl… 2026-11-… FALSE   NA     http://… 54       
#> 4  5.06e7 Media SE Loui… SE Louisia… 2026-11-… FALSE   NA     https:/… 54       
#> 5  5.06e7 Media Saint L… Saint Loui… 2026-11-… FALSE   NA     https:/… 54       
# }
```

# **Get ESPN WNBA News**

**Get ESPN WNBA News**

**Get ESPN WNBA News**

## Usage

``` r
espn_wnba_news(limit = 50)
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

Retrieve ESPN WNBA news. Uses `getOption("wehoop.proxy")` or
`http_proxy`/`https_proxy` environment variables for proxy configuration
(per-call proxy override is not supported for ESPN wrappers).

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_news(limit = 5)
#> ── ESPN WNBA News from ESPN.com ──────────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-21 11:28:29 UTC
#> # A tibble: 5 × 9
#>        id type  headline description published premium byline link_web league_id
#>     <int> <chr> <chr>    <chr>       <chr>     <lgl>   <chr>  <chr>    <chr>    
#> 1  2.96e7 Story Tom Bra… "The legen… 2026-11-… FALSE   ESPN   https:/… 59       
#> 2  5.05e7 Story Revisit… "\"Grand T… 2026-11-… FALSE   ESPN … https:/… 46       
#> 3  5.05e7 Head… Sources… "The Fever… 2026-11-… FALSE   Alexa… https:/… 59       
#> 4  5.05e7 Story 2027 WN… "Toronto e… 2026-11-… FALSE   Micha… https:/… 59       
#> 5  5.05e7 Media Ogwumik… "Ogwumike … 2026-11-… FALSE   NA     https:/… 59       
# }
```

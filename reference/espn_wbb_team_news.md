# **Get ESPN WBB Team News**

**Get ESPN WBB Team News**

**Get ESPN Women's College Basketball Team News**

## Usage

``` r
espn_wbb_team_news(team_id, limit = 25)
```

## Arguments

- team_id:

  character or integer. ESPN team ID (e.g. `2509` for UConn).

- limit:

  integer. Maximum number of articles to return. Default `25`.

## Value

Returns a tibble of team news articles.

Columns as documented in the shared
[espn_basketball_news_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_news_schema.md)
table.

## Details

Retrieve ESPN women's college basketball news for a specific team. Uses
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
  espn_wbb_team_news(team_id = "2509", limit = 5)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Team News (team_id=2509) from ESPN.com ───────
#> ℹ Data updated: 2026-11-25 06:09:38 UTC
#> # A tibble: 4 × 8
#>         id type        headline description published premium link_web league_id
#>      <int> <chr>       <chr>    <chr>       <chr>     <lgl>   <chr>    <chr>    
#> 1 50554327 Media       Purdue … "Purdue Bo… 2026-11-… FALSE   https:/… 54       
#> 2 50532516 Media       Purdue … "Purdue Bo… 2026-11-… FALSE   https:/… 54       
#> 3 50377073 Preview     Purdue … "Eastern M… 2026-11-… FALSE   http://… 54       
#> 4 49554744 HeadlineNe… New Pur… "New Purdu… 2026-08-… FALSE   https:/… 23       
# }
```

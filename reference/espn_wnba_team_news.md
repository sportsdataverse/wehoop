# **Get ESPN WNBA Team News**

**Get ESPN WNBA Team News**

**Get ESPN WNBA Team News**

## Usage

``` r
espn_wnba_team_news(team_id, limit = 25)
```

## Arguments

- team_id:

  character or integer. ESPN team ID (e.g. `17` for Las Vegas Aces).

- limit:

  integer. Maximum number of articles to return. Default `25`.

## Value

Returns a tibble of team news articles.

Columns as documented in the shared
[espn_basketball_news_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_news_schema.md)
table.

## Details

Retrieve ESPN WNBA news for a specific team. Uses
`getOption("wehoop.proxy")` or `http_proxy`/`https_proxy` environment
variables for proxy configuration (per-call proxy override is not
supported for ESPN wrappers).

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_team_news(team_id = "17", limit = 5)
#> ── ESPN WNBA Team News (team_id=17) from ESPN.com ────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 19:05:54 UTC
#> # A tibble: 5 × 9
#>        id type  headline description published premium byline link_web league_id
#>     <int> <chr> <chr>    <chr>       <chr>     <lgl>   <chr>  <chr>    <chr>    
#> 1  5.05e7 Story JuJu Wa… JuJu Watki… 2026-11-… FALSE   Micha… https:/… 59       
#> 2  5.04e7 Story 2027 WN… An early l… 2026-11-… FALSE   Doug … https:/… 22000    
#> 3  5.04e7 Story The 10 … WNBA Art, … 2026-11-… FALSE   Kate … https:/… 59       
#> 4  5.04e7 Head… Valkyri… The defend… 2026-11-… FALSE   Doug … https:/… 59       
#> 5  5.04e7 Story Where d… Las Vegas'… 2026-11-… FALSE   Micha… https:/… 59       
# }
```

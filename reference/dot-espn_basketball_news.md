# Internal helper – ESPN basketball league news

Fetches the top-level news feed for an ESPN basketball league and
returns a tidy tibble of articles. This is the single implementation
shared by
[`espn_wbb_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_news.md)
(league = "womens-college-basketball") and
[`espn_wnba_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_news.md)
(league = "wnba").

## Usage

``` r
.espn_basketball_news(league, limit = 50, ...)
```

## Arguments

- league:

  character. One of `"wnba"` or `"womens-college-basketball"`.

- limit:

  integer. Maximum number of articles to return (default `50`).

- ...:

  Currently unused; reserved for future pass-through arguments.

## Value

A `wehoop_data` tibble of articles, or `NULL` on error.

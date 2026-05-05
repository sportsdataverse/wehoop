# Internal helper – ESPN basketball team news

Fetches the news feed for a specific team in an ESPN basketball league
and returns a tidy tibble of articles. This is the single implementation
shared by
[`espn_wbb_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_team_news.md)
and
[`espn_wnba_team_news()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_team_news.md).

## Usage

``` r
.espn_basketball_team_news(league, team_id, limit = 25, ...)
```

## Arguments

- league:

  character. One of `"wnba"` or `"womens-college-basketball"`.

- team_id:

  character or integer. ESPN team ID.

- limit:

  integer. Maximum number of articles to return (default `25`).

- ...:

  Currently unused; reserved for future pass-through arguments.

## Value

A `wehoop_data` tibble of articles, or `NULL` on error.

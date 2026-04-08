# **Retry http request with proxy**

This is a thin wrapper on httr::RETRY

## Usage

``` r
request_with_proxy(
  url,
  params = list(),
  origin = "https://stats.wnba.com",
  referer = "https://www.wnba.com/",
  ...
)
```

## Arguments

- url:

  Request url

- params:

  list of params

- origin:

  Origin url

- referer:

  Referer url

- ...:

  passed to httr::RETRY

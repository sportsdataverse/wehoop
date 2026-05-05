# **Retry http request with optional proxy**

This is a thin wrapper on
[`httr2::req_retry()`](https://httr2.r-lib.org/reference/req_retry.html)
via the internal
[`.retry_request()`](https://wehoop.sportsdataverse.org/reference/dot-retry_request.md)
helper. It applies the WNBA Stats API headers (origin, referer,
x-nba-stats-\* tokens) and decodes the JSON response.

## Usage

``` r
request_with_proxy(
  url,
  params = list(),
  origin = "https://stats.wnba.com",
  referer = "https://www.wnba.com/",
  proxy = NULL,
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

- proxy:

  Optional proxy config. `NULL` (default) lets libcurl honor the
  standard `http_proxy` / `https_proxy` / `no_proxy` environment
  variables. A single URL string (e.g. `"http://host:port"`) is
  forwarded to `httr2::req_proxy(url = proxy)`. A named list is spread
  as keyword args into
  [`httr2::req_proxy()`](https://httr2.r-lib.org/reference/req_proxy.html)
  (`url`, `port`, `username`, `password`, `auth`) for full control over
  authenticated proxies.

- ...:

  currently unused (preserved for backwards compatibility).

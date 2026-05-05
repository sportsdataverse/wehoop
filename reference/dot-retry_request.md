# Retry an HTTP request with httr2

Internal helper used by
[`request_with_proxy()`](https://wehoop.sportsdataverse.org/reference/request_with_proxy.md)
and other wrappers that previously called
[`httr::RETRY()`](https://httr.r-lib.org/reference/RETRY.html). Wraps
`httr2` request building, header / query injection, timeout, and retry
policy in a single call.

## Usage

``` r
.retry_request(
  url,
  params = list(),
  headers = NULL,
  timeout = 60,
  proxy = NULL
)
```

## Arguments

- url:

  Base request URL.

- params:

  Optional named list of query parameters.

- headers:

  Optional named character vector of HTTP headers.

- timeout:

  Request timeout in seconds.

## Value

An `httr2_response` object.

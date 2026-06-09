# Internal: GET an authenticated Her Hoop Stats page and parse it

Internal: GET an authenticated Her Hoop Stats page and parse it

## Usage

``` r
.hhs_doc(path, jar)
```

## Arguments

- path:

  Page path (beginning with `/`) or full URL.

- jar:

  A session cookie jar from
  [`.hhs_login()`](https://wehoop.sportsdataverse.org/reference/dot-hhs_login.md).

## Value

An `xml_document`.

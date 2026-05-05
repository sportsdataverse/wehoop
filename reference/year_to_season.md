# **Convert a calendar year to a WNBA / NBA season string**

Returns a season string of the form `YYYY-YY` (e.g.
`2024 -> "2024-25"`). WNBA seasons span a single calendar year, but
several Stats API endpoints (and several NBA-derived endpoints used in
load helpers) accept the two-year season-string form, so this helper is
provided for parity with the analogous helper in the `hoopR` package.

## Usage

``` r
year_to_season(year)
```

## Arguments

- year:

  a four-digit calendar year (numeric or character).

## Value

A character season string, e.g. `"2024-25"`.

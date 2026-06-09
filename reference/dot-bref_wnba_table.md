# Internal: parse a Basketball-Reference WNBA table by id using data-stat keys

Un-comments the page (so comment-hidden tables are reachable), selects
the table by `id`, drops mid-table header-repeat rows, and builds a
data.frame whose columns are the cells' `data-stat` attributes.

## Usage

``` r
.bref_wnba_table(html, table_id = NULL)
```

## Arguments

- html:

  Raw page HTML (character).

- table_id:

  Table `id` (e.g. `"per_game"`); `NULL` = first table.

## Value

A data.frame (character columns), or an empty data.frame if not found.

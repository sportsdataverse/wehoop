# **Get ESPN WNBA Franchise Detail**

Returns franchise-level metadata for a WNBA franchise. Franchise IDs are
stable across relocations and rebrands.

## Usage

``` r
espn_wnba_franchise(franchise_id, ...)
```

## Arguments

- franchise_id:

  ESPN franchise identifier (character or numeric).

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

|                    |           |                                           |
|--------------------|-----------|-------------------------------------------|
| col_name           | types     | description                               |
| id                 | character | ESPN franchise identifier.                |
| uid                | character | ESPN UID string.                          |
| slug               | character | URL-safe identifier.                      |
| location           | character | Franchise location.                       |
| name               | character | Franchise name.                           |
| nickname           | character | Common nickname.                          |
| abbreviation       | character | Short abbreviation.                       |
| display_name       | character | Full display name.                        |
| short_display_name | character | Short display name.                       |
| color              | character | Primary color (hex, no leading '#').      |
| is_active          | logical   | Whether franchise is currently active.    |
| league             | character | League slug (`"wnba"`).                   |
| logo               | character | Primary logo URL.                         |
| logo_dark          | character | Dark-mode logo URL.                       |
| venue_ref          | character | `$ref` to franchise's primary venue.      |
| team_ref           | character | `$ref` to the current team for franchise. |

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_franchise(franchise_id = 17)
#> ── ESPN WNBA Franchise from ESPN.com ─────────────────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 19:05:34 UTC
#> # A tibble: 1 × 16
#>   id    uid            slug    location name  nickname abbreviation display_name
#>   <chr> <chr>          <chr>   <chr>    <chr> <lgl>    <chr>        <chr>       
#> 1 17    s:40~l:59~f:17 las-ve… Las Veg… Aces  NA       LV           Las Vegas A…
#> # ℹ 8 more variables: short_display_name <chr>, color <chr>, is_active <lgl>,
#> #   league <chr>, logo <chr>, logo_dark <chr>, venue_ref <chr>, team_ref <chr>
# }
```

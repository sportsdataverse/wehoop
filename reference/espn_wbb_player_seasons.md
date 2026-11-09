# **Get ESPN WBB Athlete Career Seasons**

Returns the list of seasons an WBB athlete appeared in. Useful for
bounding follow-up calls to per-season endpoints.

## Usage

``` r
espn_wbb_player_seasons(athlete_id, ...)
```

## Arguments

- athlete_id:

  ESPN athlete identifier (character or numeric).

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per career season.

|            |           |                                  |
|------------|-----------|----------------------------------|
| col_name   | types     | description                      |
| league     | character | League slug.                     |
| athlete_id | character | ESPN athlete id.                 |
| season     | integer   | Season year.                     |
| ref        | character | `$ref` URL to the season detail. |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  # LeBron James (1966): 23 career seasons
  espn_wbb_player_seasons(athlete_id = 4433404)
#> ✖ 2026-11-09 21:09:45.163306: Failed to retrieve ESPN womens-college-basketball athlete seasons for athlete_id=4433404
#> ✖ Args: league = "womens-college-basketball", athlete_id = 4433404
#> ✖ Error: The API returned an error
#> NULL
# }
```

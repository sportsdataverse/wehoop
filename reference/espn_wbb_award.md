# **Get ESPN WBB Season Award Detail**

Returns the name, description, and winners of one WBB season award.

## Usage

``` r
espn_wbb_award(award_id, season = most_recent_wbb_season(), ...)
```

## Arguments

- award_id:

  ESPN award identifier (character or numeric).

- season:

  Season year (numeric). Defaults to the most recent WBB season.

- ...:

  Additional arguments; currently unused.

## Value

A tibble with one row per winner.

|             |           |                                                 |
|-------------|-----------|-------------------------------------------------|
| col_name    | types     | description                                     |
| league      | character | League slug.                                    |
| season      | integer   | Season year.                                    |
| award_id    | character | ESPN award identifier.                          |
| name        | character | Award name.                                     |
| description | character | Award description.                              |
| athlete_id  | character | ESPN athlete id of winner.                      |
| team_id     | character | ESPN team id.                                   |
| athlete_ref | character | `$ref` to winner's per-season athlete resource. |
| team_ref    | character | `$ref` to winner's per-season team resource.    |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_award(award_id = 344, season = 2024)
#> ✖ 2026-11-13 23:21:23.344471: Failed to retrieve ESPN womens-college-basketball award 344 for season=2024
#> ✖ Args: league = "womens-college-basketball", season = 2024, award_id = 344
#> ✖ Error: The API returned an error
#> data frame with 0 columns and 0 rows
# }
```

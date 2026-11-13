# **Get ESPN WNBA Draft Athlete Detail (Single Drafted Player)**

Returns rich single-row detail for one drafted athlete in one NBA draft
year: name, height, weight, position, pick (overall/round/team), and a
`$ref` to the athlete's core-v2 profile. Use
[`espn_wnba_draft_athletes()`](https://wehoop.sportsdataverse.org/reference/espn_wnba_draft_athletes.md)
to enumerate draftees for a year.

## Usage

``` r
espn_wnba_draft_athlete_detail(
  season = most_recent_wnba_season(),
  athlete_id,
  ...
)
```

## Arguments

- season:

  Draft year (numeric). Defaults to the most recent NBA season.

- athlete_id:

  ESPN draftee identifier.

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

## See also

[family_espn_wnba](https://wehoop.sportsdataverse.org/reference/family_espn_wnba.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wnba_draft_athlete_detail(season = 2024, athlete_id = 3149391)
#> ✖ 2026-11-13 14:50:12.399846: Failed to retrieve ESPN wnba draft athlete detail for season=2024, athlete_id=3149391
#> ✖ Args: league = "wnba", season = 2024, athlete_id = 3149391
#> ✖ Error: The API returned an error
#> NULL
# }
```

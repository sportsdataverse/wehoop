# **Get ESPN Women's College Basketball Athlete Info**

**Get ESPN Women's College Basketball Athlete Info**

**Get ESPN Women's College Basketball Athlete Info**

## Usage

``` r
espn_wbb_player_info(athlete_id, ...)
```

## Arguments

- athlete_id:

  ESPN athlete identifier (character or numeric).

- ...:

  Additional arguments; currently unused but retained for forward
  compatibility. Proxy configuration should use
  `options(wehoop.proxy = ...)` – see
  [`?wehoop`](https://wehoop.sportsdataverse.org/reference/wehoop-package.md)
  for details.

## Value

A named list of data frames: `Bio`, `Team`, `Position`, `Status`,
`College`, `Draft`.

**Bio**

Columns as documented in the shared
[espn_basketball_player_info_bio_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_player_info_bio_schema.md)
table.

**Team**

|              |           |                                   |
|--------------|-----------|-----------------------------------|
| col_name     | types     | description                       |
| id           | character | Unique play identification number |
| abbreviation | character | Short abbreviation.               |
| display_name | character | Display name.                     |

**Position**

|              |           |                                   |
|--------------|-----------|-----------------------------------|
| col_name     | types     | description                       |
| id           | character | Unique play identification number |
| name         | character | Display name.                     |
| abbreviation | character | Short abbreviation.               |

**Status**

|          |           |                                   |
|----------|-----------|-----------------------------------|
| col_name | types     | description                       |
| id       | character | Unique play identification number |
| name     | character | Display name.                     |
| type     | character | Record type / category.           |

**College**

|          |           |                                   |
|----------|-----------|-----------------------------------|
| col_name | types     | description                       |
| id       | character | Unique play identification number |
| name     | character | Display name.                     |
| mascot   | character | Team mascot.                      |

**Draft**

|           |           |                             |
|-----------|-----------|-----------------------------|
| col_name  | types     | description                 |
| year      | character | 4-digit year.               |
| round     | character | Tournament / playoff round. |
| selection | character | Selection.                  |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_player_info(athlete_id = "4433404")
#> $Bio
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Bio from ESPN.com ──── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 18:16:14 UTC
#> # A tibble: 1 × 20
#>   id      uid       guid  first_name last_name full_name display_name short_name
#>   <chr>   <chr>     <chr> <chr>      <chr>     <chr>     <chr>        <chr>     
#> 1 4433404 s:40~l:5… a476… Cameron    Brink     Cameron … Cameron Bri… C. Brink  
#> # ℹ 12 more variables: weight <dbl>, display_weight <chr>, height <dbl>,
#> #   display_height <chr>, age <int>, date_of_birth <chr>, jersey <chr>,
#> #   active <lgl>, headshot_href <chr>, birth_city <chr>, birth_state <chr>,
#> #   birth_country <chr>
#> 
#> $Team
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Team from ESPN.com ─── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 18:16:14 UTC
#> # A tibble: 1 × 1
#>   x_ref                                                                         
#>   <chr>                                                                         
#> 1 http://sports.core.api.espn.com/v2/sports/basketball/leagues/womens-college-b…
#> 
#> $Position
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Position from ESPN.com ───────────────
#> ℹ Data updated: 2026-11-13 18:16:14 UTC
#> # A tibble: 1 × 5
#>   id    name    display_name abbreviation leaf 
#>   <chr> <chr>   <chr>        <chr>        <lgl>
#> 1 2     Forward Forward      F            FALSE
#> 
#> $Status
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Status from ESPN.com ─────────────────
#> ℹ Data updated: 2026-11-13 18:16:14 UTC
#> # A tibble: 1 × 4
#>   id    name     type     abbreviation
#>   <chr> <chr>    <chr>    <chr>       
#> 1 2     Inactive inactive Inactive    
#> 
#> $College
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete College from ESPN.com ────────────────
#> ℹ Data updated: 2026-11-13 18:16:14 UTC
#> # A tibble: 1 × 1
#>   x_ref                                                           
#>   <chr>                                                           
#> 1 http://sports.core.api.espn.com/v2/colleges/24?lang=en&region=us
#> 
#> $Draft
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Athlete Draft from ESPN.com ── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 18:16:14 UTC
#> # A tibble: 0 × 0
#> 
# }
```

# **Get ESPN WBB Single-Coach Detail**

Returns biography, current team / college refs, and counts of career
record entries + per-season coaching entries for one WBB head coach.

## Usage

``` r
espn_wbb_coach(coach_id, ...)
```

## Arguments

- coach_id:

  ESPN coach identifier (character or numeric).

- ...:

  Additional arguments; currently unused.

## Value

A single-row tibble.

|                  |           |                                     |
|------------------|-----------|-------------------------------------|
| col_name         | types     | description                         |
| coach_id         | character | ESPN coach identifier.              |
| uid              | character | ESPN UID string.                    |
| first_name       | character | First name.                         |
| last_name        | character | Last name.                          |
| date_of_birth    | character | Date of birth (ISO 8601).           |
| birth_city       | character | Birth city.                         |
| birth_state      | character | Birth state / region.               |
| n_career_records | integer   | Count of career-records entries.    |
| n_coach_seasons  | integer   | Count of seasons coached.           |
| college_ref      | character | `$ref` to the coach's college.      |
| team_ref         | character | `$ref` to the coach's current team. |
| league           | character | League slug.                        |

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_coach(coach_id = 2167842)
#> ── ESPN WOMENS-COLLEGE-BASKETBALL Coach Detail ───────────────── wehoop 3.1.0 ──
#> ℹ Data updated: 2026-11-13 23:21:25 UTC
#> # A tibble: 1 × 12
#>   coach_id uid         first_name last_name date_of_birth birth_city birth_state
#>   <chr>    <chr>       <chr>      <chr>     <chr>         <chr>      <chr>      
#> 1 2167842  s:40~l:54~… Larry      Vickers   NA            Virginia … VA         
#> # ℹ 5 more variables: n_career_records <int>, n_coach_seasons <int>,
#> #   college_ref <chr>, team_ref <chr>, league <chr>
# }
```

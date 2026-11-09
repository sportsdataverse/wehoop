# **Get ESPN Women's College Basketball Team Injuries**

**Get ESPN Women's College Basketball Team Injuries**

**Get ESPN Women's College Basketball Team Injuries**

## Usage

``` r
espn_wbb_team_injuries(team_id, ...)
```

## Arguments

- team_id:

  ESPN team identifier (character or numeric; passed as-is). Use
  [`espn_wbb_teams()`](https://wehoop.sportsdataverse.org/reference/espn_wbb_teams.md)
  to look up team IDs. Example: `"2509"` (UConn).

- ...:

  Currently unused; reserved for future argument threading.

## Value

Returns a tibble of injury records for the specified WBB team. Returns
an empty tibble (zero rows) when the team has no reported injuries.

**Injuries**

Columns as documented in the shared
[espn_basketball_team_injuries_injuries_schema](https://wehoop.sportsdataverse.org/reference/espn_basketball_team_injuries_injuries_schema.md)
table.

## See also

[family_espn_wbb](https://wehoop.sportsdataverse.org/reference/family_espn_wbb.md)
lists every function in this family.

## Author

Saiem Gilani

## Examples

``` r
# \donttest{
  espn_wbb_team_injuries(team_id = "2509")
# }
```

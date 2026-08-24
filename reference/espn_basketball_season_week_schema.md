# Shared column schema: espn basketball season week schema

Columns shared verbatim across: espn_wbb_season_week,
espn_wnba_season_week.

## Details

|              |           |                                           |
|--------------|-----------|-------------------------------------------|
| col_name     | types     | description                               |
| league       | character | League slug.                              |
| season       | integer   | Season year.                              |
| season_type  | integer   | Season-type id.                           |
| week         | integer   | Week number.                              |
| text         | character | Display label (e.g. "Week 5").            |
| start_date   | character | ISO 8601 week start.                      |
| end_date     | character | ISO 8601 week end.                        |
| rankings_ref | character | `$ref` to the per-week rankings endpoint. |

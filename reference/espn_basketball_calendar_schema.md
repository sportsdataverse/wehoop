# Shared column schema: espn basketball calendar schema

Columns shared verbatim across: espn_wbb_calendar, espn_wnba_calendar.

## Details

|  |  |  |
|----|----|----|
| col_name | types | description |
| season | character | Season identifier (4-digit year or 'YYYY-YY' string). |
| season_type | character | Season type (1=pre-season, 2=regular season, 3=postseason, 4=off-season for ESPN; or string label for WNBA Stats). |
| season_type_label | character | Season type label. |
| season_start_date | character | Date in YYYY-MM-DD format. |
| season_end_date | character | Date in YYYY-MM-DD format. |
| label | character | Label. |
| alternate_label | character | Alternate label. |
| detail | character | Detail. |
| value | character | Numeric or string value field. |
| start_date | character | Start date (YYYY-MM-DD). |
| end_date | character | End date (YYYY-MM-DD). |

# Shared column schema: espn basketball news schema

Columns shared verbatim across: espn_wbb_news, espn_wbb_team_news,
espn_wnba_news, espn_wnba_team_news.

## Details

|             |           |                                   |
|-------------|-----------|-----------------------------------|
| col_name    | types     | description                       |
| id          | character | Unique play identifcation number  |
| type        | character | Record type / category.           |
| headline    | character | News headline.                    |
| description | character | Long-form description text.       |
| published   | character | Publication timestamp (ISO 8601). |
| premium     | logical   | Premium.                          |
| byline      | character | News article byline / author.     |
| link_web    | character | Web link / URL.                   |
| league_id   | character | League identifier ('10' = WNBA).  |

# **Get W League Player**

Player profile: current team, names, bio and career notes, one row.

Endpoint: `GET https://api.wjbl.01core.app/api/player`

## Usage

``` r
wjbl_player(player_id)
```

## Arguments

- player_id:

  Player id (player_id in wjbl_box_score or wjbl_roster): the person,
  stable across seasons, e.g. 9799.

## Value

A `wehoop_data` tibble, one row per record; the columns are always
these, in this order (sportsdataverse-py `wjbl_player`):

|  |  |  |
|----|----|----|
| col_name | type | description |
| player_id | integer | Player id player_id (key space: W League persons, STABLE across seasons and teams). The player_id of /player and the pi= of the site's /player/detail?pi=; joins the play-by-play player_id1 / player_id2. |
| player_name | character | Name in Japanese, 'SURNAME GIVEN'. |
| player_name_en | character | Name in romaji, uppercase, 'SURNAME GIVEN' ('OKAMOTO MIYUU'). |
| player_furigana | character | Name reading in hiragana ((Japanese text)). |
| team_id | integer | Current (or last) team: Franchise id team_id (key space: W League franchises, STABLE across seasons and sponsor renames: 13 = Toyota Antelopes, 12 = Denso Iris, 8 = ENEOS Sunflowers; all-star sides have their own ids, e.g. 591). The team_id of /team/roster and of the site's /team/roster/?team_id=. Not season_team_id. |
| season_team_name | character | Team name as registered for the season, in Japanese (company + nickname: Toyota Antelopes). |
| season_team_short_name | character | Short team name for that season, Japanese (Toyota). |
| season_team_player_number | character | Shirt number this season, a string. |
| team_logo_image | character | Team logo path, relative to https://www.wjbl.org ('/static/images/base_team/...png' or '/assets/img/team/...png'). |
| team_url | character | Team's own website URL. |
| player_birthday | character | Date of birth 'YYYY/MM/DD' (public player bio). |
| player_nickname | character | Nickname, Japanese. |
| player_position | character | Playing position code ('PG', 'SG', 'SF', 'PF', 'C'). |
| player_home_town | character | Home prefecture, Japanese (Hokkaido). |
| player_height | character | Height with unit, a string ('179cm'). |
| player_weight | character | Weight with unit, a string ('77kg'). |
| player_height_cm | integer | Height in whole centimetres, parsed from player_height ('179cm'). |
| player_weight_kg | integer | Weight in whole kilograms, parsed from player_weight ('77kg'). |
| player_affiliation_history | character | Career path, Japanese, (Japanese text)-separated (mini-basketball club (Japanese) junior high (Japanese) high school (Japanese) university (Japanese) team). |
| player_independent_flg | integer | Retired flag (the site greys the team and hides the number): 1 = retired / no longer registered, 0 = active. |
| player_national_team | character | National-team history, Japanese free text (Universiade). |
| player_awards | character | Awards and honours, Japanese free text. |
| player_coach_history | character | Coaching history (for players who became coaches); empty string in the sample. |
| player_coach_record | character | Coaching record; empty string in the sample. |
| player_picture | character | Photo path relative to https://www.wjbl.org. |
| player_wjbl_flg | integer | 1 = a W League player (0 presumably for others; unverified). |
| player_rookie | integer | Rookie ((Japanese) icon): 1 = yes, 0 = no. |
| player_early_entry | integer | Early-entry player ((Japanese), a student who joined before graduating): 1 = yes, 0 = no. |
| player_foreign_national_flg | integer | Foreign national ((Japanese) icon): 1 = yes, 0 = no. |
| player_naturalized_flg | integer | Naturalised player ((Japanese) icon): 1 = yes, 0 = no. |
| player_appeal | character | Self-introduction text; empty string in the sample. |
| player_championships | character | Championships text; empty string in the sample. |
| player_url | character | Personal website URL; empty string in the sample. |
| player_facebook_url | character | Facebook URL; empty string in the sample. |
| player_twitter_url | character | X (Twitter) URL; empty string in the sample. |
| player_instagram_url | character | Instagram URL; empty string in the sample. |

## Details

Source, terms of use, request pacing, seasons, ids, coverage and error
classes of this family: see the notes in
[`wjbl_leagues()`](https://wehoop.sportsdataverse.org/reference/wjbl_leagues.md).

     wjbl_player(player_id = 9799)

## See also

[family_wjbl](https://wehoop.sportsdataverse.org/reference/family_wjbl.md)
lists every function in this family.

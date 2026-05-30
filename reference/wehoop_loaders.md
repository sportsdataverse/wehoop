# **wehoop Data Loaders Overview**

Loaders for full seasons of pre-scraped data from the
`sportsdataverse/wehoop-{wnba,wbb}-data` releases on
`sportsdataverse-data`. Each helper validates the requested seasons,
builds the per-asset URLs, downloads in parallel (with optional
`progressr` progress + optional `DBI` insertion), and tags the result
with the `wehoop_data` S3 class.

## Details

### **WNBA loaders**

|  |  |
|----|----|
| Function | Asset family |
| [`load_wnba_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wnba_pbp.md) | WNBA play-by-play |
| [`load_wnba_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_player_box.md) | WNBA player boxscores |
| [`load_wnba_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wnba_team_box.md) | WNBA team boxscores |
| [`load_wnba_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wnba_schedule.md) | WNBA schedule |
| [`update_wnba_db()`](https://wehoop.sportsdataverse.org/reference/update_wnba_db.md) | Delta loader -\> DB |

### **WBB loaders**

|  |  |
|----|----|
| Function | Asset family |
| [`load_wbb_pbp()`](https://wehoop.sportsdataverse.org/reference/load_wbb_pbp.md) | Women's college basketball PBP |
| [`load_wbb_player_box()`](https://wehoop.sportsdataverse.org/reference/load_wbb_player_box.md) | WBB player boxscores |
| [`load_wbb_team_box()`](https://wehoop.sportsdataverse.org/reference/load_wbb_team_box.md) | WBB team boxscores |
| [`load_wbb_schedule()`](https://wehoop.sportsdataverse.org/reference/load_wbb_schedule.md) | WBB schedule |
| [`update_wbb_db()`](https://wehoop.sportsdataverse.org/reference/update_wbb_db.md) | Delta loader -\> DB |

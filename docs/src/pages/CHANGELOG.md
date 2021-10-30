# **wehoop 1.1.1** 
- Change functions from furrr::future_map_dfr functions to data.table::rbindlist functions for loaders.

# **wehoop 1.1.0** 
### **Add schedule loaders**
- [```wehoop::load_wbb_schedule()```](https://saiemgilani.github.io/wehoop/reference/load_wbb_schedule.html) function added
- [```wehoop::load_wnba_schedule()```](https://saiemgilani.github.io/wehoop/reference/load_wnba_schedule.html) function added

# **wehoop 1.0.0** 
### **Add team box score loaders**
- [```wehoop::load_wbb_team_box()```](https://saiemgilani.github.io/wehoop/reference/load_wbb_team_box.html) function added
- [```wehoop::load_wnba_team_box()```](https://saiemgilani.github.io/wehoop/reference/load_wnba_team_box.html) function added

### **Add player box score loaders**
- [```wehoop::load_wbb_player_box()```](https://saiemgilani.github.io/wehoop/reference/load_wbb_player_box.html) function added
- [```wehoop::load_wnba_player_box()```](https://saiemgilani.github.io/wehoop/reference/load_wnba_player_box.html) function added

### **Standings functions**
- [```wehoop::espn_wnba_standings()```](https://saiemgilani.github.io/wehoop/reference/espn_wnba_standings.html)
- [```wehoop::espn_wbb_standings()```](https://saiemgilani.github.io/wehoop/reference/espn_wbb_standings.html)

### **Getting Started vignette**
- [Getting started with wehoop data](https://saiemgilani.github.io/wehoop/articles/getting-started-wehoop.html)

# **wehoop 0.9.2** 
### **Quick fix for update db functions**

### **Dependency pruning**
This update is a non-user facing change to package dependencies to shrink the list of dependencies.

# **wehoop 0.9.1**
### **Clean names and team returns**
- All functions have now been given the [```janitor::clean_names()```](https://rdrr.io/cran/janitor/man/clean_names.html) treatment
- [```wehoop::espn_wbb_teams()```](https://saiemgilani.github.io/wehoop/reference/espn_wbb_teams.html) has updated the returns to be more identity information related only
- [```wehoop::espn_wnba_teams()```](https://saiemgilani.github.io/wehoop/reference/espn_wnba_teams.html) to be more identity information related only
- All tests were updated

# **wehoop 0.9.0**
### **Loading capabilities added to the package**
- [```wehoop::load_wbb_pbp()```](https://saiemgilani.github.io/wehoop/reference/load_wbb_pbp.html) and [```wehoop::update_wbb_db()```](https://saiemgilani.github.io/wehoop/reference/update_wbb_db.html) functions added
- [```wehoop::load_wnba_pbp()```](https://saiemgilani.github.io/wehoop/reference/load_wnba_pbp.html) and [```wehoop::update_wnba_db()```](https://saiemgilani.github.io/wehoop/reference/update_wnba_db.html) functions added

# **wehoop 0.3.0**
###  **Dependencies**
- ```R``` version 3.5.0 or greater dependency added
- ```purrr``` version 0.3.0 or greater dependency added
- ```rvest``` version 1.0.0 or greater dependency added
- ```progressr``` version 0.6.0 or greater dependency added
- ```usethis``` version 1.6.0 or greater dependency added
- ```xgboost``` version 1.1.0 or greater dependency added
- ```tidyr``` version 1.0.0 or greater dependency added
- ```stringr``` version 1.3.0 or greater dependency added
- ```tibble``` version 3.0.0 or greater dependency added
- ```furrr``` dependency added
- ```future``` dependency added

### **Test coverage**
* Added tests for all ESPN functions

#### **Function Naming Convention Change**
* Similarly, data and metrics sourced from ESPN will begin with `espn_` as opposed to `wbb_` or `wnba_`. 
* Data sourced directly from the NCAA website will start the function with `ncaa_`

# **wehoop 0.2.0**
- Added support for ESPN's play-by-play endpoints with the addition of the following functions:
- ```wehoop::espn_wnba_game_all()``` - a convenience wrapper function around the following three functions (returns the results as a list of three data frames)
- ```wehoop::espn_wnba_team_box()```
- ```wehoop::espn_wnba_player_box()```
- ```wehoop::espn_wnba_pbp()```
- ```wehoop::espn_wnba_teams()``` 
- ```wehoop::espn_wbb_scoreboard()``` 

# **wehoop 0.1.0**
- Added support for ESPN's play-by-play endpoints with the addition of the following functions:
- ```wehoop::espn_wbb_game_all()``` - a convenience wrapper function around the following three functions (returns the results as a list of three data frames)
- ```wehoop::espn_wbb_team_box()```
- ```wehoop::espn_wbb_player_box()```
- ```wehoop::espn_wbb_pbp()```
- ```wehoop::espn_wbb_teams()``` 
- ```wehoop::espn_wbb_conferences()``` 
- ```wehoop::espn_wbb_scoreboard()``` 
- ```wehoop::ncaa_wbb_NET_rankings()``` 
- ```wehoop::espn_wbb_rankings()``` 

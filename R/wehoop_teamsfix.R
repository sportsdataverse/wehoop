install.packages('furrr')
install.packages('progressr')
install.packages('future')

library(wehoop)
library(tidyverse)
library(dplyr)
library(purrr)
library(tibble)

espn_wbb_teams <- espn_wbb_teams()

espn_wbb_teams <- espn_wbb_teams %>%
  select(id, location, name, displayName, shortDisplayName, abbreviation, color, alternateColor, logos_href_1, logos_href_2) %>%
  rename(logo = logos_href_1,
         logo_dark = logos_href_2,
         nickname = name,
         school = location,
         team_id = id)

espn_wnba_teams <- espn_wnba_teams() 

espn_wnba_teams <- espn_wnba_teams %>%
  select(id, location, name, displayName, abbreviation, color, alternateColor, logos_href_1, logos_href_2) %>%
  rename(logo = logos_href_1,
         logo_dark = logos_href_2,
         nickname = name,
         team = location,
         team_id = id)




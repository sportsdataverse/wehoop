library(wehoop)
library(tidyverse)
library(dplyr)
library(purrr)
library(tibble)


wbb_espn_teams <- wbb_espn_teams()

wbb_espn_teams <- wbb_espn_teams %>%
  select(id, location, name, displayName, shortDisplayName, abbreviation, color, alternateColor, logos_href_1) %>%
  rename(logo_link = logos_href_1,
         nickname = name,
         school = location)

wnba_espn_teams <- wnba_espn_teams() 

wnba_espn_teams <- wnba_espn_teams %>%
  select(id, location, name, displayName, abbreviation, color, alternateColor, logos_href_1) %>%
  rename(logo_link = logos_href_1,
         nickname = name,
         team = location)
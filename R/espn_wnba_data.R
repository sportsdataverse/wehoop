#' Get ESPN's WNBA game data (play-by-play, team and player box)
#' @author Saiem Gilani
#' @param game_id Game ID
#' @return A named list of dataframes: Plays, Team, Player
#' @keywords WNBA Game
#' @importFrom rlang .data
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows
#' @importFrom tidyr unnest unnest_wider everything
#' @import rvest
#' @export
#' @examples
#' \donttest{
#'   try(espn_wnba_game_all(game_id = 401244185))
#' }

espn_wnba_game_all <- function(game_id){
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  
  play_base_url <- "http://site.api.espn.com/apis/site/v2/sports/basketball/wnba/summary?"
  
  ## Inputs
  ## game_id
  full_url <- paste0(play_base_url,
                     "event=", game_id)
  
  plays_df <- data.frame()
  team_box <- data.frame()
  player_box <- data.frame()
  #---- Play-by-Play ------
  tryCatch(
    expr = {
      
      res <- httr::RETRY("GET", full_url)
      
      # Check the result
      check_status(res)
      
      resp <- res %>%
        httr::content(as = "text", encoding = "UTF-8")
      
      raw_play_df <- jsonlite::fromJSON(resp)
      
      homeAway1 <- jsonlite::fromJSON(resp)[['header']][['competitions']][['competitors']][[1]][['homeAway']][1]
      
      season <- raw_play_df[['header']][['season']][['year']]
      season_type <- raw_play_df[['header']][['season']][['type']]
      game_date <- as.Date(substr(raw_play_df[['header']][['competitions']][['date']], 0, 10))
      id_vars <- data.frame()
      if (homeAway1 == "home") {
        
        homeTeamId = as.integer(raw_play_df[["header"]][["competitions"]][["competitors"]][[1]][['team']][['id']][1])
        homeTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][1]
        homeTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][1]
        homeTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][1]
        homeTeamLogo = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[1]][['href']][1]
        homeTeamLogoDark = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[1]][['href']][2]
        homeTeamFullName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["displayName"]][1]
        homeTeamColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["color"]][1]
        homeTeamAlternateColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["alternateColor"]][1]
        homeTeamScore = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['score']][1])
        homeTeamWinner = raw_play_df[['header']][['competitions']][['competitors']][[1]][['winner']][1]
        homeTeamRecord = raw_play_df[['header']][['competitions']][['competitors']][[1]][['record']][[1]][['summary']][1]
        awayTeamId = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['id']][2])
        awayTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][2]
        awayTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][2]
        awayTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][2]
        awayTeamLogo = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[2]][['href']][1]
        awayTeamLogoDark = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[2]][['href']][2]
        awayTeamFullName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["displayName"]][2]
        awayTeamColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["color"]][2]
        awayTeamAlternateColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["alternateColor"]][2]
        awayTeamScore = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['score']][2])
        awayTeamWinner = raw_play_df[['header']][['competitions']][['competitors']][[1]][['winner']][2]
        awayTeamRecord = raw_play_df[['header']][['competitions']][['competitors']][[1]][['record']][[1]][['summary']][2]
        id_vars <- data.frame(
          homeTeamId,
          homeTeamMascot,
          homeTeamName,
          homeTeamAbbrev,
          homeTeamLogo,
          homeTeamLogoDark,
          homeTeamFullName,
          homeTeamColor,
          homeTeamAlternateColor,
          homeTeamScore,
          homeTeamWinner,
          homeTeamRecord,
          awayTeamId,
          awayTeamMascot,
          awayTeamName,
          awayTeamAbbrev,
          awayTeamLogo,
          awayTeamLogoDark,
          awayTeamFullName,
          awayTeamColor,
          awayTeamAlternateColor,
          awayTeamScore,
          awayTeamWinner,
          awayTeamRecord
        )
      }
      else {
        
        awayTeamId = as.integer(raw_play_df[["header"]][["competitions"]][["competitors"]][[1]][['team']][['id']][1])
        awayTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][1]
        awayTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][1]
        awayTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][1]
        awayTeamLogo = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[1]][['href']][1]
        awayTeamLogoDark = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[1]][['href']][2]
        awayTeamFullName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["displayName"]][1]
        awayTeamColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["color"]][1]
        awayTeamAlternateColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["alternateColor"]][1]
        awayTeamScore = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['score']][1])
        awayTeamWinner = raw_play_df[['header']][['competitions']][['competitors']][[1]][['winner']][1]
        awayTeamRecord = raw_play_df[['header']][['competitions']][['competitors']][[1]][['record']][[1]][['summary']][1]
        homeTeamId = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['id']][2])
        homeTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][2]
        homeTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][2]
        homeTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][2]
        homeTeamLogo = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[2]][['href']][1]
        homeTeamLogoDark = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[2]][['href']][2]
        homeTeamFullName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["displayName"]][2]
        homeTeamColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["color"]][2]
        homeTeamAlternateColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["alternateColor"]][2]
        homeTeamScore = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['score']][2])
        homeTeamWinner = raw_play_df[['header']][['competitions']][['competitors']][[1]][['winner']][2]
        homeTeamRecord = raw_play_df[['header']][['competitions']][['competitors']][[1]][['record']][[1]][['summary']][2]
        id_vars <- data.frame(
          homeTeamId,
          homeTeamMascot,
          homeTeamName,
          homeTeamAbbrev,
          homeTeamLogo,
          homeTeamLogoDark,
          homeTeamFullName,
          homeTeamColor,
          homeTeamAlternateColor,
          homeTeamScore,
          homeTeamWinner,
          homeTeamRecord,
          awayTeamId,
          awayTeamMascot,
          awayTeamName,
          awayTeamAbbrev,
          awayTeamLogo,
          awayTeamLogoDark,
          awayTeamFullName,
          awayTeamColor,
          awayTeamAlternateColor,
          awayTeamScore,
          awayTeamWinner,
          awayTeamRecord
        )
        
      }
      
      raw_play_df <- jsonlite::fromJSON(jsonlite::toJSON(raw_play_df),flatten=TRUE)
      
      
      plays <- raw_play_df[["plays"]] %>%
        tidyr::unnest_wider("participants")
      suppressWarnings(
        aths <- plays %>%
          dplyr::group_by(.data$id) %>%
          dplyr::select(
            "id", 
            "athlete.id") %>%
          tidyr::unnest_wider("athlete.id", names_sep = "_")
      )
      names(aths)<-c("play.id","athlete.id.1","athlete.id.2","athlete.id.3")
      plays_df <- dplyr::bind_cols(plays, aths, id_vars) %>%
        select(-"athlete.id") %>%
        dplyr::mutate(
          game_id = game_id,
          season = season,
          season_type = season_type,
          game_date = game_date) %>%
        janitor::clean_names() %>%
        make_wehoop_data("ESPN WNBA Play-by-Play Information from ESPN.com",Sys.time())
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no play-by-play data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  #---- Team Box ------
  tryCatch(
    expr = {
      game_json <- resp %>% 
        jsonlite::fromJSON()
      
      box_score_available <- game_json[["header"]][["competitions"]][["boxscoreAvailable"]]
      
      if (box_score_available == TRUE) {
        teams_box_score_df <- game_json[["boxscore"]][["teams"]] %>%
          jsonlite::toJSON() %>%
          jsonlite::fromJSON(flatten = TRUE)
        if (length(teams_box_score_df[["statistics"]][[1]]) > 0) {
          # Teams info columns and values
          teams_df <- game_json[["header"]][["competitions"]][["competitors"]][[1]]
          
          homeAway1 <- teams_df[["homeAway"]][1]
          homeAway1_team.id <- as.integer(teams_df[["id"]][1])
          homeAway1_team.score <- as.integer(teams_df[["score"]][1])
          homeAway1_team.winner <- teams_df[["winner"]][1]
          
          homeAway2 <- teams_df[["homeAway"]][2]
          homeAway2_team.id <- as.integer(teams_df[["id"]][2])
          homeAway2_team.score <- as.integer(teams_df[["score"]][2])
          homeAway2_team.winner <- teams_df[["winner"]][2]
          
          # Pivoting the table values for each team from long to wide
          statistics_df_1 <- teams_box_score_df[["statistics"]][[1]] %>%
            tibble::tibble() %>%
            dplyr::select("name", "displayValue") %>%
            tidyr::spread("name", "displayValue")
          
          statistics_df_2 <- teams_box_score_df[["statistics"]][[2]] %>%
            tibble::tibble() %>%
            dplyr::select("name", "displayValue") %>%
            tidyr::spread("name", "displayValue")
          
          # Assigning values to the correct data frame rows - 1
          statistics_df_1$team.homeAway <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][1]) == as.integer(homeAway1_team.id),
            homeAway1,
            homeAway2
          )
          statistics_df_1$team.score <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][1]) == as.integer(homeAway1_team.id),
            as.integer(homeAway1_team.score),
            as.integer(homeAway2_team.score)
          )
          statistics_df_1$team.winner <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][1]) == as.integer(homeAway1_team.id),
            homeAway1_team.winner,
            homeAway2_team.winner
          )
          statistics_df_1$team.id <- as.integer(teams_box_score_df[["team.id"]][[1]])
          statistics_df_1$team.uid <- teams_box_score_df[["team.uid"]][[1]]
          statistics_df_1$team.slug <- teams_box_score_df[["team.slug"]][[1]]
          statistics_df_1$team.location <- teams_box_score_df[["team.location"]][[1]]
          statistics_df_1$team.name <- teams_box_score_df[["team.name"]][[1]]
          statistics_df_1$team.abbreviation <- teams_box_score_df[["team.abbreviation"]][[1]]
          statistics_df_1$team.displayName <- teams_box_score_df[["team.displayName"]][[1]]
          statistics_df_1$team.shortDisplayName <- teams_box_score_df[["team.shortDisplayName"]][[1]]
          statistics_df_1$team.color <- teams_box_score_df[["team.color"]][[1]]
          statistics_df_1$team.alternateColor <- teams_box_score_df[["team.alternateColor"]][[1]]
          statistics_df_1$team.logo <- teams_box_score_df[["team.logo"]][[1]]
          statistics_df_1$opponent.team.id <- as.integer(teams_box_score_df[["team.id"]][[2]])
          statistics_df_1$opponent.team.uid <- teams_box_score_df[["team.uid"]][[2]]
          statistics_df_1$opponent.team.slug <- teams_box_score_df[["team.slug"]][[2]]
          statistics_df_1$opponent.team.location <- teams_box_score_df[["team.location"]][[2]]
          statistics_df_1$opponent.team.name <- teams_box_score_df[["team.name"]][[2]]
          statistics_df_1$opponent.team.abbreviation <- teams_box_score_df[["team.abbreviation"]][[2]]
          statistics_df_1$opponent.team.displayName <- teams_box_score_df[["team.displayName"]][[2]]
          statistics_df_1$opponent.team.shortDisplayName <- teams_box_score_df[["team.shortDisplayName"]][[2]]
          statistics_df_1$opponent.team.color <- teams_box_score_df[["team.color"]][[2]]
          statistics_df_1$opponent.team.alternateColor <- teams_box_score_df[["team.alternateColor"]][[2]]
          statistics_df_1$opponent.team.logo <- teams_box_score_df[["team.logo"]][[2]]
          
          # Assigning values to the correct data frame rows - 2
          statistics_df_2$team.homeAway <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][2]) == as.integer(homeAway2_team.id),
            homeAway2,
            homeAway1
          )
          statistics_df_2$team.score <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][2]) == as.integer(homeAway2_team.id),
            as.integer(homeAway2_team.score),
            as.integer(homeAway1_team.score)
          )
          statistics_df_2$team.winner <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][2]) == as.integer(homeAway2_team.id),
            homeAway2_team.winner,
            homeAway1_team.winner
          )
          statistics_df_2$team.id <- as.integer(teams_box_score_df[["team.id"]][[2]])
          statistics_df_2$team.uid <- teams_box_score_df[["team.uid"]][[2]]
          statistics_df_2$team.slug <- teams_box_score_df[["team.slug"]][[2]]
          statistics_df_2$team.location <- teams_box_score_df[["team.location"]][[2]]
          statistics_df_2$team.name <- teams_box_score_df[["team.name"]][[2]]
          statistics_df_2$team.abbreviation <- teams_box_score_df[["team.abbreviation"]][[2]]
          statistics_df_2$team.displayName <- teams_box_score_df[["team.displayName"]][[2]]
          statistics_df_2$team.shortDisplayName <- teams_box_score_df[["team.shortDisplayName"]][[2]]
          statistics_df_2$team.color <- teams_box_score_df[["team.color"]][[2]]
          statistics_df_2$team.alternateColor <- teams_box_score_df[["team.alternateColor"]][[2]]
          statistics_df_2$team.logo <- teams_box_score_df[["team.logo"]][[2]]
          statistics_df_2$opponent.team.id <- as.integer(teams_box_score_df[["team.id"]][[1]])
          statistics_df_2$opponent.team.uid <- teams_box_score_df[["team.uid"]][[1]]
          statistics_df_2$opponent.team.slug <- teams_box_score_df[["team.slug"]][[1]]
          statistics_df_2$opponent.team.location <- teams_box_score_df[["team.location"]][[1]]
          statistics_df_2$opponent.team.name <- teams_box_score_df[["team.name"]][[1]]
          statistics_df_2$opponent.team.abbreviation <- teams_box_score_df[["team.abbreviation"]][[1]]
          statistics_df_2$opponent.team.displayName <- teams_box_score_df[["team.displayName"]][[1]]
          statistics_df_2$opponent.team.shortDisplayName <- teams_box_score_df[["team.shortDisplayName"]][[1]]
          statistics_df_2$opponent.team.color <- teams_box_score_df[["team.color"]][[1]]
          statistics_df_2$opponent.team.alternateColor <- teams_box_score_df[["team.alternateColor"]][[1]]
          statistics_df_2$opponent.team.logo <- teams_box_score_df[["team.logo"]][[1]]
          
          complete_statistics_df <- statistics_df_1 %>%
            dplyr::bind_rows(statistics_df_2)
          
          # Assigning game/season level data to team box score and converting types
          complete_statistics_df$season <- game_json[["header"]][["season"]][["year"]]
          complete_statistics_df$season_type <- game_json[["header"]][["season"]][["type"]]
          complete_statistics_df$game_date <- as.Date(substr(game_json[["header"]][["competitions"]][["date"]], 0, 10))
          complete_statistics_df$game_id <- as.integer(game_id)
          
          suppressWarnings(
            complete_statistics_df <- complete_statistics_df %>%
              tidyr::separate("fieldGoalsMade-fieldGoalsAttempted",
                              into = c("fieldGoalsMade", "fieldGoalsAttempted"),
                              sep = "-") %>%
              tidyr::separate("freeThrowsMade-freeThrowsAttempted",
                              into = c("freeThrowsMade", "freeThrowsAttempted"),
                              sep = "-") %>%
              tidyr::separate("threePointFieldGoalsMade-threePointFieldGoalsAttempted",
                              into = c("threePointFieldGoalsMade", "threePointFieldGoalsAttempted"),
                              sep = "-") %>%
              dplyr::mutate(dplyr::across(c(
                "fieldGoalPct",
                "freeThrowPct",
                "threePointFieldGoalPct"
              ), ~as.numeric(.x))) %>%
              dplyr::mutate(dplyr::across(dplyr::any_of(c(
                "assists",
                "blocks",
                "defensiveRebounds",
                "fieldGoalsMade",
                "fieldGoalsAttempted",
                "flagrantFouls",
                "fouls",
                "freeThrowsMade",
                "freeThrowsAttempted",
                "largestLead",
                "offensiveRebounds",
                "steals",
                "teamTurnovers",
                "technicalFouls",
                "threePointFieldGoalsMade",
                "threePointFieldGoalsAttempted",
                "totalRebounds",
                "totalTechnicalFouls",
                "totalTurnovers",
                "turnovers"
              )), ~as.integer(.x)))
          )
          team_box_score <- complete_statistics_df %>%
            janitor::clean_names() %>%
            dplyr::select(dplyr::any_of(c(
              "game_id",
              "season",
              "season_type",
              "game_date",
              "team_id",
              "team_uid",
              "team_slug",
              "team_location",
              "team_name",
              "team_abbreviation",
              "team_display_name",
              "team_short_display_name",
              "team_color",
              "team_alternate_color",
              "team_logo",
              "team_home_away",
              "team_score",
              "team_winner")),
              tidyr::everything()) %>%
            make_wehoop_data("ESPN WNBA Team Box Information from ESPN.com", Sys.time())
        }
      }
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no team box score data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  #---- Player Box ------
  tryCatch(
    expr = {
      
      game_json <- resp %>% 
        jsonlite::fromJSON(flatten = TRUE)
      
      players_box_score_df <- game_json[["boxscore"]][["players"]] %>%
        jsonlite::toJSON() %>%
        jsonlite::fromJSON(flatten = TRUE) %>%
        as.data.frame()
      
      gameId <- as.integer(game_json[["header"]][["id"]])
      season <- game_json[["header"]][["season"]][["year"]]
      season_type <- game_json[["header"]][["season"]][["type"]]
      game_date <- as.Date(substr(game_json[["header"]][["competitions"]][["date"]], 0, 10))
      boxScoreAvailable <- game_json[["header"]][["competitions"]][["boxscoreAvailable"]]
      
      boxScoreSource <- game_json[["header"]][["competitions"]][["boxscoreSource"]]
      if (boxScoreAvailable == TRUE &&
          length(players_box_score_df[["statistics"]][[1]][["athletes"]][[1]]) > 1) {
        players_df <- players_box_score_df %>%
          tidyr::unnest("statistics") %>%
          tidyr::unnest("athletes")
        if (length(players_box_score_df[["statistics"]]) > 1 &&
            length(players_df$stats[[1]]) > 0) {
          players_df <- jsonlite::fromJSON(jsonlite::toJSON(game_json[["boxscore"]][["players"]]), flatten = TRUE) %>%
            tidyr::unnest("statistics") %>%
            tidyr::unnest("athletes")
          stat_cols <- players_df$names[[1]]
          stat_cols <- players_df$keys[[1]]
          stats <- players_df$stats
          
          stats_df <- as.data.frame(do.call(rbind,stats))
          colnames(stats_df) <- stat_cols
          suppressWarnings(
            stats_df <- stats_df %>%
              tidyr::separate("fieldGoalsMade-fieldGoalsAttempted",
                              into = c("fieldGoalsMade", "fieldGoalsAttempted"),
                              sep = "-") %>%
              tidyr::separate("freeThrowsMade-freeThrowsAttempted",
                              into = c("freeThrowsMade", "freeThrowsAttempted"),
                              sep = "-") %>%
              tidyr::separate("threePointFieldGoalsMade-threePointFieldGoalsAttempted",
                              into = c("threePointFieldGoalsMade", "threePointFieldGoalsAttempted"),
                              sep = "-") %>%
              dplyr::mutate(dplyr::across(dplyr::any_of(c(
                "minutes",
                "fieldGoalPct",
                "freeThrowPct",
                "threePointFieldGoalPct"
              )), ~as.numeric(.x))) %>%
              dplyr::mutate(dplyr::across(dplyr::any_of(c(
                "assists",
                "blocks",
                "defensiveRebounds",
                "fieldGoalsMade",
                "fieldGoalsAttempted",
                "flagrantFouls",
                "fouls",
                "freeThrowsMade",
                "freeThrowsAttempted",
                "offensiveRebounds",
                "steals",
                "teamTurnovers",
                "technicalFouls",
                "threePointFieldGoalsMade",
                "threePointFieldGoalsAttempted",
                "rebounds",
                "totalTechnicalFouls",
                "totalTurnovers",
                "turnovers",
                "points"
              )), ~as.integer(.x)))
          )
          players_df <- players_df %>%
            dplyr::filter(!.data$didNotPlay) %>%
            dplyr::select(dplyr::any_of(c(
              "starter",
              "ejected", 
              "didNotPlay",
              "active",
              "athlete.displayName",
              "athlete.jersey",
              "athlete.id",
              "athlete.shortName",
              "athlete.headshot.href",
              "athlete.position.name",
              "athlete.position.abbreviation",
              "team.shortDisplayName",
              "team.name",
              "team.logo",
              "team.id",
              "team.abbreviation",
              "team.color",
              "team.alternateColor"
            )))
          
          players_df <- dplyr::bind_cols(stats_df,players_df) %>%
            dplyr::select(dplyr::any_of(c(
              "athlete.displayName",
              "team.shortDisplayName")), 
              tidyr::everything()) %>% 
            janitor::clean_names() %>%
            dplyr::mutate(
              game_id = gameId,
              season = season,
              season_type = season_type,
              game_date = game_date)
          
          player_box_score <- players_df %>% 
            dplyr::select(dplyr::any_of(c(
              "game_id",
              "season",
              "season_type",
              "game_date",
              "athlete_id",
              "athlete_display_name",
              "team_id",
              "team_name",
              "team_short_display_name",
              "minutes",
              "field_goals_made",
              "field_goals_attempted",
              "three_point_field_goals_made",
              "three_point_field_goals_attempted",
              "free_throws_made",
              "free_throws_attempted",
              "offensive_rebounds",
              "defensive_rebounds",
              "rebounds",
              "assists",
              "steals",
              "blocks",
              "turnovers",
              "fouls",
              "plus_minus",
              "points",
              "starter",
              "ejected",
              "did_not_play",
              "active",
              "athlete_jersey",
              "athlete_short_name",
              "athlete_headshot_href",
              "athlete_position_name",
              "athlete_position_abbreviation",
              "team_logo",
              "team_abbreviation",
              "team_color",
              "team_alternate_color"))) %>%
            make_wehoop_data("ESPN WNBA Player Box Information from ESPN.com", Sys.time())
        }
      }
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no player box score data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  pbp <- c(list(plays_df), list(team_box_score),list(player_box_score))
  names(pbp) <- c("Plays","Team","Player")
  return(pbp)
}

#' Get ESPN's WNBA play by play data
#' @author Saiem Gilani
#' @param game_id Game ID
#' @return Returns a play-by-play data frame
#' @keywords WNBA PBP
#' @importFrom rlang .data
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows
#' @importFrom tidyr unnest unnest_wider everything
#' @import rvest
#' @export
#' @examples
#' 
#' \donttest{
#'   try(espn_wnba_pbp(game_id = 401455681))
#' }
espn_wnba_pbp <- function(game_id){
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  
  play_base_url <- "http://site.api.espn.com/apis/site/v2/sports/basketball/wnba/summary?"
  
  ## Inputs
  ## game_id
  full_url <- paste0(play_base_url,
                     "event=", game_id)
  
  #---- Play-by-Play ------
  tryCatch(
    expr = {
      
      res <- httr::RETRY("GET", full_url)
      
      # Check the result
      check_status(res)
      
      resp <- res %>%
        httr::content(as = "text", encoding = "UTF-8")
      
      raw_play_df <- jsonlite::fromJSON(resp)
      
      homeAway1 <- jsonlite::fromJSON(resp)[['header']][['competitions']][['competitors']][[1]][['homeAway']][1]
      
      season <- raw_play_df[['header']][['season']][['year']]
      season_type <- raw_play_df[['header']][['season']][['type']]
      game_date <- as.Date(substr(raw_play_df[['header']][['competitions']][['date']], 0, 10))
      id_vars <- data.frame()
      if (homeAway1 == "home") {
        
        homeTeamId = as.integer(raw_play_df[["header"]][["competitions"]][["competitors"]][[1]][['team']][['id']][1])
        homeTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][1]
        homeTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][1]
        homeTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][1]
        homeTeamLogo = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[1]][['href']][1]
        homeTeamLogoDark = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[1]][['href']][2]
        homeTeamFullName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["displayName"]][1]
        homeTeamColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["color"]][1]
        homeTeamAlternateColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["alternateColor"]][1]
        homeTeamScore = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['score']][1])
        homeTeamWinner = raw_play_df[['header']][['competitions']][['competitors']][[1]][['winner']][1]
        homeTeamRecord = raw_play_df[['header']][['competitions']][['competitors']][[1]][['record']][[1]][['summary']][1]
        awayTeamId = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['id']][2])
        awayTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][2]
        awayTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][2]
        awayTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][2]
        awayTeamLogo = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[2]][['href']][1]
        awayTeamLogoDark = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[2]][['href']][2]
        awayTeamFullName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["displayName"]][2]
        awayTeamColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["color"]][2]
        awayTeamAlternateColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["alternateColor"]][2]
        awayTeamScore = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['score']][2])
        awayTeamWinner = raw_play_df[['header']][['competitions']][['competitors']][[1]][['winner']][2]
        awayTeamRecord = raw_play_df[['header']][['competitions']][['competitors']][[1]][['record']][[1]][['summary']][2]
        id_vars <- data.frame(
          homeTeamId,
          homeTeamMascot,
          homeTeamName,
          homeTeamAbbrev,
          homeTeamLogo,
          homeTeamLogoDark,
          homeTeamFullName,
          homeTeamColor,
          homeTeamAlternateColor,
          homeTeamScore,
          homeTeamWinner,
          homeTeamRecord,
          awayTeamId,
          awayTeamMascot,
          awayTeamName,
          awayTeamAbbrev,
          awayTeamLogo,
          awayTeamLogoDark,
          awayTeamFullName,
          awayTeamColor,
          awayTeamAlternateColor,
          awayTeamScore,
          awayTeamWinner,
          awayTeamRecord
        )
      }
      else {
        
        awayTeamId = as.integer(raw_play_df[["header"]][["competitions"]][["competitors"]][[1]][['team']][['id']][1])
        awayTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][1]
        awayTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][1]
        awayTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][1]
        awayTeamLogo = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[1]][['href']][1]
        awayTeamLogoDark = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[1]][['href']][2]
        awayTeamFullName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["displayName"]][1]
        awayTeamColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["color"]][1]
        awayTeamAlternateColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["alternateColor"]][1]
        awayTeamScore = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['score']][1])
        awayTeamWinner = raw_play_df[['header']][['competitions']][['competitors']][[1]][['winner']][1]
        awayTeamRecord = raw_play_df[['header']][['competitions']][['competitors']][[1]][['record']][[1]][['summary']][1]
        homeTeamId = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['id']][2])
        homeTeamMascot = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['name']][2]
        homeTeamName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['location']][2]
        homeTeamAbbrev = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['abbreviation']][2]
        homeTeamLogo = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[2]][['href']][1]
        homeTeamLogoDark = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][['logos']][[2]][['href']][2]
        homeTeamFullName = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["displayName"]][2]
        homeTeamColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["color"]][2]
        homeTeamAlternateColor = raw_play_df[['header']][['competitions']][['competitors']][[1]][['team']][["alternateColor"]][2]
        homeTeamScore = as.integer(raw_play_df[['header']][['competitions']][['competitors']][[1]][['score']][2])
        homeTeamWinner = raw_play_df[['header']][['competitions']][['competitors']][[1]][['winner']][2]
        homeTeamRecord = raw_play_df[['header']][['competitions']][['competitors']][[1]][['record']][[1]][['summary']][2]
        id_vars <- data.frame(
          homeTeamId,
          homeTeamMascot,
          homeTeamName,
          homeTeamAbbrev,
          homeTeamLogo,
          homeTeamLogoDark,
          homeTeamFullName,
          homeTeamColor,
          homeTeamAlternateColor,
          homeTeamScore,
          homeTeamWinner,
          homeTeamRecord,
          awayTeamId,
          awayTeamMascot,
          awayTeamName,
          awayTeamAbbrev,
          awayTeamLogo,
          awayTeamLogoDark,
          awayTeamFullName,
          awayTeamColor,
          awayTeamAlternateColor,
          awayTeamScore,
          awayTeamWinner,
          awayTeamRecord
        )
        
      }
      
      raw_play_df <- jsonlite::fromJSON(jsonlite::toJSON(raw_play_df),flatten=TRUE)
      
      
      plays <- raw_play_df[["plays"]] %>%
        tidyr::unnest_wider("participants")
      suppressWarnings(
        aths <- plays %>%
          dplyr::group_by(.data$id) %>%
          dplyr::select(
            "id", 
            "athlete.id") %>%
          tidyr::unnest_wider("athlete.id", names_sep = "_")
      )
      names(aths) <- c("play.id", "athlete.id.1", "athlete.id.2", "athlete.id.3")
      plays_df <- dplyr::bind_cols(plays, aths, id_vars) %>%
        select(-"athlete.id") %>%
        dplyr::mutate(
          game_id = game_id,
          season = season,
          season_type = season_type,
          game_date = game_date) %>%
        janitor::clean_names() %>%
        make_wehoop_data("ESPN WNBA Play-by-Play Information from ESPN.com",Sys.time())
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no play-by-play data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(plays_df)
}

#' Get ESPN's WNBA team box data
#' @author Saiem Gilani
#' @param game_id Game ID
#' @return Returns a team boxscore data frame
#' @keywords WNBA Team Box
#' @importFrom rlang .data
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows
#' @importFrom tidyr unnest unnest_wider everything
#' @import rvest
#' @export
#' @examples
#' 
#' \donttest{
#'    try(espn_wnba_team_box(game_id = 401244185))
#' }
espn_wnba_team_box <- function(game_id){
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  play_base_url <- "http://site.api.espn.com/apis/site/v2/sports/basketball/wnba/summary?"
  
  ## Inputs
  ## game_id
  full_url <- paste0(play_base_url,
                     "event=", game_id)
  res <- httr::RETRY(
    "GET", full_url
  )
  
  # Check the result
  check_status(res)
  
  resp <- res %>%
    httr::content(as = "text", encoding = "UTF-8") 
  #---- Team Box ------
  tryCatch(
    expr = {
      game_json <- resp %>% 
        jsonlite::fromJSON()
      
      box_score_available <- game_json[["header"]][["competitions"]][["boxscoreAvailable"]]
      
      if (box_score_available == TRUE) {
        teams_box_score_df <- game_json[["boxscore"]][["teams"]] %>%
          jsonlite::toJSON() %>%
          jsonlite::fromJSON(flatten = TRUE)
        if (length(teams_box_score_df[["statistics"]][[1]]) > 0) {
          # Teams info columns and values
          teams_df <- game_json[["header"]][["competitions"]][["competitors"]][[1]]
          
          homeAway1 <- teams_df[["homeAway"]][1]
          homeAway1_team.id <- as.integer(teams_df[["id"]][1])
          homeAway1_team.score <- as.integer(teams_df[["score"]][1])
          homeAway1_team.winner <- teams_df[["winner"]][1]
          
          homeAway2 <- teams_df[["homeAway"]][2]
          homeAway2_team.id <- as.integer(teams_df[["id"]][2])
          homeAway2_team.score <- as.integer(teams_df[["score"]][2])
          homeAway2_team.winner <- teams_df[["winner"]][2]
          
          # Pivoting the table values for each team from long to wide
          statistics_df_1 <- teams_box_score_df[["statistics"]][[1]] %>%
            tibble::tibble() %>%
            dplyr::select("name", "displayValue") %>%
            tidyr::spread("name", "displayValue")
          
          statistics_df_2 <- teams_box_score_df[["statistics"]][[2]] %>%
            tibble::tibble() %>%
            dplyr::select("name", "displayValue") %>%
            tidyr::spread("name", "displayValue")
          
          # Assigning values to the correct data frame rows - 1
          statistics_df_1$team.homeAway <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][1]) == as.integer(homeAway1_team.id),
            homeAway1,
            homeAway2
          )
          statistics_df_1$team.score <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][1]) == as.integer(homeAway1_team.id),
            as.integer(homeAway1_team.score),
            as.integer(homeAway2_team.score)
          )
          statistics_df_1$team.winner <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][1]) == as.integer(homeAway1_team.id),
            homeAway1_team.winner,
            homeAway2_team.winner
          )
          statistics_df_1$team.id <- as.integer(teams_box_score_df[["team.id"]][[1]])
          statistics_df_1$team.uid <- teams_box_score_df[["team.uid"]][[1]]
          statistics_df_1$team.slug <- teams_box_score_df[["team.slug"]][[1]]
          statistics_df_1$team.location <- teams_box_score_df[["team.location"]][[1]]
          statistics_df_1$team.name <- teams_box_score_df[["team.name"]][[1]]
          statistics_df_1$team.abbreviation <- teams_box_score_df[["team.abbreviation"]][[1]]
          statistics_df_1$team.displayName <- teams_box_score_df[["team.displayName"]][[1]]
          statistics_df_1$team.shortDisplayName <- teams_box_score_df[["team.shortDisplayName"]][[1]]
          statistics_df_1$team.color <- teams_box_score_df[["team.color"]][[1]]
          statistics_df_1$team.alternateColor <- teams_box_score_df[["team.alternateColor"]][[1]]
          statistics_df_1$team.logo <- teams_box_score_df[["team.logo"]][[1]]
          statistics_df_1$opponent.team.id <- as.integer(teams_box_score_df[["team.id"]][[2]])
          statistics_df_1$opponent.team.uid <- teams_box_score_df[["team.uid"]][[2]]
          statistics_df_1$opponent.team.slug <- teams_box_score_df[["team.slug"]][[2]]
          statistics_df_1$opponent.team.location <- teams_box_score_df[["team.location"]][[2]]
          statistics_df_1$opponent.team.name <- teams_box_score_df[["team.name"]][[2]]
          statistics_df_1$opponent.team.abbreviation <- teams_box_score_df[["team.abbreviation"]][[2]]
          statistics_df_1$opponent.team.displayName <- teams_box_score_df[["team.displayName"]][[2]]
          statistics_df_1$opponent.team.shortDisplayName <- teams_box_score_df[["team.shortDisplayName"]][[2]]
          statistics_df_1$opponent.team.color <- teams_box_score_df[["team.color"]][[2]]
          statistics_df_1$opponent.team.alternateColor <- teams_box_score_df[["team.alternateColor"]][[2]]
          statistics_df_1$opponent.team.logo <- teams_box_score_df[["team.logo"]][[2]]
          
          # Assigning values to the correct data frame rows - 2
          statistics_df_2$team.homeAway <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][2]) == as.integer(homeAway2_team.id),
            homeAway2,
            homeAway1
          )
          statistics_df_2$team.score <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][2]) == as.integer(homeAway2_team.id),
            as.integer(homeAway2_team.score),
            as.integer(homeAway1_team.score)
          )
          statistics_df_2$team.winner <- ifelse(
            as.integer(teams_box_score_df[["team.id"]][2]) == as.integer(homeAway2_team.id),
            homeAway2_team.winner,
            homeAway1_team.winner
          )
          statistics_df_2$team.id <- as.integer(teams_box_score_df[["team.id"]][[2]])
          statistics_df_2$team.uid <- teams_box_score_df[["team.uid"]][[2]]
          statistics_df_2$team.slug <- teams_box_score_df[["team.slug"]][[2]]
          statistics_df_2$team.location <- teams_box_score_df[["team.location"]][[2]]
          statistics_df_2$team.name <- teams_box_score_df[["team.name"]][[2]]
          statistics_df_2$team.abbreviation <- teams_box_score_df[["team.abbreviation"]][[2]]
          statistics_df_2$team.displayName <- teams_box_score_df[["team.displayName"]][[2]]
          statistics_df_2$team.shortDisplayName <- teams_box_score_df[["team.shortDisplayName"]][[2]]
          statistics_df_2$team.color <- teams_box_score_df[["team.color"]][[2]]
          statistics_df_2$team.alternateColor <- teams_box_score_df[["team.alternateColor"]][[2]]
          statistics_df_2$team.logo <- teams_box_score_df[["team.logo"]][[2]]
          statistics_df_2$opponent.team.id <- as.integer(teams_box_score_df[["team.id"]][[1]])
          statistics_df_2$opponent.team.uid <- teams_box_score_df[["team.uid"]][[1]]
          statistics_df_2$opponent.team.slug <- teams_box_score_df[["team.slug"]][[1]]
          statistics_df_2$opponent.team.location <- teams_box_score_df[["team.location"]][[1]]
          statistics_df_2$opponent.team.name <- teams_box_score_df[["team.name"]][[1]]
          statistics_df_2$opponent.team.abbreviation <- teams_box_score_df[["team.abbreviation"]][[1]]
          statistics_df_2$opponent.team.displayName <- teams_box_score_df[["team.displayName"]][[1]]
          statistics_df_2$opponent.team.shortDisplayName <- teams_box_score_df[["team.shortDisplayName"]][[1]]
          statistics_df_2$opponent.team.color <- teams_box_score_df[["team.color"]][[1]]
          statistics_df_2$opponent.team.alternateColor <- teams_box_score_df[["team.alternateColor"]][[1]]
          statistics_df_2$opponent.team.logo <- teams_box_score_df[["team.logo"]][[1]]
          
          complete_statistics_df <- statistics_df_1 %>%
            dplyr::bind_rows(statistics_df_2)
          
          # Assigning game/season level data to team box score and converting types
          complete_statistics_df$season <- game_json[["header"]][["season"]][["year"]]
          complete_statistics_df$season_type <- game_json[["header"]][["season"]][["type"]]
          complete_statistics_df$game_date <- as.Date(substr(game_json[["header"]][["competitions"]][["date"]], 0, 10))
          complete_statistics_df$game_id <- as.integer(game_id)
          
          suppressWarnings(
            complete_statistics_df <- complete_statistics_df %>%
              tidyr::separate("fieldGoalsMade-fieldGoalsAttempted",
                              into = c("fieldGoalsMade", "fieldGoalsAttempted"),
                              sep = "-") %>%
              tidyr::separate("freeThrowsMade-freeThrowsAttempted",
                              into = c("freeThrowsMade", "freeThrowsAttempted"),
                              sep = "-") %>%
              tidyr::separate("threePointFieldGoalsMade-threePointFieldGoalsAttempted",
                              into = c("threePointFieldGoalsMade", "threePointFieldGoalsAttempted"),
                              sep = "-") %>%
              dplyr::mutate(dplyr::across(c(
                "fieldGoalPct",
                "freeThrowPct",
                "threePointFieldGoalPct"
              ), ~as.numeric(.x))) %>%
              dplyr::mutate(dplyr::across(dplyr::any_of(c(
                "assists",
                "blocks",
                "defensiveRebounds",
                "fieldGoalsMade",
                "fieldGoalsAttempted",
                "flagrantFouls",
                "fouls",
                "freeThrowsMade",
                "freeThrowsAttempted",
                "largestLead",
                "offensiveRebounds",
                "steals",
                "teamTurnovers",
                "technicalFouls",
                "threePointFieldGoalsMade",
                "threePointFieldGoalsAttempted",
                "totalRebounds",
                "totalTechnicalFouls",
                "totalTurnovers",
                "turnovers"
              )), ~as.integer(.x)))
          )
          team_box_score <- complete_statistics_df %>%
            janitor::clean_names() %>%
            dplyr::select(dplyr::any_of(c(
              "game_id",
              "season",
              "season_type",
              "game_date",
              "team_id",
              "team_uid",
              "team_slug",
              "team_location",
              "team_name",
              "team_abbreviation",
              "team_display_name",
              "team_short_display_name",
              "team_color",
              "team_alternate_color",
              "team_logo",
              "team_home_away",
              "team_score",
              "team_winner")),
              tidyr::everything()) %>%
            make_wehoop_data("ESPN WNBA Team Box Information from ESPN.com", Sys.time())
        }
      }
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no team box score data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(team_box_score)
}

#' Get ESPN's WNBA player box data
#' @author Saiem Gilani
#' @param game_id Game ID
#' @return Returns a player boxscore data frame
#' @keywords WNBA Player Box
#' @importFrom rlang .data
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows
#' @importFrom tidyr unnest unnest_wider everything
#' @import rvest
#' @export
#' @examples
#' \donttest{
#'   try(espn_wnba_player_box(game_id = 401244185))
#' }
#' 
espn_wnba_player_box <- function(game_id){
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  play_base_url <- "http://site.api.espn.com/apis/site/v2/sports/basketball/wnba/summary?"
  
  ## Inputs
  ## game_id
  full_url <- paste0(play_base_url,
                     "event=", game_id)
  res <- httr::RETRY(
    "GET", full_url
  )
  
  # Check the result
  check_status(res)
  resp <- res %>%
    httr::content(as = "text", encoding = "UTF-8") 
  
  #---- Player Box ------
  tryCatch(
    expr = {
      
      game_json <- resp %>% 
        jsonlite::fromJSON(flatten = TRUE)
      
      players_box_score_df <- game_json[["boxscore"]][["players"]] %>%
        jsonlite::toJSON() %>%
        jsonlite::fromJSON(flatten = TRUE) %>%
        as.data.frame()
      
      gameId <- as.integer(game_json[["header"]][["id"]])
      season <- game_json[["header"]][["season"]][["year"]]
      season_type <- game_json[["header"]][["season"]][["type"]]
      game_date <- as.Date(substr(game_json[["header"]][["competitions"]][["date"]], 0, 10))
      boxScoreAvailable <- game_json[["header"]][["competitions"]][["boxscoreAvailable"]]
      
      boxScoreSource <- game_json[["header"]][["competitions"]][["boxscoreSource"]]
      if (boxScoreAvailable == TRUE &&
          length(players_box_score_df[["statistics"]][[1]][["athletes"]][[1]]) > 1) {
        players_df <- players_box_score_df %>%
          tidyr::unnest("statistics") %>%
          tidyr::unnest("athletes")
        if (length(players_box_score_df[["statistics"]]) > 1 &&
            length(players_df$stats[[1]]) > 0) {
          players_df <- jsonlite::fromJSON(jsonlite::toJSON(game_json[["boxscore"]][["players"]]), flatten = TRUE) %>%
            tidyr::unnest("statistics") %>%
            tidyr::unnest("athletes")
          stat_cols <- players_df$names[[1]]
          stat_cols <- players_df$keys[[1]]
          stats <- players_df$stats
          
          stats_df <- as.data.frame(do.call(rbind,stats))
          colnames(stats_df) <- stat_cols
          suppressWarnings(
            stats_df <- stats_df %>%
              tidyr::separate("fieldGoalsMade-fieldGoalsAttempted",
                              into = c("fieldGoalsMade", "fieldGoalsAttempted"),
                              sep = "-") %>%
              tidyr::separate("freeThrowsMade-freeThrowsAttempted",
                              into = c("freeThrowsMade", "freeThrowsAttempted"),
                              sep = "-") %>%
              tidyr::separate("threePointFieldGoalsMade-threePointFieldGoalsAttempted",
                              into = c("threePointFieldGoalsMade", "threePointFieldGoalsAttempted"),
                              sep = "-") %>%
              dplyr::mutate(dplyr::across(dplyr::any_of(c(
                "minutes",
                "fieldGoalPct",
                "freeThrowPct",
                "threePointFieldGoalPct"
              )), ~as.numeric(.x))) %>%
              dplyr::mutate(dplyr::across(dplyr::any_of(c(
                "assists",
                "blocks",
                "defensiveRebounds",
                "fieldGoalsMade",
                "fieldGoalsAttempted",
                "flagrantFouls",
                "fouls",
                "freeThrowsMade",
                "freeThrowsAttempted",
                "offensiveRebounds",
                "steals",
                "teamTurnovers",
                "technicalFouls",
                "threePointFieldGoalsMade",
                "threePointFieldGoalsAttempted",
                "rebounds",
                "totalTechnicalFouls",
                "totalTurnovers",
                "turnovers",
                "points"
              )), ~as.integer(.x)))
          )
          players_df <- players_df %>%
            dplyr::filter(!.data$didNotPlay) %>%
            dplyr::select(dplyr::any_of(c(
              "starter",
              "ejected", 
              "didNotPlay",
              "active",
              "athlete.displayName",
              "athlete.jersey",
              "athlete.id",
              "athlete.shortName",
              "athlete.headshot.href",
              "athlete.position.name",
              "athlete.position.abbreviation",
              "team.shortDisplayName",
              "team.name",
              "team.logo",
              "team.id",
              "team.abbreviation",
              "team.color",
              "team.alternateColor"
            )))
          
          players_df <- dplyr::bind_cols(stats_df,players_df) %>%
            dplyr::select(dplyr::any_of(c(
              "athlete.displayName",
              "team.shortDisplayName")), 
              tidyr::everything()) %>% 
            janitor::clean_names() %>%
            dplyr::mutate(
              game_id = gameId,
              season = season,
              season_type = season_type,
              game_date = game_date)
          
          player_box_score <- players_df %>% 
            dplyr::select(dplyr::any_of(c(
              "game_id",
              "season",
              "season_type",
              "game_date",
              "athlete_id",
              "athlete_display_name",
              "team_id",
              "team_name",
              "team_short_display_name",
              "minutes",
              "field_goals_made",
              "field_goals_attempted",
              "three_point_field_goals_made",
              "three_point_field_goals_attempted",
              "free_throws_made",
              "free_throws_attempted",
              "offensive_rebounds",
              "defensive_rebounds",
              "rebounds",
              "assists",
              "steals",
              "blocks",
              "turnovers",
              "fouls",
              "plus_minus",
              "points",
              "starter",
              "ejected",
              "did_not_play",
              "active",
              "athlete_jersey",
              "athlete_short_name",
              "athlete_headshot_href",
              "athlete_position_name",
              "athlete_position_abbreviation",
              "team_logo",
              "team_abbreviation",
              "team_color",
              "team_alternate_color"))) %>%
            make_wehoop_data("ESPN WNBA Player Box Information from ESPN.com", Sys.time())
        }
      }
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no player box score data for {game_id} available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  
  return(player_box_score)
}



#' **Get ESPN WNBA game rosters**
#' @author Saiem Gilani
#' @param game_id Game ID
#' @return A game rosters data frame
#' @keywords WNBA Game Roster
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows
#' @importFrom tidyr unnest unnest_wider everything
#' @import rvest
#' @export
#'
#' @examples
#' \donttest{
#'   try(espn_wnba_game_rosters(game_id = 401244185))
#' }
espn_wnba_game_rosters <- function(game_id) {
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  tryCatch(
    expr = {
      play_base_url <- paste0(
        "https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/events/",
        game_id, "/competitions/",
        game_id,"/competitors/")
      game_res <- httr::RETRY("GET", play_base_url)
      # Check the result
      check_status(game_res)
      
      game_resp <- game_res %>%
        httr::content(as = "text", encoding = "UTF-8")
      game_df <- jsonlite::fromJSON(game_resp)[["items"]] %>%
        jsonlite::toJSON() %>%
        jsonlite::fromJSON(flatten = TRUE) %>%
        dplyr::rename("team_statistics_href" = "statistics.$ref")
      
      colnames(game_df) <- gsub(".\\$ref","_href", colnames(game_df))
      
      game_df <- game_df %>%
        dplyr::rename(
          "team_id" = "id",
          "team_uid" = "uid")
      
      game_df$game_id <- game_id
      
      teams_df <- purrr::map_dfr(game_df$team_href, function(x){
        
        res <- httr::RETRY("GET", x)
        # Check the result
        check_status(res)
        
        team_df <- res %>%
          httr::content(as = "text", encoding = "UTF-8") %>%
          jsonlite::fromJSON(simplifyDataFrame = FALSE, simplifyVector = FALSE, simplifyMatrix = FALSE)
        
        team_df[["links"]] <- NULL
        team_df[["injuries"]] <- NULL
        team_df[["record"]] <- NULL
        team_df[["athletes"]] <- NULL
        team_df[["venue"]] <- NULL
        team_df[["groups"]] <- NULL
        team_df[["ranks"]] <- NULL
        team_df[["statistics"]] <- NULL
        team_df[["leaders"]] <- NULL
        team_df[["links"]] <- NULL
        team_df[["notes"]] <- NULL
        team_df[["franchise"]] <- NULL
        team_df[["againstTheSpreadRecords"]] <- NULL
        team_df[["oddsRecords"]] <- NULL
        team_df[["college"]] <- NULL
        team_df[["transactions"]] <- NULL
        team_df[["leaders"]] <- NULL
        team_df[["depthCharts"]] <- NULL
        team_df[["awards"]] <- NULL
        team_df[["events"]] <- NULL
        
        team_df <- team_df %>%
          purrr::map_if(is.list, as.data.frame) %>%
          as.data.frame() %>%
          dplyr::select(
            -dplyr::any_of(
              c("logos.width",
                "logos.height",
                "logos.alt",
                "logos.rel..full.",
                "logos.rel..default.",
                "logos.rel..scoreboard.",
                "logos.rel..scoreboard..1",
                "logos.rel..scoreboard.2",
                "logos.lastUpdated",
                "logos.width.1",
                "logos.height.1",
                "logos.alt.1",
                "logos.rel..full..1",
                "logos.rel..dark.",
                "logos.rel..dark..1",
                "logos.lastUpdated.1",
                "logos.width.2",
                "logos.height.2",
                "logos.alt.2",
                "logos.rel..full..2",
                "logos.rel..scoreboard.",
                "logos.lastUpdated.2",
                "logos.width.3",
                "logos.height.3",
                "logos.alt.3",
                "logos.rel..full..3",
                "logos.lastUpdated.3",
                "X.ref",
                "X.ref.1",
                "X.ref.2"))) %>%
          janitor::clean_names()
        
        colnames(team_df)[1:13] <- paste0("team_", colnames(team_df)[1:13])
        
        team_df <- team_df %>%
          dplyr::rename(
            "logo_href" = "logos_href",
            "logo_dark_href" = "logos_href_1") %>%
          dplyr::left_join(
            game_df %>%
              dplyr::select(
                "game_id",
                "team_id",
                "team_uid",
                "order",
                "homeAway",
                "winner",
                "roster_href"),
            by = c("team_id" = "team_id",
                   "team_uid" = "team_uid")
          )
        
      })
      
      ## Inputs
      ## game_id
      team_roster_df <- purrr::map_dfr(teams_df$team_id, function(x){
        
        res <- httr::RETRY("GET", paste0(play_base_url, x, "/roster"))
        
        # Check the result
        check_status(res)
        
        resp <- res %>%
          httr::content(as = "text", encoding = "UTF-8")
        
        raw_play_df <- jsonlite::fromJSON(resp)[["entries"]]
        
        raw_play_df <- raw_play_df %>%
          jsonlite::toJSON() %>%
          jsonlite::fromJSON(flatten = TRUE) %>%
          dplyr::mutate(team_id = x) %>%
          dplyr::select(-"period", -"forPlayerId", -"active")
        
        raw_play_df <- raw_play_df %>%
          dplyr::left_join(teams_df, by = c("team_id" = "team_id"))
        
      })
      
      colnames(team_roster_df) <- gsub(".\\$ref","_href", colnames(team_roster_df))
      
      athlete_roster_df <- purrr::map_dfr(team_roster_df$athlete_href, function(x){
        
        res <- httr::RETRY("GET", x)
        
        # Check the result
        check_status(res)
        
        resp <- res %>%
          httr::content(as = "text", encoding = "UTF-8")
        
        raw_play_df <- jsonlite::fromJSON(resp, flatten = TRUE)
        raw_play_df[["links"]] <- NULL
        raw_play_df[["injuries"]] <- NULL
        raw_play_df[["teams"]] <- NULL
        raw_play_df[["team"]] <- NULL
        raw_play_df[["college"]] <- NULL
        raw_play_df[["proAthlete"]] <- NULL
        raw_play_df[["statistics"]] <- NULL
        raw_play_df[["notes"]] <- NULL
        raw_play_df[["eventLog"]] <- NULL
        raw_play_df[["$ref"]] <- NULL
        raw_play_df[["position"]][["$ref"]] <- NULL
        birth_place <- raw_play_df %>% 
          purrr::pluck("birthPlace") %>% 
          as.data.frame()
        raw_play_df[["birthPlace"]] <- NULL
        
        raw_play_df2 <- raw_play_df %>%
          as.data.frame() %>%
          dplyr::bind_cols(birth_place) %>% 
          dplyr::mutate(id = as.integer(.data$id)) %>%
          dplyr::rename(
            "athlete_id" = "id",
            "athlete_uid" = "uid",
            "athlete_guid" = "guid",
            "athlete_type" = "type",
            "athlete_display_name" = "displayName"
          )
        
        raw_play_df2 <- raw_play_df2 %>%
          dplyr::left_join(team_roster_df, by = c("athlete_id" = "playerId"))
        
      })
      
      colnames(athlete_roster_df) <- gsub(".\\$ref","_href", colnames(athlete_roster_df))
      
      athlete_roster_df <- athlete_roster_df %>%
        janitor::clean_names() %>%
        dplyr::rename(
          "birth_place_city" = "city",
          "birth_place_state" = "state",
          "birth_place_country" = "country") %>% 
        dplyr::select(-dplyr::any_of(c(
          "x_ref",
          "x_ref_1",
          "contract_ref",
          "contract_ref_1",
          "contract_ref_2",
          "draft_ref",
          "draft_ref_1",
          "athlete_href",
          "position_ref",
          "position_href",
          "roster_href",
          "statistics_href"))) %>%
        make_wehoop_data("ESPN WNBA Game Roster Information from ESPN.com",Sys.time())
      
    },
    error = function(e) {
      message(
        glue::glue(
          "{Sys.time()}: Invalid arguments or no game roster data for {game_id} available!"
        )
      )
    },
    warning = function(w) {
      
    },
    finally = {
      
    }
  )
  return(athlete_roster_df)
}


#' Get ESPN's WNBA team names and ids
#' @author Saiem Gilani
#' @keywords WNBA Teams
#' @return Returns a tibble
#' @importFrom rlang .data
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows row_number group_by mutate as_tibble ungroup
#' @importFrom tidyr unnest unnest_wider everything pivot_wider
#' @import rvest
#' @export
#' @examples
#' \donttest{
#'   try(espn_wnba_teams())
#' }

espn_wnba_teams <- function(){
  old <- options(list(stringsAsFactors = FALSE, scipen = 999))
  on.exit(options(old))
  play_base_url <- "http://site.api.espn.com/apis/site/v2/sports/basketball/wnba/teams?limit=1000"
  res <- httr::RETRY(
    "GET", play_base_url
  )
  
  # Check the result
  check_status(res)
  resp <- res %>%
    httr::content(as = "text", encoding = "UTF-8") 
  
  ## Inputs
  ## game_id
  leagues <- jsonlite::fromJSON(resp)[["sports"]][["leagues"]][[1]][['teams']][[1]][['team']] %>%
    dplyr::group_by(.data$id) %>%
    tidyr::unnest_wider("logos", names_sep = "_") %>%
    tidyr::unnest_wider("logos_href", names_sep = "_") %>%
    dplyr::select(
      -"logos_width",
      -"logos_height",
      -"logos_alt", 
      -"logos_rel") %>%
    dplyr::ungroup()
  
  wnba_teams <- leagues %>%
    dplyr::select(
      "id", 
      "location", 
      "name", 
      "displayName", 
      "shortDisplayName", 
      "abbreviation", 
      "color", 
      "alternateColor", 
      "logos_href_1", 
      "logos_href_2") %>%
    dplyr::rename(
      "logo" = "logos_href_1",
      "logo_dark" = "logos_href_2",
      "mascot" = "name",
      "team" = "location",
      "team_id" = "id",
      "alternate_color" = "alternateColor",
      "short_name" = "shortDisplayName",
      "display_name" = "displayName") %>%
    make_wehoop_data("ESPN WNBA Teams Information from ESPN.com",Sys.time())
  
  return(wnba_teams)
}

#' Get WNBA schedule for a specific year/date from ESPN's API
#'
#' @param season Either numeric or character
#' @author Saiem Gilani.
#' @return Returns a tibble
#' @import utils
#' @import rvest
#' @importFrom dplyr select rename any_of mutate
#' @importFrom jsonlite fromJSON
#' @importFrom tidyr unnest_wider unchop hoist
#' @importFrom glue glue
#' @import rvest
#' @export
#' @examples
#' # Get schedule from date 2022-08-31
#' \donttest{
#'   try(espn_wnba_scoreboard (season = "20220831"))
#' }

espn_wnba_scoreboard <- function(season){
  
  # message(glue::glue("Returning data for {season}!"))
  
  max_year <- substr(Sys.Date(), 1,4)
  
  if(!(as.integer(substr(season, 1, 4)) %in% c(2001:max_year))){
    message(paste("Error: Season must be between 2001 and", max_year))
  }
  
  # year > 2000
  season <- as.character(season)
  
  season_dates <- season
  
  schedule_api <- paste0("http://site.api.espn.com/apis/site/v2/sports/basketball/wnba/scoreboard?limit=1000&dates=",
                         season_dates)
  res <- httr::RETRY(
    "GET", schedule_api
  )
  
  # Check the result
  check_status(res)
  
  tryCatch(
    expr = {
      raw_sched <- res %>%
        httr::content(as = "text", encoding = "UTF-8") %>%
        jsonlite::fromJSON(simplifyDataFrame = FALSE, simplifyVector = FALSE, simplifyMatrix = FALSE)
      
      wnba_data <- raw_sched[["events"]] %>%
        tibble::tibble(data = .data$.) %>%
        tidyr::unnest_wider("data") %>%
        tidyr::unchop("competitions") %>%
        dplyr::select(
          -"id",
          -"uid",
          -"date",
          -"status") %>%
        tidyr::unnest_wider("competitions") %>%
        dplyr::rename(
          "matchup" = "name",
          "matchup_short" = "shortName",
          "game_id" = "id",
          "game_uid" = "uid",
          "game_date" = "date"
        ) %>%
        tidyr::hoist(.data$status,
                     status_name = list("type", "name")) %>%
        dplyr::select(!dplyr::any_of(
          c(
            "timeValid",
            "neutralSite",
            "conferenceCompetition",
            "recent",
            "venue",
            "type"
          )
        )) %>%
        tidyr::unnest_wider("season", names_sep="_") %>%
        dplyr::rename("season" = "season_year") %>%
        dplyr::select(-dplyr::any_of("status")) 
      wnba_data <- wnba_data %>% 
        tidyr::hoist(
          .data$competitors,
          homeAway = list(1,"homeAway")
        )
      wnba_data <- wnba_data %>%
        tidyr::hoist(
          .data$competitors,
          team1_team_name = list(1, "team", "name"),
          team1_team_logo = list(1, "team", "logo"),
          team1_team_abb = list(1, "team", "abbreviation"),
          team1_team_id = list(1, "team", "id"),
          team1_team_location = list(1, "team", "location"),
          team1_team_full = list(1, "team", "displayName"),
          team1_team_color = list(1, "team", "color"),
          team1_score = list(1, "score"),
          team1_win = list(1, "winner"),
          team1_record = list(1, "records", 1, "summary"),
          # away team
          team2_team_name = list(2, "team", "name"),
          team2_team_logo = list(2, "team", "logo"),
          team2_team_abb = list(2, "team", "abbreviation"),
          team2_team_id = list(2, "team", "id"),
          team2_team_location = list(2, "team", "location"),
          team2_team_full = list(2, "team", "displayName"),
          team2_team_color = list(2, "team", "color"),
          team2_score = list(2, "score"),
          team2_win = list(2, "winner"),
          team2_record = list(2, "records", 1, "summary")) 
      
      
      wnba_data <- wnba_data %>% 
        dplyr::mutate(
          home_team_name = ifelse(.data$homeAway=="home",.data$team1_team_name, .data$team2_team_name),
          home_team_logo = ifelse(.data$homeAway=="home",.data$team1_team_logo, .data$team2_team_logo),
          home_team_abb = ifelse(.data$homeAway=="home",.data$team1_team_abb, .data$team2_team_abb),
          home_team_id = ifelse(.data$homeAway=="home",.data$team1_team_id, .data$team2_team_id),
          home_team_location = ifelse(.data$homeAway=="home",.data$team1_team_location, .data$team2_team_location),
          home_team_full_name = ifelse(.data$homeAway=="home",.data$team1_team_full, .data$team2_team_full),
          home_team_color = ifelse(.data$homeAway=="home",.data$team1_team_color, .data$team2_team_color),
          home_score = ifelse(.data$homeAway=="home",.data$team1_score, .data$team2_score),
          home_win = ifelse(.data$homeAway=="home",.data$team1_win, .data$team2_win),
          home_record = ifelse(.data$homeAway=="home",.data$team1_record, .data$team2_record),
          away_team_name = ifelse(.data$homeAway=="away",.data$team1_team_name, .data$team2_team_name),
          away_team_logo = ifelse(.data$homeAway=="away",.data$team1_team_logo, .data$team2_team_logo),
          away_team_abb = ifelse(.data$homeAway=="away",.data$team1_team_abb, .data$team2_team_abb),
          away_team_id = ifelse(.data$homeAway=="away",.data$team1_team_id, .data$team2_team_id),
          away_team_location = ifelse(.data$homeAway=="away",.data$team1_team_location, .data$team2_team_location),
          away_team_full_name = ifelse(.data$homeAway=="away",.data$team1_team_full, .data$team2_team_full),
          away_team_color = ifelse(.data$homeAway=="away",.data$team1_team_color, .data$team2_team_color),
          away_score = ifelse(.data$homeAway=="away",.data$team1_score, .data$team2_score),
          away_win = ifelse(.data$homeAway=="away",.data$team1_win, .data$team2_win),
          away_record = ifelse(.data$homeAway=="away",.data$team1_record, .data$team2_record)
        )
      
      wnba_data <- wnba_data %>%
        dplyr::mutate(
          home_win = as.integer(.data$home_win),
          away_win = as.integer(.data$away_win),
          home_score = as.integer(.data$home_score),
          away_score = as.integer(.data$away_score))
      wnba_data <- wnba_data %>% 
        dplyr::select(-dplyr::any_of(dplyr::starts_with("team1")),
                      -dplyr::any_of(dplyr::starts_with("team2")),
                      -dplyr::any_of(c("homeAway")))
      
      
      
      if ("broadcasts" %in% names(wnba_data) && !any(is.na(wnba_data[['broadcasts']]))) {
        wnba_data %>%
          tidyr::hoist(
            .data$broadcasts,
            broadcast_market = list(1, "market"),
            broadcast_name = list(1, "names", 1)) %>%
          dplyr::select(!where(is.list)) %>%
          janitor::clean_names() %>%
          make_wehoop_data("ESPN WNBA Scoreboard Information from ESPN.com",Sys.time())
      } else {
        wnba_data %>%
          dplyr::select(!where(is.list)) %>%
          janitor::clean_names() %>%
          make_wehoop_data("ESPN WNBA Scoreboard Information from ESPN.com",Sys.time())
      }
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no scoreboard data available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
}

#' Get ESPN WNBA Standings
#'
#' @author Geoff Hutchinson
#' @param year Either numeric or character (YYYY)
#' @return Returns a tibble
#' @keywords WNBA Standings
#' @importFrom rlang .data
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr select rename
#' @importFrom tidyr pivot_wider
#' @importFrom data.table rbindlist
#' @export
#' @examples
#' \donttest{
#'   try(espn_wnba_standings(year = 2021))
#' }
espn_wnba_standings <- function(year){
  
  standings_url <- "https://site.web.api.espn.com/apis/v2/sports/basketball/wnba/standings?region=us&lang=en&contentorigin=espn&type=0&level=1&sort=winpercent%3Adesc%2Cwins%3Adesc%2Cgamesbehind%3Aasc&"
  
  ## Inputs
  ## year
  full_url <- paste0(standings_url,
                     "season=", year)
  
  res <- httr::RETRY("GET", full_url)
  
  # Check the result
  check_status(res)
  tryCatch(
    expr = {
      resp <- res %>%
        httr::content(as = "text", encoding = "UTF-8")
      
      raw_standings <- jsonlite::fromJSON(resp)[["standings"]]
      
      #Create a dataframe of all NBA teams by extracting from the raw_standings file
      
      teams <- raw_standings[["entries"]][["team"]]
      
      teams <- teams %>%
        dplyr::select(
          "id", 
          "displayName") %>%
        dplyr::rename(
          "team_id" = "id",
          "team" = "displayName")
      
      #creating a dataframe of the WNBA raw standings table from ESPN
      
      standings_df <- raw_standings[["entries"]][["stats"]]
      
      standings_data <- data.table::rbindlist(standings_df, fill = TRUE, idcol = T)
      
      #Use the following code to replace NA's in the dataframe with the correct corresponding values and removing all unnecessary columns
      
      standings_data$value <- ifelse(is.na(standings_data$value) & !is.na(standings_data$summary), standings_data$summary, standings_data$value)
      
      standings_data <- standings_data %>%
        dplyr::select(
          ".id", 
          "type", 
          "value")
      
      #Use pivot_wider to transpose the dataframe so that we now have a standings row for each team
      
      standings_data <- standings_data %>%
        tidyr::pivot_wider(names_from = "type", values_from = "value")
      
      standings_data <- standings_data %>%
        dplyr::select(-".id")
      
      #joining the 2 dataframes together to create a standings table
      
      standings <- cbind(teams, standings_data) %>%
        make_wehoop_data("ESPN WNBA Standings Information from ESPN.com",Sys.time())
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}: Invalid arguments or no standings data available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
    
  )
  return(standings)
}

#' @import utils
utils::globalVariables(c("where"))

#' @title
#' **Get ESPN WNBA team stats data**
#' @author Saiem Gilani
#' @param team_id Team ID
#' @param year Year
#' @param season_type (character, default: regular): Season type - regular or postseason
#' @param total (boolean, default: FALSE): Totals
#' @keywords WNBA Team Stats
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr filter select rename bind_cols bind_rows
#' @importFrom tidyr unnest unnest_wider everything
#' @export
#' @return Returns a tibble with the team stats data
#'
#' @examples
#' \donttest{
#'   try(espn_wnba_team_stats(team_id = 18, year = 2020))
#' }

espn_wnba_team_stats <- function(team_id, year, season_type='regular', total=FALSE){
  if (!(tolower(season_type) %in% c("regular","postseason"))) {
    # Check if season_type is appropriate, if not regular
    cli::cli_abort("Enter valid season_type: regular or postseason")
  }
  s_type <- ifelse(season_type == "postseason", 3, 2)
  
  base_url <- "https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/"
  
  totals <- ifelse(total == TRUE, 0, "")
  full_url <- paste0(
    base_url,
    year,
    '/types/',s_type,
    '/teams/',team_id,
    '/statistics/', totals
  )
  
  df <- data.frame()
  tryCatch(
    expr = {
      
      # Create the GET request and set response as res
      res <- httr::RETRY("GET", full_url)
      
      # Check the result
      check_status(res)
      
      # Get the content and return result as data.frame
      df <- res %>%
        httr::content(as = "text", encoding = "UTF-8") %>%
        jsonlite::fromJSON() 
      
      
      team_url <- df[["team"]][["$ref"]]
      
      # Create the GET request and set response as res
      team_res <- httr::RETRY("GET", team_url)
      
      # Check the result
      check_status(team_res)
      
      # Get the content and return result as data.frame
      team_df <- team_res %>%
        httr::content(as = "text", encoding = "UTF-8") %>%
        jsonlite::fromJSON(simplifyDataFrame = FALSE, simplifyVector = FALSE, simplifyMatrix = FALSE) 
      
      team_df[["links"]] <- NULL
      team_df[["injuries"]] <- NULL
      team_df[["record"]] <- NULL
      team_df[["athletes"]] <- NULL 
      team_df[["venue"]] <- NULL 
      team_df[["groups"]] <- NULL 
      team_df[["ranks"]] <- NULL 
      team_df[["statistics"]] <- NULL 
      team_df[["leaders"]] <- NULL 
      team_df[["links"]] <- NULL 
      team_df[["notes"]] <- NULL 
      team_df[["franchise"]] <- NULL 
      team_df[["record"]] <- NULL
      team_df[["college"]] <- NULL                              
      
      team_df <- team_df %>%
        purrr::map_if(is.list,as.data.frame) %>% 
        as.data.frame() %>% 
        dplyr::select(
          -dplyr::any_of(
            c("logos.width",  
              "logos.height",
              "logos.alt",
              "logos.rel..full.",
              "logos.rel..default.", 
              "logos.lastUpdated",
              "logos.width.1",
              "logos.height.1",
              "logos.alt.1",
              "logos.rel..full..1",
              "logos.rel..dark.",
              "logos.lastUpdated.1",
              "X.ref",
              "X.ref.1",
              "X.ref.2",
              "X.ref.3"))) %>% 
        janitor::clean_names() 
      colnames(team_df)[1:14] <- paste0("team_",colnames(team_df)[1:14])
      
      team_df <- team_df %>%   
        dplyr::rename(
          "logo_href" = "logos_href",
          "logo_dark_href" = "logos_href_1")
      
      df <- df %>%
        purrr::pluck("splits") %>%
        purrr::pluck("categories") %>%
        tidyr::unnest("stats", names_sep="_")
      df <- df %>%
        dplyr::mutate(
          stats_category_name = glue::glue("{.data$name}_{.data$stats_name}")) %>%
        dplyr::select(
          "stats_category_name", 
          "stats_value") %>%
        tidyr::pivot_wider(
          names_from = "stats_category_name",
          values_from = "stats_value",
          values_fn = dplyr::first) %>%
        janitor::clean_names()
      
      df <- team_df %>% 
        dplyr::bind_cols(df)
      df <- df %>%
        make_wehoop_data("ESPN WNBA Team Season Stats from ESPN.com",Sys.time())
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}:Invalid arguments or no team season stats data available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df)
}

#' @title
#' **Get ESPN WNBA player stats data**
#' @author Saiem Gilani
#' @param athlete_id Athlete ID
#' @param year Year
#' @param season_type (character, default: regular): Season type - regular or postseason
#' @param total (boolean, default: FALSE): Totals
#' @keywords WNBA Player Stats
#' @export
#' @return Returns a tibble with the player stats data
#'
#' @examples
#' \donttest{
#'   try(espn_wnba_player_stats(athlete_id = 2529130, year = 2022))
#' }

espn_wnba_player_stats <- function(athlete_id, year, season_type='regular', total=FALSE){
  if (!(tolower(season_type) %in% c("regular","postseason"))) {
    # Check if season_type is appropriate, if not regular
    cli::cli_abort("Enter valid season_type: regular or postseason")
  }
  s_type <- ifelse(season_type == "postseason", 3, 2)
  
  base_url <- "https://sports.core.api.espn.com/v2/sports/basketball/leagues/wnba/seasons/"
  
  totals <- ifelse(total == TRUE, 0, "")
  full_url <- paste0(
    base_url,
    year,
    '/types/',s_type,
    '/athletes/', athlete_id,
    '/statistics/', totals
  )
  athlete_url <- paste0(
    base_url,
    year,
    '/athletes/', athlete_id
  )
  df <- data.frame()
  tryCatch(
    expr = {
      
      # Create the GET request and set response as res
      res <- httr::RETRY("GET", full_url)
      
      # Check the result
      check_status(res)
      # Create the GET request and set response as res
      athlete_res <- httr::RETRY("GET", athlete_url)
      
      # Check the result
      check_status(athlete_res)
      
      athlete_df <- athlete_res %>%
        httr::content(as = "text", encoding = "UTF-8") %>%
        jsonlite::fromJSON(simplifyDataFrame = FALSE, simplifyVector = FALSE, simplifyMatrix = FALSE) 
      
      team_url <- athlete_df[["team"]][["$ref"]]
      
      # Create the GET request and set response as res
      team_res <- httr::RETRY("GET", team_url)
      
      # Check the result
      check_status(team_res)
      
      team_df <- team_res %>%
        httr::content(as = "text", encoding = "UTF-8") %>%
        jsonlite::fromJSON(simplifyDataFrame = FALSE, simplifyVector = FALSE, simplifyMatrix = FALSE) 
      
      team_df[["links"]] <- NULL
      team_df[["injuries"]] <- NULL
      team_df[["record"]] <- NULL
      team_df[["athletes"]] <- NULL 
      team_df[["venue"]] <- NULL 
      team_df[["groups"]] <- NULL 
      team_df[["ranks"]] <- NULL 
      team_df[["statistics"]] <- NULL 
      team_df[["leaders"]] <- NULL 
      team_df[["links"]] <- NULL 
      team_df[["notes"]] <- NULL 
      team_df[["franchise"]] <- NULL 
      team_df[["record"]] <- NULL
      team_df[["college"]] <- NULL                              
      
      team_df <- team_df %>%
        purrr::map_if(is.list,as.data.frame) %>% 
        as.data.frame() %>% 
        dplyr::select(
          -dplyr::any_of(
            c("logos.width",  
              "logos.height",
              "logos.alt",
              "logos.rel..full.",
              "logos.rel..default.", 
              "logos.lastUpdated",
              "logos.width.1",
              "logos.height.1",
              "logos.alt.1",
              "logos.rel..full..1",
              "logos.rel..dark.",
              "logos.lastUpdated.1",
              "X.ref",
              "X.ref.1",
              "X.ref.2",
              "X.ref.3"))) %>% 
        janitor::clean_names() 
      colnames(team_df)[1:14] <- paste0("team_",colnames(team_df)[1:14])
      
      team_df <- team_df %>%   
        dplyr::rename(
          "logo_href" = "logos_href",
          "logo_dark_href" = "logos_href_1")
      
      athlete_df[["links"]] <- NULL
      athlete_df[["injuries"]] <- NULL
      athlete_df[["birthPlace"]] <- NULL
      
      athlete_df <- athlete_df %>% 
        purrr::map_if(is.list, as.data.frame) %>% 
        tibble::tibble(data=.data$.)
      athlete_df <- athlete_df$data %>%
        as.data.frame() %>% 
        dplyr::select(-dplyr::any_of(c("X.ref","X.ref.1","X.ref.2","X.ref.3","X.ref.4","X.ref.5","X.ref.6","X.ref.7","position.X.ref"))) %>% 
        janitor::clean_names() %>% 
        dplyr::rename(
          "athlete_id" = "id",
          "athlete_uid" = "uid",
          "athlete_guid" = "guid",
          "athlete_type" = "type")
      
      
      # Get the content and return result as data.frame
      df <- res %>%
        httr::content(as = "text", encoding = "UTF-8") %>%
        jsonlite::fromJSON() %>%
        purrr::pluck("splits") %>%
        purrr::pluck("categories") %>%
        tidyr::unnest("stats", names_sep="_")
      df <- df %>%
        dplyr::mutate(
          stats_category_name = glue::glue("{.data$name}_{.data$stats_name}")) %>%
        dplyr::select(
          "stats_category_name", 
          "stats_value") %>%
        tidyr::pivot_wider(
          names_from = "stats_category_name",
          values_from = "stats_value",
          values_fn = dplyr::first) %>%
        janitor::clean_names()
      df <- athlete_df %>% 
        dplyr::bind_cols(df) %>% 
        dplyr::bind_cols(team_df)
      df <- df %>%
        make_wehoop_data("ESPN WNBA Player Season Stats from ESPN.com",Sys.time())
      
    },
    error = function(e) {
      message(glue::glue("{Sys.time()}:Invalid arguments or no player season stats data available!"))
    },
    warning = function(w) {
    },
    finally = {
    }
  )
  return(df)
}

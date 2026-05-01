.wnba_headers <-
  function(url = "https://stats.wnba.com/stats/leaguegamelog?Counter=1000&Season=2019-20&Direction=DESC&LeagueID=00&PlayerOrTeam=P&SeasonType=Regular%20Season&Sorter=DATE",
           params = list(),
           ...,
           origin = "https://stats.wnba.com",
           referer = "https://www.wnba.com/") {

    headers <- c(
      `Host` = 'stats.wnba.com',
      `User-Agent` = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36',
      `Accept` = 'application/json, text/plain, */*',
      `Accept-Language` = 'en-US,en;q=0.5',
      `Accept-Encoding` = 'gzip, deflate, br',
      `x-nba-stats-origin` = 'stats',
      `x-nba-stats-token` = 'true',
      `Connection` = 'keep-alive',
      `Origin` = origin,
      `Referer` = referer,
      `Pragma` = 'no-cache',
      `Cache-Control` = 'no-cache'
    )

    res <- .retry_request(url, params = params, headers = headers)

    json <- res %>%
      .resp_text() %>%
      jsonlite::fromJSON(simplifyVector = TRUE)

    return(json)
  }

wnba_headers_params <- function(
    origin = "https://stats.wnba.com",
    referer="https://www.wnba.com/"){
  headers <- c(
    `Host` = 'stats.wnba.com',
    `User-Agent` = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36',
    `Accept` = 'application/json, text/plain, */*',
    `Accept-Language` = 'en-US,en;q=0.5',
    `Accept-Encoding` = 'gzip, deflate, br',
    `x-nba-stats-origin` = 'stats',
    `x-nba-stats-token` = 'true',
    `Connection` = 'keep-alive',
    `Origin` = origin,
    `Referer` = referer,
    `Pragma` = 'no-cache',
    `Cache-Control` = 'no-cache'
  )
  return(headers)
}

#' @title
#' **Retry http request with proxy**
#' @description
#' This is a thin wrapper on `httr2::req_retry()` via the internal
#' `.retry_request()` helper. It applies the WNBA Stats API headers (origin,
#' referer, x-nba-stats-* tokens) and decodes the JSON response.
#' @param url Request url
#' @param params list of params
#' @param origin Origin url
#' @param referer Referer url
#' @param ... currently unused (preserved for backwards compatibility with
#'   callers that previously passed `httr::use_proxy()` etc.)
#' @keywords internal
request_with_proxy <- function(url,
                               params = list(),
                               origin = "https://stats.wnba.com",
                               referer = "https://www.wnba.com/",
                               ...){
  headers <- c(
    `Host` = 'stats.wnba.com',
    `User-Agent` = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0',
    `Accept` = 'application/json, text/plain, */*',
    `Accept-Language` = 'en-US,en;q=0.5',
    `Accept-Encoding` = 'gzip, deflate, br',
    `x-nba-stats-origin` = 'stats',
    `x-nba-stats-token` = 'true',
    `Connection` = 'keep-alive',
    `Origin` = origin,
    `Referer` = referer,
    `Pragma` = 'no-cache',
    `Cache-Control` = 'no-cache'
  )

  resp <- .retry_request(url, params = params, headers = headers)

  json <- resp %>%
    .resp_text() %>%
    jsonlite::fromJSON()

  return(json)
}

wnba_live_endpoint <- function(endpoint){
  base_url = paste0("https://cdn.wnba.com/static/json/liveData/", endpoint)
  return(base_url)
}

wnba_endpoint <- function(endpoint){
  all_endpoints = c(
    'alltimeleadersgrids',
    'assistleaders',
    'assisttracker',
    'boxscoreadvancedv2',
    'boxscoreadvancedv3',
    'boxscoredefensive',
    'boxscorefourfactorsv2',
    'boxscorefourfactorsv3',
    'boxscorematchups',
    'boxscorematchupsv3',
    'boxscoremiscv2',
    'boxscoremiscv3',
    'boxscoreplayertrackv2',
    'boxscoreplayertrackv3',
    'boxscorescoringv2',
    'boxscorescoringv3',
    'boxscoresimilarityscore',
    'boxscoresummaryv2',
    'boxscoresummaryv3',
    'boxscoretraditionalv2',
    'boxscoretraditionalv3',
    'boxscoreusagev2',
    'boxscoreusagev3',
    'commonallplayers',
    'commonplayerinfo',
    'commonplayoffseries',
    'commonteamroster',
    'commonteamyears',
    'cumestatsplayer',
    'cumestatsplayergames',
    'cumestatsteam',
    'cumestatsteamgames',
    'defensehub',
    'draftboard',
    'draftcombinedrillresults',
    'draftcombinenonstationaryshooting',
    'draftcombineplayeranthro',
    'draftcombinespotshooting',
    'draftcombinestats',
    'drafthistory',
    'fantasywidget',
    'franchisehistory',
    'franchiseleaders',
    'franchiseplayers',
    'gamerotation',
    'glalumboxscoresimilarityscore',
    'homepageleaders',
    'homepagev2',
    'infographicfanduelplayer',
    'leaderstiles',
    'leaguedashlineups',
    'leaguedashplayerbiostats',
    'leaguedashplayerclutch',
    'leaguedashplayerptshot',
    'leaguedashplayershotlocations',
    'leaguedashplayerstats',
    'leaguedashptdefend',
    'leaguedashptstats',
    'leaguedashptteamdefend',
    'leaguedashteamclutch',
    'leaguedashoppptshot',
    'leaguedashteamptshot',
    'leaguedashteamshotlocations',
    'leaguedashteamstats',
    'leaguegamefinder',
    'leaguegamelog',
    'leagueleaders',
    'leaguelineupviz',
    'leagueplayerondetails',
    'leagueseasonmatchups',
    'leaguestandings',
    'leaguestandingsv3',
    'matchupsrollup',
    'playbyplay',
    'playbyplayv2',
    'playbyplayv3',
    'playerawards',
    'playercareerbycollege',
    'playercareerbycollegerollup',
    'playercareerstats',
    'playercompare',
    'playerdashptpass',
    'playerdashptreb',
    'playerdashptshotdefend',
    'playerdashptshots',
    'playerdashboardbyclutch',
    'playerdashboardbygamesplits',
    'playerdashboardbygeneralsplits',
    'playerdashboardbylastngames',
    'playerdashboardbyopponent',
    'playerdashboardbyshootingsplits',
    'playerdashboardbyteamperformance',
    'playerdashboardbyyearoveryear',
    'playerestimatedmetrics',
    'playerfantasyprofile',
    'playerfantasyprofilebargraph',
    'playergamelog',
    'playergamelogs',
    'playergamestreakfinder',
    'playernextngames',
    'playerprofilev2',
    'playervsplayer',
    'playoffpicture',
    'scoreboard',
    'scoreboardv2',
    'shotchartdetail',
    'shotchartleaguewide',
    'shotchartlineupdetail',
    'synergyplaytypes',
    'teamandplayersvsplayers',
    'teamdashlineups',
    'teamdashptpass',
    'teamdashptreb',
    'teamdashptshots',
    'teamdashboardbyclutch',
    'teamdashboardbygamesplits',
    'teamdashboardbygeneralsplits',
    'teamdashboardbylastngames',
    'teamdashboardbyopponent',
    'teamdashboardbyshootingsplits',
    'teamdashboardbyteamperformance',
    'teamdashboardbyyearoveryear',
    'teamdetails',
    'teamestimatedmetrics',
    'teamgamelog',
    'teamgamelogs',
    'teamgamestreakfinder',
    'teamhistoricalleaders',
    'teaminfocommon',
    'teamplayerdashboard',
    'teamplayeronoffdetails',
    'teamplayeronoffsummary',
    'teamvsplayer',
    'teamyearbyyearstats',
    'videodetails',
    'videoevents',
    'videostatus',
    'winprobabilitypbp'
  )
  base_url = paste0("https://stats.wnba.com/stats/", endpoint)
  return(base_url)
}


wnba_stats_map_result_sets <- function(resp) {
  if ("resultSets" %in% names(resp)) {
    df_list <- purrr::map(1:length(resp$resultSets$name), function(x){
      data <- resp$resultSets$rowSet[[x]] %>%
        data.frame(stringsAsFactors = F) %>%
        dplyr::as_tibble()
      
      json_names <- resp$resultSets$headers[[x]]
      colnames(data) <- json_names
      return(data)
    })
    names(df_list) <- resp$resultSets$name
    return(df_list)
  } else {
    df_list <- purrr::map(1:length(resp$resultSet$name), function(x){
      data <- resp$resultSet$rowSet[[x]] %>%
        data.frame(stringsAsFactors = F) %>%
        dplyr::as_tibble()
      
      json_names <- resp$resultSet$headers[[x]]
      colnames(data) <- json_names
      return(data)
    })
    names(df_list) <- resp$resultSet$name
    return(df_list)
  }
}


pad_id <- function(id = 1012100001) {
  zeros <- 10 - nchar(id)

  if (zeros == 0) {
    return(as.character(id))
  }

  start <- strrep("0", zeros)
  paste0(start, id)
}


.ncaa_headers <- function(url){
  headers <- c(
    `Host` = 'stats.ncaa.org',
    `User-Agent` = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
    `Accept` = 'application/json, text/html, text/plain, */*',
    `Accept-Language` = 'en-US,en;q=0.5',
    `Accept-Encoding` = 'gzip, deflate, br',
    `Pragma` = 'no-cache',
    `Cache-Control` = 'no-cache'
  )
  return(headers)
}

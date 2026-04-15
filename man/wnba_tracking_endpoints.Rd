\name{wnba_leaguedashptdefend}
\alias{wnba_leaguedashptdefend}
\alias{wnba_leaguedashptstats}
\alias{wnba_leaguedashptteamdefend}
\alias{wnba_leaguestandings}
\alias{wnba_playerdashptpass}
\alias{wnba_playerdashptreb}
\alias{wnba_playerdashptshotdefend}
\alias{wnba_playerdashptshots}
\alias{wnba_teamandplayersvsplayers}
\alias{wnba_teamdashptpass}
\alias{wnba_teamdashptreb}
\alias{wnba_teamdashptshots}
\title{WNBA Stats endpoint wrappers added for valid WNBA endpoints}
\usage{
wnba_leaguedashptdefend(...)

wnba_leaguedashptstats(...)

wnba_leaguedashptteamdefend(...)

wnba_leaguestandings(...)

wnba_playerdashptpass(...)

wnba_playerdashptreb(...)

wnba_playerdashptshotdefend(...)

wnba_playerdashptshots(...)

wnba_teamandplayersvsplayers(...)

wnba_teamdashptpass(...)

wnba_teamdashptreb(...)

wnba_teamdashptshots(...)
}
\arguments{
  \item{...}{Additional arguments passed to the WNBA Stats API request wrapper.}
}
\value{
Each function returns a named list of data frames parsed from the corresponding
WNBA Stats API endpoint response.
}
\description{
Convenience wrappers for WNBA Stats endpoints that are available for WNBA
LeagueID values and were previously missing from the package.
}

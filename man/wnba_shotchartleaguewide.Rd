% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wnba_stats_shotchart.R
\name{wnba_shotchartleaguewide}
\alias{wnba_shotchartleaguewide}
\title{\strong{Get WNBA Stats API Shot Chart League-Wide}}
\usage{
wnba_shotchartleaguewide(
  league_id = "10",
  season = most_recent_wnba_season() - 1,
  ...
)
}
\arguments{
\item{league_id}{League - default: '10'. Other options include '00': NBA, '20': G-League}

\item{season}{season}

\item{...}{Additional arguments passed to an underlying function like httr.}
}
\value{
Return a named list of data frames: League_Wide

\strong{League_Wide}\tabular{ll}{
   col_name \tab types \cr
   GRID_TYPE \tab character \cr
   SHOT_ZONE_BASIC \tab character \cr
   SHOT_ZONE_AREA \tab character \cr
   SHOT_ZONE_RANGE \tab character \cr
   FGA \tab character \cr
   FGM \tab character \cr
   FG_PCT \tab character \cr
}
}
\description{
\strong{Get WNBA Stats API Shot Chart League-Wide}

\strong{Get WNBA Stats API Shot Chart League-Wide}
}
\details{
\if{html}{\out{<div class="sourceCode r">}}\preformatted{ wnba_shotchartleaguewide(league_id = '10', season = most_recent_wnba_season() - 1)
}\if{html}{\out{</div>}}
}
\seealso{
Other WNBA Shooting Functions: 
\code{\link{wnba_leaguedashplayershotlocations}()},
\code{\link{wnba_leaguedashteamshotlocations}()},
\code{\link{wnba_playerdashboardbyshootingsplits}()},
\code{\link{wnba_shotchartdetail}()},
\code{\link{wnba_shotchartlineupdetail}()},
\code{\link{wnba_teamdashboardbyshootingsplits}()}

Other WNBA League Functions: 
\code{\link{wnba_leaguedashlineups}()},
\code{\link{wnba_leaguedashplayerbiostats}()},
\code{\link{wnba_leaguedashplayerclutch}()},
\code{\link{wnba_leaguedashplayershotlocations}()},
\code{\link{wnba_leaguedashplayerstats}()},
\code{\link{wnba_leaguedashteamclutch}()},
\code{\link{wnba_leaguedashteamshotlocations}()},
\code{\link{wnba_leaguedashteamstats}()},
\code{\link{wnba_leaguegamefinder}()},
\code{\link{wnba_leaguegamelog}()},
\code{\link{wnba_leaguelineupviz}()},
\code{\link{wnba_leagueplayerondetails}()},
\code{\link{wnba_leagueseasonmatchups}()},
\code{\link{wnba_leaguestandingsv3}()}
}
\author{
Saiem Gilani
}
\concept{WNBA League Functions}
\concept{WNBA Shooting Functions}

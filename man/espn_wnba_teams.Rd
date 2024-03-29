% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/espn_wnba_data.R
\name{espn_wnba_teams}
\alias{espn_wnba_teams}
\title{Get ESPN's WNBA team names and ids}
\usage{
espn_wnba_teams()
}
\value{
Returns a tibble\tabular{ll}{
   col_name \tab types \cr
   team_id \tab integer \cr
   team \tab character \cr
   mascot \tab character \cr
   display_name \tab character \cr
   short_name \tab character \cr
   abbreviation \tab character \cr
   color \tab character \cr
   alternate_color \tab character \cr
   logo \tab character \cr
   logo_dark \tab character \cr
}
}
\description{
Get ESPN's WNBA team names and ids
}
\examples{
\donttest{
  try(espn_wnba_teams())
}
}
\seealso{
Other ESPN WNBA Functions: 
\code{\link{espn_wnba_game_all}()},
\code{\link{espn_wnba_game_rosters}()},
\code{\link{espn_wnba_pbp}()},
\code{\link{espn_wnba_player_box}()},
\code{\link{espn_wnba_player_stats}()},
\code{\link{espn_wnba_scoreboard}()},
\code{\link{espn_wnba_standings}()},
\code{\link{espn_wnba_team_box}()},
\code{\link{espn_wnba_team_stats}()}
}
\author{
Saiem Gilani
}
\concept{ESPN WNBA Functions}
\keyword{Teams}
\keyword{WNBA}

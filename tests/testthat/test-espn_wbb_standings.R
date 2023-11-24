
cols <- c(
  "team_id","team","playoffseed","wins","losses",
  "winpercent","gamesbehind","pointsfor","pointsagainst",
  "avgpointsfor","avgpointsagainst","streak",
  "leaguewinpercent","total","home_playoffseed",
  "home_wins","home_losses","home_winpercent",
  "home_gamesbehind","home_pointsfor","home_pointsagainst",
  "home_avgpointsfor","home_avgpointsagainst",
  "home_streak","home_leaguewinpercent","home",
  "road_playoffseed","road_wins","road_losses",
  "road_winpercent","road_gamesbehind","road_pointsfor",
  "road_pointsagainst","road_avgpointsfor",
  "road_avgpointsagainst","road_streak","road_leaguewinpercent",
  "road","vsaprankedteams_playoffseed","vsaprankedteams_wins",
  "vsaprankedteams_losses","vsaprankedteams_winpercent",
  "vsaprankedteams_gamesbehind","vsaprankedteams_pointsfor",
  "vsaprankedteams_pointsagainst","vsaprankedteams_avgpointsfor",
  "vsaprankedteams_avgpointsagainst","vsaprankedteams_streak",
  "vsaprankedteams_leaguewinpercent","vsaprankedteams",
  "vsusarankedteams_playoffseed","vsusarankedteams_wins",
  "vsusarankedteams_losses","vsusarankedteams_winpercent",
  "vsusarankedteams_gamesbehind","vsusarankedteams_pointsfor",
  "vsusarankedteams_pointsagainst","vsusarankedteams_avgpointsfor",
  "vsusarankedteams_avgpointsagainst","vsusarankedteams_streak",
  "vsusarankedteams_leaguewinpercent","vsusarankedteams",
  "vsconf_playoffseed","vsconf_wins","vsconf_losses",
  "vsconf_winpercent","vsconf_gamesbehind","vsconf_pointsfor",
  "vsconf_pointsagainst","vsconf_avgpointsfor","vsconf_avgpointsagainst",
  "vsconf_streak","vsconf_leaguewinpercent","vsconf"
)

test_that("ESPN - WBB Standings", {
  skip_on_cran()
  x <- espn_wbb_standings(year = 2021)
  expect_in(sort(cols), sort(colnames(x)))
  expect_s3_class(x, "data.frame")
})

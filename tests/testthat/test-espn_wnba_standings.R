
cols <- c(
  "team_id","team","playoffseed","wins","losses",
  "winpercent","gamesbehind","avgpointsfor",
  "avgpointsagainst","differential","streak",
  "divisionwinpercent","leaguewinpercent","leaguestandings",
  "home","road","vsdiv","vsconf","lasttengames"
)

test_that("ESPN - WNBA Standings", {
  skip_on_cran()
  x <- espn_wnba_standings(year = 2021)
  expect_true(all(cols%in%colnames(x)))
  expect_s3_class(x, "data.frame")
})

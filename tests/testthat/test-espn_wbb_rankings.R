
cols <- c(
  "id", "name", "shortName", "type", "headline", "shortHeadline", 
  "current", "previous", "points", "firstPlaceVotes",
  "trend", "date", "lastUpdated", "recordSummary", "team.id", 
  "team.uid", "team.location", "team.name", "team.nickname", 
  "team.abbreviation", "team.color", "team.logo", "occurrence.number", 
  "occurrence.type", "occurrence.last", "occurrence.value",
  "occurrence.displayValue", "season.year", "season.startDate",
  "season.endDate", "season.displayName", "season.type.type", 
  "season.type.name", "season.type.abbreviation", "firstOccurrence.type",
  "firstOccurrence.value"
)

test_that("ESPN - WBB Rankings", {
  skip_on_cran()
  x <- espn_wbb_rankings()
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
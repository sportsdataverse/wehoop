
x <- wbb_rankings()

cols <- c("id", "name", "shortName", "type", "headline", "shortHeadline", 
          "current", "previous", "points", "firstPlaceVotes", "trend", 
          "recordSummary", "team.id", "team.uid", "team.location", "team.name", 
          "team.nickname", "team.abbreviation", "team.color", "team.links", 
          "team.logo", "others", "droppedOut", "occurrence.number", "occurrence.type", 
          "occurrence.last", "occurrence.value", "occurrence.displayValue", 
          "season.year", "season.startDate", "season.endDate", "season.displayName", 
          "season.type.type", "season.type.name", "season.type.abbreviation", 
          "season.athletes.$ref", "season.leaders.$ref", "firstOccurrence.type", 
          "firstOccurrence.value", "ranks")

test_that("WBB ESPN Rankings", {
  expect_equal(colnames(x), cols)
  expect_s3_class(x, "data.frame")
})
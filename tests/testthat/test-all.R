library(testthat)

testthat::test_that("get sotkanet includes year field",{
  testthat::skip_on_cran()
  testthat::expect_true("year" %in% names(GetDataSotkanet(indicators = 165)))
})

testthat::test_that("Invalid URLs produce a message",{
  testthat::skip_on_cran()
  testthat::expect_message(sotkanet:::sotkanet.json_query("httpstat.us/200?sleep=1500", timeout = 1))
  testthat::expect_message(test_connection("https://httpstat.us/401"))
  testthat::expect_message(test_connection("https://httpstat.us/418"))
  testthat::expect_message(SotkanetIndicatorMetadata())
  testthat::expect_message(SotkanetIndicators(type = "teibeul"))
  testthat::expect_message(GetDataSotkanet(5468, years = 2020, genders = "total", regions = "Soumi"))
  testthat::expect_message(GetDataSotkanet(5468, years = 2020, genders = "total", region.category = "KUU"))
})

testthat::test_that("Valid URLs stay silent or produce expected output",{
  testthat::skip_on_cran()
  testthat::expect_silent(sotkanet::sotkanet.json_query("http://httpbin.org/json"))
  testthat::expect_s3_class(GetDataSotkanet(5468, years = 2020, genders = "total"), "data.frame")
  testthat::expect_s3_class(SotkanetIndicatorMetadata(5468, type = "table"), "data.frame")
  testthat::expect_s3_class(GetDataSotkanet(5468, years = 2020, genders = "total", regions = "Koko maa"), "data.frame")
})

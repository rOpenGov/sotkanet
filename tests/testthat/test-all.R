library(testthat)

testthat::test_that("get sotkanet includes year field",{
  testthat::skip_on_cran()
  testthat::expect_true("year" %in% names(get_sotkanet(indicators = 165)))
})

testthat::test_that("Invalid URLs produce a message",{
  testthat::skip_on_cran()
  testthat::expect_message(sotkanet_indicator_metadata())
  testthat::expect_message(SotkanetIndicators(type = "teibeul"))
  testthat::expect_message(get_sotkanet(5468, years = 2020, genders = "total", regions = "Soumi"))
  testthat::expect_message(get_sotkanet(5468, years = 2020, genders = "total", region.category = "KUU"))
})

testthat::test_that("Valid URLs stay silent or produce expected output",{
  testthat::skip_on_cran()
  testthat::expect_silent(sotkanet::sotkanet.json_query("http://httpbin.org/json"))
  testthat::expect_s3_class(get_sotkanet(5468, years = 2020, genders = "total"), "data.frame")
  testthat::expect_s3_class(sotkanet_indicator_metadata(5468, type = "table"), "data.frame")
  testthat::expect_s3_class(get_sotkanet(5468, years = 2020, genders = "total", regions = "Koko maa"), "data.frame")
})

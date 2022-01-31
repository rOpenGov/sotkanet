library(testthat)

context("Get")
testthat::test_that("get sotkanet includes year field",{
  testthat::skip_on_cran()
  testthat::expect_true("year" %in% names(GetDataSotkanet(indicators = 165, verbose = TRUE)))
})

testthat::test_that("URLs produce a message",{
  testthat::skip_on_cran()
  testthat::expect_message(sotkanet.json_query("httpstat.us/200?sleep=1500", timeout = 1))
  testthat::expect_message(test_connection("https://httpstat.us/418"))
})


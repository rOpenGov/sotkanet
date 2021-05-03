library(testthat)

context("Get")
testthat::test_that("get sotkanet includes year field",{
  testthat::skip_on_cran()
  testthat::expect_true("year" %in% names(GetDataSotkanet(indicators = 165, verbose = TRUE)))
})


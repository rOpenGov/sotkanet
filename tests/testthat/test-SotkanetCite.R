test_that("SotkanetCite gives correct results", {

  expect_equal(class(SotkanetCite(10013)), "Bibtex")

  expect_equal(class(SotkanetCite(10012)), "Bibtex")

  expect_equal(class(SotkanetCite(10011)), "Bibtex")
})

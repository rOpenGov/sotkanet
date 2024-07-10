test_that("sotkanet_cite gives correct results", {
  
  testthat::skip_on_cran()

  expect_equal(
    class(
      sotkanet_cite(
        id = 10013,
        lang = "en"
        )),
      "Bibtex"
    )

  expect_equal(
    class(
      sotkanet_cite(
        id = 10012,
        lang = "fi"
        )),
    "Bibtex"
    )

  expect_equal(
    class(
      sotkanet_cite(
        id = 10011,
        lang = "sv"
        )),
    "Bibtex"
    )

  expect_error(
    sotkanet_cite(10013, lang = "ru"
                 ))

  expect_equal(
    class(
      sotkanet_cite(
        id = 10013,
        format = "bibentry"))[2],
    "bibentry"
  )

  expect_equal(
    class(
      sotkanet_cite(
        id = 10013,
        format = "bibtex")),
    "Bibtex"
  )

  expect_warning(
    sotkanet_cite(
      id = 10013,
      format = "test"
    )
  )

})

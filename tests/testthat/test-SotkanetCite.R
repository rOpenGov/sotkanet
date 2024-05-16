test_that("SotkanetCite gives correct results", {

  expect_equal(
    class(
      SotkanetCite(
        id = 10013,
        lang = "en"
        )),
      "Bibtex"
    )

  expect_equal(
    class(
      SotkanetCite(
        id = 10012,
        lang = "fi"
        )),
    "Bibtex"
    )

  expect_equal(
    class(
      SotkanetCite(
        id = 10011,
        lang = "sv"
        )),
    "Bibtex"
    )

  expect_error(
    SotkanetCite(10013, lang = "ru"
                 ))

  expect_equal(
    class(
      SotkanetCite(
        id = 10013,
        format = "bibentry"))[2],
    "bibentry"
  )

  expect_equal(
    class(
      SotkanetCite(
        id = 10013,
        format = "bibtex")),
    "Bibtex"
  )

})

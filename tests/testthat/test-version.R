library(testthat)

credential  <- retrieve_credential_testing()

test_that("smoke", {
  testthat::skip_on_cran()
  expect_message(
    returned <- redcap_version(
      redcap_uri  = credential$redcap_uri,
      token       = credential$token
    )
  )
})

test_that("version-successful", {
  testthat::skip_on_cran()
  expect_message(
    actual <- redcap_version(
      redcap_uri  = credential$redcap_uri,
      token       = credential$token
    )
  )

  expected <- package_version("12.5.5")
  version_good <- (expected <= actual)
  expect_true(version_good)
})

test_that("version-unuccessful-bad-token", {
  testthat::skip_on_cran()
  expect_message(
    actual <- redcap_version(
      redcap_uri  = credential$redcap_uri,
      token       = "BAD00000000000000000000000000000"
      )
  )

  expected <- package_version("0.0.0")
  expect_equal(actual, expected)
})

rm(credential)

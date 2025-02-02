library(testthat)

credential  <- retrieve_credential_testing()
update_expectation  <- FALSE

test_that("smoke test", {
  testthat::skip_on_cran()
  expect_message(
    returned_object <-
      redcap_log_read(
        redcap_uri    = credential$redcap_uri,
        token         = credential$token
      )
  )
})

test_that("2020-08-10", {
  testthat::skip_on_cran()
  path_expected <- "test-data/specific-redcapr/log-read/2020-08-10.R"
  expected_outcome_message <- "\\d+ rows were read from REDCap in \\d+(\\.\\d+\\W|\\W)seconds\\."

  expect_message(
    regexp          = expected_outcome_message,
    returned_object <-
      REDCapR::redcap_log_read(
        redcap_uri     = credential$redcap_uri,
        token          = credential$token,
        log_begin_date = as.Date("2020-08-10"),
        log_end_date   = as.Date("2020-08-10")
      )
  )

  if (update_expectation) save_expected(returned_object$data, path_expected)
  expected_data_frame <- retrieve_expected(path_expected)

  expect_equal(returned_object$data, expected=expected_data_frame, label="The returned data.frame should be correct", ignore_attr = TRUE) # dput(returned_object$data)
  expect_equal(returned_object$status_code, expected=200L)
  expect_equal(returned_object$raw_text, expected="", ignore_attr = TRUE) # dput(returned_object$raw_text)
  expect_match(returned_object$outcome_message, regexp=expected_outcome_message, perl=TRUE)
  expect_true(returned_object$success)
})

test_that("2020-08-10-api-export", {
  testthat::skip_on_cran()
  path_expected <- "test-data/specific-redcapr/log-read/2020-08-10.R"
  expected_outcome_message <- "\\d+ rows were read from REDCap in \\d+(\\.\\d+\\W|\\W)seconds\\."

  expect_message(
    regexp          = expected_outcome_message,
    returned_object <-
      REDCapR::redcap_log_read(
        redcap_uri     = credential$redcap_uri,
        token          = credential$token,
        log_begin_date = as.Date("2020-08-10"),
        log_end_date   = as.Date("2020-08-10")
      )
  )

  if (update_expectation) save_expected(returned_object$data, path_expected)
  expected_data_frame <- retrieve_expected(path_expected)

  expect_equal(returned_object$data, expected=expected_data_frame, label="The returned data.frame should be correct", ignore_attr = TRUE) # dput(returned_object$data)
  expect_equal(returned_object$status_code, expected=200L)
  expect_equal(returned_object$raw_text, expected="", ignore_attr = TRUE) # dput(returned_object$raw_text)
  expect_match(returned_object$outcome_message, regexp=expected_outcome_message, perl=TRUE)
  expect_true(returned_object$success)
})
test_that("2021-07-11-record3-user", {
  testthat::skip_on_cran()
  path_expected <- "test-data/specific-redcapr/log-read/2021-07-11-record3-user.R"
  expected_outcome_message <- "\\d+ rows were read from REDCap in \\d+(\\.\\d+\\W|\\W)seconds\\."

  expect_message(
    regexp          = expected_outcome_message,
    returned_object <-
        REDCapR::redcap_log_read(
          redcap_uri     = credential$redcap_uri,
          token          = credential$token,
          log_begin_date = as.Date("2021-07-11"),
          log_end_date   = as.Date("2021-07-11"),
          record         = as.character(3),
          user           = "unittestphifree"
        )
  )

  if (update_expectation) save_expected(returned_object$data, path_expected)
  expected_data_frame <- retrieve_expected(path_expected)

  expect_equal(returned_object$data, expected=expected_data_frame, label="The returned data.frame should be correct", ignore_attr = TRUE) # dput(returned_object$data)
  expect_equal(returned_object$status_code, expected=200L)
  expect_equal(returned_object$raw_text, expected="", ignore_attr = TRUE) # dput(returned_object$raw_text)
  expect_match(returned_object$outcome_message, regexp=expected_outcome_message, perl=TRUE)
  expect_true(returned_object$success)
})

rm(credential)

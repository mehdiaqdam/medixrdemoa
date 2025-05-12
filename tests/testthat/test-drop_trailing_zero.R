test_that("input must be numeric numeric", {
  x <- 2
  expect_equal(is.numeric(x), TRUE)

  x <- rep(1.4, 8.4, by = 0.2)
  expect_equal(is.numeric(x), TRUE)

  x <- "a"
  expect_warning(is.numeric(x), NA)
  expect_warning(is.numeric(x), NA)


})

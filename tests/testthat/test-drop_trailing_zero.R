test_that("input is numeric", {
  x <- "2"
  expect_error(drop_trailing_zero(x), "Input must be a number a numeric vector.")

})


# test_that("input must be numeric numeric", {
#   x <- 2
#   expect_equal(drop_trailing_zero(x), "2")
#
#   x <- c(1.230, 3.0000, 0.0023400, 10, 100.02)
#   expect_equal(drop_trailing_zero(x), c("1.23", "3", "0.00234"))
#
#   x <- "a"
#   # expect_error(x)
#   expect_warning(is.numeric(x), NA)
#   expect_warning(is.numeric(x), NA)
#
# })

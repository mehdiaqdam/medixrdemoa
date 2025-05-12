test_that("decimal not ending with zero", {
  x <- c(0.12, 1.02, 10.123)
  expect_equal(drop_trailing_zero(x, align = "left"),
               c("0.12", "1.02", "10.123"))
})

test_that("decimal ending with zero", {
  x <- c(0.120, 1.0200, 10.1000203000, 3.00)
  expect_equal(drop_trailing_zero(x, align = "left"),
               c("0.12", "1.02", "10.1000203", "3"))
})

test_that("integer", {
  x <- c(1, 10, 010)
  expect_equal(drop_trailing_zero(x, align = "left"),
               c("1", "10", "10"))
})

test_that("NA or NaN", {
  x <- c(NA, 1, 1.01, NaN, NA_real_,)
  expect_equal(drop_trailing_zero(x, align = "left"),
               c("NA", "1", "1.01", "NaN", "NA"))
})


test_that("input is numeric", {
  x <- "2"
  expect_error(drop_trailing_zero(x, align = "left"),
               "Input must be a number or a numeric vector.")
  x <- c("2", "ab", NA_character_)
  expect_error(drop_trailing_zero(x, align = "left"),
               "Input must be a number or a numeric vector.")

})

test_that("aligns", {
  x <- c(0.120, 1.0200, 10.1000203000, 300.3)
  expect_equal(drop_trailing_zero(x, align = "left"),
               c("0.12", "1.02", "10.1000203", "300.3"))
  expect_equal(drop_trailing_zero(x, align = "right"),
               c("  0.12", "  1.02", " 10.1000203", "300.3"))

})

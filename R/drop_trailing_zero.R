#' @title Drop Trailing Zero
#'
#' @description
#' Drops trailing zero(s) with no mathematical value.
#'
#' @param x a numeric value or vector.
#'
#' @return a character (single or vector depending on \code{x}).
#'
#' @export
#'
#' @import stringr
#' @import cli
#'
#' @examples
#' x <- 0.00200
#' drop_trailing_zero(x)
#'
#' x <- c(0.00200, 0.1, 1110.0250)
#' drop_trailing_zero(x)
drop_trailing_zero <- function(x) {

  if (!is.numeric(x)) {
    cli_abort("Input must be a number a numeric vector.")
  }

  x_f = format(x, scientific = FALSE)
  ifelse(str_detect(x_f, "\\."),
         str_replace(x_f, "[\\.]?[0]+$", ""),
         x_f)
}

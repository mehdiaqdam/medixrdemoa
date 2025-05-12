#' @title Drop Trailing Zero
#'
#' @description
#' Drops trailing zero(s) with no mathematical value.
#'
#' @param x a numeric value or vector.
#' @param align alignment ('left' or 'right') of returned values.
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
#' drop_trailing_zero(x, align = "left")
#' drop_trailing_zero(x, align = "right")
#'
#' x <- c(0.00200, 0.1, 1110.0250)
#' drop_trailing_zero(x, align = "left")
drop_trailing_zero <- function(x, align) {

  if (is.null(align) || !align %in% c("left", "right")) {
    cli_abort("{.arg align} must be defined, and as either 'left' or 'right.")
  }

  if (!is.numeric(x)) {
    cli_abort("Input must be a number or a numeric vector.")
  }

  x_res = format(x, scientific = FALSE, nsmall = 10)
  x_res <- ifelse(str_detect(x_res, "\\."),
                  str_replace(x_res, "[\\.]?[0]+$", ""),
                  x_res)

  if (align == "left") {
    x_res <- str_trim(x_res)
  }
x_res
}

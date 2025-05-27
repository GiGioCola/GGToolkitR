#' Get the last day of the month
#'
#' This function calculates the last day of the month for a given date.
#'
#' @param date A Date object representing the input date.
#'
#' @return A Date object representing the last day of the month for the given date.
#'
#' @examples
#' getEndOfMonth(as.Date("2023-01-15"))
#' # Output: "2023-01-31"
#'
getEndOfMonth <- function(date) {
  ceiling_date(date, "month") - days(1)
}
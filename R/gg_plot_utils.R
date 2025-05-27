#' Calculate bin width for a histogram
#'
#' This function calculates the bin width for a histogram based on the range of a specified column
#' in the provided data frame. If the column contains only `NA` values or the data frame is empty,
#' a default bin width is returned.
#'
#' @param df A data frame containing the data.
#' @param column_name A string specifying the name of the column for which to calculate the bin width.
#' @param default_binwidth A numeric value specifying the default bin width to return if the calculation fails. Default is 1.
#'
#' @return A numeric value representing the bin width for the histogram. If the calculation fails, the default bin width is returned.
#'
#' @examples
#' # Example with valid data
#' df <- data.frame(cost = c(100, 200, 300, 400, 500))
#' calculate_binwidth(df, "cost")
#'
#' # Example with only NA values
#' df <- data.frame(cost = c(NA, NA, NA))
#' calculate_binwidth(df, "cost")
#'
#' # Example with an empty data frame
#' df <- data.frame(cost = numeric(0))
#' calculate_binwidth(df, "cost")
calculate_binwidth <- function(df, column_name, default_binwidth = 10) {
  # Check if the data frame is empty
  if (nrow(df) == 0) {
    warning("The data frame is empty. Returning the default bin width.")
    return(default_binwidth)
  }

  # Check if the specified column exists
  if (!column_name %in% names(df)) {
    warning(paste("The column", column_name, "does not exist in the data frame. Returning the default bin width."))
    return(default_binwidth)
  }

  # Check if the specified column contains only NA values
  if (all(is.na(df[[column_name]]))) {
    warning(paste("The column", column_name, "contains only NA values. Returning the default bin width."))
    return(default_binwidth)
  }

  # Calculate the range of the data
  data_range <- max(df[[column_name]], na.rm = TRUE) - min(df[[column_name]], na.rm = TRUE)

  # If the range is zero (e.g., all values are the same), return the default bin width
  if (data_range == 0) {
    warning(paste("The range of", column_name, "is zero. Returning the default bin width."))
    return(default_binwidth)
  }

  # Divide the range by a chosen number of bins (e.g., 30) to calculate the bin width
  return(data_range / 30)
}
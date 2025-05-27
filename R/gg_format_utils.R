#' Format a numeric value as euros with appropriate scale
#'
#' This function takes a numeric input `x` and formats it as euros with an appropriate scale:
#' thousands (`k€`), millions (`M€`), or billions (`B€`). For smaller values, it simply appends
#' the euro symbol (`€`) to the original value without scaling.
#'
#' @param x A numeric value to format.
#' @param currency_symbol A string representing the currency symbol to append. Default is "€".
#' @return A string representing the input value. If `x` is large enough, it is formatted
#' as thousands, millions, or billions of given currency (e.g., "2K €", "3M €", "1B €"). Otherwise,
#' the original value is returned with the euro symbol appended (e.g., "999 €").
#' @examples
#' format_scaled_cost(1500)       # Returns "2K €"
#' format_scaled_cost(1e6)        # Returns "1M €"
#' format_scaled_cost(1.5e9)      # Returns "2B €"
#' format_scaled_cost(999)        # Returns "999 €"
#' format_scaled_cost(-1.5e6)     # Returns "-2M €"
#' format_scaled_cost(NA)         # Returns NA
#' format_scaled_cost(1234567890, "$")  # Returns "1B $"
#' format_scaled_cost(1234567, "£")  # Returns "1M £"
format_scaled_cost <- function(x, currency_symbol = "€") {
  # Check if the value is NA
  if (is.na(x)) {
    return(NA)  # Return NA if the input is missing
  }

  # Format the value based on its magnitude
  if (abs(x) >= 1e9) {
    paste0(round(x / 1e9), " B", currency_symbol)
  } else if (abs(x) >= 1e6) {
    paste0(round(x / 1e6), " M", currency_symbol)
  } else if (abs(x) >= 1e3) {
    paste0(round(x / 1e3), " k", currency_symbol)
  } else {
    paste0(round(x), " ", currency_symbol)
  }
}
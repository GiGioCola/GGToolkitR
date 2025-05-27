# GGToolkitR

**GGToolkitR** is a versatile collection of utility functions for R, designed to simplify common tasks in data analysis, including data formatting, date manipulation, and plotting. This package provides a handy toolkit for R users, combining efficiency and ease of use in one package.

## Features

- **Plot Utilities**: 
  - `calculate_binwidth`: Automatically calculate the optimal bin width for histograms based on data range.

- **Formatting Utilities**: 
  - `format_scaled_cost`: Format numeric values as euros (or other currencies) with appropriate scaling (e.g., thousands, millions, billions).

- **Date Utilities**: 
  - `getEndOfMonth`: Determine the last day of the month for a given date.

## Installation

To use **GGToolkitR**, clone the repository and load the functions into your R environment:

```r
# Clone the repository
# Load the functions into your R session
source("R/gg_plot_utils.R")
source("R/gg_format_utils.R")
source("R/gg_date_utils.R")
```

## Usage

### Plot Utilities

```r
# Calculate bin width for a histogram
df <- data.frame(cost = c(100, 200, 300, 400, 500))
calculate_binwidth(df, "cost")
```

### Formatting Utilities

```r
# Format numeric values as euros
format_scaled_cost(1500)       # Returns "2k €"
format_scaled_cost(1e6)        # Returns "1M €"
format_scaled_cost(1234567, "$")  # Returns "1M $"
```

### Date Utilities

```r
# Get the last day of the month
getEndOfMonth(as.Date("2023-01-15"))  # Returns "2023-01-31"
```

## Examples

Explore the examples provided in the function documentation to see how **GGToolkitR** can simplify your workflow.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve the package.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

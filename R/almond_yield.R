#' computes yield from min. monthly temp and last months total precip
#' @param  T_min (C)
#' @param  P (mm)
#' @param  year (yr)
#' @param  month (dy)
#' @return data frame with estimate of yield per year

almond_yield <- function(df) {
  yields <- data.frame()
  
  # Filter the data to include only February rows
  feb_data <- df[df$month == 2, ]
  
  # Iterate over the February data
  for (i in 1:nrow(feb_data)) {
    year <- feb_data$year[i]
    t_min <- feb_data$min_tmin_c[i]
    
    # Get the January precipitation for the current year
    jan_precip <- df$total_precip[df$year == year & df$month == 1]
    
    # Calculate Y_min for February of the current year
    Y_min <- (-0.015 * t_min) - (0.0046 * (t_min^2)) - (0.07 * jan_precip) + (0.0043 * (jan_precip^2)) + 0.28
    
    # Create a dataframe with calculated values for the current year and month 2
    calculations <- data.frame(
      Year = rep(year, length(Y_min)),
      Month = rep(2, length(Y_min)),
      Yield = Y_min
    )
    
    # Append the calculations to the yields dataframe
    yields <- rbind(yields, calculations)
  }
  
  # Return both the summary statistics and the yields dataframe in a list
  return(yields)
}

#' Title
#'
#' @param df a dataframe with climate data
#' @param year a specific year of interest
#' @param Yield the almond yield (ton/acre)
#' @param price the price per acre
#' @param discount the yearly discount
#'
#' @return a dataframe with the predicted net profit (netpre) of a specific year
#' @export
#'
#' @examples
compute_profit_fromyield = function(df, year, Yield, price, discount=0.12) {
  
  yield_df <- almond_yield(df)
  
  profit_df <- yield_df %>% 
    select(-Yield) %>% 
    mutate(net = Yield*price,
           netpre = compute_NPV(cost=net, 
                                time=Year-Year[1], # remember to normalize the year to start year e.g the first year
                                discount=0.12))
  profit_df <- profit_df %>%
    filter(Year == year)
  
  return(profit_df)
}
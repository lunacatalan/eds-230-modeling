#' Calculates the energy produced from a photovoltaic system if you know the average annual solar radiation
#'
#' @param A_m2 Solar panel area (m2)
#' @param H_kWh Annual average solar radiation (kWh)
#' @param r Panel yields; default is 0.2
#' @param PR Performance ratio; default is 0.75
#'
#' @return Energy (kWh)
#' 
#' @examples 
#' solar_e(5, 10)

# set inputs and parameters
solar_e <- function(A_m2, H_kWh, r = 0.2, PR = 0.75) { 
  
  # energy equation
  E_kWh = A_m2*H_kWh*r*PR
  
  # output the energy E
  return(E_kWh) 
}



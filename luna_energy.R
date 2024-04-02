# create function 
solar_e <- function(A_m2, H_kWh, r = 0.2, PR = 0.75) { # set default values for r and PR
  
  # energy equation
  E_kWh = A_m2*H_kWh*r*PR
  
  # output the energy E
  print(E_kWh) 
}

solar_e(5, 10)

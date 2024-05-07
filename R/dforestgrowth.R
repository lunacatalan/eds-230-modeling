#' Title
#'
#' @param Time time since start
#' @param C canopy closure
#' @param parms - as list with two values, r, K
#' @param r intrinsic growth rate
#' @param K carrying capacity in units of carbon
#'
#' @return
#' @export
#'
#' @examples
dforestgrowth = function(Time, C, parms) {
  
  if(C < 50) {
    
    dG = parms$r * C
  } else {
    
    dG = parms$g * C * (1- C/parms$K)
  }
  
  return(list(dG))
}
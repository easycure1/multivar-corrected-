library(Rcpp)
library(RcppArmadillo)

sourceCpp('C:/Users/Yixuan/Documents/PhD/multivar_R/vnpc_R_help.cpp')

## Multivariate corrected likelihood using VAR
llike_var_correct_m <- function(FZ, ar, f_param_half, sigma, f, excludeBoundary=T) { # exclude lambda_{0,N} for mean-centered TS
  d <- ncol(FZ)
  f_half <- sqrt_cube(f, excludeBoundary) 
  f_half_inv <- inv_cube(f_half, excludeBoundary)
  CFZ <- get_CFZ(FZ, f_half_inv, f_param_half, excludeBoundary)
  FCFZ <- Re(midft(CFZ))
  ll <- sum(logdet_cube(f_half_inv, excludeBoundary)) + # times 2, because of functional determinant in real-valued formulation
    sum(logdet_cube(f_param_half, excludeBoundary)) + # times 2, because of functional determinant in real-valued formulation
    llike_var_partial(FCFZ, ar, sigma=sigma)
  return(ll)
}
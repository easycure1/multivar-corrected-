library(Rcpp)
library(RcppArmadillo)

sourceCpp('C:/Users/yliu894/Documents/Multi_corrected_R/prototype.cpp')

## Multivariate corrected likelihood using VAR
llike_var_corrected <- function(FZ, ar, f_param_half, sigma, f, excludeBoundary=T) { # exclude lambda_{0,N} for mean-centered TS
  d <- ncol(FZ)
  f_half <- sqrt_cube(f, excludeBoundary) 
  f_half_inv <- inv_cube(f_half, excludeBoundary)
  CFZ <- get_CFZ(FZ, f_half_inv, f_param_half, excludeBoundary)
  FCFZ <- Re(midft(CFZ))
  ll <- 2*sum(logdet_cube(f_half_inv, excludeBoundary)) + # times 2, because of functional determinant in real-valued formulation ???
    2*sum(logdet_cube(f_param_half, excludeBoundary)) + # times 2, because of functional determinant in real-valued formulation ???
    llike_var_partial(FCFZ, ar, sigma=sigma)
  return(ll)
}

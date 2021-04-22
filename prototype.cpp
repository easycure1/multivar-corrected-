#include <RcppArmadillo.h> 
// [[Rcpp::depends(RcppArmadillo)]]

using namespace Rcpp;



// [[Rcpp::export]]
arma::cx_mat sqrt_cpp(arma::cx_mat A){ //square root of a PSD Hermitian matrix
  return arma::sqrtmat(A);
}

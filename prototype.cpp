#include <RcppArmadillo.h> 
// [[Rcpp::depends(RcppArmadillo)]]

#include <Rcpp.h>

using namespace Rcpp;



// [[Rcpp::export]]
arma::cx_cube cx_cube_from_ComplexVector(ComplexVector x) {
  const IntegerVector dim_x = x.attr("dim");
  arma::cx_vec x_vec(x);
  return arma::cx_cube(x_vec.begin(), dim_x[0], dim_x[1], 
                       dim_x[2], true); // re-allocate memory
}




// [[Rcpp::export]]
arma::cx_mat sqrt_cpp(arma::cx_mat A){ //square root of a PSD Hermitian matrix
  return arma::sqrtmat(A);
}


// [[Rcpp::export]]
arma::cx_cube sqrt_cube(ComplexVector f_, bool excludeBoundary) { // ok
  const arma::cx_cube f = cx_cube_from_ComplexVector(f_);
  arma::cx_cube f_half(f.n_rows, f.n_cols, f.n_slices); // Carful: No fill
  if (excludeBoundary) {
    f_half.slice(0) = arma::cx_mat(f.n_rows, f.n_cols, arma::fill::zeros);
    f_half.slice(f.n_slices-1) = arma::cx_mat(f.n_rows, f.n_cols, arma::fill::zeros);
  }
  for (unsigned j=excludeBoundary; j < f.n_slices-excludeBoundary; ++j) {
    f_half.slice(j) = arma::sqrtmat(f.slice(j));
  }
  return f_half;
}




// [[Rcpp::export]]
arma::cx_cube inv_cube(ComplexVector f_, bool excludeBoundary) { // ok
  const arma::cx_cube f = cx_cube_from_ComplexVector(f_);
  arma::cx_cube f_inv(f.n_rows, f.n_cols, f.n_slices); // Carful: No fill
  if (excludeBoundary) {
    f_inv.slice(0) = arma::cx_mat(f.n_rows, f.n_cols, arma::fill::zeros);
    f_inv.slice(f.n_slices-1) = arma::cx_mat(f.n_rows, f.n_cols, arma::fill::zeros);
  }
  for (unsigned j=excludeBoundary; j < f.n_slices-excludeBoundary; ++j) {
    f_inv.slice(j) = arma::inv(f.slice(j));
  }
  return f_inv;
}




// [[Rcpp::export]]
arma::cx_mat get_CFZ(arma::cx_mat FZ, ComplexVector f_half_inv_, 
                     ComplexVector f_param_half_, bool excludeBoundary) {
  const arma::cx_cube f_half_inv = cx_cube_from_ComplexVector(f_half_inv_);
  const arma::cx_cube f_param_half = cx_cube_from_ComplexVector(f_param_half_);
  arma::cx_mat res(FZ.n_rows, FZ.n_cols);
  if (excludeBoundary) {
    res.row(0) = arma::cx_rowvec(FZ.n_cols, arma::fill::zeros);
    res.row(FZ.n_rows-1) = arma::cx_rowvec(FZ.n_cols, arma::fill::zeros);
  }
  for (unsigned j=excludeBoundary; j<FZ.n_rows-excludeBoundary; ++j) {
    res.row(j) = (f_param_half.slice(j) * f_half_inv.slice(j) * FZ.row(j).st()).st();
  }
  return res;
}






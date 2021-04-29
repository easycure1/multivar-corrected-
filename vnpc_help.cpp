#include <RcppArmadillo.h> 
// [[Rcpp::depends(RcppArmadillo)]]

#include <Rcpp.h>

using namespace Rcpp;



// Log prior for Bernstein Gamma Psd (multivariate)
// [[Rcpp::export]]
double lprior_bernsteinGammaPsd(const bernsteinGammaPsd& f, 
                                const AGammaProcessPrior& ap,
                                double k_theta) {
  const int k = f.get_k();
  const double klk = (double)k * std::log((double)k);
  return -k_theta * klk + ap.lprior(f.get_Z(), f.get_r(), f.get_U());
}




//' Log corrected whittle likelihood
// [[Rcpp::export]]
double llike_correct_whittle(const arma::cx_mat& FZ,
                             const arma::cx_cube& f_para_half,
                             const arma::cx_cube& f) {
  const int d=FZ.n_cols;
  const arma::cx_cube f_half = sqrt_cube(f) // Not consider the indicator of boundary yet L, Yixuan
  const arma::cx_cube f_half_inv = inv_cube(f_half)  // Not consider the indicator of boundary yet L, Yixuan
  const arma::cx_mat CFZ = get_CFZ(FZ, f_half_inv, f_para_half) // Not consider the indicator of boundary yet L, Yixuan
  const arma::cx_mat FCFZ = midft(CFZ).real() //Is midft() a R function? Need to check
  return sum(logdet_cube(f_half_inv)) + sum(logdet_cube(f_para_half)) + llike_var_partial(FCFZ, ar, sigma) //????? Incorrect
}



//' Posterior
// [[Rcpp::export]]
double lpost_correct_bernsteinGammaWhittle(const arma::cx_mat& FZ,
                                           const arma::cx_cube& f_para_half,
                                           const bernsteinGammaPSD&, f,
                                           const AGammaProcessPrior& ap,
                                           double k_theta) {
  return lprior_bernsteinGammaPsd(f, ap, k_theta) +
    llike_correct_whittle(FZ, f.eval(), f_para_half);
}

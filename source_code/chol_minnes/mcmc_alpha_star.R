# source("gibbs_multivariate_util.R")
# source("mittelbach_util.R")

# General A-Gamma log Levy measure, angular part, unnormalized
# TODO: Parametrize by Sigma_inv, to save some computation time
cppFunction('double lalphaStar_AGamma(arma::cx_mat U, double eta, arma::cx_mat Sigma) {
            double res(0.0);
            const double dd = (double)U.n_cols;
            std::complex<double> log_det_val;
            double log_det_sign;
            arma::log_det(log_det_val,log_det_sign,Sigma);
            const double log_determ_Sigma = log_det_val.real();
            const arma::cx_mat Sigma_inv = arma::inv_sympd(Sigma);
            //for (unsigned j=0; j < U.n_slices; ++j) {
              arma::log_det(log_det_val,log_det_sign,U);
              const double log_determ = log_det_val.real();
              res -= log_determ_Sigma*eta;
              res -= arma::trace(Sigma_inv * U).real()*eta*dd;
              res += log_determ * (eta - dd);
            //}
            return res;
}', depends="RcppArmadillo")


###############################################################################
###############################################################################
###############################################################################


##  
## Metropolis Hastings algorithm to obtain random samples from alpha_star
## For AGamma distribution
##
mcmc_alpha_star <- function(eta, Sigma, N_MCMC) {
  d <- ncol(Sigma)
  stopifnot(nrow(Sigma)==d)
  # Initialize stuff
  p_vec <- cholesky_pVec(d)
  q_vec <- cholesky_qVec(d)
  d <- ncol(Sigma)
  stopifnot(Sigma==diag(d)) # For different Sigma's: Use transformation theorem
  N <- d*d-1
  U <- array(NA, dim=c(d,d,N_MCMC)) # parametrization: W = rU
  U__phi <- array(NA, dim=c(N, N_MCMC)) # Mittelbach et al
  U__IND_ALL <- 1:N
  U__IND_PIHALF <- (1:(d-1))^2
  U__IND_PI <- setdiff(U__IND_ALL, U__IND_PIHALF)
  U__SCALING <- U__IND_ALL
  U__SCALING[U__IND_PI] <- pi
  U__SCALING[U__IND_PIHALF] <- pi / 2
  # Starting values
  
  U__phi[U__IND_PIHALF,1] <- runif(length(U__IND_PIHALF), 0, 1) * pi / 2
  U__phi[U__IND_PI,1] <- runif(length(U__IND_PI), 0, 1) * pi
  
  # ## Uniforom proposal (see Algorithm 3, Mittelbach)
  # y <- rbeta(d*d-1, (p_vec+1)/2, (q_vec+1)/2)
  # b <- (!p_vec) * rbinom(1,1,1/2)
  # U__phi[,1] <- (1-b)*y + b*(pi-y)
  # ##
  
  U[,,1] <- cholesky_UFromPhi(U__phi[,1])
  for (i in 1:(N_MCMC-1)) {
    U.old <- U[,,i]
    rejectedU <- F
    

    ##
    ## Blocked Gibbs.
    ## Problem: Acceptance rate too low for dimensions d>=3.
    ##
    if (d<3) {
      U__phi__tmp <- U__phi[,i] / U__SCALING
      U__phi.star <- rbeta(length(U__SCALING), U__phi__tmp, (1-U__phi__tmp)) * U__SCALING
      U__phi.star <- runif(length(U__SCALING), -1, 1) * U__SCALING
      
      # ## Uniforom proposal (see Algorithm 3, Mittelbach)
      # y <- rbeta(d*d-1, (p_vec+1)/2, (q_vec+1)/2)
      # b <- (!p_vec) * rbinom(1,1,1/2)
      # U__phi.star <- (1-b)*y + b*(pi-y)
      # ##
      U.star <- U.old
      U.star <- cholesky_UFromPhi(U__phi.star)
      if (hasEigenValueSmallerZero(U.star, TOL=1e-15)) { # stay positive definite
        #print(paste0("Discaring U prosal with value ", U.star, " because of eigenvalues"))
        U[,,i+1] <- U[,,i] # reject and use previous
        U__phi[,i+1] <- U__phi[,i]
        rejectedU <- T
      }
      if (matCond(U.star) < 1e-12) { # stay numerically stable
        #print(paste0("Discaring U prosal with value ", U.star, " because of numerics"))
        U[,,i+1] <- U[,,i] # reject and use previous
        U__phi[,i+1] <- U__phi[,i]
        rejectedU <- T
      }
      if (!rejectedU) {
        f.U.star <- lalphaStar_AGamma(U.star, eta, Sigma)
        f.U <- lalphaStar_AGamma(U[,,i], eta, Sigma)
        # Note: symmetric Uniform proposals -- but need jacobian of transformation [phi_U |-> U]
        alpha <- min(0, f.U.star +
                       cholesky_jacobianLogDeterminant(U__phi.star) -
                       f.U -
                       cholesky_jacobianLogDeterminant(U__phi[,i]))
        
        if (is.na(alpha)) {
          print("should not happen")
        }
        
        if (log(runif(1,0,1)) < alpha) {
          U[,,i+1] <- U.star # accept
          U__phi[,i+1] <- U__phi.star
          U.old <- U.star
          f.store <- f.U.star
        } else {
          U[,,i+1] <- U[,,i] # reject
          U__phi[,i+1] <- U__phi[,i]
        }
      }
    } else {
      ##
      ## TODO: Random Walk Gibbs
      ##
    }
    

    

  }
  return(list(phi=U__phi, U=U))
}
ralpha_star <- function(n, eta, Sigma, N_MCMC_BETWEEN=40*nrow(Sigma)^2) {
  d <- ncol(Sigma)
  mcmc <- mcmc_alpha_star(eta, Sigma, N_MCMC_BETWEEN*n)
  samples <- mcmc$U[,,(1:n)*N_MCMC_BETWEEN]
  return(samples)
}


###############################################################################
###############################################################################
###############################################################################

# ##
# ## Pre-compute random draws from alpha(eta,I_d) for some eta
# ##
# d <- 2
# N_REPS <- 10000
# M <- 60
# U_store <- array(NA, dim=c(d,d,M*N_REPS))
# burnin <- 3000 # 1000 is enough for eta=2
# thin <- 400 # 100 is enough for eta=2
# N_MCMC <- burnin + M*thin
# reps <- floor(seq(burnin+1, N_MCMC, length.out=M))
# eta <- 8
# for (repN in 1:N_REPS) {
#   print(repN)
#   mcmc_tmp <- mcmc_alpha_star(eta, diag(d), N_MCMC)
#   reps_repN <- seq((repN-1)*M+1, repN*M)
#   U_store[,,reps_repN] <- mcmc_tmp$U[,,reps]
# }
# save(list="U_store", file=paste0("U_store_eta_", eta))

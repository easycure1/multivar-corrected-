if (corrected && toggle) {
  # 1) Full conditional of beta - Yixuan
  # TODO This proposal needs improval
  V_beta_post_inv <- V_beta_inv ##
  param__beta_old <- V_beta_inv %*% mu_beta ##
  if (var.order>0) {   ##for (jj in 1:(n-var.order)) {
    for (jj in 1:(n-var.order)) { ##
      Z_t <- ZZ[((jj-1)*d+1):(jj*d),] ##
      Y_t <- Y_vec[((jj-1)*d+1):(jj*d)] ##
      V_beta_post_inv <- V_beta_post_inv + t(Z_t) %*% param_Sigma_inv[,,i] %*% Z_t ##
      param__beta_old <- param__beta_old + t(Z_t) %*% param_Sigma_inv[,,i] %*% Y_t ##  mimic var - Yixuan
    } ##
    V_beta_post <- solve(V_beta_post_inv) ##
    param__beta.star <- V_beta_post %*% param_beta_old ##
    param__beta.star <- MASS::mvrnorm(1, mu=param__beta.star, Sigma=V_beta_post) ##
    param__phi.star <- phiFromBeta_normalInverseWishart(param__beta.star, d, var.order) ##
    f_param.star <- psd_varma(lambda, param__phi.star, sigma=param__Sigma[,,i]) ## Note f_param.star is not psd_varma()$psd - Yixuan
    #indices_jj <- ((jj-1)*d*d+1):(jj*d*d)
    #param__beta.star <- param__beta.old
    #param__beta.star[indices_jj] <- param__beta.star[indices_jj] + 
    #  MASS::mvrnorm(1, mu=rep(0, d*d), Sigma=diag(eps_param[jj], d*d, d*d))
    #param__phi.star <- phiFromBeta_normalInverseWishart(param__beta.star, d, var.order)
    #f_param.star <- psd_varma(lambda, param__phi.star, sigma=sigma.fit)$psd
    
    # plotMPsd(f_param.star, main="proposed")
    #rejectedPhi <- F
    #if (any(apply(f_param.star, 3, hasEigenValueSmallerZero, TOL=NUMERICAL_THRESH))) { # stay positive definite
    #  if (verbose) print_warn("Discarding f_param proposal, because of positive definiteness")
    #  param__beta[,i+1] <- param__beta[,i]
    #  param__phi[,,i+1] <- param__phi[,,i]
    #  rejectedPhi <- T
    #} 
    #if (numericalUnstable(f_param.star, excludeBoundary=F, TOL=NUMERICAL_THRESH)) { # stay numerically stable
    #  if (verbose) print_warn("Discarding f_param proposal, because of numerical instablity")
    #  param__beta[,i+1] <- param__beta[,i]
    #  param__phi[,,i+1] <- param__phi[,,i]
    #  rejectedPhi <- T
    #}
    if (!rejectedPhi) {
      f_param_half.star <- chol_cube(f_param.star$psd, excludeBoundary=F)
      phi.fit.star <- list(ar=param__phi.star,
                           f_param_half=f_param_half.star,
                           f_param_half_trans=trans_cube(f_param_half.star),
                           beta=param__beta.star,  ## 
                           mu_beta=mu_beta,        ## include stuff for prior computation, too
                           V_beta_inv=V_beta_inv)  ##
    #  f.phi.star <- lpost_matrixGamma(omega=omega,
    #                                  FZ=FZ,
    #                                  r=r[,i+1],
    #                                  U=U[,,,i+1],
    #                                  Z=Z[,i+1],
    #                                  k=k[,i+1],
    #                                  C_alpha=C_alpha,
    #                                  omega_fun=omega_fun,
    #                                  k.theta=k.theta,
    #                                  db.list=db.list,
    #                                  eta=eta,
    #                                  Sigma_fun=Sigma_fun,
    #                                  corrected=corrected,
    #                                  phi=phi.fit.star, #
    #                                  sigma_ar=sigma.fit,
    #                                  prior.q=prior.q,
    #                                  prior.cholesky=prior.cholesky,
    #                                  excludeBoundary=T, # note
    #                                  verbose=verbose)
    #  f.phi <- f.store
    #  alpha5 <- min(0, f.phi.star - f.phi) # Note: Normal proposal symmetric for beta
    #  if (log(runif(1,0,1)) < alpha5) {
    #    # accept
    #    param__beta[,i+1] <- param__beta.star
    #    param__beta.old <- param__beta.star
    #    param__phi[,,i+1] <- param__phi.star
    #    phi.fit <- phi.fit.star
    #    f.store <- f.phi.star
    #  } else {
        # reject
    #    param__beta[,i+1] <- param__beta[,i]
    #    param__phi[,,i+1] <- param__phi[,,i]
    #  }
    #}
    
    # 2) Draw theta (MH)
  }
}































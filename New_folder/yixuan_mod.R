if (corrected && toggle) {
  # 1) Full conditional of beta - Yixuan
  # TODO This proposal needs improval
  V_beta_post_inv <- V_beta_inv ##
  param__beta_old <- V_beta_inv %*% param__beta_old ##
  if (var.order>0) {   ##for (jj in 1:(n-var.order)) {
    for (jj in 1:(n-var.order)) { ##
      Z_t <- ZZ[((jj-1)*d+1):(jj*d),] ##
      Y_t <- Y_vec[((jj-1)*d+1):(jj*d)] ##
      V_beta_post_inv <- V_beta_post_inv + t(Z_t) %*% param__Sigma_inv[,,i] %*% Z_t ##
      param__beta_old <- param__beta_old + t(Z_t) %*% param__Sigma_inv[,,i] %*% Y_t ##  mimic var - Yixuan
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
    rejectedPhi <- F
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
                           V_beta_inv=V_beta_post_inv,
                           sigma=param__Sigma[,,i])  ##
      f.phi.star <- lpost_matrixGamma(omega=omega,
                                      FZ=FZ,
                                      r=r[,i+1],
                                      U=U[,,,i+1],
                                      Z=Z[,i+1],
                                      k=k[,i+1],
                                      C_alpha=C_alpha,
                                      omega_fun=omega_fun,
                                      k.theta=k.theta,
                                      db.list=db.list,
                                      eta=eta,
                                      Sigma_fun=Sigma_fun,
                                      corrected=corrected,
                                      phi=phi.fit.star, #
                                      sigma_ar=sigma.fit, ##??? - Yixuan
                                      prior.q=prior.q,
                                      prior.cholesky=prior.cholesky,
                                      excludeBoundary=T, # note
                                      verbose=verbose)
      f.phi <- f.store
      alpha5 <- min(0, f.phi.star - f.phi) # Note: Normal proposal symmetric for beta
      if (log(runif(1,0,1)) < alpha5) {
        # accept
        param__beta[,i+1] <- param__beta.star
        param__beta.old <- param__beta.star
        param__phi[,,i+1] <- param__phi.star
        phi.fit <- phi.fit.star
        f.store <- f.phi.star
      } else {
        # reject
        param__beta[,i+1] <- param__beta[,i]
        param__phi[,,i+1] <- param__phi[,,i]
      }
    }
  }
}






##
## Step 6: Sample parameter of interest
##

# MH Step for theta
if (theta_dim > 0) {
  if (corrected) {
    q_for_theta <- get_f_matrix(U[,,,i+1], r[,i+1], Z[,i+1], k[,i+1], db.list, prior.cholesky)
    f_for_theta <- mult_cube(mult_cube(phi.fit$f_param_half, q_for_theta), phi.fit$f_param_half_trans)
    previous_theta <- theta[,i] # might change for corrected in case of double steps
  } else {
    f_for_theta <- get_f_matrix(U[,,,i+1], r[,i+1], Z[,i+1], k[,i+1], db.list, prior.cholesky)
    previous_theta <- theta[,i] # might change for corrected in case of double steps
  }
  theta_prop <- propose_next_theta(data=data, f=f_for_theta, previous_theta=previous_theta, NULL)
  theta_star <- theta_prop$theta_star
  noise_star <- get_noise(data, theta_star)  # noise = data - signal
  FZ_star <- mdft(noise_star)  # Frequency domain
  
  ##
  f.theta.star <- lpost_matrixGamma(omega=omega,
                                    FZ=FZ_star, # note
                                    r=r[,i+1],
                                    U=U[,,,i+1],
                                    Z=Z[,i+1],
                                    k=k[,i+1],
                                    C_alpha=C_alpha,
                                    omega_fun=omega_fun,
                                    k.theta=k.theta,
                                    db.list=db.list,
                                    eta=eta,
                                    Sigma_fun=Sigma_fun,
                                    corrected=corrected,
                                    phi=phi.fit,
                                    sigma_ar=sigma.fit,
                                    prior.q=prior.q,
                                    prior.cholesky=prior.cholesky,
                                    excludeBoundary=F, # note
                                    verbose=verbose)
  f.theta <- lpost_matrixGamma(omega=omega,
                               FZ=FZ, # note
                               r=r[,i+1],
                               U=U[,,,i+1],
                               Z=Z[,i+1],
                               k=k[,i+1],
                               C_alpha=C_alpha,
                               omega_fun=omega_fun,
                               k.theta=k.theta,
                               db.list=db.list,
                               eta=eta,
                               Sigma_fun=Sigma_fun,
                               corrected=corrected,
                               phi=phi.fit,
                               sigma_ar=sigma.fit,
                               prior.q=prior.q,
                               prior.cholesky=prior.cholesky,
                               excludeBoundary=F, # note
                               verbose=verbose)
  ##
  
  alphaTheta <- min(0, f.theta.star + lprior_theta(theta_star) - 
                      f.theta - lprior_theta(theta[,i]) +
                      theta_prop$lprop_previous_theta - 
                      theta_prop$lprop_theta_star)
  if (log(runif(1,0,1)) < alphaTheta) {
    theta[,i+1] <- theta_star
    f.store <- lpost_matrixGamma(omega=omega,
                                 FZ=FZ_star, # note
                                 r=r[,i+1],
                                 U=U[,,,i+1],
                                 Z=Z[,i+1],
                                 k=k[,i+1],
                                 C_alpha=C_alpha,
                                 omega_fun=omega_fun,
                                 k.theta=k.theta,
                                 db.list=db.list,
                                 eta=eta,
                                 Sigma_fun=Sigma_fun,
                                 corrected=corrected,
                                 phi=phi.fit,
                                 sigma_ar=sigma.fit,
                                 prior.q=prior.q,
                                 prior.cholesky=prior.cholesky,
                                 excludeBoundary=T, # note
                                 verbose=verbose)
    noise <- noise_star
    Y_mat <- apply(noise, 2, tail, n-p)
    Y_vec <- c(t(Y_mat))
    ZZ <- VAR_regressor_matrix(noise, p)
  } else {
    theta[,i+1] <- theta[,i]
  }
}




##
## Full conditional of param_Sigma_inv
##


nu_Sigma_post <- n - p + nu_Sigma
S_Sigma_post <- S_Sigma
for (i in 1:(n-p)) {
  Z_t <- ZZ[((i-1)*d+1):(i*d),]
  Y_t <- Y_vec[((i-1)*d+1):(i*d)]
  ymZb <- Y_t - Z_t %*% param__beta[,i+1]
  S_Sigma_post <- S_Sigma_post + ymZb %*% t(ymZb)
}
S_Sigma_post_inv <- solve(S_Sigma_post)
param__Sigma_inv[,,i+1] <- rWishart(n=1, df=nu_Sigma_post, Sigma=S_Sigma_post)[,,1]
param__Sigma_tmp <- solve(param__Sigma_inv[,,i+1])
param__Sigma[,,i+1] <- param__Sigma_tmp



























# source("gibbs_multivariate_util.R") # psd_varma

## 
## Bayesian VAR with the (unconstrained) independent normal inverse Wishart prior.
## See Section 2.2.3 in Koop, Corobilis for a detailed account.
##
gibbs_VAR_nuisance <- function(data, # data
                               mcmc_params,
                               prior_params,
                               model_params) {
  # + Z: data
  # + Ntotal, burnin: mcmc_params
  # + p, beta_prior, V_prior, S_prior, nu_prior: prior_params
  # + implement thin, print_interval
  # + data to noise: Y_mat, Y_vec, ZZ
  # + implement nuisance model stuff: model_params
  # + update examples
  # - compare different prior choices (some 'default'/'flat' which is non-empirical bayes?)
  
  warning("No double-step between beta's and theta implemented (yet)")
  
  K <- ncol(data)
  if (K==1) stop("Use 1D algorithms instead")
  n <- nrow(data)
  
  # MCMC parameters
  stopifnot(!is.null(mcmc_params$Ntotal)); stopifnot(mcmc_params$Ntotal>0)
  Ntotal <- mcmc_params$Ntotal
  stopifnot(!is.null(mcmc_params$burnin)); stopifnot(mcmc_params$burnin>=0 && mcmc_params$burnin<Ntotal)
  burnin <- mcmc_params$burnin
  stopifnot(!is.null(mcmc_params$thin)); stopifnot(mcmc_params$thin>=1)
  thin <- mcmc_params$thin
  stopifnot(!is.null(mcmc_params$print_interval)); stopifnot(mcmc_params$print_interval>0)
  print_interval <- mcmc_params$print_interval
  # Note: No adaptive MCMC employed here
  
  # Prior parameters
  stopifnot(!is.null(prior_params$var.order))
  stopifnot(prior_params$var.order > 0)
  p <- prior_params$var.order
  stopifnot(!is.null(prior_params$beta_prior))
  stopifnot(length(prior_params$beta_prior)==K*K*p)
  beta_prior <- prior_params$beta_prior
  stopifnot(!is.null(prior_params$V_prior))
  stopifnot(class(prior_params$V_prior)=="matrix")
  stopifnot(ncol(prior_params$V_prior)==K*K*p && nrow(prior_params$V_prior)==K*K*p)
  stopifnot(is_spd(prior_params$V_prior))
  V_prior <- prior_params$V_prior
  stopifnot(!is.null(prior_params$S_prior))
  stopifnot(class(prior_params$S_prior)=="matrix")
  stopifnot(ncol(prior_params$S_prior)==K && nrow(prior_params$S_prior)==K)
  stopifnot(is_spd(prior_params$S_prior))
  S_prior <- prior_params$S_prior
  stopifnot(!is.null(prior_params$nu_prior))
  # stopifnot(prior_params$nu_prior > K-1)
  stopifnot(prior_params$nu_prior >= 0) # Note that prior is improper for 0 <= nu <= K-1
  nu_prior <- prior_params$nu_prior

  # Model paramaters
  stopifnot(!is.null(model_params$theta_dim)); stopifnot(model_params$theta_dim >= 0)
  theta_dim <- model_params$theta_dim
  stopifnot(!is.null(model_params$get_noise)); stopifnot(class(model_params$get_noise)=="function")
  get_noise <- model_params$get_noise
  stopifnot(!is.null(model_params$get_data)); stopifnot(class(model_params$get_data)=="function")
  get_data <- model_params$get_data
  stopifnot(!is.null(model_params$initialize_theta)); stopifnot(class(model_params$initialize_theta)=="function")
  initialize_theta <- model_params$initialize_theta
  stopifnot(!is.null(model_params$lprior_theta)); stopifnot(class(model_params$lprior_theta)=="function")
  lprior_theta <- model_params$lprior_theta
  stopifnot(!is.null(model_params$propose_next_theta)); stopifnot(class(model_params$propose_next_theta)=="function")
  propose_next_theta <- model_params$propose_next_theta
  # Note: model_params$excludeBoundary not needed -- the VAR approach
  # does not use the frequency domain representation of the data

  TT <- n-p 
  V_prior_inv <- solve(V_prior)
  S_prior_inv <- solve(S_prior)
  
  # Initiate values
  lambda <- pi*omegaFreq(n)
  N <- length(lambda)
  Sigma_trace <- array(NA, dim=c(K,K,Ntotal))
  Sigma_inv_trace <- array(NA, dim=c(K,K,Ntotal)) # redundant, for convenience
  beta_trace <- array(NA, dim=c(K*K*p, Ntotal))
  phi_trace <- array(NA, dim=c(K,K*p,Ntotal)) # redundant, for convenience
  psd_trace <- array(NA, dim=c(K,K,N,Ntotal)) # redundant, for convenience // {f11, Re(f12), Im(f12), f22}-representation
  theta_trace <- matrix(NA, nrow=theta_dim, ncol=Ntotal)
  theta_trace[,1] <- initialize_theta(data, NULL)
  noise <- get_noise(data, theta_trace[,1])
  Y_mat <- noise[-(1:p),]
  Y_vec <- c(t(Y_mat))
  ZZ <- VAR_regressor_matrix(noise, p)
  
  lpost_trace <- rep(NA, Ntotal)
  a1 <- ar(noise,order.max=p,aic=F,method="ols")
  Sigma_trace[,,1] <- a1$var.pred
  Sigma_inv_trace[,,1] <- solve(a1$var.pred)
  beta_trace[,1] <- c(a1$ar)
  phi_trace[,,1] <- phiFromBeta_normalInverseWishart(beta_trace[,1], K, p)
  f_param <- psd_varma(lambda, ar=phi_trace[,,1], sigma=solve(Sigma_inv_trace[,,1]))$psd
  psd_trace[,,,1] <- realValuedPsd(f_param)
  lpost_trace[1] <- llike_var_partial(noise, phi_trace[,,1], Sigma_trace[,,1]) +
    lprior_theta(theta_trace[,1])
  
  # Main MCMC loop
  for (isample in 1:(Ntotal-1)) {
    if (!(isample%%print_interval)) {
      cat("iteration ", isample, "/", Ntotal, "\n", sep="")
    }

    # 1) Full conditional of beta
    V_post_inv <- V_prior_inv
    beta_post <- V_prior_inv %*% beta_prior
    for (i in 1:TT) {
      Z_t <- ZZ[((i-1)*K+1):(i*K),]
      Y_t <- Y_vec[((i-1)*K+1):(i*K)]
      V_post_inv <- V_post_inv + t(Z_t) %*% Sigma_inv_trace[,,isample] %*% Z_t
      beta_post <- beta_post + t(Z_t) %*% Sigma_inv_trace[,,isample] %*% Y_t
    }
    V_post <- solve(V_post_inv)
    beta_post <- V_post %*% beta_post
    # beta_trace[,isample+1] <- mvtnorm::rmvnorm(1, mean=beta_post, sigma=V_post)
    beta_trace[,isample+1] <- MASS::mvrnorm(1, mu=beta_post, Sigma=V_post)
    phi_trace[,,isample+1] <- phiFromBeta_normalInverseWishart(beta_trace[,isample+1], K, p)
    f_param <- psd_varma(lambda, ar=phi_trace[,,isample+1], sigma=Sigma_trace[,,isample])$psd
    
    # 2) Draw theta (MH)
    if (theta_dim > 0) {
      theta_prev <- theta_trace[,isample]
      theta_prop <- propose_next_theta(data=data, f=f_param, previous_theta=theta_prev, NULL)
      theta_star <- theta_prop$theta_star
      
      noise_star <- get_noise(data, theta_star)
      f.theta_star <- llike_var_partial(noise_star, 
                                        phi_trace[,,isample+1], 
                                        Sigma_trace[,,isample]) +
        lprior_theta(theta_star)
      f.theta <- llike_var_partial(noise, 
                                   phi_trace[,,isample+1], 
                                   Sigma_trace[,,isample]) +
        lprior_theta(theta_trace[,isample])
      alpha.theta <- min(0, f.theta_star - f.theta + 
                           theta_prop$lprop_previous_theta - 
                           theta_prop$lprop_theta_star)
      if (log(runif(1,0,1)) < alpha.theta) {
        # accept
        theta_trace[,isample+1] <- theta_star
        noise <- noise_star
        Y_mat <- noise[-(1:p),]
        Y_vec <- c(t(Y_mat))
        ZZ <- VAR_regressor_matrix(noise, p)
      } else {
        # reject and use previous
        theta_trace[,isample+1] <- theta_trace[,isample]
      }
    }
    
    # 3) Full conditional of Sigma_inv
    nu_post <- TT + nu_prior
    S_post <- S_prior
    for (i in 1:TT) {
      Z_t <- ZZ[((i-1)*K+1):(i*K),]
      Y_t <- Y_vec[((i-1)*K+1):(i*K)]
      ymZb <- Y_t - Z_t %*% beta_trace[,isample+1]
      S_post <- S_post + ymZb %*% t(ymZb)
    }
    S_post_inv <- solve(S_post)
    Sigma_inv_trace[,,isample+1] <- rWishart(n=1, df=nu_post, Sigma=S_post_inv)[,,1]
    Sigma_tmp <- solve(Sigma_inv_trace[,,isample+1])
    Sigma_trace[,,isample+1] <- Sigma_tmp

    # Update some stuff
    psd_trace[,,,isample+1] <- realValuedPsd(f_param)
    stopifnot(!any(is.na(psd_trace[,,,isample+1])))
    lpost_trace[isample+1] <- llike_var_partial(noise, phi_trace[,,isample+1], Sigma_trace[,,isample+1]) +
      lprior_theta(theta_trace[,isample+1])
  }
  
  # Remove burnin-period and return traces
  keep <- seq(from=burnin+1, to=Ntotal, by=thin)
  fpsd.s <- apply(psd_trace[,,,keep], c(1,2,3), median)
  fpsd.mean <- apply(psd_trace[,,,keep], c(1,2,3), mean)
  fpsd.s05 <- apply(psd_trace[,,,keep], c(1,2,3), quantile, 0.05)
  fpsd.s95 <- apply(psd_trace[,,,keep], c(1,2,3), quantile, 0.95)
  
  alpha_uci <- 0.1 # same as in 1D
  uci_tmp <- uci_matrix(fpsd.sample=psd_trace[,,,keep], 
                        alpha=alpha_uci)
  fpsd.uci05 <- uci_tmp$fpsd.uci05
  fpsd.uci95 <- uci_tmp$fpsd.uci95
  uuci_tmp <- uci_matrix(fpsd.sample=psd_trace[,,,keep], 
                         alpha=alpha_uci, 
                         uniform_among_components=T)
  fpsd.uuci05 <- uuci_tmp$fpsd.uci05
  fpsd.uuci95 <- uuci_tmp$fpsd.uci95
  
  # # Construct forecasts
  # N_FORECAST <- 10
  # data_forecast <- array(data=NA, dim=c(N_FORECAST, K, length(keep)))
  # for (i in 1:length(keep)) {
  #   phi_store <- phi_trace[,,i]
  #   noise <- get_noise(data, theta_trace[,i])  
  #   innov <- MASS::mvrnorm(n=N_FORECAST, mu=rep(0,K), Sigma=Sigma_trace[,,i])
  #   noise_forecast <- var_forecast(noise, phi_store, innov)
  #   noise_all <- rbind(noise, noise_forecast)
  #   data_forecast[,,i] <- get_data(noise_all, theta_trace[,i])[-(1:nrow(noise)),]
  # }
  
  return(list(beta=beta_trace[,keep],
              phi=phi_trace[,,keep],
              Sigma=Sigma_trace[,,keep],
              Sigma_inv=Sigma_inv_trace[,,keep],
              fpsd.s=fpsd.s,
              fpsd.mean=fpsd.mean,
              fpsd.s05=fpsd.s05,
              fpsd.s95=fpsd.s95,
              # fpsd.uci05=fpsd.uci05,
              # fpsd.uci95=fpsd.uci95,
              fpsd.uuci05=fpsd.uuci05,
              fpsd.uuci95=fpsd.uuci95,
              lpost=lpost_trace, # log posterior: don't discard burnin to investigate convergence
              p=p,
              theta=theta_trace[,keep]#,
              #data_forecast=data_forecast
              ))
}

reduceMemoryStorage_VAR <- function(mcmc, data) {
  # ret <- mcmc
  # ret$beta <- NULL
  # ret$phi <- NULL
  # ret$Sigma <- NULL
  # ret$Sigma_inv <- NULL
  ret <- (list(data=data,
               fpsd.median=mcmc$psd.median,
               fpsd.mean=mcmc$psd.mean,
               fpsd.s05=mcmc$psd.p05,
               fpsd.s95=mcmc$psd.p95,
               # fpsd.uci05=mcmc$fpsd.uci05,
               # fpsd.uci95=mcmc$fpsd.uci95,
               fpsd.uuci05=mcmc$psd.u05,
               fpsd.uuci95=mcmc$psd.u95,
               lpostTrace=mcmc$lpost,
               beta=mcmc$beta,
               Sigma=mcmc$Sigma))
  return(ret)
}

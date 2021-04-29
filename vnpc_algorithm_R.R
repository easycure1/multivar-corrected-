## MH-Within Gibbs sampler
##
for (i in 1:(Ntotal-1)) {
  noise <- get_noise(data, theta[,i])
  FZ <- mdft(noise) # Frequency domain
  
  if (i==1) {
    ##
    ## f.store: previous lpost value to save some computation time in MH steps
    ## Needs to be updated for every proposal acceptance
    ##
    f.store <- lpost_correct_whittle(omega=omega,
                                 FZ=FZ,
                                 r=r[,i],
                                 U=U[,,,i],
                                 Z=Z[,i],
                                 k[,i],
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
                                 excludeBoundary=T)
    
    lpostTrace[1] <- f.store + lprior_theta(theta[,1])
    lpriorTrace[1] <- lprior_correct_whittle(r=r[,1],
                                         U=U[,,,1],
                                         Z=Z[,1],
                                         k=k[,1],
                                         C_alpha=C_alpha,
                                         omega_fun=omega_fun,
                                         k.theta=k.theta,
                                         eta=eta,
                                         Sigma_fun=Sigma_fun,
                                         phi=phi.fit) +
      lprior_theta(theta[,1])
    llikeTrace[1] <- lpostTrace[1] - lpriorTrace[1]
  }
  
  ##
  ## Step 1: Sample k from MH
  ##
  
  k.old <- k[i]
  k.star <- k.old + round(rt(1, 1)) # Cauchy distribution discretized
  while (k.star < 3 || k.star > kmax){
    k.star <- k.old + round((rt(1, 1)))
  }
  f.k.star <- lpost_correct_whittle()
  f.k <- f.store
  # Accept/reject
  alpha.k <- min(0, f.k.star - f.k)
  if (log(runif(1, 0, 1)) < alpha_k) {
    k[i+1] <- k.star # Accept k.star
    k.old <- k.star
    f.store <- f.k.star
  } else {
    k[i+1] <- k[i] # Reject and use previous
  }
  
  
  ##
  ## Step 2: Sample Z's
  ##
  Z.old <- Z[i]
  for (l in 1:L) {
    Z.star <- Z.old
    Z_star[l] <- Z_star[l] + runif(1, -eps_Z[l], eps_Z[l])
    Z.star[l][Z.star[l] < 0] <- Z.star[l] + 1 # shift in [0, 1]
    Z.star[l][Z.star[l] > 1] <- Z.star[l] - 1 # shift in [0, 1]
    f.Z.star <- lpost_correct_whittle()
    #Accept/reject
    f.Z <- f.store
    alpha.Z <- min(0, f.Z.star - f.Z) # Note: symmetric proposals
    if (log(runif(1,0,1)) < alpha.Z) {
      Z[l, i+1] <- Z.star[l] # Accept Z.star
      f.store <- f.Z.star
      Z.old <- Z.star
    } else {
      Z[l, i+1] <- Z[l, i] # Reject
    }
  }
}


























































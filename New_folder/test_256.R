library(beyondWhittle)


source("_include_multivariate_cluster.R")



## --------------------------------------------------
## Model and data
##
 d <- 2
  param_ar <- rbind(c(.5, 0, 0, 0), c(0, -.3, 0, -.5))
  param_ma <- matrix(nrow=2, ncol=0)
  param_sigma <- matrix(data=c(1, .9, .9, 1), nrow=2, ncol=2)

  d <- 2
  param_ar <- matrix(nrow=2, ncol=0)
  param_ma <- rbind(c(-.75, .5), c(.5, .75))
  param_sigma <- cbind(c(1,.5),c(0.5,1))
  
n <- 256

data <- varma_sim(n=n, d=2, 
                  ar=param_ar, 
                  ma=param_ma, 
                  rand.gen=MASS::mvrnorm, 
                  mu=rep(0,2), 
                  Sigma=param_sigma)
##
##
## --------------------------------------------------

Ntotal <- 80000 # TODO 80000
burnin <- 50000  # TODO 30000
Nadaptive <- burnin
thin <- 5 # TODO 5
print_interval <- 100 # TODO 10000



  my_Sigma_fun <- function(x) {
    Sigma_fun_eye(x) * 1e4
  }
  p_star <- ar(data)$order
  mcmc_params <- list(Ntotal=Ntotal,
                      burnin=burnin,
                      thin=thin,
                      print_interval=print_interval,
                      numerical_thresh=1e-12,
                      Nadaptive=Nadaptive,
                      adaption.batchSize=50,
                      adaption.targetAcceptanceRate=0.44,
                      verbose=F)
  prior_params <- list(prior.cholesky=F,
                       var.order=p_star,
                       eta=d,
                       omega_fun=create_omega_fun_from_beta_density(1,1,1),
                       Sigma_fun=my_Sigma_fun,
                       k.theta=0.01,
                       kmax=300,
                       bernstein_l=0.1, # note
                       bernstein_r=0.9, # note
                       coarsened=F, # note
                       L=20,
                       toggle=TRUE,
                       prior.q=T,
                       mu_beta=rep(1e-4,2*2*p_star), #p_star here might be changed to var.order in case a larger var.order is used
                       V_beta=diag(2*2*p_star)*1e4)  #same as above
  model_params <- psd_dummy_model()
  mcmc <- gibbs_m_nuisance(data=data,
                           mcmc_params=mcmc_params,
                           corrected=T,
                           prior_params=prior_params,
                           model_params=model_params)
  mcmc <- reduceMemoryStorage_matrixGamma(mcmc)

save(mcmc, file='vnpc_256_var2_new.RData')
save(mcmc, file='vnpc_256_vma1.RData')

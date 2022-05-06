library(beyondWhittle)


realValuedPsd <- function(x){
  out <- matrix(nrow = 2, ncol = 2)
  out[1,1] <- Re(x[1,1])
  out[1,2] <- Re(x[1,2])
  out[2,1] <- Im(x[2,1])
  out[2,2] <- Re(x[2,2])
  out
}



#---------------------------VAR2_256---------------------------------#


psd_256 <- psd_varma(0:128*2*pi/256, 
                     ar=rbind(c(.5, 0, 0, 0), c(0, -.3, 0, -.5)),
                     Sigma=matrix(data=c(1, .9, .9, 1), nrow=2, ncol=2))


psd_256_real <- array(NA, c(2, 2, 129))
for(i in 1:129){
  psd_256_real[,,i] <- realValuedPsd(psd_256[,,i])
}



##---------------------VNPC-------------------------------##

n_vnpc <- 0

for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo1.RData')
  load(name)
  if (all(mcmc$fpsd.uuci05<=psd_256_real & mcmc$fpsd.uuci95>=psd_256_real)){
    n_vnpc <- n_vnpc+1
  } 
  else{
    n_vnpc <- n_vnpc
  }
}
n_vnpc/1000




##---------------------VNP-------------------------------##

n_vnp <- 0

for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u05_real <- array(NA, c(2, 2, 129))
  u95_real <- array(NA, c(2, 2, 129))
  for (j in 1:129){
    u05_real[,,j] <- realValuedPsd(ret$psd.u05[,,j])
    u95_real[,,j] <- realValuedPsd(ret$psd.u95[,,j])
  }
  if (all(u05_real<=psd_256_real & u95_real>=psd_256_real)){
    n_vnp <- n_vnp+1
  } 
  else{
    n_vnp <- n_vnp
  }
}
n_vnp/1000




##---------------------VAR-------------------------------##

n_var <- 0

for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo2_AIC.RData')
  load(name)
  u05_real <- array(NA, c(2, 2, 129))
  u95_real <- array(NA, c(2, 2, 129))
  for (j in 1:129){
    u05_real[,,j] <- realValuedPsd(mcmc$psd.u05[,,j])
    u95_real[,,j] <- realValuedPsd(mcmc$psd.u95[,,j])
  }
  
  if (all(u05_real<=psd_256_real & u95_real>=psd_256_real)){
    n_var <- n_var+1
  } 
  else{
    n_var <- n_var
  }
}
n_var/1000






#---------------------------VAR2_512---------------------------------#


psd_512 <- psd_varma(0:256*2*pi/512, 
                     ar=rbind(c(.5, 0, 0, 0), c(0, -.3, 0, -.5)),
                     Sigma=matrix(data=c(1, .9, .9, 1), nrow=2, ncol=2))


psd_512_real <- array(NA, c(2, 2, 257))
for(i in 1:257){
  psd_512_real[,,i] <- realValuedPsd(psd_512[,,i])
}



##---------------------VNPC-------------------------------##

n_vnpc <- 0

for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo1.RData')
  load(name)
  if (all(mcmc$fpsd.uuci05<=psd_512_real & mcmc$fpsd.uuci95>=psd_512_real)){
    n_vnpc <- n_vnpc+1
  } 
  else{
    n_vnpc <- n_vnpc
  }
}
n_vnpc/1000




##---------------------VNP-------------------------------##

n_vnp <- 0

for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u05_real <- array(NA, c(2, 2, 257))
  u95_real <- array(NA, c(2, 2, 257))
  for (j in 1:257){
    u05_real[,,j] <- realValuedPsd(ret$psd.u05[,,j])
    u95_real[,,j] <- realValuedPsd(ret$psd.u95[,,j])
  }
  if (all(u05_real<=psd_512_real & u95_real>=psd_512_real)){
    n_vnp <- n_vnp+1
  } 
  else{
    n_vnp <- n_vnp
  }
}
n_vnp/1000




##---------------------VAR-------------------------------##

n_var <- 0

for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo2_AIC.RData')
  load(name)
  u05_real <- array(NA, c(2, 2, 257))
  u95_real <- array(NA, c(2, 2, 257))
  for (j in 1:257){
    u05_real[,,j] <- realValuedPsd(mcmc$psd.u05[,,j])
    u95_real[,,j] <- realValuedPsd(mcmc$psd.u95[,,j])
  }
  
  if (all(u05_real<=psd_512_real & u95_real>=psd_512_real)){
    n_var <- n_var+1
  } 
  else{
    n_var <- n_var
  }
}
n_var/1000


#---------------------VNP_256_VAR2-----------------------------------#

med_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  med_vnp[, , (i*129-128):(129*i)] <- ret$psd.median 
}
save(med_vnp, file='PSD_MEDIAN_imodel1_n256_VNP.RData')



mean_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  mean_vnp[, , (i*129-128):(129*i)] <- ret$psd.mean 
}
save(mean_vnp, file='PSD_MEAN_imodel1_n256_VNP.RData')



p05_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p05_vnp[, , (i*129-128):(129*i)] <- ret$psd.p05
}
save(mean_vnp, file='PSD_P05_imodel1_n256_VNP.RData')



p95_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p95_vnp[, , (i*129-128):(129*i)] <- ret$psd.p95
}
save(mean_vnp, file='PSD_P95_imodel1_n256_VNP.RData')



u05_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u05_vnp[, , (i*129-128):(129*i)] <- ret$psd.u05
}
save(mean_vnp, file='PSD_U05_imodel1_n256_VNP.RData')



u95_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u95_vnp[, , (i*129-128):(129*i)] <- ret$psd.u95
}
save(mean_vnp, file='PSD_U95_imodel1_n256_VNP.RData')





#------------------------VNP_256_VMA1--------------------------------------#

med_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  med_vnp[, , (i*129-128):(129*i)] <- ret$psd.median 
}
save(med_vnp, file='PSD_MEDIAN_imodel2_n256_VNP.RData')



mean_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  mean_vnp[, , (i*129-128):(129*i)] <- ret$psd.mean 
}
save(mean_vnp, file='PSD_MEAN_imodel2_n256_VNP.RData')



p05_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p05_vnp[, , (i*129-128):(129*i)] <- ret$psd.p05
}
save(mean_vnp, file='PSD_P05_imodel2_n256_VNP.RData')



p95_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p95_vnp[, , (i*129-128):(129*i)] <- ret$psd.p95
}
save(mean_vnp, file='PSD_P95_imodel2_n256_VNP.RData')



u05_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u05_vnp[, , (i*129-128):(129*i)] <- ret$psd.u05
}
save(mean_vnp, file='PSD_U05_imodel2_n256_VNP.RData')



u95_vnp <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u95_vnp[, , (i*129-128):(129*i)] <- ret$psd.u95
}
save(mean_vnp, file='PSD_U95_imodel2_n256_VNP.RData')








#-----------------------------VNP_512_VAR2-------------------------------#

med_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  med_vnp[, , (i*257-256):(257*i)] <- ret$psd.median 
}
save(med_vnp, file='PSD_MEDIAN_imodel1_n512_VNP.RData')



mean_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  mean_vnp[, , (i*257-256):(257*i)] <- ret$psd.mean 
}
save(mean_vnp, file='PSD_MEAN_imodel1_n512_VNP.RData')



p05_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p05_vnp[, , (i*257-256):(257*i)] <- ret$psd.p05
}
save(mean_vnp, file='PSD_P05_imodel1_n512_VNP.RData')



p95_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p95_vnp[, , (i*257-256):(257*i)] <- ret$psd.p95
}
save(mean_vnp, file='PSD_P95_imodel1_n512_VNP.RData')



u05_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u05_vnp[, , (i*257-256):(257*i)] <- ret$psd.u05
}
save(mean_vnp, file='PSD_U05_imodel1_n512_VNP.RData')



u95_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u95_vnp[, , (i*257-256):(257*i)] <- ret$psd.u95
}
save(mean_vnp, file='PSD_U95_imodel1_n512_VNP.RData')





#----------------------------------VNP_512_VMA1-----------------------------#

med_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  med_vnp[, , (i*257-256):(257*i)] <- ret$psd.median 
}
save(med_vnp, file='PSD_MEDIAN_imodel2_n512_VNP.RData')



mean_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  mean_vnp[, , (i*257-256):(257*i)] <- ret$psd.mean 
}
save(mean_vnp, file='PSD_MEAN_imodel2_n512_VNP.RData')



p05_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p05_vnp[, , (i*257-256):(257*i)] <- ret$psd.p05
}
save(mean_vnp, file='PSD_P05_imodel2_n512_VNP.RData')



p95_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p95_vnp[, , (i*257-256):(257*i)] <- ret$psd.p95
}
save(mean_vnp, file='PSD_P95_imodel2_n512_VNP.RData')



u05_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u05_vnp[, , (i*257-256):(257*i)] <- ret$psd.u05
}
save(mean_vnp, file='PSD_U05_imodel2_n512_VNP.RData')



u95_vnp <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u95_vnp[, , (i*257-256):(257*i)] <- ret$psd.u95
}
save(mean_vnp, file='PSD_U95_imodel2_n512_VNP.RData')







#-----------------------------VNP_1024_VAR2--------------------------------#

med_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  med_vnp[, , (i*513-512):(513*i)] <- ret$psd.median 
}
save(med_vnp, file='PSD_MEDIAN_imodel1_n1024_VNP.RData')



mean_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  mean_vnp[, , (i*513-512):(513*i)] <- ret$psd.mean 
}
save(mean_vnp, file='PSD_MEAN_imodel1_n1024_VNP.RData')



p05_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p05_vnp[, , (i*513-512):(513*i)] <- ret$psd.p05
}
save(mean_vnp, file='PSD_P05_imodel1_n1024_VNP.RData')



p95_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p95_vnp[, , (i*513-512):(513*i)] <- ret$psd.p95
}
save(mean_vnp, file='PSD_P95_imodel1_n1024_VNP.RData')



u05_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u05_vnp[, , (i*513-512):(513*i)] <- ret$psd.u05
}
save(mean_vnp, file='PSD_U05_imodel1_n1024_VNP.RData')



u95_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u95_vnp[, , (i*513-512):(513*i)] <- ret$psd.u95
}
save(mean_vnp, file='PSD_U95_imodel1_n1024_VNP.RData')






#-----------------------VNP_1024_VMA1--------------------------------------------#


med_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  med_vnp[, , (i*513-512):(513*i)] <- ret$psd.median 
}
save(med_vnp, file='PSD_MEDIAN_imodel2_n1024_VNP.RData')



mean_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  mean_vnp[, , (i*513-512):(513*i)] <- ret$psd.mean 
}
save(mean_vnp, file='PSD_MEAN_imodel2_n1024_VNP.RData')



p05_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p05_vnp[, , (i*513-512):(513*i)] <- ret$psd.p05
}
save(mean_vnp, file='PSD_P05_imodel2_n1024_VNP.RData')



p95_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  p95_vnp[, , (i*513-512):(513*i)] <- ret$psd.p95
}
save(mean_vnp, file='PSD_P95_imodel2_n1024_VNP.RData')



u05_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u05_vnp[, , (i*513-512):(513*i)] <- ret$psd.u05
}
save(mean_vnp, file='PSD_U05_imodel2_n1024_VNP.RData')



u95_vnp <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo3_sqrtmat.RData')
  load(name)
  u95_vnp[, , (i*513-512):(513*i)] <- ret$psd.u95
}
save(mean_vnp, file='PSD_U95_imodel2_n1024_VNP.RData')






#---------------------VAR_256_VAR2-----------------------------------#

med_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo2.RData')
  load(name)
  med_var[, , (i*129-128):(129*i)] <- mcmc$psd.median 
}
save(med_var, file='PSD_MEDIAN_imodel1_n256_VAR.RData')



mean_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo2.RData')
  load(name)
  mean_var[, , (i*129-128):(129*i)] <- mcmc$psd.mean 
}
save(mean_var, file='PSD_MEAN_imodel1_n256_VAR.RData')



p05_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo2.RData')
  load(name)
  p05_var[, , (i*129-128):(129*i)] <- mcmc$psd.p05
}
save(mean_var, file='PSD_P05_imodel1_n256_VAR.RData')



p95_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo2.RData')
  load(name)
  p95_var[, , (i*129-128):(129*i)] <- mcmc$psd.p95
}
save(mean_var, file='PSD_P95_imodel1_n256_VAR.RData')



u05_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo2.RData')
  load(name)
  u05_var[, , (i*129-128):(129*i)] <- mcmc$psd.u05
}
save(mean_var, file='PSD_U05_imodel1_n256_VAR.RData')



u95_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo2.RData')
  load(name)
  u95_var[, , (i*129-128):(129*i)] <- mcmc$psd.u95
}
save(mean_var, file='PSD_U95_imodel1_n256_VAR.RData')





#---------------------VAR_256_VMA1-----------------------------------#

med_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo2.RData')
  load(name)
  med_var[, , (i*129-128):(129*i)] <- mcmc$psd.median 
}
save(med_var, file='PSD_MEDIAN_imodel2_n256_VAR.RData')



mean_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo2.RData')
  load(name)
  mean_var[, , (i*129-128):(129*i)] <- mcmc$psd.mean 
}
save(mean_var, file='PSD_MEAN_imodel2_n256_VAR.RData')



p05_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo2.RData')
  load(name)
  p05_var[, , (i*129-128):(129*i)] <- mcmc$psd.p05
}
save(mean_var, file='PSD_P05_imodel2_n256_VAR.RData')



p95_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo2.RData')
  load(name)
  p95_var[, , (i*129-128):(129*i)] <- mcmc$psd.p95
}
save(mean_var, file='PSD_P95_imodel2_n256_VAR.RData')



u05_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo2.RData')
  load(name)
  u05_var[, , (i*129-128):(129*i)] <- mcmc$psd.u05
}
save(mean_var, file='PSD_U05_imodel2_n256_VAR.RData')



u95_var <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo2.RData')
  load(name)
  u95_var[, , (i*129-128):(129*i)] <- mcmc$psd.u95
}
save(mean_var, file='PSD_U95_imodel2_n256_VAR.RData')





#---------------------VAR_512_VAR2-----------------------------------#

med_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo2.RData')
  load(name)
  med_var[, , (i*257-256):(257*i)] <- mcmc$psd.median 
}
save(med_var, file='PSD_MEDIAN_imodel1_n512_VAR.RData')



mean_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo2.RData')
  load(name)
  mean_var[, , (i*257-256):(257*i)] <- mcmc$psd.mean 
}
save(mean_var, file='PSD_MEAN_imodel1_n512_VAR.RData')



p05_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo2.RData')
  load(name)
  p05_var[, , (i*257-256):(257*i)] <- mcmc$psd.p05
}
save(mean_var, file='PSD_P05_imodel1_n512_VAR.RData')



p95_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo2.RData')
  load(name)
  p95_var[, , (i*257-256):(257*i)] <- mcmc$psd.p95
}
save(mean_var, file='PSD_P95_imodel1_n512_VAR.RData')



u05_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo2.RData')
  load(name)
  u05_var[, , (i*257-256):(257*i)] <- mcmc$psd.u05
}
save(mean_var, file='PSD_U05_imodel1_n512_VAR.RData')



u95_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo2.RData')
  load(name)
  u95_var[, , (i*257-256):(257*i)] <- mcmc$psd.u95
}
save(mean_var, file='PSD_U95_imodel1_n512_VAR.RData')





#---------------------VAR_512_VMA1-----------------------------------#

med_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo2.RData')
  load(name)
  med_var[, , (i*257-256):(257*i)] <- mcmc$psd.median 
}
save(med_var, file='PSD_MEDIAN_imodel2_n512_VAR.RData')



mean_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo2.RData')
  load(name)
  mean_var[, , (i*257-256):(257*i)] <- mcmc$psd.mean 
}
save(mean_var, file='PSD_MEAN_imodel2_n512_VAR.RData')



p05_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo2.RData')
  load(name)
  p05_var[, , (i*257-256):(257*i)] <- mcmc$psd.p05
}
save(mean_var, file='PSD_P05_imodel2_n512_VAR.RData')



p95_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo2.RData')
  load(name)
  p95_var[, , (i*257-256):(257*i)] <- mcmc$psd.p95
}
save(mean_var, file='PSD_P95_imodel2_n512_VAR.RData')



u05_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo2.RData')
  load(name)
  u05_var[, , (i*257-256):(257*i)] <- mcmc$psd.u05
}
save(mean_var, file='PSD_U05_imodel2_n512_VAR.RData')



u95_var <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo2.RData')
  load(name)
  u95_var[, , (i*257-256):(257*i)] <- mcmc$psd.u95
}
save(mean_var, file='PSD_U95_imodel2_n512_VAR.RData')





#-----------------------------VAR_1024_VAR2--------------------------------#

med_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo2.RData')
  load(name)
  med_var[, , (i*513-512):(513*i)] <- mcmc$psd.median 
}
save(med_var, file='PSD_MEDIAN_imodel1_n1024_VAR.RData')



mean_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo2.RData')
  load(name)
  mean_var[, , (i*513-512):(513*i)] <- mcmc$psd.mean 
}
save(mean_var, file='PSD_MEAN_imodel1_n1024_VAR.RData')



p05_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo2.RData')
  load(name)
  p05_var[, , (i*513-512):(513*i)] <- mcmc$psd.p05
}
save(mean_var, file='PSD_P05_imodel1_n1024_VAR.RData')



p95_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo2.RData')
  load(name)
  p95_var[, , (i*513-512):(513*i)] <- mcmc$psd.p95
}
save(mean_var, file='PSD_P95_imodel1_n1024_VAR.RData')



u05_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo2.RData')
  load(name)
  u05_var[, , (i*513-512):(513*i)] <- mcmc$psd.u05
}
save(mean_var, file='PSD_U05_imodel1_n1024_VAR.RData')



u95_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo2.RData')
  load(name)
  u95_var[, , (i*513-512):(513*i)] <- mcmc$psd.u95
}
save(mean_var, file='PSD_U95_imodel1_n1024_VAR.RData')






#-----------------------VAR_1024_VMA1--------------------------------------------#


med_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo2.RData')
  load(name)
  med_var[, , (i*513-512):(513*i)] <- mcmc$psd.median 
}
save(med_var, file='PSD_MEDIAN_imodel2_n1024_VAR.RData')



mean_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo2.RData')
  load(name)
  mean_var[, , (i*513-512):(513*i)] <- mcmc$psd.mean 
}
save(mean_var, file='PSD_MEAN_imodel2_n1024_VAR.RData')



p05_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo2.RData')
  load(name)
  p05_var[, , (i*513-512):(513*i)] <- mcmc$psd.p05
}
save(mean_var, file='PSD_P05_imodel2_n1024_VAR.RData')



p95_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo2.RData')
  load(name)
  p95_var[, , (i*513-512):(513*i)] <- mcmc$psd.p95
}
save(mean_var, file='PSD_P95_imodel2_n1024_VAR.RData')



u05_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo2.RData')
  load(name)
  u05_var[, , (i*513-512):(513*i)] <- mcmc$psd.u05
}
save(mean_var, file='PSD_U05_imodel2_n1024_VAR.RData')



u95_var <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo2.RData')
  load(name)
  u95_var[, , (i*513-512):(513*i)] <- mcmc$psd.u95
}
save(mean_var, file='PSD_U95_imodel2_n1024_VAR.RData')










#---------------------VNPC_256_VAR2-----------------------------------#

med_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo1.RData')
  load(name)
  med_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.s 
}
save(med_vnpc, file='PSD_MEDIAN_imodel1_n256_VNPC.RData')



mean_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo1.RData')
  load(name)
  mean_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.mean 
}
save(mean_vnpc, file='PSD_MEAN_imodel1_n256_VNPC.RData')



p05_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo1.RData')
  load(name)
  p05_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.s05
}
save(mean_vnpc, file='PSD_P05_imodel1_n256_VNPC.RData')



p95_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo1.RData')
  load(name)
  p95_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.s95
}
save(mean_vnpc, file='PSD_P95_imodel1_n256_VNPC.RData')



u05_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo1.RData')
  load(name)
  u05_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.uuci05
}
save(mean_vnpc, file='PSD_U05_imodel1_n256_VNPC.RData')



u95_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel1_repN', i, '_algo1.RData')
  load(name)
  u95_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.uuci95
}
save(mean_vnpc, file='PSD_U95_imodel1_n256_VNPC.RData')





#---------------------VNPC_256_VMA1-----------------------------------#

med_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo1.RData')
  load(name)
  med_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.s 
}
save(med_vnpc, file='PSD_MEDIAN_imodel2_n256_VNPC.RData')



mean_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo1.RData')
  load(name)
  mean_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.mean 
}
save(mean_vnpc, file='PSD_MEAN_imodel2_n256_VNPC.RData')



p05_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo1.RData')
  load(name)
  p05_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.s05
}
save(mean_vnpc, file='PSD_P05_imodel2_n256_VNPC.RData')



p95_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo1.RData')
  load(name)
  p95_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.s95
}
save(mean_vnpc, file='PSD_P95_imodel2_n256_VNPC.RData')



u05_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo1.RData')
  load(name)
  u05_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.uuci05
}
save(mean_vnpc, file='PSD_U05_imodel2_n256_VNPC.RData')



u95_vnpc <- array(rep(NA, 2*2*129*1000), dim=c(2, 2, 129*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n256_imodel2_repN', i, '_algo1.RData')
  load(name)
  u95_vnpc[, , (i*129-128):(129*i)] <- mcmc$fpsd.uuci95
}
save(mean_vnpc, file='PSD_U95_imodel2_n256_VNPC.RData')





#---------------------VNPC_512_VAR2-----------------------------------#

med_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo1.RData')
  load(name)
  med_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.s 
}
save(med_vnpc, file='PSD_MEDIAN_imodel1_n512_VNPC.RData')



mean_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo1.RData')
  load(name)
  mean_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.mean 
}
save(mean_vnpc, file='PSD_MEAN_imodel1_n512_VNPC.RData')



p05_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo1.RData')
  load(name)
  p05_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.s05
}
save(mean_vnpc, file='PSD_P05_imodel1_n512_VNPC.RData')



p95_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo1.RData')
  load(name)
  p95_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.s95
}
save(mean_vnpc, file='PSD_P95_imodel1_n512_VNPC.RData')



u05_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo1.RData')
  load(name)
  u05_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.uuci05
}
save(mean_vnpc, file='PSD_U05_imodel1_n512_VNPC.RData')



u95_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel1_repN', i, '_algo1.RData')
  load(name)
  u95_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.uuci95
}
save(mean_vnpc, file='PSD_U95_imodel1_n512_VNPC.RData')





#---------------------VNPC_512_VMA1-----------------------------------#

med_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo1.RData')
  load(name)
  med_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.s 
}
save(med_vnpc, file='PSD_MEDIAN_imodel2_n512_VNPC.RData')



mean_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo1.RData')
  load(name)
  mean_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.mean 
}
save(mean_vnpc, file='PSD_MEAN_imodel2_n512_VNPC.RData')



p05_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo1.RData')
  load(name)
  p05_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.s05
}
save(mean_vnpc, file='PSD_P05_imodel2_n512_VNPC.RData')



p95_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo1.RData')
  load(name)
  p95_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.s95
}
save(mean_vnpc, file='PSD_P95_imodel2_n512_VNPC.RData')



u05_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo1.RData')
  load(name)
  u05_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.uuci05
}
save(mean_vnpc, file='PSD_U05_imodel2_n512_VNPC.RData')



u95_vnpc <- array(rep(NA, 2*2*257*1000), dim=c(2, 2, 257*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n512_imodel2_repN', i, '_algo1.RData')
  load(name)
  u95_vnpc[, , (i*257-256):(257*i)] <- mcmc$fpsd.uuci95
}
save(mean_vnpc, file='PSD_U95_imodel2_n512_VNPC.RData')





#-----------------------------VNPC_1024_VAR2--------------------------------#

med_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo1.RData')
  load(name)
  med_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.s
}
save(med_vnpc, file='PSD_MEDIAN_imodel1_n1024_VNPC.RData')



mean_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo1.RData')
  load(name)
  mean_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.mean 
}
save(mean_vnpc, file='PSD_MEAN_imodel1_n1024_VNPC.RData')



p05_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo1.RData')
  load(name)
  p05_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.s05
}
save(mean_vnpc, file='PSD_P05_imodel1_n1024_VNPC.RData')



p95_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo1.RData')
  load(name)
  p95_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.s95
}
save(mean_vnpc, file='PSD_P95_imodel1_n1024_VNPC.RData')



u05_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo1.RData')
  load(name)
  u05_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.uuci05
}
save(mean_vnpc, file='PSD_U05_imodel1_n1024_VNPC.RData')



u95_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel1_repN', i, '_algo1.RData')
  load(name)
  u95_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.uuci95
}
save(mean_vnpc, file='PSD_U95_imodel1_n1024_VNPC.RData')






#-----------------------VNPC_1024_VMA1--------------------------------------------#


med_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo1.RData')
  load(name)
  med_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.s 
}
save(med_vnpc, file='PSD_MEDIAN_imodel2_n1024_VNPC.RData')



mean_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo1.RData')
  load(name)
  mean_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.mean 
}
save(mean_vnpc, file='PSD_MEAN_imodel2_n1024_VNPC.RData')



p05_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo1.RData')
  load(name)
  p05_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.s05
}
save(mean_vnpc, file='PSD_P05_imodel2_n1024_VNPC.RData')



p95_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo1.RData')
  load(name)
  p95_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.s95
}
save(mean_vnpc, file='PSD_P95_imodel2_n1024_VNPC.RData')



u05_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo1.RData')
  load(name)
  u05_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.uuci05
}
save(mean_vnpc, file='PSD_U05_imodel2_n1024_VNPC.RData')



u95_vnpc <- array(rep(NA, 2*2*513*1000), dim=c(2, 2, 513*1000))
for (i in 1:1000) {
  name <- paste0('RES_MULTI__n1024_imodel2_repN', i, '_algo1.RData')
  load(name)
  u95_vnpc[, , (i*513-512):(513*i)] <- mcmc$fpsd.uuci95
}
save(mean_vnpc, file='PSD_U95_imodel2_n1024_VNPC.RData')




















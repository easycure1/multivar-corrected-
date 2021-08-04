library(beyondWhittle)

#-------------------------VAR2----------------------------------------------------#

#------------------------256_VAR2--------------------------------------#

#-----------------VNPC_256_VAR2---------------------------------#

psd_256 <- psd_varma(1:129*2*pi/256, 
                          ar=rbind(c(.5, 0, 0, 0), c(0, -.3, 0, -.5)),
                          Sigma=matrix(data=c(1, .9, .9, 1), nrow=2, ncol=2))
psd_256_m <- array(NA, c(2, 2, 129*1000))
psd_256_m[,,] <- psd_256
med_vnpc <- beyondWhittle:::complexValuedPsd(med_vnpc)
N1_vnpc <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N1_vnpc[i] <- sqrt(sum(diag((med_vnpc[,,i]-psd_256_m[,,i])%*%
                           (med_vnpc[,,i]-psd_256_m[,,i]))))
}
N1_vnpc <- N1_vnpc[-seq(129, 129*1000, by=129)]
L1_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnpc[i] <- mean(N1_vnpc[(128*i-127):(128*i)])
}

N2_vnpc <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N2_vnpc[i] <- sum(diag((med_vnpc[,,i]-psd_256_m[,,i])%*%
                                (med_vnpc[,,i]-psd_256_m[,,i])))
}
N2_vnpc <- N2_vnpc[-seq(129, 129*1000, by=129)]
L2_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnpc[i] <- sqrt(mean(N2_vnpc[(128*i-127):(128*i)]))
}



#-----------------VNP_256_VAR2---------------------------------#

N1_vnp <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N1_vnp[i] <- sqrt(sum(diag((med_vnp[,,i]-psd_256_m[,,i])%*%
                                (med_vnp[,,i]-psd_256_m[,,i]))))
}
N1_vnp <- N1_vnp[-seq(129, 129*1000, by=129)]
L1_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnp[i] <- mean(N1_vnp[(128*i-127):(128*i)])
}

N2_vnp <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N2_vnp[i] <- sum(diag((med_vnp[,,i]-psd_256_m[,,i])%*%
                           (med_vnp[,,i]-psd_256_m[,,i])))
}
N2_vnp <- N2_vnp[-seq(129, 129*1000, by=129)]
L2_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnp[i] <- sqrt(mean(N2_vnp[(128*i-127):(128*i)]))
}



#-----------------VAR_256_VAR2---------------------------------#

N1_var <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N1_var[i] <- sqrt(sum(diag((med_var[,,i]-psd_256_m[,,i])%*%
                               (med_var[,,i]-psd_256_m[,,i]))))
}
N1_var <- N1_var[-seq(129, 129*1000, by=129)]
L1_var <- rep(NA, 1000)
for (i in 1:1000){
  L1_var[i] <- mean(N1_var[(128*i-127):(128*i)])
}

N2_var <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N2_var[i] <- sum(diag((med_var[,,i]-psd_256_m[,,i])%*%
                           (med_var[,,i]-psd_256_m[,,i])))
}
N2_var <- N2_var[-seq(129, 129*1000, by=129)]
L2_var <- rep(NA, 1000)
for (i in 1:1000){
  L2_var[i] <- sqrt(mean(N2_var[(128*i-127):(128*i)]))
}

out_256_var2 <- list(L1_vnpc=Re(mean(L1_vnpc)),
                L1_vnp=Re(mean(L1_vnp)),
                L1_var=Re(mean(L1_var)),
                L2_vnpc=Re(mean(L2_vnpc)),
                L2_vnp=Re(mean(L2_vnp)),
                L2_var=Re(mean(L2_var)))







#--------------------------512_VAR2-------------------------#

#-----------------VNPC_512_VAR2---------------------------------#

psd_512 <- psd_varma(1:257*2*pi/512, 
                     ar=rbind(c(.5, 0, 0, 0), c(0, -.3, 0, -.5)),
                     Sigma=matrix(data=c(1, .9, .9, 1), nrow=2, ncol=2))
psd_512_m <- array(NA, c(2, 2, 257*1000))
psd_512_m[,,] <- psd_512
med_vnpc <- beyondWhittle:::complexValuedPsd(med_vnpc)
N1_vnpc <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N1_vnpc[i] <- sqrt(sum(diag((med_vnpc[,,i]-psd_512_m[,,i])%*%
                                (med_vnpc[,,i]-psd_512_m[,,i]))))
}
N1_vnpc <- N1_vnpc[-seq(257, 257*1000, by=257)]
L1_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnpc[i] <- mean(N1_vnpc[(256*i-255):(256*i)])
}

N2_vnpc <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N2_vnpc[i] <- sum(diag((med_vnpc[,,i]-psd_512_m[,,i])%*%
                           (med_vnpc[,,i]-psd_512_m[,,i])))
}
N2_vnpc <- N2_vnpc[-seq(257, 257*1000, by=257)]
L2_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnpc[i] <- sqrt(mean(N2_vnpc[(256*i-255):(256*i)]))
}



#--------------------VNP_512_VAR2----------------------------#

N1_vnp <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N1_vnp[i] <- sqrt(sum(diag((med_vnp[,,i]-psd_512_m[,,i])%*%
                                (med_vnp[,,i]-psd_512_m[,,i]))))
}
N1_vnp <- N1_vnp[-seq(257, 257*1000, by=257)]
L1_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnp[i] <- mean(N1_vnp[(256*i-255):(256*i)])
}

N2_vnp <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N2_vnp[i] <- sum(diag((med_vnp[,,i]-psd_512_m[,,i])%*%
                           (med_vnp[,,i]-psd_512_m[,,i])))
}
N2_vnp <- N2_vnp[-seq(257, 257*1000, by=257)]
L2_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnp[i] <- sqrt(mean(N2_vnp[(256*i-255):(256*i)]))
}



#--------------------VAR_512_VAR2----------------------------#

N1_var <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N1_var[i] <- sqrt(sum(diag((med_var[,,i]-psd_512_m[,,i])%*%
                               (med_var[,,i]-psd_512_m[,,i]))))
}
N1_var <- N1_var[-seq(257, 257*1000, by=257)]
L1_var <- rep(NA, 1000)
for (i in 1:1000){
  L1_var[i] <- mean(N1_var[(256*i-255):(256*i)])
}

N2_var <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N2_var[i] <- sum(diag((med_var[,,i]-psd_512_m[,,i])%*%
                          (med_var[,,i]-psd_512_m[,,i])))
}
N2_var <- N2_var[-seq(257, 257*1000, by=257)]
L2_var <- rep(NA, 1000)
for (i in 1:1000){
  L2_var[i] <- sqrt(mean(N2_var[(256*i-255):(256*i)]))
}


out_512_var2 <- list(L1_vnpc=Re(mean(L1_vnpc)),
                     L1_vnp=Re(mean(L1_vnp)),
                     L1_var=Re(mean(L1_var)),
                     L2_vnpc=Re(mean(L2_vnpc)),
                     L2_vnp=Re(mean(L2_vnp)),
                     L2_var=Re(mean(L2_var)))








#--------------------------1024_VAR2-------------------------#

#-----------------VNPC_1024_VAR2---------------------------------#

psd_1024 <- psd_varma(1:513*2*pi/1024, 
                     ar=rbind(c(.5, 0, 0, 0), c(0, -.3, 0, -.5)),
                     Sigma=matrix(data=c(1, .9, .9, 1), nrow=2, ncol=2))
psd_1024_m <- array(NA, c(2, 2, 513*1000))
psd_1024_m[,,] <- psd_1024
med_vnpc <- beyondWhittle:::complexValuedPsd(med_vnpc)
N1_vnpc <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N1_vnpc[i] <- sqrt(sum(diag((med_vnpc[,,i]-psd_1024_m[,,i])%*%
                                (med_vnpc[,,i]-psd_1024_m[,,i]))))
}
N1_vnpc <- N1_vnpc[-seq(513, 513*1000, by=513)]
L1_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnpc[i] <- mean(N1_vnpc[(512*i-511):(512*i)])
}

N2_vnpc <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N2_vnpc[i] <- sum(diag((med_vnpc[,,i]-psd_1024_m[,,i])%*%
                           (med_vnpc[,,i]-psd_1024_m[,,i])))
}
N2_vnpc <- N2_vnpc[-seq(513, 513*1000, by=513)]
L2_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnpc[i] <- sqrt(mean(N2_vnpc[(512*i-511):(512*i)]))
}



#-----------------VNP_1024_VAR2---------------------------------#

N1_vnp <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N1_vnp[i] <- sqrt(sum(diag((med_vnp[,,i]-psd_1024_m[,,i])%*%
                                (med_vnp[,,i]-psd_1024_m[,,i]))))
}
N1_vnp <- N1_vnp[-seq(513, 513*1000, by=513)]
L1_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnp[i] <- mean(N1_vnp[(512*i-511):(512*i)])
}

N2_vnp <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N2_vnp[i] <- sum(diag((med_vnp[,,i]-psd_1024_m[,,i])%*%
                           (med_vnp[,,i]-psd_1024_m[,,i])))
}
N2_vnp <- N2_vnp[-seq(513, 513*1000, by=513)]
L2_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnp[i] <- sqrt(mean(N2_vnp[(512*i-511):(512*i)]))
}



#-----------------VAR_1024_VAR2---------------------------------#

N1_var <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N1_var[i] <- sqrt(sum(diag((med_var[,,i]-psd_1024_m[,,i])%*%
                                (med_var[,,i]-psd_1024_m[,,i]))))
}
N1_var <- N1_var[-seq(513, 513*1000, by=513)]
L1_var <- rep(NA, 1000)
for (i in 1:1000){
  L1_var[i] <- mean(N1_var[(512*i-511):(512*i)])
}

N2_var <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N2_var[i] <- sum(diag((med_var[,,i]-psd_1024_m[,,i])%*%
                           (med_var[,,i]-psd_1024_m[,,i])))
}
N2_var <- N2_var[-seq(513, 513*1000, by=513)]
L2_var <- rep(NA, 1000)
for (i in 1:1000){
  L2_var[i] <- sqrt(mean(N2_var[(512*i-511):(512*i)]))
}

out_1024_var2 <- list(L1_vnpc=Re(mean(L1_vnpc)),
                     L1_vnp=Re(mean(L1_vnp)),
                     L1_var=Re(mean(L1_var)),
                     L2_vnpc=Re(mean(L2_vnpc)),
                     L2_vnp=Re(mean(L2_vnp)),
                     L2_var=Re(mean(L2_var)))

out_var2 <- list(n256=out_256_var2, n512=out_512_var2, n1024=out_1024_var2)
save(out_var2, file='VAR2.RData')





















#-----------------------------VMA1------------------------------------------------#

#---------------------------256_VMA1------------------------------#

#-----------------------VNPC_256_VMA1-----------------------#

psd_256 <- psd_varma(1:129*2*pi/256, 
                     ma=rbind(c(-.75, .5), c(.5, .75)),
                     Sigma=matrix(data=c(1, .5, .5, 1), nrow=2, ncol=2))
psd_256_m <- array(NA, c(2, 2, 129*1000))
psd_256_m[,,] <- psd_256
med_vnpc <- beyondWhittle:::complexValuedPsd(med_vnpc)
N1_vnpc <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N1_vnpc[i] <- sqrt(sum(diag((med_vnpc[,,i]-psd_256_m[,,i])%*%
                                (med_vnpc[,,i]-psd_256_m[,,i]))))
}
N1_vnpc <- N1_vnpc[-seq(129, 129*1000, by=129)]
L1_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnpc[i] <- mean(N1_vnpc[(128*i-127):(128*i)])
}

N2_vnpc <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N2_vnpc[i] <- sum(diag((med_vnpc[,,i]-psd_256_m[,,i])%*%
                           (med_vnpc[,,i]-psd_256_m[,,i])))
}
N2_vnpc <- N2_vnpc[-seq(129, 129*1000, by=129)]
L2_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnpc[i] <- sqrt(mean(N2_vnpc[(128*i-127):(128*i)]))
}



#-----------------VNP_256_VMA1---------------------------------#

N1_vnp <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N1_vnp[i] <- sqrt(sum(diag((med_vnp[,,i]-psd_256_m[,,i])%*%
                               (med_vnp[,,i]-psd_256_m[,,i]))))
}
N1_vnp <- N1_vnp[-seq(129, 129*1000, by=129)]
L1_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnp[i] <- mean(N1_vnp[(128*i-127):(128*i)])
}

N2_vnp <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N2_vnp[i] <- sum(diag((med_vnp[,,i]-psd_256_m[,,i])%*%
                          (med_vnp[,,i]-psd_256_m[,,i])))
}
N2_vnp <- N2_vnp[-seq(129, 129*1000, by=129)]
L2_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnp[i] <- sqrt(mean(N2_vnp[(128*i-127):(128*i)]))
}



#-----------------VAR_256_VMA1---------------------------------#

N1_var <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N1_var[i] <- sqrt(sum(diag((med_var[,,i]-psd_256_m[,,i])%*%
                               (med_var[,,i]-psd_256_m[,,i]))))
}
N1_var <- N1_var[-seq(129, 129*1000, by=129)]
L1_var <- rep(NA, 1000)
for (i in 1:1000){
  L1_var[i] <- mean(N1_var[(128*i-127):(128*i)])
}

N2_var <- rep(NA, 129*1000)
for(i in 1:(129*1000)){
  N2_var[i] <- sum(diag((med_var[,,i]-psd_256_m[,,i])%*%
                          (med_var[,,i]-psd_256_m[,,i])))
}
N2_var <- N2_var[-seq(129, 129*1000, by=129)]
L2_var <- rep(NA, 1000)
for (i in 1:1000){
  L2_var[i] <- sqrt(mean(N2_var[(128*i-127):(128*i)]))
}

out_256_vma1 <- list(L1_vnpc=Re(mean(L1_vnpc)),
                     L1_vnp=Re(mean(L1_vnp)),
                     L1_var=Re(mean(L1_var)),
                     L2_vnpc=Re(mean(L2_vnpc)),
                     L2_vnp=Re(mean(L2_vnp)),
                     L2_var=Re(mean(L2_var)))







#--------------------------512_VMA1-------------------------#

#-----------------VNPC_512_VMA1---------------------------------#

psd_512 <- psd_varma(1:257*2*pi/512, 
                     ma=rbind(c(-.75, .5), c(.5, .75)),
                     Sigma=matrix(data=c(1, .5, .5, 1), nrow=2, ncol=2))
psd_512_m <- array(NA, c(2, 2, 257*1000))
psd_512_m[,,] <- psd_512
med_vnpc <- beyondWhittle:::complexValuedPsd(med_vnpc)
N1_vnpc <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N1_vnpc[i] <- sqrt(sum(diag((med_vnpc[,,i]-psd_512_m[,,i])%*%
                                (med_vnpc[,,i]-psd_512_m[,,i]))))
}
N1_vnpc <- N1_vnpc[-seq(257, 257*1000, by=257)]
L1_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnpc[i] <- mean(N1_vnpc[(256*i-255):(256*i)])
}

N2_vnpc <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N2_vnpc[i] <- sum(diag((med_vnpc[,,i]-psd_512_m[,,i])%*%
                           (med_vnpc[,,i]-psd_512_m[,,i])))
}
N2_vnpc <- N2_vnpc[-seq(257, 257*1000, by=257)]
L2_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnpc[i] <- sqrt(mean(N2_vnpc[(256*i-255):(256*i)]))
}



#--------------------VNP_512_VMA1----------------------------#

N1_vnp <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N1_vnp[i] <- sqrt(sum(diag((med_vnp[,,i]-psd_512_m[,,i])%*%
                               (med_vnp[,,i]-psd_512_m[,,i]))))
}
N1_vnp <- N1_vnp[-seq(257, 257*1000, by=257)]
L1_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnp[i] <- mean(N1_vnp[(256*i-255):(256*i)])
}

N2_vnp <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N2_vnp[i] <- sum(diag((med_vnp[,,i]-psd_512_m[,,i])%*%
                          (med_vnp[,,i]-psd_512_m[,,i])))
}
N2_vnp <- N2_vnp[-seq(257, 257*1000, by=257)]
L2_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnp[i] <- sqrt(mean(N2_vnp[(256*i-255):(256*i)]))
}



#--------------------VAR_512_VMA1----------------------------#

N1_var <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N1_var[i] <- sqrt(sum(diag((med_var[,,i]-psd_512_m[,,i])%*%
                               (med_var[,,i]-psd_512_m[,,i]))))
}
N1_var <- N1_var[-seq(257, 257*1000, by=257)]
L1_var <- rep(NA, 1000)
for (i in 1:1000){
  L1_var[i] <- mean(N1_var[(256*i-255):(256*i)])
}

N2_var <- rep(NA, 257*1000)
for(i in 1:(257*1000)){
  N2_var[i] <- sum(diag((med_var[,,i]-psd_512_m[,,i])%*%
                          (med_var[,,i]-psd_512_m[,,i])))
}
N2_var <- N2_var[-seq(257, 257*1000, by=257)]
L2_var <- rep(NA, 1000)
for (i in 1:1000){
  L2_var[i] <- sqrt(mean(N2_var[(256*i-255):(256*i)]))
}


out_512_vma1 <- list(L1_vnpc=Re(mean(L1_vnpc)),
                     L1_vnp=Re(mean(L1_vnp)),
                     L1_var=Re(mean(L1_var)),
                     L2_vnpc=Re(mean(L2_vnpc)),
                     L2_vnp=Re(mean(L2_vnp)),
                     L2_var=Re(mean(L2_var)))








#--------------------------1024_VMA1-------------------------#

#-----------------VNPC_1024_VMA1---------------------------------#

psd_1024 <- psd_varma(1:513*2*pi/1024, 
                      ma=rbind(c(-.75, .5), c(.5, .75)),
                      Sigma=matrix(data=c(1, .5, .5, 1), nrow=2, ncol=2))
psd_1024_m <- array(NA, c(2, 2, 513*1000))
psd_1024_m[,,] <- psd_1024
med_vnpc <- beyondWhittle:::complexValuedPsd(med_vnpc)
N1_vnpc <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N1_vnpc[i] <- sqrt(sum(diag((med_vnpc[,,i]-psd_1024_m[,,i])%*%
                                (med_vnpc[,,i]-psd_1024_m[,,i]))))
}
N1_vnpc <- N1_vnpc[-seq(513, 513*1000, by=513)]
L1_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnpc[i] <- mean(N1_vnpc[(512*i-511):(512*i)])
}

N2_vnpc <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N2_vnpc[i] <- sum(diag((med_vnpc[,,i]-psd_1024_m[,,i])%*%
                           (med_vnpc[,,i]-psd_1024_m[,,i])))
}
N2_vnpc <- N2_vnpc[-seq(513, 513*1000, by=513)]
L2_vnpc <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnpc[i] <- sqrt(mean(N2_vnpc[(512*i-511):(512*i)]))
}



#-----------------VNP_1024_VMA1---------------------------------#

N1_vnp <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N1_vnp[i] <- sqrt(sum(diag((med_vnp[,,i]-psd_1024_m[,,i])%*%
                               (med_vnp[,,i]-psd_1024_m[,,i]))))
}
N1_vnp <- N1_vnp[-seq(513, 513*1000, by=513)]
L1_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L1_vnp[i] <- mean(N1_vnp[(512*i-511):(512*i)])
}

N2_vnp <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N2_vnp[i] <- sum(diag((med_vnp[,,i]-psd_1024_m[,,i])%*%
                          (med_vnp[,,i]-psd_1024_m[,,i])))
}
N2_vnp <- N2_vnp[-seq(513, 513*1000, by=513)]
L2_vnp <- rep(NA, 1000)
for (i in 1:1000){
  L2_vnp[i] <- sqrt(mean(N2_vnp[(512*i-511):(512*i)]))
}



#-----------------VAR_1024_VMA1---------------------------------#

N1_var <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N1_var[i] <- sqrt(sum(diag((med_var[,,i]-psd_1024_m[,,i])%*%
                               (med_var[,,i]-psd_1024_m[,,i]))))
}
N1_var <- N1_var[-seq(513, 513*1000, by=513)]
L1_var <- rep(NA, 1000)
for (i in 1:1000){
  L1_var[i] <- mean(N1_var[(512*i-511):(512*i)])
}

N2_var <- rep(NA, 513*1000)
for(i in 1:(513*1000)){
  N2_var[i] <- sum(diag((med_var[,,i]-psd_1024_m[,,i])%*%
                          (med_var[,,i]-psd_1024_m[,,i])))
}
N2_var <- N2_var[-seq(513, 513*1000, by=513)]
L2_var <- rep(NA, 1000)
for (i in 1:1000){
  L2_var[i] <- sqrt(mean(N2_var[(512*i-511):(512*i)]))
}

out_1024_vma1 <- list(L1_vnpc=Re(mean(L1_vnpc)),
                      L1_vnp=Re(mean(L1_vnp)),
                      L1_var=Re(mean(L1_var)),
                      L2_vnpc=Re(mean(L2_vnpc)),
                      L2_vnp=Re(mean(L2_vnp)),
                      L2_var=Re(mean(L2_var)))

out_vma1 <- list(n256=out_256_vma1, n512=out_512_vma1, n1024=out_1024_vma1)
save(out_vma1, file='VMA1.RData')

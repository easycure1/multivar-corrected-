A <- array(c(1, 1+2i, 1+3i, 1-2i, 2, 2+3i, 1-3i, 2-3i, 3, 
             4, 4+5i, 4+6i, 4-5i, 5, 5+6i, 4-6i, 5-6i, 6), dim = c(3, 3, 2))


Dn <- function(f){
  d <- dim(f)[1]
  N <- dim(f)[3]
  Dn <- matrix(rep(0, (2*N*d)^2), ncol = 2*N*d)
  k <- 2*d
  while (k <= 2*N*d){
    Dn[(k-(2*d-1)):(k-d), (k-(2*d-1)):(k-d)] <- Re(f[ , , k/(2*d)])
    Dn[(k-(2*d-1)):(k-d), (k-d+1):k] <- -Im(f[ , , k/(2*d)])
    Dn[(k-d+1):k, (k-(2*d-1)):(k-d)] <- Im(f[ , , k/(2*d)])
    Dn[(k-d+1):k, (k-d+1):k] <- Re(f[ , , k/(2*d)])
    k <- k + 2*d
  }
  return(Dn)
}

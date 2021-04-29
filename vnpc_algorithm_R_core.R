llike_correct_whittle <- function(FZ,
                                  U,
                                  r,
                                  Z,
                                  db.list,
                                  k,
                                  phi,
                                  sigma_ar,
                                  excludeBoundary) {
  f <- bernsteinGammaPsd(U, r, Z, db.list, k)
  ll <- llike_var_correct_m(FZ=FZ,
                            ar=phi$ar,
                            f_para_half=phi$f_para_half,
                            sigma=sigma_ar,
                            f=f,
                            excludeBoundary=excludeBoundary)
  return(ll)
}



lprior_correct_whittle <- function() {
  
}



lpost_correct_whittle <- function() {
  ll <- llike_correct_whittle()
  lp <- lprior_correct_whittle()
  return(ll + lp)
}
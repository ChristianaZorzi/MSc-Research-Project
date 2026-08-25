
# Code for the function of the modification of ID (that uses only right-expanding intervals)
# for the change in the mean, called pcm_th_right()

######################################################################################################################
######################################################################################################################

library(IDetect)

s_e_points_right <- function (r, s, e) 
{
  
  r <- sort(r)
  if (s > e) {
    stop("s should be less than or equal to e")
  }
  if (!(is.numeric(c(r, s, e))) | (r[1] <= 0) | s <= 0 | e <= 0) {
    stop("The input arguments must be positive integers")
  }
  if (any(abs(r - round(r)) > .Machine$double.eps^0.5)) {
    warning("The input for r should be a vector of positive integers. If there is at least a positive real number then the integer part of that number is used.")
  }
  if (abs(s - round(s)) > .Machine$double.eps^0.5) {
    warning("The input for s should be a positive integer. If it is a positive real number then the integer part of that number is used.")
  }
  if (abs(e - round(e)) > .Machine$double.eps^0.5) {
    warning("The input for e should be a positive integer. If it is a positive real number then the integer part of that number is used.")
  }
  r <- as.integer(r)
  e <- as.integer(e)
  s <- as.integer(s)
  e_points <- unique(c(r[which((r > s) & (r < e))], e))
  return(list(e_points = e_points))
}

######################################################################################################################
######################################################################################################################
cusum_function<-function (x) 
{
  if (!(is.numeric(x))) {
    stop("The input in `x' should be a numeric vector containing the data for which the CUSUM function will be calculated.")
  }
  n <- length(x)
  y <- cumsum(x)
  res <- sqrt(((n - 1):1)/n/(1:(n - 1))) * y[1:(n - 1)] - sqrt((1:(n - 1))/n/((n - 1):1)) * (y[n] - y[1:(n - 1)])
  return(res)
}

######################################################################################################################
######################################################################################################################

pcm_th_right <- function (x,length_t = 1000, sigma = stats::mad(diff(x)/sqrt(2)),
                          s = 1, e = length(x), points = 3, k_r = 1) 
{
  
  #parameters
  thr_const <- 1.15
  thr_fin <- sigma * thr_const * sqrt(2 * log(length_t))

  #function
  if (!(is.numeric(x))) {
    stop("The input in `x' should be a numeric vector containing the data in which you would like to find change-points.")
  }
  if ((thr_const <= 0) || (points <= 0)) {
    stop("The threshold constant as well as the `points' argument that represents the magnitude of the expansion for the intervals should be positive numbers.")
  }
  if (abs(points - round(points)) > .Machine$double.eps^0.5) {
    warning("The input for `points' should be a positive integer. If it is a positive real\n number then the integer part of the given number is used as the value of `points'.")
  }
  points <- as.integer(points)
  l <- length(x)
  r_e_points <- seq(points, l, points)
  chp <- 0
  if (e - s <= 1) {
    cpt <- 0
  }
  else {
    pos_r <- numeric()
    CUSUM_r <- numeric()
    moving_points <- s_e_points_right(r_e_points, s,e)
    right_points <- moving_points[[1]]
    rur <- length(right_points)
    while ((chp == 0) & (k_r < rur)) {
      x_temp_r <- x[s:right_points[k_r]]
      ipcr <- cusum_function(x_temp_r)
      pos_r[k_r] <- which.max(abs(ipcr)) + s - 1
      CUSUM_r[k_r] <- abs(ipcr[pos_r[k_r] - s + 1])
      if (CUSUM_r[k_r] > thr_fin) {
        chp <- pos_r[k_r]
      }
      else {
        k_r <- k_r + 1
      }
    }
    
    if (chp != 0) {
      r <- pcm_th_right(x, s = chp + 1, e = e, points = points,  k_r = 1,length_t = length_t)
      cpt <- c(chp, r)
    }
    else {
      cpt <- chp
    }
  }
  cpt <- cpt[cpt != 0]
  return(sort(cpt))
}






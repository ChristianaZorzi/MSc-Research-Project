
# Code for the function of the modification of ID (that uses only right-expanding intervals) 
# for the change in the slope, called cplm_th_right()

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

cumsum_lin <- function (x) 
{
  if (!(is.numeric(x))) {
    stop("The input in `x' should be a numeric vector.")
  }
  res <- numeric()
  n <- length(x)
  if (n <= 2) {
    res <- 0
  }
  else {
    b <- 2:(n - 1)
    y1 <- cumsum(x * (1:n))
    y <- cumsum(x)
    a <- sqrt(6/((n - 1) * n * (n + 1) * (2 - 2 * b^2 + 2 * b * n - 1 + 2 * b - n)))
    be <- sqrt(((n - b + 1) * (n - b))/((b - 1) * b))
    res[1] <- 0
    res[b] <- a * be * ((2 * b + n - 1) * y1[b] - 
                          (n + 1) * b * y[b]) - (a/be) * ((3 * n - 2 * b + 1) * (y1[n] - y1[b]) 
                                                          - (n + 1) * (2 * n - b) * (y[n] - y[b]))
  }
  return(res)
}

######################################################################################################################
######################################################################################################################


cplm_th_right <- function (x,length_t = 1000, sigma = stats::mad(diff(diff(x)))/sqrt(6), s = 1, 
                           e = length(x), points = 3, k_r = 1) 
{
  
  thr_const = 1.4
  thr_fin = sigma * thr_const * sqrt(2 * log(length_t))
  
  
  
  if (!(is.numeric(x))) {
    stop("The input in `x' should be a numeric vector containing the data in which you would like to find change-points.")
  }
  if ((points <= 0)) {
    stop("The `points' argument that represents the magnitude of the expansion for the intervals should be a positive number.")
  }
  if (abs(points - round(points)) > .Machine$double.eps^0.5) {
    warning("The input for `points' should be a positive integer. If it is a positive real number then the integer part of the given number is used as the value of `points'.")
  }
  points <- as.integer(points)
  l <- length(x)
  r_e_points <- seq(points, l, points)
  chp <- 0
  if (e - s <= 2) {
    chp <- 0
    cpt <- chp
  }
  else {
    pos_r <- numeric()
    CUSUM_r <- numeric()
    moving_points <- s_e_points_right(r_e_points, s, e)
    right_points <- moving_points$e_points
    rur <- length(right_points)
    
    while ((chp == 0) & (k_r < rur)) {
      x_temp_r <- x[s:right_points[k_r]]
      ipcr <- cumsum_lin(x_temp_r)
      pos_r[k_r] <- which.max(abs(ipcr)) + s - 1
      CUSUM_r[k_r] <- abs(ipcr[pos_r[k_r] - s + 1])
      if (CUSUM_r[k_r] > thr_fin) {
        chp <- pos_r[k_r]
      }
      else {
        k_r <- k_r + 1
      }
    }
    
    if (chp == 0) {
      while ((chp == 0) & (k_r <= rur)) {
        x_temp_r <- x[s:right_points[k_r]]
        ipcr <- cumsum_lin(x_temp_r)
        pos_r[k_r] <- which.max(abs(ipcr)) + s - 1
        CUSUM_r[k_r] <- abs(ipcr[pos_r[k_r] - s + 1])
        if (CUSUM_r[k_r] > thr_fin) {
          chp <- pos_r[k_r]
        }
        else {
          k_r <- k_r + 1
        }
      }
    }
    if (chp != 0) {
      if (chp > ((e + s)/2)) {
        r <- cplm_th_right(x, s = s, e = chp, points = points,k_r = k_r, length_t = length_t)
      }
      else {
        r <- cplm_th_right(x, s = chp + 1, e = e, points = points, 
                     k_r = 1, length_t = length_t)
      }
      cpt <- c(chp, r)
    }
    else {
      cpt <- chp
    }
  }
  cpt <- cpt[cpt != 0]
  return(sort(cpt))
}


#####################


#trials

#cpt: 1600
# s1<-c(seq(0,1599,1), seq(1597,799,-2)) #1600
# ts.plot(s1)
# s1.noise<-s1+rnorm(2000)
# cplm_th_right(s1.noise)
# 
# #cpt: 1050
# s2 <- c(seq(0, 1049, 1),seq(1048.5, 574, -0.5)) #1050
# s2.noise<- s2 + rnorm(2000)
# cplm_th_right(s2.noise)




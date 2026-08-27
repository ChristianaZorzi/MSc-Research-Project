########################################################
########################################################
# Change in the Slope

# code for applying the change in the slope Pseudo-Online ID
# in real, live stock prices data taken fro Twelve Data API

# in this project, we apply it in the Apple stock price

# due to the free Twelve Data API constrains, the data are taken every 7.5 seconds
# since we are allowed to have only 8 API calls per minute (and 800 API calls/day)


# NOTE: Before running the code below, you need to run the cplm_th_right (and everything else)
# from the file: "ID method_functions_thr_slope.R"

# LIVE data from twelve data 
library(IDetect)
library(readr)
library(httr)
library(jsonlite)
api_key <- "TWELVE_DATA_API_KEY"
symbol <- "AAPL"


# function to get REAL live data
get_real_live_price_and_date <- function() {
  url <- paste0("https://api.twelvedata.com/price?symbol=", symbol, "&apikey=", api_key)
  price <- fromJSON(content(GET(url), "text"))$price
  time <- format(Sys.time(), "%Y-%m-%d %H:%M:%S")
  write(paste(time, price, sep = ","), "aapl_prices_api_09_12.csv", append = TRUE)
  return(list(price = price, time = time))
}



# real data and cpd

# set and initialize the needed parameters
burn_end<-150
found<-FALSE
prices<-c()
dates_vec <- as.POSIXct(character(), tz="EET")
cp<-0
cpts<-c()


# hyperparameters - as chosen from the simulation study
length_t <- 1000
window_length <- 1000
step_ahead <- 3


t<-1
new_points_since_check <- 0 # related to the step_ahead, 
                            # i.e. wait every step_ahead points to check for a cpt

while(!found){
  
  # take one data point each every 7.5 seconds and also plot it
  info  <- get_real_live_price_and_date()
  price <- as.numeric(info$price)
  date  <- info$time
  
  prices <- c(prices, price)
  dates_vec <- c(dates_vec, as.POSIXct(date, tz="EET"))
  
  plot(dates_vec, prices, type="l",
       xlab="Time", ylab="Price",
       main=paste("Live", symbol, "Price on", substr(date, 1, 10)),
       xaxt="n")
  axis.POSIXct(1, at=pretty(dates_vec), format="%H:%M:%S")
  points(dates_vec[length(prices)], prices[length(prices)], col="red", pch=19)
  
  
  # burn - in period
  if(length(prices)==burn_end){
    abline(v = dates_vec[burn_end], col = "gray", lwd = 2)
    res_burn<-cplm_th(prices[1:burn_end]) 
    #check if there are cpts in burn in to assign the starting point
    if (length(res_burn)==0){
      start<-burn_end+1
    }else{
      start<-res_burn[length(res_burn)]+1
      #abline(v = res_burn[length(res_burn)], col = "magenta", lwd = 2)
    }
    cat("Burn-in complete. Start =", start, "\n")
  }
  
  # after the burn in period (expanding step only - step 1)
  if (length(prices) >= burn_end) {
    
    end <- burn_end + 1
    
    while (end <= start + window_length && !found) {
      
      info2 <- get_real_live_price_and_date()
      price2 <- as.numeric(info2$price)
      date2  <- info2$time
      
      prices <- c(prices, price2)
      dates_vec <- c(dates_vec, as.POSIXct(date2, tz="EET"))
      
      new_points_since_check <- new_points_since_check + 1
      
      plot(dates_vec, prices, type="l",
           xlab="Time", ylab="Price",
           main=paste("Live", symbol, "Price on", substr(date2, 1, 10)),
           xaxt="n")
      axis.POSIXct(1, at=pretty(dates_vec), format="%H:%M:%S")
      abline(v = dates_vec[burn_end], col="gray", lwd = 2)   
      points(dates_vec[length(prices)], prices[length(prices)], col="red", pch=19)
      
      print(new_points_since_check)
      print(end)
      print(stats::mad(diff(diff(prices[(end-100):end])))/sqrt(6))
      
      if(new_points_since_check == step_ahead){
        
        result <- cplm_th_right(prices[start:end], sigma = stats::mad(diff(diff(prices[(end-100):end])))/sqrt(6), points = 1, length_t = length_t)
        for (cp in result) {
          cp_new <- cp + start - 1  
          if(cp_new>burn_end){
            cpts <- c(cpts, cp_new)
            current_time<-end
            
            cat("Change point detected at index:", cp_new, "and a time:", current_time, "\n")
            cat("This is on:", format(dates_vec[cp_new], "%Y-%m-%d %H:%M:%S"), "and was detected on:", format(dates_vec[current_time], "%Y-%m-%d %H:%M:%S"))
            abline(v = dates_vec[cp_new], col = "green", lwd = 2)
            abline(v = dates_vec[current_time], col = "blue", lwd = 2)
            found <- TRUE
            break
            
          }
          
        }
        
        new_points_since_check<-0
        end <- end + step_ahead
      }
      Sys.sleep(7.5)
      t <- t + 1
    }
    
  }
  
  Sys.sleep(7.5)
  t <- t + 1
}

#abline(v = res_burn[length(res_burn)], col = "magenta", lwd = 2)


# plot extra 10 points to ckeck that there is indeed a change

extra_points <- 10  

for (i in 1:extra_points) {
  
  info_extra <- get_real_live_price_and_date()
  price_extra <- info_extra$price
  date_extra  <- info_extra$time
  
  prices <- c(prices, price_extra)
  dates_vec <- c(dates_vec, as.POSIXct(date_extra, tz="EET"))
  
  plot(dates_vec, prices, type="l",
       xlab="Time", ylab="Price",
       main=paste("Live", symbol, "Price on", substr(date_extra, 1, 10)),
       xaxt="n")
  axis.POSIXct(1, at=pretty(dates_vec), format="%H:%M:%S")
  
  # Mark the detected change point
  abline(v = dates_vec[burn_end], col = "gray", lwd = 2)
  abline(v = dates_vec[cp_new], col = "green", lwd = 2)
  abline(v = dates_vec[current_time], col = "blue", lwd = 2)
  
  # Highlight the newest point
  points(dates_vec[length(prices)], prices[length(prices)], col="red", pch=19)
  
  Sys.sleep(7.5)
  t <- t + 1
}



###################################################################################
###################################################################################
###################################################################################
###################################################################################

#same algorithm but applied in daily closing stock prices, taken from 
#different libraries of R


# tidyquant

library(tidyquant)

symbol<-"AAPL"
live_data <- as.numeric(tq_get(symbol, from = "2025-01-01")$close)
any(is.na(live_data))
dates <- tq_get(symbol, from = "2025-01-01")$date


# different ways to get data

# quantmod
# 
# library(quantmod)
# symbol<-"NVDA"
# getSymbols(symbol, src = "yahoo", interval = "1 min")
# 
# live_data <- as.numeric(Cl(NVDA))
# any(is.na(live_data))
# dates <- index(NVDA)
# 
# 
# # simulated data
# set.seed(4)
# sigma_noise <- 20
# signal_easy <- c(seq(0,807.3,2.7), seq(808.3,2007.3,1), seq(2010,6058.3,2.7)) # true cpts: 300, 1500
# signal_diff <- c(seq(0,358.8,1.2), seq(359.8,1558.8,1), seq(1560,3359.8,1.2)) # true cpts: 300, 1500
# live_data<-signal+rnorm(length(signal_diff), 0, sigma_noise)




# function to get live data
get_live_price_and_date <- function() {
  price <- live_data[t]
  date <- dates[t]
  return(list(price = price, date = date))
}




# live cpd

burn_end<-150 # not 100 because if it finds a cpd in burn in then it will not have enough 
              # data to calculate the sigma 
found<-FALSE
prices<-c()
dates_vec <- c() # to be able to print the datetimes at the detection (current and detected)
cp<-0
cpts<-c()


# hyperparameters - as chosen from the simulation study
length_t <- 1000
window_length <- 1000
step_ahead <- 3


t<-1
new_points_since_check <- 0 # related to the step_ahead, 
                            # i.e. wait every step_ahead points to check for a cpt

while(!found){
  
  info <- get_live_price_and_date()
  price <- info$price
  date  <- info$date
  
  prices <- c(prices, price)
  dates_vec <- c(dates_vec,  as.character(date))
  
  plot(prices, type="l", col="black",
       xlab="Observation", ylab="Price",
       main=paste("Live", symbol, "Price on", date))
  points(length(prices), tail(prices,1), col="red", pch=19)
  
  
  # burn - in period
  if(length(prices)==burn_end){
    abline(v = burn_end, col = "gray", lwd = 2)
    res_burn<-cplm_th(prices[1:burn_end]) 
    
    #check if there are cpts in burn in to assign the starting point
    if (length(res_burn)==0){
      start<-burn_end+1
    }else{
      start<-res_burn[length(res_burn)]+1
    }
    cat("Burn-in complete. Start =", start, "\n")
  }
  
  # after the burn in period (expanding step only - step 1)
  if (length(prices) >= burn_end) {
    
    end <- burn_end + 1
    
    while (end <= start + window_length && !found) {
      
      info2 <- get_live_price_and_date()
      price2 <- info2$price
      date2  <- info2$date
      
      prices <- c(prices, price2)
      dates_vec <- c(dates_vec,  as.character(date2))
      
      new_points_since_check <- new_points_since_check + 1
      
      
      plot(prices, type="l", col="black",
           xlab="Observation", ylab="Price",
           main=paste("Live", symbol, "Price on", date2))
      abline(v = burn_end, col="gray", lwd = 2)   
      points(length(prices), tail(prices,1), col="red", pch=19)
      
      if(new_points_since_check == step_ahead){
        result <- cplm_th_right(prices[start:end], sigma = stats::mad(diff(diff(prices[end-100:end])))/sqrt(6), points = 1, length_t = length_t)
        for (cp in result) {
          cp_new <- cp + start - 1  
          if(cp_new>burn_end){
            cpts <- c(cpts, cp_new)
            current_time<-end
            cat("Change point detected at index:", cp_new, "and a time:", current_time, "\n")
            cat("This is on:", dates_vec[as.numeric(cp_new)], "and was detected on:", dates_vec[as.numeric(current_time)])
            abline(v = cp_new, col = "green", lwd = 2)
            abline(v = current_time, col = "blue", lwd = 2)
            found <- TRUE
            break
            
          }
          
        }
        new_points_since_check<-0
        end <- end + step_ahead
      }
      Sys.sleep(1)
      t <- t + 1
    }

  }
  
  Sys.sleep(1)
  t <- t + 1
}


# plot extra 10 points to ckeck that there is indeed a change

extra_points <- 10  

for (i in 1:extra_points) {
  
  info_extra <- get_live_price_and_date()
  price_extra <- info_extra$price
  date_extra  <- info_extra$date
  
  prices <- c(prices, price_extra)
  dates_vec <- c(dates_vec, as.character(date_extra))
  
  plot(prices, type = "l", col = "black",
       xlab = "Observation", ylab = "Price",
       main = paste("Live", symbol, "Price on", date_extra))
  
  # Mark the detected change point
  abline(v = cp_new, col = "green", lwd = 2)
  abline(v = current_time, col = "blue", lwd = 2)
  
  # Highlight the newest point
  points(length(prices), tail(prices, 1), col = "red", pch = 19)
  
  Sys.sleep(1)
  t <- t + 1
}




#checks
# stats::mad(diff(diff(prices[(102-100):102])))/sqrt(6)
# plot(90:102, prices[90:102], type="l")
# abline(v = 152, col="blue", lwd=2)
# cplm_th_right(prices[138:249], sigma = stats::mad(diff(diff(prices[249-100:249])))/sqrt(6), points = 1)

###################################################################################
###################################################################################
###################################################################################
###################################################################################


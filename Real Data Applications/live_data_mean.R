########################################################
########################################################
# Change in the Mean


# code for applying the change in the mean Pseudo-Online ID
# in daily Euro to British exchange rate data from 2016 

# the given algorithm starts taking data form 25/11/2025
# and it detects the Brexit referendum day on 23/06/2016

# NOTE: Before running the code below, you need to run the pcm_th_right (and everything else)
# from the file: "ID method_functions_thr_mean.R"


# data taken from library tidyquant

library(IDetect)
library(tidyquant)
library(dplyr)
library(tidyr)
library(zoo)

symbol <- "EURGBP=x"

fx_data <- tq_get(symbol, from = "2015-11-25",to = "2020-12-31") %>% drop_na(close)

live_data <- as.numeric(fx_data$close)
dates <- fx_data$date

any(is.na(live_data))  

#citation("tidyquant")


########################################################
########################################################

# plot the data to see them before applying the algorithm
plot(dates, live_data,
     type = "l",
     xlab = "Date",
     ylab = "EUR/GBP Exchange Rate",
     main = "EUR/GBP Exchange Rate (2015–2020)")

# Add the Brexit referendum date
abline(v = as.Date("2016-06-23"), col = "red", lwd = 1.5)
text(as.Date("2016-06-23"),
     max(live_data, na.rm = TRUE),
     labels = "Brexit Referendum (2016)",
     pos = 4, col = "red")


########################################################
########################################################


# function to get live data
get_live_price_and_date <- function() {
  price <- live_data[t]
  date <- dates[t]
  return(list(price = price, date = date))
}


# live cpd

# set and initialize the needed parameters
burn_end<-150 
found<-FALSE
prices<-c()
dates_vec <- as.Date(c()) # to be able to print the datetimes at the detection (current and detected)
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
  
  # take one data point each every 1 second and also plot it
  info <- get_live_price_and_date()
  price <- info$price
  date  <- info$date
  
  prices <- c(prices, price)
  dates_vec <- c(dates_vec,  as.Date(date))
  
  plot(dates_vec, prices, type = "l",
       xlab = "Date", ylab = "Exchange Rate",
       main = paste("Euro-Pound Exchange Rate on", date),
       xaxt = "n")
  
  axis.Date(1, at = pretty(dates_vec), format = "%Y-%m")
  
  # highlight the newest point
  points(dates_vec[length(prices)], tail(prices, 1), col="red", pch=19)
  
  
  # burn - in period
  if(length(prices)==burn_end){
    abline(v = dates_vec[burn_end], col = "gray", lwd = 2)
    res_burn<-pcm_th(prices[1:burn_end], thr_const = 1.15) 
    
    # check if there are cpts in burn in to assign the starting point
    if (length(res_burn)==0){
      start<-burn_end+1
    }else{
      start<-res_burn[length(res_burn)]+1
    }
    cat("Burn-in complete. Start =", start, "\n")
  }
  
  # after the burn in period begin the expanding step only - step 1 of the algorithm
  if (length(prices) >= burn_end) {
    
    end <- burn_end + 1
    
    while (end <= start + window_length && !found) {
      
      info2 <- get_live_price_and_date()
      price2 <- info2$price
      date2  <- info2$date
      
      prices <- c(prices, price2)
      dates_vec <- c(dates_vec,  as.Date(date2))
      
      new_points_since_check <- new_points_since_check + 1
      
      plot(dates_vec, prices, type = "l",
           xlab = "Date", ylab = "Exchange Rate",
           main = paste("Euro-Pound Exchange Rate on", date2),
           xaxt = "n")
      
      axis.Date(1, at = pretty(dates_vec), format = "%Y-%m")
      abline(v = dates_vec[burn_end], col="gray", lwd = 2) 
      
      # highlight the newest point
      points(dates_vec[length(prices)], tail(prices, 1), col="red", pch=19)
      
      if(new_points_since_check == step_ahead){
        result <- pcm_th_right(prices[start:end], sigma = stats::mad(diff(prices[end-100:end])/sqrt(2)), points = 1, length_t = length_t)
        for (cp in result) {
          cp_new <- cp + start - 1  
          if(cp_new>burn_end){
            cpts <- c(cpts, cp_new)
            current_time<-end
            cat("Change point detected at index:", cp_new, "and a time:", current_time, "\n")
            cat("This is on:", format(dates_vec[cp_new]),"and was detected on:", format(dates_vec[current_time]), "\n")
            abline(v = dates_vec[cp_new], col = "green", lwd = 2)
            abline(v = dates_vec[current_time], col = "blue", lwd = 2)
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
  dates_vec <- c(dates_vec, as.Date(date_extra))
  
  plot(dates_vec, prices, type = "l",
       xlab = "Date", ylab = "Exchange Rate",
       main = paste("Euro-Pound Exchange Rate on", date_extra),
       xaxt = "n")
  
  axis.Date(1, at = pretty(dates_vec), format = "%Y-%m-%d")
  
  # mark the detected change point
  abline(v = dates_vec[burn_end], col = "gray", lwd = 2)
  abline(v = dates_vec[cp_new], col = "green", lwd = 2)
  abline(v = dates_vec[current_time], col = "blue", lwd = 2)
  
  # highlight the newest point
  points(dates_vec[length(prices)], tail(prices, 1), col="red", pch=19)
  
  Sys.sleep(1)
  t <- t + 1
}



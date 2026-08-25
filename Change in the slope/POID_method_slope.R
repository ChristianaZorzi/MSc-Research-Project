
# Code for Pseudo-Online Isolate-Detect (POID) algorithm for change in the slope

# The function below implements and runs the algorithm in simulated signals
# and stops as soon as a change-point is detected, after the burn-in period

# NOTE: Before running the code below, you need to run the cplm_th_right (and everything else)
# from the file: "ID method_functions_thr_slope.R"

# few signals for trials of the method
# true cpts: 300, 1500, with different change magnitudes (2, 1.7, 1.5, 1)
s1 <- c(seq(0,897,3), seq(898,2097,1), seq(2100,6599,3))
s2 <- c(seq(0,807.3,2.7), seq(808.3,2007.3,1), seq(2010,6058.3,2.7))
s3 <- c(seq(0,747.5,2.5), seq(748.5,1947.5,1), seq(1950,5697.5,2.5))
s4 <- c(seq(0,598,2), seq(599,1798,1), seq(1800,4798,2))



# function:

library(IDetect)

single_cpt_detect_one_slope <- function(signal, burn_end=1000, window_length=1000,
                                        length_t=1000, step_ahead=1, true_loc, sigma_noise=1) {
  
  
  time_start<-Sys.time()
  cpt<-0
  delay_true<-0
  current_time<-0
  runtime<-0
  error_norm<-NA
  found<-FALSE
  x<-signal+rnorm(length(signal), 0,sigma_noise)
  
  #run algorithm at burn in period
  res_burn<-cplm_th(x[1:burn_end]) 
  
  #check if there are cpts to assign the starting point
  if (length(res_burn)==0){
    start<-burn_end+1
  }else{
    start<-res_burn[length(res_burn)]+1
  }
  
  # step 1 - apply cplm_th_right in right expanding windows until window length = T
  #sigma estimated using the last 100 data points from the current location
  
  if((window_length + start > burn_end) && ((start+window_length) - (burn_end+1)) >= step_ahead){
    for (end in seq(burn_end+1, start+window_length, by = step_ahead)) {
      result <- cplm_th_right(x[start:end], sigma = stats::mad(diff(diff(x[end-100:end])))/sqrt(6), points = 1, length_t = length_t)
      for (cp in result) {
        cp_new <- cp + start - 1  
        if(cp_new>burn_end){
          cpt <- cp_new
          current_time<-end
          delay_true <- current_time-true_loc
          location_error<-abs(cp_new - true_loc)
          error_norm <- abs(cp_new - true_loc) / length(signal)
          found <- TRUE
          break
        }
      }
      if (found) break
    }
  }
  
  
  if (!found){ 
    # step 2 - start sliding
    #sigma estimated using the last 100 data points from the current location
    slide<-step_ahead
    if(window_length + start <= burn_end){
      
      new_start<-burn_end - window_length + slide
      
    }else{
      new_start<-start+slide
    }
    for (start2 in seq(new_start, length(signal)-(window_length-1), by = step_ahead)) {
      end <- start2 + (window_length-1)
      result <- cplm_th_right(x[start2:end], sigma = stats::mad(diff(diff(x[end-100:end])))/sqrt(6), length_t = length_t)
      for (cp in result) {
        cp_new <- cp + start2 - 1
        if(cp_new>burn_end){
          cpt <- cp_new
          current_time<-end
          delay_true <- current_time-true_loc
          location_error<-abs(cp_new - true_loc)
          error_norm <- abs(cp_new - true_loc) / length(signal)
          found <- TRUE
          break
        }
      }
      if (found) break
    }
  }
  
  time_end <- Sys.time()
  runtime <- as.numeric(difftime(time_end, time_start, units = "secs"))
  
  
  cat("change point:", cpt, "current time:",current_time, "delay:",delay_true,"location error:",location_error, "error:", error_norm,"runtime:",runtime)
}


# trial
single_cpt_detect_one_slope(s1, window_length = 1000, length_t=1000, step_ahead = 10, true_loc=1500, sigma_noise=20)



# Code for Pseudo-Online Isolate-Detect (POID) algorithm for change in the mean

# The function below implements and runs the algorithm in simulated signals
# and stops as soon as a change-point is detected, after the burn-in period

# NOTE: Before running the code below, you need to run the pcm_th_right (and everything else)
# from the file: "ID method_functions_thr_mean.R"

# few signals for trials of the method
# true cpts: 300, 1500, with different change magnitudes (0.5, 0.7, 1 ,2)
s1 <- c(rep(0,300), rep(0.5,1200), rep(0,1500))
s2 <- c(rep(0,300), rep(0.7,1200), rep(0,1500))
s3 <- c(rep(0,300), rep(1,1200), rep(0,1500))
s4 <- c(rep(0,300), rep(2,1200), rep(0,1500))


#function:

library(IDetect)

single_cpt_detect_one <- function(signal, burn_end=1000, window_length=1000,
                                  length_t=1000, step_ahead=1, true_loc) {
  
  time_start<-Sys.time()
  cpt<-0
  delay_true<-0
  current_time<-0
  runtime<-0
  error_norm<-NA
  found<-FALSE
  x<-signal+rnorm(length(signal))
  
  #run algorithm at burn in period
  res_burn<-pcm_th(x[1:burn_end], thr_const = 1.15) 
  
  #check if there are cpts to assign the starting point
  if (length(res_burn)==0){
    start<-burn_end+1
  }else{
    start<-res_burn[length(res_burn)]+1
  }
  
  # step 1 - apply pcm_th_right in right expanding windows until window length = T
  #sigma estimated using the last 100 data points from the current location
  
  if((window_length + start > burn_end) && ((start+window_length) - (burn_end+1)) >= step_ahead){
    for (end in seq(burn_end+1, start+window_length, by = step_ahead)) {
      result <- pcm_th_right(x[start:end], sigma = stats::mad(diff(x[end-100:end])/sqrt(2)), points = 1)
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
      result <- pcm_th_right(x[start2:end], sigma = stats::mad(diff(x[end-100:end])/sqrt(2)), length_t = length_t)
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
single_cpt_detect_one(s1, window_length = 1000,length_t=1000, step_ahead = 10, true_loc=1500)

##############################################################################################
##############################################################################################
##############################################################################################
##############################################################################################

#draw lines as well

single_cpt_detect_one_lines <- function(signal, burn_end=1000, window_length=1000,
                                        length_t=1000, step_ahead=1, true_loc) {
  
  x <- signal + rnorm(length(signal))
  found <- FALSE
  cpt <- NA
  current_time <- NA
  
  
  plot(x, type="n", ylim=range(x),
       xlab="Index", ylab="Value")
  
  # draw burn-in instantly
  lines(1:burn_end, x[1:burn_end], col="black")
  abline(v=burn_end, col="darkgray", lty=2) 
  
  # run algorithm at burn in period
  res_burn<-pcm_th(x[1:burn_end], thr_const = 1.15) 
  
  # Step 1
  if (length(res_burn)==0){
    start<-burn_end+1
  }else{
    start<-res_burn[length(res_burn)]+1
  }
  if ((window_length + start > burn_end) && ((start+window_length) - (burn_end+1)) >= step_ahead) {
    for (end in seq(burn_end+1, start+window_length, by=step_ahead)) {
      
      lines((end-1):end, x[(end-1):end], col="black")
      Sys.sleep(0.03)
      
      result <- pcm_th_right(x[start:end], sigma = stats::mad(diff(x[end-100:end])/sqrt(2)), points=1)
      if (length(result) > 0) {
        cp_new <- result[1] + start - 1
        if (cp_new > burn_end) {
          cpt <- cp_new
          current_time <- end
          found <- TRUE
          abline(v=cpt, col="red", lwd=2)
          abline(v=true_loc, col="blue", lwd=2)
          abline(v=current_time, col="green", lwd=2)
          break
        }
      }
      if (found) break
    }
  }
  
  
  # Step 2
  if (!found) {
    slide<-step_ahead
    if(window_length + start <= burn_end){
      
      new_start<-burn_end - window_length + slide
      
    }else{
      new_start<-start+slide
    }
    for (start2 in seq(new_start, length(x)-(window_length-1), by=step_ahead)) {
      end <- start2 + (window_length-1)
      
      lines((end-1):end, x[(end-1):end], col="black")
      Sys.sleep(0.03)
      
      result <- pcm_th_right(x[start2:end], sigma = stats::mad(diff(x[end-100:end])/sqrt(2)), length_t=length_t)
      if (length(result) > 0) {
        cp_new <- result[1] + start2 - 1
        if (cp_new > burn_end) {
          cpt <- cp_new
          current_time <- end
          found <- TRUE
          abline(v=cpt, col="red", lwd=2)
          abline(v=true_loc, col="blue", lwd=2)
          abline(v=current_time, col="green", lwd=2)
          break
        }
      }
      if (found) break
    }
  }
  
  if (found) {
    cat("Detected CP:", cpt, " Current time:", current_time, "\n")
  } else {
    cat("No CP detected\n")
  }
}





#trial
single_cpt_detect_one_lines(s1, window_length = 1000, length_t=1000, step_ahead = 10, true_loc = 1500)

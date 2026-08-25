
# Function for summarizing results from simulations (change in mean)

# the simulations that we run, with different hyperparameter combinations (T (length_t), W (window_length) and lambda (step_ahead), as discussed in the report),
# and got the needed results for our project
# can be found in the R-files: Simulations_mean_a.R, Simulations_mean_b.R, Simulations_mean_c.R and Simulations_mean_d.R

# NOTE: Before running the code below, you need to run the pcm_th_right (and everything else)
# from the file: "ID method_functions_thr_mean.R"


# Simulations

#signals - true cpts: 300, 1500
s1 <- c(rep(0,300), rep(0.5,1200), rep(0,1500))
s2 <- c(rep(0,300), rep(1,1200), rep(0,1500))
s3 <- c(rep(0,300), rep(2,1200), rep(0,1500))
s4 <- c(rep(0,300), rep(3,1200), rep(0,1500))
s5 <- c(rep(0,300), rep(5,1200), rep(0,1500))
s6 <- c(rep(0,300), rep(8,1200), rep(0,1500))
s7 <- c(rep(0,300), rep(10,1200), rep(0,1500))


#signals - true cpts: 900, 1050
s11<-c(rep(0,900),rep(0.5,150),rep(0,1950))
s22<-c(rep(0,900),rep(1,150),rep(0,1950))
s33<-c(rep(0,900),rep(2,150),rep(0,1950))
s44<-c(rep(0,900),rep(3,150),rep(0,1950))
s55<-c(rep(0,900),rep(5,150),rep(0,1950))
s66<-c(rep(0,900),rep(8,150),rep(0,1950))
s77<-c(rep(0,900),rep(10,150),rep(0,1950))


library(IDetect)

#function: gives the results (as shown in the list) of 100 simulations for 1 signal

single_cpt_detect_sim<-function(signal, burn_end = 1000, length_t, window_length = 1000, 
                                step_ahead, true_loc, n_iter = 100, seed = 4)
{
  
  signal_name <- as.character(substitute(signal))
  correct_detections<-0
  wrong_detections<-0
  no_detection<-0
  
  
  runtimes <- rep(0, n_iter)
  
  error_norm<-rep(NA, n_iter)
  
  delay_true <- rep(NA, n_iter)
  
  loc_error <- rep(NA, n_iter)
  
  i<-1
  if (!is.null(seed)) set.seed(seed)
  while(i<=n_iter){
    
    time_start<-Sys.time()
    cpts<-c()
    current_time<-0
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
      for (end in seq(burn_end+2, start+window_length, by = step_ahead) ) {
        result <- pcm_th_right(x[start:end], sigma = stats::mad(diff(x[end-100:end])/sqrt(2)), points = 1, length_t = length_t)
        for (cp in result) {
          cp_new <- cp + start - 1  
          if(cp_new>burn_end){
            cpts <- c(cpts, cp_new)
            current_time<-end
            delay_true[i] <- current_time-true_loc
            loc_error[i] <- abs(cp_new-true_loc)
            if (!is.na(delay_true[i]) && delay_true[i] >= 0){
              error_norm[i] <- abs(cp_new - true_loc) / length(signal)
            }
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
      
      for (start2 in seq(new_start, length(x)-(window_length-1), by = step_ahead)) {
        end <- start2 + (window_length-1)
        result <- pcm_th_right(x[start2:end], sigma = stats::mad(diff(x[end-100:end])/sqrt(2)), length_t = length_t)
        for (cp in result) {
          cp_new <- cp + start2 - 1
          if(cp_new>burn_end){
            cpts <- c(cpts, cp_new)
            current_time<-end
            delay_true[i] <- current_time-true_loc
            loc_error[i] <- abs(cp_new - true_loc)
            if (!is.na(delay_true[i]) && delay_true[i] >= 0){
              error_norm[i] <- abs(cp_new - true_loc) / length(signal)
            }
            found <- TRUE
            break
          }
          
        }
        
        if (found) break
      }
    }
    
    
    if(is.na(delay_true[i])) {
      no_detection <- no_detection + 1
    }
    
    if (!is.na(delay_true[i]) && delay_true[i] < 0) {
      wrong_detections <- wrong_detections + 1
    }  
    
    if (length(cpts) != 0 && abs(cp_new - true_loc)<=20 && delay_true[i]>=0){
      correct_detections<- correct_detections + 1
      
    }
    
    time_end <- Sys.time()
    runtimes[i] <- as.numeric(difftime(time_end, time_start, units = "secs"))
    
    #cat("change point:", sort(cpts), "current time:",current_time, "delay:",delay_true[i], "error", error_norm[i], "runtime", runtimes[i],"\n")
    
    i <- i+1
  }
  
  out <- list(
    signal = signal_name,
    length_T = length_t,
    window_length = window_length,
    step_ahead = step_ahead,
    
    no_detection=no_detection,
    wrong_detections = wrong_detections,
    median_norm_error = median(error_norm, na.rm = TRUE),
    correct_detections = correct_detections,
    mean_delay = mean(delay_true[delay_true >= 0], na.rm = TRUE),
    median_delay = median(delay_true[delay_true >= 0], na.rm = TRUE),
    median_location_difference =  median(loc_error[delay_true >= 0], na.rm = TRUE),
    mean_runtime = mean(runtimes)
  )
  return(out)
  
}

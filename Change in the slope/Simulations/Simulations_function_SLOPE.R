
# Function for summarizing results from simulations (change in slope)

# the simulations that we run, with different hyperparameter combinations (T (length_t), W (window_length) and lambda (step_ahead), as discussed in the report),
# and got the needed results for our project,
# can be found in the R-files: Simulations_slope_a.R, Simulations_slope_b.R, Simulations_slope_c.R and Simulations_slope_d.R

# NOTE: Before running the code below, you need to run the cplm_th_right (and everything else)
# from the file: "ID method_functions_thr_slope.R"


# Simulations

#signals - true cpts: 300, 1500

s1 <- c(seq(0,897,3), seq(898,2097,1), seq(2100,6599,3))
s2 <- c(seq(0,807.3,2.7), seq(808.3,2007.3,1), seq(2010,6058.3,2.7))
s3 <- c(seq(0,747.5,2.5), seq(748.5,1947.5,1), seq(1950,5697.5,2.5))
s4 <- c(seq(0,598,2), seq(599,1798,1), seq(1800,4798,2))
s5 <- c(seq(0,508.3,1.7), seq(509.3,1708.6,1), seq(1710.3,4258.6,1.7))
s6 <- c(seq(0,448.5,1.5), seq(449.5,1648.5,1), seq(1650,3899.5,1.5))
s7 <- c(seq(0,358.8,1.2), seq(359.8,1558.8,1), seq(1560,3359.8,1.2))


#signals - true cpts: 900, 1050

s11 <- c(seq(0,2697,3), seq(2698,2847,1), seq(2850,8697,3))
s22 <- c(seq(0,2427.3,2.7), seq(2428.3,2577.3,1), seq(2580,7844.5,2.7))
s33 <- c(seq(0,2247.5,2.5), seq(2248.5,2397.5,1), seq(2400,7272.5,2.5))
s44 <- c(seq(0,1798,2), seq(1799,1948,1), seq(1950,5848,2))
s55 <- c(seq(0,1528.3,1.7), seq(1529.3,1678.3,1), seq(1680,4994.7,1.7))
s66 <- c(seq(0,1348.5,1.5), seq(1349.5,1498.5,1), seq(1500,4424.5,1.5))
s77 <- c(seq(0,1078.8,1.2), seq(1079.8,1228.8,1), seq(1230,3569,1.2))




library(IDetect)

#function: gives the results (as shown in the list) of 100 simulations for 1 signal

single_cpt_detect_sim_slope<-function(signal, burn_end = 1000, length_t, window_length = 1000, step_ahead,
                                      true_loc, sigma_noise = 1, n_iter = 100, seed = 4)
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
    x<-signal+rnorm(length(signal), 0, sigma_noise)
    
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
    
    if((window_length + start > burn_end+3) && ((start+window_length) - (burn_end+1)) >= step_ahead){
      for (end in seq(burn_end+3, start+window_length, by = step_ahead)) {
        result <- cplm_th_right(x[start:end], sigma = stats::mad(diff(diff(x[end-100:end])))/sqrt(6), points = 1, length_t = length_t)
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
    
    
    if (!found && (length(x) - start >= window_length)){ 
      
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
        result <- cplm_th_right(x[start2:end], sigma = stats::mad(diff(diff(x[end-100:end])))/sqrt(6), length_t = length_t)
        for (cp in result) {
          cp_new <- cp + start2 - 1
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

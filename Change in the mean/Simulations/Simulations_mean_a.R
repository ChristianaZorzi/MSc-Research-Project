library(IDetect)

# the results of the combinations of: length_t = 1000, 500, 100, window_length = 1000, step-ahead = 10


#signals - true cpts: 300, 1500

s1 <- c(rep(0,300), rep(0.5,1200), rep(0,1500))
s2 <- c(rep(0,300), rep(1,1200), rep(0,1500))
s3 <- c(rep(0,300), rep(2,1200), rep(0,1500))
s4 <- c(rep(0,300), rep(3,1200), rep(0,1500))
s5 <- c(rep(0,300), rep(5,1200), rep(0,1500))
s6 <- c(rep(0,300), rep(8,1200), rep(0,1500))
s7 <- c(rep(0,300), rep(10,1200), rep(0,1500))


#table 1.1
result_s1_1_mean <- single_cpt_detect_sim(s1,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1500)
result_s2_1_mean <- single_cpt_detect_sim(s2,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1500)
result_s3_1_mean <- single_cpt_detect_sim(s3,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1500)
result_s4_1_mean <- single_cpt_detect_sim(s4,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1500)
result_s5_1_mean <- single_cpt_detect_sim(s5,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1500)
result_s6_1_mean <- single_cpt_detect_sim(s6,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1500)
result_s7_1_mean <- single_cpt_detect_sim(s7,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1500)


result_s1_1_mean
result_s2_1_mean
result_s3_1_mean
result_s4_1_mean
result_s5_1_mean
result_s6_1_mean
result_s7_1_mean




#table 1.2
result_s1_2_mean <- single_cpt_detect_sim(s1,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s2_2_mean <- single_cpt_detect_sim(s2,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s3_2_mean <- single_cpt_detect_sim(s3,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s4_2_mean <- single_cpt_detect_sim(s4,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s5_2_mean <- single_cpt_detect_sim(s5,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s6_2_mean <- single_cpt_detect_sim(s6,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s7_2_mean <- single_cpt_detect_sim(s7,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1600)


result_s1_2_mean
result_s2_2_mean
result_s3_2_mean
result_s4_2_mean
result_s5_2_mean
result_s6_2_mean
result_s7_2_mean



#table 1.3
result_s1_3_mean <- single_cpt_detect_sim(s1,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s2_3_mean <- single_cpt_detect_sim(s2,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s3_3_mean <- single_cpt_detect_sim(s3,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s4_3_mean <- single_cpt_detect_sim(s4,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s5_3_mean <- single_cpt_detect_sim(s5,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s6_3_mean <- single_cpt_detect_sim(s6,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1600)
result_s7_3_mean <- single_cpt_detect_sim(s7,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1600)


result_s1_3_mean
result_s2_3_mean
result_s3_3_mean
result_s4_3_mean
result_s5_3_mean
result_s6_3_mean
result_s7_3_mean


##################################################################################################################################################
##################################################################################################################################################

#signals - true cpts: 900, 1050

s11<-c(rep(0,900),rep(0.5,150),rep(0,1950))
s22<-c(rep(0,900),rep(1,150),rep(0,1950))
s33<-c(rep(0,900),rep(2,150),rep(0,1950))
s44<-c(rep(0,900),rep(3,150),rep(0,1950))
s55<-c(rep(0,900),rep(5,150),rep(0,1950))
s66<-c(rep(0,900),rep(8,150),rep(0,1950))
s77<-c(rep(0,900),rep(10,150),rep(0,1950))


#change at 1050

#table 2.1
result_s11_1_mean <- single_cpt_detect_sim(s11,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s22_1_mean <- single_cpt_detect_sim(s22,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s33_1_mean <- single_cpt_detect_sim(s33,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s44_1_mean <- single_cpt_detect_sim(s44,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s55_1_mean <- single_cpt_detect_sim(s55,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s66_1_mean <- single_cpt_detect_sim(s66,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s77_1_mean <- single_cpt_detect_sim(s77,length_t = 1000, window_length = 1000, step_ahead = 10,true_loc = 1050)


result_s11_1_mean
result_s22_1_mean
result_s33_1_mean
result_s44_1_mean
result_s55_1_mean
result_s66_1_mean
result_s77_1_mean



#table 2.2
result_s11_2_mean <- single_cpt_detect_sim(s11,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s22_2_mean <- single_cpt_detect_sim(s22,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s33_2_mean <- single_cpt_detect_sim(s33,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s44_2_mean <- single_cpt_detect_sim(s44,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s55_2_mean <- single_cpt_detect_sim(s55,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s66_2_mean <- single_cpt_detect_sim(s66,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s77_2_mean <- single_cpt_detect_sim(s77,length_t = 500, window_length = 1000, step_ahead = 10,true_loc = 1050)


result_s11_2_mean
result_s22_2_mean
result_s33_2_mean
result_s44_2_mean
result_s55_2_mean
result_s66_2_mean
result_s77_2_mean



#table 2.3
result_s11_3_mean <- single_cpt_detect_sim(s11,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s22_3_mean <- single_cpt_detect_sim(s22,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s33_3_mean <- single_cpt_detect_sim(s33,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s44_3_mean <- single_cpt_detect_sim(s44,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s55_3_mean <- single_cpt_detect_sim(s55,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s66_3_mean <- single_cpt_detect_sim(s66,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1050)
result_s77_3_mean <- single_cpt_detect_sim(s77,length_t = 100, window_length = 1000, step_ahead = 10,true_loc = 1050)


result_s11_3_mean
result_s22_3_mean
result_s33_3_mean
result_s44_3_mean
result_s55_3_mean
result_s66_3_mean
result_s77_3_mean






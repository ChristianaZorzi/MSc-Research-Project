library(IDetect)

# the results of the combinations of: length_t = 1000, 500, 100, window_length = 1000, step-ahead = 1


#signals - true cpts: 300, 1500

s1 <- c(rep(0,300), rep(0.5,1200), rep(0,1500))
s2 <- c(rep(0,300), rep(1,1200), rep(0,1500))
s3 <- c(rep(0,300), rep(2,1200), rep(0,1500))
s4 <- c(rep(0,300), rep(3,1200), rep(0,1500))
s5 <- c(rep(0,300), rep(5,1200), rep(0,1500))
s6 <- c(rep(0,300), rep(8,1200), rep(0,1500))
s7 <- c(rep(0,300), rep(10,1200), rep(0,1500))

#table 1.7
result_s1_7 <- single_cpt_detect_sim(s1,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s2_7 <- single_cpt_detect_sim(s2,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s3_7 <- single_cpt_detect_sim(s3,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s4_7 <- single_cpt_detect_sim(s4,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s5_7 <- single_cpt_detect_sim(s5,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s6_7 <- single_cpt_detect_sim(s6,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s7_7 <- single_cpt_detect_sim(s7,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1600)


result_s1_7
result_s2_7
result_s3_7
result_s4_7
result_s5_7
result_s6_7
result_s7_7



#table 1.8
result_s1_8 <- single_cpt_detect_sim(s1,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500)
result_s2_8 <- single_cpt_detect_sim(s2,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500)
result_s3_8 <- single_cpt_detect_sim(s3,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500)
result_s4_8 <- single_cpt_detect_sim(s4,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500)
result_s5_8 <- single_cpt_detect_sim(s5,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500)
result_s6_8 <- single_cpt_detect_sim(s6,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500)
result_s7_8 <- single_cpt_detect_sim(s7,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500)


result_s1_8
result_s2_8
result_s3_8
result_s4_8
result_s5_8
result_s6_8
result_s7_8


#table 1.9
result_s1_9 <- single_cpt_detect_sim(s1,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s2_9 <- single_cpt_detect_sim(s2,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s3_9 <- single_cpt_detect_sim(s3,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s4_9 <- single_cpt_detect_sim(s4,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s5_9 <- single_cpt_detect_sim(s5,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s6_9 <- single_cpt_detect_sim(s6,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1600)
result_s7_9 <- single_cpt_detect_sim(s7,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1600)


result_s1_9
result_s2_9
result_s3_9
result_s4_9
result_s5_9
result_s6_9
result_s7_9




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


#table 2.7
result_s11_7 <- single_cpt_detect_sim(s11,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s22_7 <- single_cpt_detect_sim(s22,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s33_7 <- single_cpt_detect_sim(s33,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s44_7 <- single_cpt_detect_sim(s44,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s55_7 <- single_cpt_detect_sim(s55,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s66_7 <- single_cpt_detect_sim(s66,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s77_7 <- single_cpt_detect_sim(s77,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050)


result_s11_7
result_s22_7
result_s33_7
result_s44_7
result_s55_7
result_s66_7
result_s77_7


#table 2.8
result_s11_8 <- single_cpt_detect_sim(s11,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s22_8 <- single_cpt_detect_sim(s22,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s33_8 <- single_cpt_detect_sim(s33,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s44_8 <- single_cpt_detect_sim(s44,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s55_8 <- single_cpt_detect_sim(s55,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s66_8 <- single_cpt_detect_sim(s66,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s77_8 <- single_cpt_detect_sim(s77,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050)


result_s11_8
result_s22_8
result_s33_8
result_s44_8
result_s55_8
result_s66_8
result_s77_8


#table 2.9
result_s11_9 <- single_cpt_detect_sim(s11,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s22_9 <- single_cpt_detect_sim(s22,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s33_9 <- single_cpt_detect_sim(s33,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s44_9 <- single_cpt_detect_sim(s44,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s55_9 <- single_cpt_detect_sim(s55,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s66_9 <- single_cpt_detect_sim(s66,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050)
result_s77_9 <- single_cpt_detect_sim(s77,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050)


result_s11_9
result_s22_9
result_s33_9
result_s44_9
result_s55_9
result_s66_9
result_s77_9



library(IDetect)

# the results of the combinations of: length_t = 1000, 500, 100, window_length = 1000, step-ahead = 3

#signals - true cpts: 300, 1500

s1 <- c(rep(0,300), rep(0.5,1200), rep(0,1500))
s2 <- c(rep(0,300), rep(1,1200), rep(0,1500))
s3 <- c(rep(0,300), rep(2,1200), rep(0,1500))
s4 <- c(rep(0,300), rep(3,1200), rep(0,1500))
s5 <- c(rep(0,300), rep(5,1200), rep(0,1500))
s6 <- c(rep(0,300), rep(8,1200), rep(0,1500))
s7 <- c(rep(0,300), rep(10,1200), rep(0,1500))


#table 1.4
result_s1_4_mean <- single_cpt_detect_sim(s1,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500)
result_s2_4_mean <- single_cpt_detect_sim(s2,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500)
result_s3_4_mean <- single_cpt_detect_sim(s3,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500)
result_s4_4_mean <- single_cpt_detect_sim(s4,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500)
result_s5_4_mean <- single_cpt_detect_sim(s5,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500)
result_s6_4_mean <- single_cpt_detect_sim(s6,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500)
result_s7_4_mean <- single_cpt_detect_sim(s7,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500)


result_s1_4_mean
result_s2_4_mean
result_s3_4_mean
result_s4_4_mean
result_s5_4_mean
result_s6_4_mean
result_s7_4_mean



#table 1.5
result_s1_5 <- single_cpt_detect_sim(s1,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s2_5 <- single_cpt_detect_sim(s2,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s3_5 <- single_cpt_detect_sim(s3,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s4_5 <- single_cpt_detect_sim(s4,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s5_5 <- single_cpt_detect_sim(s5,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s6_5 <- single_cpt_detect_sim(s6,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s7_5 <- single_cpt_detect_sim(s7,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1600)


result_s1_5
result_s2_5
result_s3_5
result_s4_5
result_s5_5
result_s6_5
result_s7_5


#table 1.6
result_s1_6 <- single_cpt_detect_sim(s1,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s2_6 <- single_cpt_detect_sim(s2,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s3_6 <- single_cpt_detect_sim(s3,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s4_6 <- single_cpt_detect_sim(s4,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s5_6 <- single_cpt_detect_sim(s5,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s6_6 <- single_cpt_detect_sim(s6,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1600)
result_s7_6 <- single_cpt_detect_sim(s7,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1600)


result_s1_6
result_s2_6
result_s3_6
result_s4_6
result_s5_6
result_s6_6
result_s7_6



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


#table 2.4
result_s11_4 <- single_cpt_detect_sim(s11,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s22_4 <- single_cpt_detect_sim(s22,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s33_4 <- single_cpt_detect_sim(s33,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s44_4 <- single_cpt_detect_sim(s44,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s55_4 <- single_cpt_detect_sim(s55,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s66_4 <- single_cpt_detect_sim(s66,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s77_4 <- single_cpt_detect_sim(s77,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050)


result_s11_4
result_s22_4
result_s33_4
result_s44_4
result_s55_4
result_s66_4
result_s77_4


#table 2.5
result_s11_5 <- single_cpt_detect_sim(s11,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s22_5 <- single_cpt_detect_sim(s22,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s33_5 <- single_cpt_detect_sim(s33,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s44_5 <- single_cpt_detect_sim(s44,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s55_5 <- single_cpt_detect_sim(s55,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s66_5 <- single_cpt_detect_sim(s66,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s77_5 <- single_cpt_detect_sim(s77,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050)


result_s11_5
result_s22_5
result_s33_5
result_s44_5
result_s55_5
result_s66_5
result_s77_5

#table 2.6
result_s11_6 <- single_cpt_detect_sim(s11,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s22_6 <- single_cpt_detect_sim(s22,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s33_6 <- single_cpt_detect_sim(s33,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s44_6 <- single_cpt_detect_sim(s44,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s55_6 <- single_cpt_detect_sim(s55,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s66_6 <- single_cpt_detect_sim(s66,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050)
result_s77_6 <- single_cpt_detect_sim(s77,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050)



result_s11_6
result_s22_6
result_s33_6
result_s44_6
result_s55_6
result_s66_6
result_s77_6

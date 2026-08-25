library(IDetect)

# the results of (some) the combinations of: length_t = 1000, 500, 100, window_length = 500, step-ahead = 1, 3, 10

#signals - true cpts: 300, 1500

s1 <- c(rep(0,300), rep(0.5,1200), rep(0,1500))
s2 <- c(rep(0,300), rep(1,1200), rep(0,1500))
s3 <- c(rep(0,300), rep(2,1200), rep(0,1500))
s4 <- c(rep(0,300), rep(3,1200), rep(0,1500))
s5 <- c(rep(0,300), rep(5,1200), rep(0,1500))
s6 <- c(rep(0,300), rep(8,1200), rep(0,1500))
s7 <- c(rep(0,300), rep(10,1200), rep(0,1500))



#table 1.10
result_s1_10 <- single_cpt_detect_sim(s1,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1600)
result_s2_10 <- single_cpt_detect_sim(s2,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1600)
result_s3_10 <- single_cpt_detect_sim(s3,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1600)
result_s4_10 <- single_cpt_detect_sim(s4,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1600)
result_s5_10 <- single_cpt_detect_sim(s5,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1600)
result_s6_10 <- single_cpt_detect_sim(s6,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1600)
result_s7_10 <- single_cpt_detect_sim(s7,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1600)


result_s1_10
result_s2_10
result_s3_10
result_s4_10
result_s5_10
result_s6_10
result_s7_10



#table 1.11
result_s1_11 <- single_cpt_detect_sim(s1,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1600)
result_s2_11 <- single_cpt_detect_sim(s2,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1600)
result_s3_11 <- single_cpt_detect_sim(s3,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1600)
result_s4_11 <- single_cpt_detect_sim(s4,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1600)
result_s5_11 <- single_cpt_detect_sim(s5,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1600)
result_s6_11 <- single_cpt_detect_sim(s6,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1600)
result_s7_11 <- single_cpt_detect_sim(s7,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1600)


result_s1_11
result_s2_11
result_s3_11
result_s4_11
result_s5_11
result_s6_11
result_s7_11

#table 1.12
result_s1_12 <- single_cpt_detect_sim(s1,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1600)
result_s2_12 <- single_cpt_detect_sim(s2,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1600)
result_s3_12 <- single_cpt_detect_sim(s3,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1600)
result_s4_12 <- single_cpt_detect_sim(s4,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1600)
result_s5_12 <- single_cpt_detect_sim(s5,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1600)
result_s6_12 <- single_cpt_detect_sim(s6,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1600)
result_s7_12 <- single_cpt_detect_sim(s7,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1600)



result_s1_12
result_s2_12
result_s3_12
result_s4_12
result_s5_12
result_s6_12
result_s7_12



#table 1.13
result_s1_13 <- single_cpt_detect_sim(s1,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500)
result_s2_13 <- single_cpt_detect_sim(s2,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500)
result_s3_13 <- single_cpt_detect_sim(s3,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500)
result_s4_13 <- single_cpt_detect_sim(s4,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500)
result_s5_13 <- single_cpt_detect_sim(s5,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500)
result_s6_13 <- single_cpt_detect_sim(s6,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500)
result_s7_13 <- single_cpt_detect_sim(s7,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1500)



result_s1_13
result_s2_13
result_s3_13
result_s4_13
result_s5_13
result_s6_13
result_s7_13


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


#table 2.10
result_s11_10 <- single_cpt_detect_sim(s11,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s22_10 <- single_cpt_detect_sim(s22,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s33_10 <- single_cpt_detect_sim(s33,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s44_10 <- single_cpt_detect_sim(s44,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s55_10 <- single_cpt_detect_sim(s55,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s66_10 <- single_cpt_detect_sim(s66,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s77_10 <- single_cpt_detect_sim(s77,length_t = 1000, window_length = 500, step_ahead = 10,true_loc = 1050)


result_s11_10
result_s22_10
result_s33_10
result_s44_10
result_s55_10
result_s66_10
result_s77_10


#table 2.11
result_s11_11 <- single_cpt_detect_sim(s11,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050)
result_s22_11 <- single_cpt_detect_sim(s22,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050)
result_s33_11 <- single_cpt_detect_sim(s33,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050)
result_s44_11 <- single_cpt_detect_sim(s44,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050)
result_s55_11 <- single_cpt_detect_sim(s55,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050)
result_s66_11 <- single_cpt_detect_sim(s66,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050)
result_s77_11 <- single_cpt_detect_sim(s77,length_t = 1000, window_length = 500, step_ahead = 3,true_loc = 1050)


result_s11_11
result_s22_11
result_s33_11
result_s44_11
result_s55_11
result_s66_11
result_s77_11


#table 2.12
result_s11_12 <- single_cpt_detect_sim(s11,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050)
result_s22_12 <- single_cpt_detect_sim(s22,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050)
result_s33_12 <- single_cpt_detect_sim(s33,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050)
result_s44_12 <- single_cpt_detect_sim(s44,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050)
result_s55_12 <- single_cpt_detect_sim(s55,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050)
result_s66_12 <- single_cpt_detect_sim(s66,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050)
result_s77_12 <- single_cpt_detect_sim(s77,length_t = 1000, window_length = 500, step_ahead = 1,true_loc = 1050)


result_s11_12
result_s22_12
result_s33_12
result_s44_12
result_s55_12
result_s66_12
result_s77_12


#table 2.13
result_s11_13 <- single_cpt_detect_sim(s11,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s22_13 <- single_cpt_detect_sim(s22,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s33_13 <- single_cpt_detect_sim(s33,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s44_13 <- single_cpt_detect_sim(s44,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s55_13 <- single_cpt_detect_sim(s55,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s66_13 <- single_cpt_detect_sim(s66,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050)
result_s77_13 <- single_cpt_detect_sim(s77,length_t = 500, window_length = 500, step_ahead = 10,true_loc = 1050)


result_s11_13
result_s22_13
result_s33_13
result_s44_13
result_s55_13
result_s66_13
result_s77_13








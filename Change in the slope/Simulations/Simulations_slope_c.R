library(IDetect)

# the results of the combinations of: length_t = 1000, 500, 100, window_length = 1000, step-ahead = 1

#signals - true cpts: 300, 1500

s1 <- c(seq(0,897,3), seq(898,2097,1), seq(2100,6599,3))
s2 <- c(seq(0,807.3,2.7), seq(808.3,2007.3,1), seq(2010,6058.3,2.7))
s3 <- c(seq(0,747.5,2.5), seq(748.5,1947.5,1), seq(1950,5697.5,2.5))
s4 <- c(seq(0,598,2), seq(599,1798,1), seq(1800,4798,2))
s5 <- c(seq(0,508.3,1.7), seq(509.3,1708.6,1), seq(1710.3,4258.6,1.7))
s6 <- c(seq(0,448.5,1.5), seq(449.5,1648.5,1), seq(1650,3899.5,1.5))
s7 <- c(seq(0,358.8,1.2), seq(359.8,1558.8,1), seq(1560,3359.8,1.2))


#table 1.7
result_s1_7 <- single_cpt_detect_sim_slope(s1,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s2_7 <- single_cpt_detect_sim_slope(s2,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s3_7 <- single_cpt_detect_sim_slope(s3,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s4_7 <- single_cpt_detect_sim_slope(s4,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s5_7 <- single_cpt_detect_sim_slope(s5,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s6_7 <- single_cpt_detect_sim_slope(s6,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s7_7 <- single_cpt_detect_sim_slope(s7,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)


result_s1_7 
result_s2_7
result_s3_7
result_s4_7
result_s5_7
result_s6_7
result_s7_7



#table 1.8
result_s1_8 <- single_cpt_detect_sim_slope(s1,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s2_8 <- single_cpt_detect_sim_slope(s2,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s3_8 <- single_cpt_detect_sim_slope(s3,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s4_8 <- single_cpt_detect_sim_slope(s4,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s5_8 <- single_cpt_detect_sim_slope(s5,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s6_8 <- single_cpt_detect_sim_slope(s6,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s7_8 <- single_cpt_detect_sim_slope(s7,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)


result_s1_8
result_s2_8
result_s3_8
result_s4_8
result_s5_8
result_s6_8
result_s7_8


#table 1.9
result_s1_9 <- single_cpt_detect_sim_slope(s1,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s2_9 <- single_cpt_detect_sim_slope(s2,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s3_9 <- single_cpt_detect_sim_slope(s3,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s4_9 <- single_cpt_detect_sim_slope(s4,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s5_9 <- single_cpt_detect_sim_slope(s5,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s6_9 <- single_cpt_detect_sim_slope(s6,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)
result_s7_9 <- single_cpt_detect_sim_slope(s7,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1500, sigma_noise = 20)



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

s11 <- c(seq(0,2697,3), seq(2698,2847,1), seq(2850,8697,3))
s22 <- c(seq(0,2427.3,2.7), seq(2428.3,2577.3,1), seq(2580,7844.5,2.7))
s33 <- c(seq(0,2247.5,2.5), seq(2248.5,2397.5,1), seq(2400,7272.5,2.5))
s44 <- c(seq(0,1798,2), seq(1799,1948,1), seq(1950,5848,2))
s55 <- c(seq(0,1528.3,1.7), seq(1529.3,1678.3,1), seq(1680,4994.7,1.7))
s66 <- c(seq(0,1348.5,1.5), seq(1349.5,1498.5,1), seq(1500,4424.5,1.5))
s77 <- c(seq(0,1078.8,1.2), seq(1079.8,1228.8,1), seq(1230,3569,1.2))

#table 2.7
result_s11_7 <- single_cpt_detect_sim_slope(s11,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s22_7 <- single_cpt_detect_sim_slope(s22,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s33_7 <- single_cpt_detect_sim_slope(s33,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s44_7 <- single_cpt_detect_sim_slope(s44,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s55_7 <- single_cpt_detect_sim_slope(s55,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s66_7 <- single_cpt_detect_sim_slope(s66,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s77_7 <- single_cpt_detect_sim_slope(s77,length_t = 1000, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)


result_s11_7
result_s22_7
result_s33_7
result_s44_7
result_s55_7
result_s66_7
result_s77_7


#table 2.8
result_s11_8 <- single_cpt_detect_sim_slope(s11,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s22_8 <- single_cpt_detect_sim_slope(s22,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s33_8 <- single_cpt_detect_sim_slope(s33,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s44_8 <- single_cpt_detect_sim_slope(s44,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s55_8 <- single_cpt_detect_sim_slope(s55,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s66_8 <- single_cpt_detect_sim_slope(s66,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s77_8 <- single_cpt_detect_sim_slope(s77,length_t = 500, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)


result_s11_8
result_s22_8
result_s33_8
result_s44_8
result_s55_8
result_s66_8
result_s77_8


#table 2.9
result_s11_9 <- single_cpt_detect_sim_slope(s11,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s22_9 <- single_cpt_detect_sim_slope(s22,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s33_9 <- single_cpt_detect_sim_slope(s33,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s44_9 <- single_cpt_detect_sim_slope(s44,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s55_9 <- single_cpt_detect_sim_slope(s55,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s66_9 <- single_cpt_detect_sim_slope(s66,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)
result_s77_9 <- single_cpt_detect_sim_slope(s77,length_t = 100, window_length = 1000, step_ahead = 1,true_loc = 1050, sigma_noise = 20)


result_s11_9
result_s22_9
result_s33_9
result_s44_9
result_s55_9
result_s66_9
result_s77_9


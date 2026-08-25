library(IDetect)


# the results of the combinations of: length_t = 1000, 500, 100, window_length = 1000, step-ahead = 3


#signals - true cpts: 300, 1500

s1 <- c(seq(0,897,3), seq(898,2097,1), seq(2100,6599,3))
s2 <- c(seq(0,807.3,2.7), seq(808.3,2007.3,1), seq(2010,6058.3,2.7))
s3 <- c(seq(0,747.5,2.5), seq(748.5,1947.5,1), seq(1950,5697.5,2.5))
s4 <- c(seq(0,598,2), seq(599,1798,1), seq(1800,4798,2))
s5 <- c(seq(0,508.3,1.7), seq(509.3,1708.6,1), seq(1710.3,4258.6,1.7))
s6 <- c(seq(0,448.5,1.5), seq(449.5,1648.5,1), seq(1650,3899.5,1.5))
s7 <- c(seq(0,358.8,1.2), seq(359.8,1558.8,1), seq(1560,3359.8,1.2))


#table 1.4
result_s1_4 <- single_cpt_detect_sim_slope(s1,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s2_4 <- single_cpt_detect_sim_slope(s2,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s3_4 <- single_cpt_detect_sim_slope(s3,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s4_4 <- single_cpt_detect_sim_slope(s4,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s5_4 <- single_cpt_detect_sim_slope(s5,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s6_4 <- single_cpt_detect_sim_slope(s6,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s7_4 <- single_cpt_detect_sim_slope(s7,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)


result_s1_4
result_s2_4
result_s3_4
result_s4_4
result_s5_4
result_s6_4
result_s7_4



#table 1.5
result_s1_5 <- single_cpt_detect_sim_slope(s1,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s2_5 <- single_cpt_detect_sim_slope(s2,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s3_5 <- single_cpt_detect_sim_slope(s3,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s4_5 <- single_cpt_detect_sim_slope(s4,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s5_5 <- single_cpt_detect_sim_slope(s5,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s6_5 <- single_cpt_detect_sim_slope(s6,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s7_5 <- single_cpt_detect_sim_slope(s7,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)


result_s1_5
result_s2_5
result_s3_5
result_s4_5
result_s5_5
result_s6_5
result_s7_5


#table 1.6
result_s1_6 <- single_cpt_detect_sim_slope(s1,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s2_6 <- single_cpt_detect_sim_slope(s2,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s3_6 <- single_cpt_detect_sim_slope(s3,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s4_6 <- single_cpt_detect_sim_slope(s4,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s5_6 <- single_cpt_detect_sim_slope(s5,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s6_6 <- single_cpt_detect_sim_slope(s6,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)
result_s7_6 <- single_cpt_detect_sim_slope(s7,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1500, sigma_noise = 20)



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

s11 <- c(seq(0,2697,3), seq(2698,2847,1), seq(2850,5697,3))
s22 <- c(seq(0,2427.3,2.7), seq(2428.3,2577.3,1), seq(2580,5144.5,2.7))
s33 <- c(seq(0,2247.5,2.5), seq(2248.5,2397.5,1), seq(2400,4772.5,2.5))
s44 <- c(seq(0,1798,2), seq(1799,1948,1), seq(1950,3848,2))
s55 <- c(seq(0,1528.3,1.7), seq(1529.3,1678.3,1), seq(1680,3294.7,1.7))
s66 <- c(seq(0,1348.5,1.5), seq(1349.5,1498.5,1), seq(1500,2924.5,1.5))
s77 <- c(seq(0,1078.8,1.2), seq(1079.8,1228.8,1), seq(1230,2369,1.2))


#table 2.4
result_s11_4 <- single_cpt_detect_sim_slope(s11,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s22_4 <- single_cpt_detect_sim_slope(s22,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s33_4 <- single_cpt_detect_sim_slope(s33,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s44_4 <- single_cpt_detect_sim_slope(s44,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s55_4 <- single_cpt_detect_sim_slope(s55,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s66_4 <- single_cpt_detect_sim_slope(s66,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s77_4 <- single_cpt_detect_sim_slope(s77,length_t = 1000, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)


result_s11_4
result_s22_4
result_s33_4
result_s44_4
result_s55_4
result_s66_4
result_s77_4


#table 2.5
result_s11_5 <- single_cpt_detect_sim_slope(s11,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s22_5 <- single_cpt_detect_sim_slope(s22,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s33_5 <- single_cpt_detect_sim_slope(s33,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s44_5 <- single_cpt_detect_sim_slope(s44,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s55_5 <- single_cpt_detect_sim_slope(s55,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s66_5 <- single_cpt_detect_sim_slope(s66,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s77_5 <- single_cpt_detect_sim_slope(s77,length_t = 500, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)


result_s11_5
result_s22_5
result_s33_5
result_s44_5
result_s55_5
result_s66_5
result_s77_5


#table 2.6
result_s11_6 <- single_cpt_detect_sim_slope(s11,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s22_6 <- single_cpt_detect_sim_slope(s22,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s33_6 <- single_cpt_detect_sim_slope(s33,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s44_6 <- single_cpt_detect_sim_slope(s44,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s55_6 <- single_cpt_detect_sim_slope(s55,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s66_6 <- single_cpt_detect_sim_slope(s66,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)
result_s77_6 <- single_cpt_detect_sim_slope(s77,length_t = 100, window_length = 1000, step_ahead = 3,true_loc = 1050, sigma_noise = 20)



result_s11_6
result_s22_6
result_s33_6
result_s44_6
result_s55_6
result_s66_6
result_s77_6
